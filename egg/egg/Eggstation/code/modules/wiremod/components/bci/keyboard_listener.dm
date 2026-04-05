/**
 * # Keyboard Listener Component
 *
 * Allows user to input a string using a Keyboard Shell.
 * Requires a keyboard shell.
 */

/obj/item/circuit_component/keyboard_listener
	display_name = "Keyboard Listener"
	desc = "Prompts the user holding the keyboard shell to input text."
	category = "Input"

	required_shells = list(/obj/item/keyboard_shell)

	var/datum/port/input/input_name
	var/datum/port/input/input_desc

	var/datum/port/output/output
	var/datum/port/output/failure

	circuit_flags = CIRCUIT_FLAG_INPUT_SIGNAL

	var/obj/item/keyboard_shell/shell
	var/ready = TRUE

/obj/item/circuit_component/keyboard_listener/populate_ports()
	input_name = add_input_port("Input Name", PORT_TYPE_STRING)
	input_desc = add_input_port("Input Description", PORT_TYPE_STRING)

	output = add_output_port("Received Input", PORT_TYPE_STRING)
	trigger_output = add_output_port("Triggered", PORT_TYPE_SIGNAL)
	failure = add_output_port("On Failure", PORT_TYPE_SIGNAL)

/obj/item/circuit_component/keyboard_listener/register_shell(atom/movable/attached_shell)
	if(istype(attached_shell, /obj/item/keyboard_shell))
		shell = attached_shell

/obj/item/circuit_component/keyboard_listener/unregister_shell(atom/movable/attached_shell)
	shell = null

/obj/item/circuit_component/keyboard_listener/input_received(datum/port/input/port)
	if(!ready)
		failure.set_output(COMPONENT_SIGNAL)
		return

	if(!shell)
		failure.set_output(COMPONENT_SIGNAL)
		return

	var/mob/user = shell.loc

	// Must be held by a mob
	if(!ismob(user) || !user.client)
		failure.set_output(COMPONENT_SIGNAL)
		return

	// Optional: unconscious check
	if(user.stat >= UNCONSCIOUS)
		failure.set_output(COMPONENT_SIGNAL)
		return

	INVOKE_ASYNC(src, PROC_REF(prompt_keyboard), user)
	ready = FALSE

/obj/item/circuit_component/keyboard_listener/proc/prompt_keyboard(mob/user)
	var/message = trimtext(
		tgui_input_text(
			user,
			input_desc.value ? input_desc.value : "",
			input_name.value ? input_name.value : "Keyboard Input",
			"",
			encode = FALSE
		)
	)

	if(length(message))
		output.set_output(message)
		trigger_output.set_output(COMPONENT_SIGNAL)

	ready = TRUE
