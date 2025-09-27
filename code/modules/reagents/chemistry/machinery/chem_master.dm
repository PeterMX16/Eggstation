<<<<<<< HEAD
#define TRANSFER_MODE_DESTROY 0
#define TRANSFER_MODE_MOVE 1
#define TARGET_BEAKER "beaker"
#define TARGET_BUFFER "buffer"

/// List of containers the Chem Master machine can print
GLOBAL_LIST_INIT(chem_master_containers, list(
	CAT_CONDIMENTS = list(
		/obj/item/reagent_containers/cup/bottle,
		/obj/item/reagent_containers/condiment/flour,
		/obj/item/reagent_containers/condiment/sugar,
		/obj/item/reagent_containers/condiment/rice,
		/obj/item/reagent_containers/condiment/cornmeal,
		/obj/item/reagent_containers/condiment/milk,
		/obj/item/reagent_containers/condiment/soymilk,
		/obj/item/reagent_containers/condiment/yoghurt,
		/obj/item/reagent_containers/condiment/saltshaker,
		/obj/item/reagent_containers/condiment/peppermill,
		/obj/item/reagent_containers/condiment/soysauce,
		/obj/item/reagent_containers/condiment/bbqsauce,
		/obj/item/reagent_containers/condiment/enzyme,
		/obj/item/reagent_containers/condiment/hotsauce,
		/obj/item/reagent_containers/condiment/coldsauce,
		/obj/item/reagent_containers/condiment/mayonnaise,
		/obj/item/reagent_containers/condiment/ketchup,
		/obj/item/reagent_containers/condiment/quality_oil,
		/obj/item/reagent_containers/condiment/cooking_oil,
		/obj/item/reagent_containers/condiment/peanut_butter,
		/obj/item/reagent_containers/condiment/cherryjelly,
		/obj/item/reagent_containers/condiment/honey,
		/obj/item/reagent_containers/condiment/pack,
	),
	CAT_TUBES = list(
		/obj/item/reagent_containers/cup/tube
	),
	CAT_PILLS = typecacheof(list(
		/obj/item/reagent_containers/pill/style
	)),
	CAT_PATCHES = typecacheof(list(
		/obj/item/reagent_containers/pill/patch/style
	))
))
=======
#define MAX_CONTAINER_PRINT_AMOUNT 50
>>>>>>> tg-pr-88929

/obj/machinery/chem_master
	name = "ChemMaster 3000"
	desc = "Used to separate chemicals and distribute them in a variety of forms."
	icon = 'icons/obj/medical/chemical.dmi'
	icon_state = "chemmaster"
	base_icon_state = "chemmaster"
<<<<<<< HEAD
=======
	density = TRUE
>>>>>>> tg-pr-88929
	idle_power_usage = BASE_MACHINE_IDLE_CONSUMPTION * 0.2
	active_power_usage = BASE_MACHINE_ACTIVE_CONSUMPTION * 0.2
	resistance_flags = FIRE_PROOF | ACID_PROOF
	circuit = /obj/item/circuitboard/machine/chem_master
<<<<<<< HEAD
	/// Icons for different percentages of buffer reagents
	var/fill_icon = 'icons/obj/reagentfillings.dmi'
	var/fill_icon_state = "chemmaster"
	var/list/fill_icon_thresholds = list(10,20,30,40,50,60,70,80,90,100)
	/// Inserted reagent container
	var/obj/item/reagent_containers/beaker
	/// Whether separated reagents should be moved back to container or destroyed.
	var/transfer_mode = TRANSFER_MODE_MOVE
	/// Whether reagent analysis screen is active
	var/reagent_analysis_mode = FALSE
	/// Reagent being analyzed
	var/datum/reagent/analyzed_reagent
	/// List of printable container types
	var/list/printable_containers = list()
	/// Container used by default to reset to (REF)
	var/default_container
	/// Selected printable container type (REF)
	var/selected_container
	/// Whether the machine has an option to suggest container
	var/has_container_suggestion = FALSE
	/// Whether to suggest container or not
	var/do_suggest_container = FALSE
	/// The container suggested by main reagent in the buffer
	var/suggested_container
	/// Whether the machine is busy with printing containers
	var/is_printing = FALSE
	/// Number of printed containers in the current printing cycle for UI progress bar
	var/printing_progress
	var/printing_total
	/// Default duration of printing cycle
	var/printing_speed = 0.75 SECONDS // Duration of animation
	/// The amount of containers printed in one cycle
	var/printing_amount = 1

/obj/machinery/chem_master/Initialize(mapload)
	create_reagents(100)
	load_printable_containers()
	default_container = REF(printable_containers[printable_containers[1]][1])
	selected_container = default_container
	return ..()
=======

	/// Inserted reagent container
	var/obj/item/reagent_containers/beaker
	/// Whether separated reagents should be moved back to container or destroyed.
	var/is_transfering = TRUE
	/// List of printable container types
	var/list/printable_containers
	/// Container used by default to reset to
	var/obj/item/reagent_containers/default_container
	/// Selected printable container type
	var/obj/item/reagent_containers/selected_container
	/// Whether the machine is busy with printing containers
	var/is_printing = FALSE
	/// Number of containers printed so far
	var/printing_progress
	/// Number of containers to be printed
	var/printing_total
	/// The time it takes to print a container
	var/printing_speed = 0.75 SECONDS

/obj/machinery/chem_master/Initialize(mapload)
	create_reagents(100)

	printable_containers = load_printable_containers()
	default_container = printable_containers[printable_containers[1]][1]
	selected_container = default_container

	register_context()

	. = ..()
>>>>>>> tg-pr-88929

	var/obj/item/circuitboard/machine/chem_master/board = circuit
	board.build_path = type
	board.name = name

/obj/machinery/chem_master/Destroy()
	QDEL_NULL(beaker)
	return ..()

<<<<<<< HEAD
/obj/machinery/chem_master/on_deconstruction()
	replace_beaker()
	return ..()

/obj/machinery/chem_master/handle_atom_del(atom/deleted_atom)
	..()
	if(deleted_atom == beaker)
		beaker = null
		update_appearance(UPDATE_ICON)
=======
/obj/machinery/chem_master/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	. = NONE
	if(isnull(held_item) || (held_item.item_flags & ABSTRACT) || (held_item.flags_1 & HOLOGRAM_1))
		if(isnull(held_item))
			context[SCREENTIP_CONTEXT_RMB] = "Remove beaker"
			. = CONTEXTUAL_SCREENTIP_SET
		return .

	if(is_reagent_container(held_item) && held_item.is_open_container())
		if(!QDELETED(beaker))
			context[SCREENTIP_CONTEXT_LMB] = "Replace beaker"
		else
			context[SCREENTIP_CONTEXT_LMB] = "Insert beaker"
		return CONTEXTUAL_SCREENTIP_SET

	if(held_item.tool_behaviour == TOOL_SCREWDRIVER)
		context[SCREENTIP_CONTEXT_LMB] = "[panel_open ? "Close" : "Open"] panel"
		return CONTEXTUAL_SCREENTIP_SET
	else if(held_item.tool_behaviour == TOOL_WRENCH)
		context[SCREENTIP_CONTEXT_LMB] = "[anchored ? "Un" : ""] anchor"
		return CONTEXTUAL_SCREENTIP_SET
	else if(panel_open && held_item.tool_behaviour == TOOL_CROWBAR)
		context[SCREENTIP_CONTEXT_LMB] = "Deconstruct"
		return CONTEXTUAL_SCREENTIP_SET

/obj/machinery/chem_master/examine(mob/user)
	. = ..()
	if(in_range(user, src) || isobserver(user))
		. += span_notice("The status display reads:<br>Reagent buffer capacity: <b>[reagents.maximum_volume]</b> units.<br>Printing speed: <b>[0.75 SECONDS / printing_speed * 100]%</b>.")
		if(!QDELETED(beaker))
			. += span_notice("[beaker] of <b>[beaker.reagents.maximum_volume]u</b> capacity inserted")
			. += span_notice("Right click with empty hand to remove beaker")
		else
			. += span_warning("Missing input beaker")

		. += span_notice("It can be [EXAMINE_HINT("wrenched")] [anchored ? "loose" : "in place"]")
		. += span_notice("Its maintainence panel can be [EXAMINE_HINT("screwed")] [panel_open ? "close" : "open"]")
		if(panel_open)
			. += span_notice("The machine can be [EXAMINE_HINT("pried")] apart.")

/obj/machinery/chem_master/update_appearance(updates)
	. = ..()
	if(panel_open || !is_operational)
		set_light(0)
	else
		set_light(1, 1, "#fffb00")

/obj/machinery/chem_master/update_overlays()
	. = ..()
	if(!isnull(beaker))
		. += mutable_appearance(icon, base_icon_state + "_overlay_container")
	if(machine_stat & BROKEN)
		. += mutable_appearance(icon, base_icon_state + "_overlay_broken")
	if(panel_open)
		. += mutable_appearance(icon, base_icon_state + "_overlay_panel")

	if(is_printing)
		. += mutable_appearance(icon, base_icon_state + "_overlay_extruder_active")
	else
		. += mutable_appearance(icon, base_icon_state + "_overlay_extruder")

	// Screen overlay
	if(!panel_open && is_operational)
		var/screen_overlay = base_icon_state + "_overlay_screen"
		if(is_printing)
			screen_overlay += "_active"
		else if(reagents.total_volume > 0)
			screen_overlay += "_main"
		. += mutable_appearance(icon, screen_overlay)
		. += emissive_appearance(icon, base_icon_state + "_overlay_lightmask", src, alpha = src.alpha)

	// Buffer reagents overlay
	if(reagents.total_volume)
		var/static/list/fill_icon_thresholds = list(10, 20, 30, 40, 50, 60, 70, 80, 90, 100)
		var/mutable_appearance/filling = reagent_threshold_overlay(reagents, 'icons/obj/medical/reagent_fillings.dmi', "chemmaster", fill_icon_thresholds)
		if(!isnull(filling))
			. += filling

/obj/machinery/chem_master/Exited(atom/movable/gone, direction)
	. = ..()
	if(gone == beaker)
		beaker = null
		update_appearance(UPDATE_OVERLAYS)

/obj/machinery/chem_master/on_set_is_operational(old_value)
	if(!is_operational)
		is_printing = FALSE
	update_appearance(UPDATE_OVERLAYS)
>>>>>>> tg-pr-88929

/obj/machinery/chem_master/RefreshParts()
	. = ..()
	reagents.maximum_volume = 0
	for(var/obj/item/reagent_containers/cup/beaker/beaker in component_parts)
		reagents.maximum_volume += beaker.reagents.maximum_volume
<<<<<<< HEAD
	printing_amount = 0
	for(var/datum/stock_part/manipulator/manipulator in component_parts)//Monkestation Edit: We use manipulators instead of servos
		printing_amount += manipulator.tier

/obj/machinery/chem_master/update_appearance(updates=ALL)
	. = ..()
	if(panel_open || (machine_stat & (NOPOWER|BROKEN)))
		set_light(0)
	else
		set_light(1, 1, "#fffb00")

/obj/machinery/chem_master/update_overlays()
	. = ..()
	if(!isnull(beaker))
		. += mutable_appearance(icon, base_icon_state + "_overlay_container")
	if(machine_stat & BROKEN)
		. += mutable_appearance(icon, base_icon_state + "_overlay_broken")
	if(panel_open)
		. += mutable_appearance(icon, base_icon_state + "_overlay_panel")

	if(is_printing)
		. += mutable_appearance(icon, base_icon_state + "_overlay_extruder_active")
	else
		. += mutable_appearance(icon, base_icon_state + "_overlay_extruder")

	// Screen overlay
	if(!panel_open && !(machine_stat & (NOPOWER | BROKEN)))
		var/screen_overlay = base_icon_state + "_overlay_screen"
		if(reagent_analysis_mode)
			screen_overlay += "_analysis"
		else if(is_printing)
			screen_overlay += "_active"
		else if(reagents.total_volume > 0)
			screen_overlay += "_main"
		. += mutable_appearance(icon, screen_overlay)
		. += emissive_appearance(icon, base_icon_state + "_overlay_lightmask", src, alpha = src.alpha)

	// Buffer reagents overlay
	if(reagents.total_volume)
		var/threshold = null
		for(var/i in 1 to fill_icon_thresholds.len)
			if(ROUND_UP(100 * reagents.total_volume / reagents.maximum_volume) >= fill_icon_thresholds[i])
				threshold = i
		if(threshold)
			var/fill_name = "[fill_icon_state][fill_icon_thresholds[threshold]]"
			var/mutable_appearance/filling = mutable_appearance(fill_icon, fill_name)
			filling.color = mix_color_from_reagents(reagents.reagent_list)
			. += filling

/obj/machinery/chem_master/wrench_act(mob/living/user, obj/item/tool)
	. = ..()
	default_unfasten_wrench(user, tool)
	return ITEM_INTERACT_SUCCESS

/obj/machinery/chem_master/attackby(obj/item/item, mob/user, params)
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, item))
		update_appearance(UPDATE_ICON)
		return
	if(default_deconstruction_crowbar(item))
		return
	if(is_reagent_container(item) && !(item.item_flags & ABSTRACT) && item.is_open_container())
		. = TRUE // No afterattack
		var/obj/item/reagent_containers/beaker = item
		replace_beaker(user, beaker)
		if(!panel_open)
			ui_interact(user)
	return ..()
=======

	//Servo tier determines printing speed
	printing_speed = 1 SECONDS
	for(var/datum/stock_part/servo/servo in component_parts)
		printing_speed -= servo.tier * 0.25 SECONDS
	printing_speed = max(printing_speed, 0.25 SECONDS)

///Return a map of category->list of containers this machine can print
/obj/machinery/chem_master/proc/load_printable_containers()
	PROTECTED_PROC(TRUE)
	SHOULD_BE_PURE(TRUE)

	var/static/list/containers
	if(!length(containers))
		containers = list(
			CAT_TUBES = GLOB.reagent_containers[CAT_TUBES],
			CAT_PILLS = GLOB.reagent_containers[CAT_PILLS],
			CAT_PATCHES = GLOB.reagent_containers[CAT_PATCHES],
		)
	return containers

/obj/machinery/chem_master/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	if(user.combat_mode || (tool.item_flags & ABSTRACT) || (tool.flags_1 & HOLOGRAM_1) || !can_interact(user) || !user.can_perform_action(src, ALLOW_SILICON_REACH | FORBID_TELEKINESIS_REACH))
		return NONE

	if(is_reagent_container(tool) && tool.is_open_container())
		replace_beaker(user, tool)
		if(!panel_open)
			ui_interact(user)
			return ITEM_INTERACT_SUCCESS
		else
			return ITEM_INTERACT_BLOCKING

	return NONE

/obj/machinery/chem_master/wrench_act(mob/living/user, obj/item/tool)
	if(user.combat_mode)
		return NONE

	. = ITEM_INTERACT_BLOCKING
	if(is_printing)
		balloon_alert(user, "still printing!")
		return .

	if(default_unfasten_wrench(user, tool) == SUCCESSFUL_UNFASTEN)
		return ITEM_INTERACT_SUCCESS

/obj/machinery/chem_master/screwdriver_act(mob/living/user, obj/item/tool)
	if(user.combat_mode)
		return NONE

	. = ITEM_INTERACT_BLOCKING
	if(is_printing)
		balloon_alert(user, "still printing!")
		return .

	if(default_deconstruction_screwdriver(user, icon_state, icon_state, tool))
		update_appearance(UPDATE_OVERLAYS)
		return ITEM_INTERACT_SUCCESS

/obj/machinery/chem_master/crowbar_act(mob/living/user, obj/item/tool)
	if(user.combat_mode)
		return NONE

	. = ITEM_INTERACT_BLOCKING
	if(is_printing)
		balloon_alert(user, "still printing!")
		return .

	if(default_deconstruction_crowbar(tool))
		return ITEM_INTERACT_SUCCESS

/**
 * Insert, remove, replace the existig beaker
 * Arguments
 *
 * * mob/living/user - the player trying to replace the beaker
 * * obj/item/reagent_containers/new_beaker - the beaker we are trying to insert, swap with existing or remove if null
 */
/obj/machinery/chem_master/proc/replace_beaker(mob/living/user, obj/item/reagent_containers/new_beaker)
	PRIVATE_PROC(TRUE)

	if(!QDELETED(beaker))
		try_put_in_hand(beaker, user)
	if(!QDELETED(new_beaker) && user.transferItemToLoc(new_beaker, src))
		beaker = new_beaker
	update_appearance(UPDATE_OVERLAYS)
>>>>>>> tg-pr-88929

/obj/machinery/chem_master/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return .
	if(!can_interact(user) || !user.can_perform_action(src, ALLOW_SILICON_REACH | FORBID_TELEKINESIS_REACH))
		return .
	replace_beaker(user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/machinery/chem_master/attack_robot_secondary(mob/user, list/modifiers)
	return attack_hand_secondary(user, modifiers)

/obj/machinery/chem_master/attack_ai_secondary(mob/user, list/modifiers)
	return attack_hand_secondary(user, modifiers)

<<<<<<< HEAD
/// Insert new beaker and/or eject the inserted one
/obj/machinery/chem_master/proc/replace_beaker(mob/living/user, obj/item/reagent_containers/new_beaker)
	if(new_beaker && user && !user.transferItemToLoc(new_beaker, src))
		return FALSE
	if(beaker)
		try_put_in_hand(beaker, user)
		beaker = null
	if(new_beaker)
		beaker = new_beaker
	update_appearance(UPDATE_ICON)
	return TRUE

/obj/machinery/chem_master/proc/load_printable_containers()
	printable_containers = list(
		CAT_TUBES = GLOB.chem_master_containers[CAT_TUBES],
		CAT_PILLS = GLOB.chem_master_containers[CAT_PILLS],
		CAT_PATCHES = GLOB.chem_master_containers[CAT_PATCHES],
	)

=======
>>>>>>> tg-pr-88929
/obj/machinery/chem_master/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ChemMaster", name)
		ui.open()

/obj/machinery/chem_master/ui_static_data(mob/user)
<<<<<<< HEAD
	var/list/data = list()
	data["categories"] = list()
	for(var/category in printable_containers)
		var/container_data = list()
		for(var/obj/item/reagent_containers/container as anything in printable_containers[category])
			container_data += list(list(
				"icon" = initial(container.icon),
				"icon_state" = initial(container.icon_state),
				"ref" = REF(container),
				"name" = initial(container.name),
				"volume" = initial(container.volume),
			))
		data["categories"]+= list(list(
			"name" = category,
			"containers" = container_data,
		))

	return data

/obj/machinery/chem_master/ui_data(mob/user)
	var/list/data = list()

	data["reagentAnalysisMode"] = reagent_analysis_mode
	if(reagent_analysis_mode && analyzed_reagent)
		//Monkestation Addition: prude mode
		var/chem_name = analyzed_reagent.name
		if(istype(analyzed_reagent, /datum/reagent/ammonia/urine) && user.client?.prefs.read_preference(/datum/preference/toggle/prude_mode))
			chem_name = "Ammonia?"
		//End Monkestation Addition
		var/state
		switch(analyzed_reagent.reagent_state)
			if(SOLID)
				state = "Solid"
			if(LIQUID)
				state = "Liquid"
			if(GAS)
				state = "Gas"
			else
				state = "Unknown"
		data["analysisData"] = list(
			"name" = chem_name, //Monkestation Edit: prude mode
			"state" = state,
			"pH" = analyzed_reagent.ph,
			"color" = analyzed_reagent.color,
			"description" = analyzed_reagent.description,
			"purity" = analyzed_reagent.purity,
			"metaRate" = analyzed_reagent.metabolization_rate,
			"overdose" = analyzed_reagent.overdose_threshold,
			"addictionTypes" = reagents.parse_addictions(analyzed_reagent),
		)
	else
		data["isPrinting"] = is_printing
		data["printingProgress"] = printing_progress
		data["printingTotal"] = printing_total
		data["hasBeaker"] = beaker ? TRUE : FALSE
		data["beakerCurrentVolume"] = beaker ? round(beaker.reagents.total_volume, 0.01) : null
		data["beakerMaxVolume"] = beaker ? beaker.volume : null
		var/list/beaker_contents = list()
		if(beaker)
			for(var/datum/reagent/reagent in beaker.reagents.reagent_list)
				beaker_contents.Add(list(list("name" = reagent.name, "ref" = REF(reagent), "volume" = round(reagent.volume, 0.01))))
		data["beakerContents"] = beaker_contents

		var/list/buffer_contents = list()
		if(reagents.total_volume)
			for(var/datum/reagent/reagent in reagents.reagent_list)
				buffer_contents.Add(list(list("name" = reagent.name, "ref" = REF(reagent), "volume" = round(reagent.volume, 0.01))))
		data["bufferContents"] = buffer_contents
		data["bufferCurrentVolume"] = round(reagents.total_volume, 0.01)
		data["bufferMaxVolume"] = reagents.maximum_volume

		data["transferMode"] = transfer_mode

		data["hasContainerSuggestion"] = !!has_container_suggestion
		if(has_container_suggestion)
			data["doSuggestContainer"] = !!do_suggest_container
			if(do_suggest_container)
				if(reagents.total_volume > 0)
					var/master_reagent = reagents.get_master_reagent()
					suggested_container = get_suggested_container(master_reagent)
				else
					suggested_container = default_container
				data["suggestedContainer"] = suggested_container
				selected_container = suggested_container
			else if (isnull(selected_container))
				selected_container = default_container

		data["selectedContainerRef"] = selected_container
		var/obj/item/reagent_containers/container = locate(selected_container)
		data["selectedContainerVolume"] = initial(container.volume)
=======
	var/list/data = list()

	data["maxPrintable"] = MAX_CONTAINER_PRINT_AMOUNT
	data["categories"] = list()
	for(var/category in printable_containers)
		//make the category
		var/list/category_list = list(
			"name" = category,
			"containers" = list(),
		)

		//add containers to this category
		for(var/obj/item/reagent_containers/container as anything in printable_containers[category])
			category_list["containers"] += list(list(
				"ref" = REF(container),
				"name" = initial(container.name),
				"icon" = initial(container.icon),
				"icon_state" = initial(container.icon_state),
				"volume" = initial(container.volume),
			))

		//add the category
		data["categories"] += list(category_list)
>>>>>>> tg-pr-88929

	return data

/obj/machinery/chem_master/ui_data(mob/user)
	. = list()

	//printing statictics
	.["isPrinting"] = is_printing
	.["printingProgress"] = printing_progress
	.["printingTotal"] = printing_total

	//contents of source beaker
	var/list/beaker_data = null
	if(!QDELETED(beaker))
		beaker_data = list()
		beaker_data["maxVolume"] = beaker.volume
		beaker_data["currentVolume"] = round(beaker.reagents.total_volume, CHEMICAL_VOLUME_ROUNDING)
		var/list/beakerContents = list()
		if(length(beaker.reagents.reagent_list))
			for(var/datum/reagent/reagent as anything in beaker.reagents.reagent_list)
				beakerContents += list(list(
					"ref" = "[reagent.type]",
					"name" = reagent.name,
					"volume" = round(reagent.volume, CHEMICAL_VOLUME_ROUNDING),
					"pH" = reagent.ph,
					"color" = reagent.color,
					"description" = reagent.description,
					"purity" = reagent.purity,
					"metaRate" = reagent.metabolization_rate,
					"overdose" = reagent.overdose_threshold,
					"addictionTypes" = reagents.parse_addictions(reagent),
				))
		beaker_data["contents"] = beakerContents
	.["beaker"] = beaker_data

	//contents of buffer
	beaker_data = list()
	beaker_data["maxVolume"] = reagents.maximum_volume
	beaker_data["currentVolume"] = round(reagents.total_volume, CHEMICAL_VOLUME_ROUNDING)
	var/list/beakerContents = list()
	if(length(reagents.reagent_list))
		for(var/datum/reagent/reagent as anything in reagents.reagent_list)
			beakerContents += list(list(
				"ref" = "[reagent.type]",
				"name" = reagent.name,
				"volume" = round(reagent.volume, CHEMICAL_VOLUME_ROUNDING),
				"pH" = reagent.ph,
				"color" = reagent.color,
				"description" = reagent.description,
				"purity" = reagent.purity,
				"metaRate" = reagent.metabolization_rate,
				"overdose" = reagent.overdose_threshold,
				"addictionTypes" = reagents.parse_addictions(reagent),
			))
	beaker_data["contents"] = beakerContents
	.["buffer"] = beaker_data

	//is transfering or destroying reagents. applied only for buffer
	.["isTransfering"] = is_transfering

	//container along with the suggested type
	var/obj/item/reagent_containers/suggested_container = default_container
	if(reagents.total_volume > 0)
		var/datum/reagent/master_reagent = reagents.get_master_reagent()
		var/container_found = FALSE
		suggested_container = master_reagent.default_container
		for(var/category in printable_containers)
			for(var/obj/item/reagent_containers/container as anything in printable_containers[category])
				if(container == suggested_container)
					suggested_container = REF(container)
					container_found = TRUE
					break
		if(!container_found)
			suggested_container = REF(default_container)
	.["suggestedContainerRef"] = suggested_container

	//selected container
	.["selectedContainerRef"] = REF(selected_container)
	.["selectedContainerVolume"] = initial(selected_container.volume)

/**
 * Transfers a single reagent between buffer & beaker
 * Arguments
 *
 * * datum/reagents/source - the holder we are transferring from
 * * datum/reagents/target - the holder we are transferring to
 * * datum/reagent/path - the reagent typepath we are transfering
 * * amount - volume to transfer
 * * do_transfer - transfer the reagents else destroy them
 */
/obj/machinery/chem_master/proc/transfer_reagent(datum/reagents/source, datum/reagents/target, datum/reagent/path, amount, do_transfer)
	PRIVATE_PROC(TRUE)

	//sanity checks for transfer amount
	if(isnull(amount) || amount <= 0)
		return FALSE
	//sanity checks for reagent path
	var/datum/reagent/reagent = text2path(path)
	if (!reagent)
		return FALSE

	//use energy
	if(!use_energy(active_power_usage, force = FALSE))
		return FALSE

	//do the operation
	. = FALSE
	if(do_transfer)
		if(target.is_reacting)
			return FALSE
		if(source.trans_to(target, amount, target_id = reagent))
			. = TRUE
	else if(source.remove_reagent(reagent, amount))
		. = TRUE
	if(. && !QDELETED(src)) //transferring volatile reagents can cause a explosion & destory us
		update_appearance(UPDATE_OVERLAYS)

/obj/machinery/chem_master/ui_act(action, params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

<<<<<<< HEAD
	if(action == "eject")
		replace_beaker(usr)
		return TRUE

	if(action == "transfer")
		var/reagent_ref = params["reagentRef"]
		var/amount = text2num(params["amount"])
		var/target = params["target"]
		return transfer_reagent(reagent_ref, amount, target)

	if(action == "toggleTransferMode")
		transfer_mode = !transfer_mode
		return TRUE

	if(action == "analyze")
		analyzed_reagent = locate(params["reagentRef"])
		if(analyzed_reagent)
			reagent_analysis_mode = TRUE
			update_appearance(UPDATE_ICON)
			return TRUE

	if(action == "stopAnalysis")
		reagent_analysis_mode = FALSE
		analyzed_reagent = null
		update_appearance(UPDATE_ICON)
		return TRUE

	if(action == "stopPrinting")
		is_printing = FALSE
		return TRUE

	if(action == "toggleContainerSuggestion")
		do_suggest_container = !do_suggest_container
		return TRUE

	if(action == "selectContainer")
		var/target_ref = params["ref"]
		var/obj/item/reagent_containers/target = locate(target_ref)

		//is this even a valid type path
		if(!ispath(target))
			return FALSE

		//are we printing a valid container
		var/container_found = FALSE
		for(var/category in printable_containers)
			if(target in printable_containers[category])
				container_found = TRUE
				break
		if(!container_found)
			return FALSE

		//set the container
		selected_container = target_ref
		return TRUE

	if(action == "create")
		if(reagents.total_volume == 0)
			return FALSE
		var/item_count = text2num(params["itemCount"])
		if(item_count <= 0)
			return FALSE
		create_containers(item_count)
		return TRUE

/// Create N selected containers with reagents from buffer split between them
/obj/machinery/chem_master/proc/create_containers(item_count = 1)
	var/obj/item/reagent_containers/container_style = locate(selected_container)
	var/is_pill_subtype = ispath(container_style, /obj/item/reagent_containers/pill)
	var/volume_in_each = reagents.total_volume / item_count
	var/printing_amount_current = is_pill_subtype ? printing_amount * 2 : printing_amount

	// Generate item name
	var/item_name_default = initial(container_style.name)
	if(!(initial(container_style.reagent_flags) & OPENCONTAINER)) // Closed containers get reagent name and units in the name
		item_name_default = "[reagents.get_master_reagent_name()] [item_name_default] ([volume_in_each]u)"
	var/item_name = tgui_input_text(usr,
		"Container name",
		"Name",
		item_name_default,
		MAX_NAME_LEN)

	if(!item_name || !reagents.total_volume || QDELETED(src) || !usr.can_perform_action(src, ALLOW_SILICON_REACH))
		return FALSE

	// Print and fill containers
	is_printing = TRUE
	update_appearance(UPDATE_ICON)
	printing_progress = 0
	printing_total = item_count
	while(item_count > 0)
		if(!is_printing)
			break
		use_energy(active_power_usage)
		stoplag(printing_speed)
		for(var/i in 1 to printing_amount_current)
			if(!item_count)
				continue
			var/obj/item/reagent_containers/item = new container_style(drop_location())
			adjust_item_drop_location(item)
			item.name = item_name
			item.reagents.clear_reagents()
			reagents.trans_to(item, volume_in_each, transfered_by = src)
			printing_progress++
			item_count--
		update_appearance(UPDATE_ICON)
	is_printing = FALSE
	update_appearance(UPDATE_ICON)
	return TRUE

/// Transfer reagents to specified target from the opposite source
/obj/machinery/chem_master/proc/transfer_reagent(reagent_ref, amount, target)
	if (amount == -1)
		amount = text2num(input("Enter the amount you want to transfer:", name, ""))
	if (amount == null || amount <= 0)
		return FALSE
	if (!beaker && target == TARGET_BEAKER && transfer_mode == TRANSFER_MODE_MOVE)
		return FALSE
	var/datum/reagent/reagent = locate(reagent_ref)
	if (!reagent)
		return FALSE

	use_energy(active_power_usage)

	if (target == TARGET_BUFFER)
		if(!check_reactions(reagent, beaker.reagents))
			return FALSE
		beaker.reagents.trans_id_to(src, reagent.type, amount)
		update_appearance(UPDATE_ICON)
		return TRUE

	if (target == TARGET_BEAKER && transfer_mode == TRANSFER_MODE_DESTROY)
		reagents.remove_reagent(reagent.type, amount)
		update_appearance(UPDATE_ICON)
		return TRUE
	if (target == TARGET_BEAKER && transfer_mode == TRANSFER_MODE_MOVE)
		if(!check_reactions(reagent, reagents))
			return FALSE
		reagents.trans_id_to(beaker, reagent.type, amount)
		update_appearance(UPDATE_ICON)
		return TRUE
=======
	switch(action)
		if("eject")
			replace_beaker(ui.user)
			return TRUE

		if("transfer")
			if(is_printing)
				say("The buffer is locked while printing.")
				return

			var/reagent_ref = params["reagentRef"]
			var/amount = params["amount"]
			var/target = params["target"]

			if(amount == -1) // Set custom amount
				var/mob/user = ui.user //Hold a reference of the user if the UI is closed
				amount = FLOOR(tgui_input_number(user, "Enter amount to transfer", "Transfer amount", round_value = FALSE), CHEMICAL_VOLUME_ROUNDING)
				if(!amount || !user.can_perform_action(src))
					return FALSE

			var/should_transfer = is_transfering || (target == "buffer") // we should always transfer if target is the buffer
			if(should_transfer && isnull(beaker)) // if there's no beaker, we cannot transfer
				say("No reagent container is inserted.")
				return FALSE

			var/reagents_from
			var/reagents_to = null
			if(target == "buffer")
				reagents_from = beaker.reagents
				reagents_to = reagents // buffer
			else if(target == "beaker")
				reagents_from = reagents // buffer
				if(should_transfer)
					reagents_to = beaker.reagents
			return transfer_reagent(reagents_from, reagents_to, reagent_ref, amount, should_transfer)

		if("toggleTransferMode")
			is_transfering = !is_transfering
			return TRUE

		if("stopPrinting")
			is_printing = FALSE
			update_appearance(UPDATE_OVERLAYS)
			return TRUE

		if("selectContainer")
			var/obj/item/reagent_containers/target = locate(params["ref"])

			//is this even a valid type path
			if(!ispath(target))
				return FALSE

			//are we printing a valid container
			var/container_found = FALSE
			for(var/category in printable_containers)
				//container found in previous iteration
				if(container_found)
					break

				//find for matching typepath
				for(var/obj/item/reagent_containers/container as anything in printable_containers[category])
					if(target == container)
						container_found = TRUE
						break
			if(!container_found)
				return FALSE

			//set the container
			selected_container = target
			return TRUE

		if("create")
			if(!reagents.total_volume || is_printing)
				return FALSE

			//validate print count
			var/item_count = params["itemCount"]
			if(isnull(item_count))
				return FALSE
			item_count = text2num(item_count)
			if(isnull(item_count) || item_count <= 0)
				return FALSE
			item_count = min(item_count, MAX_CONTAINER_PRINT_AMOUNT)
			var/volume_in_each = round(reagents.total_volume / item_count, CHEMICAL_VOLUME_ROUNDING)

			// Generate item name
			var/item_name_default = initial(selected_container.name)
			var/datum/reagent/master_reagent = reagents.get_master_reagent()
			if(selected_container == default_container) // Tubes and bottles gain reagent name
				item_name_default = "[master_reagent.name] [item_name_default]"
			if(!(initial(selected_container.reagent_flags) & OPENCONTAINER)) // Closed containers get both reagent name and units in the name
				item_name_default = "[master_reagent.name] [item_name_default] ([volume_in_each]u)"
			var/item_name = tgui_input_text(
				usr,
				"Container name",
				"Name",
				item_name_default,
				max_length = MAX_NAME_LEN,
			)
			if(!item_name)
				return FALSE

			//start printing
			is_printing = TRUE
			printing_progress = 0
			printing_total = item_count
			update_appearance(UPDATE_OVERLAYS)
			create_containers(ui.user, item_count, item_name, volume_in_each)
			return TRUE

/**
 * Create N selected containers with reagents from buffer split between them
 * Arguments
 *
 * * mob/user - the player printing these containers
 * * item_count - number of containers to print
 * * item_name - the name for each container printed
 * * volume_in_each - volume in each container created
 */
/obj/machinery/chem_master/proc/create_containers(mob/user, item_count, item_name, volume_in_each)
	PRIVATE_PROC(TRUE)

	//lost power or manually stopped
	if(!is_printing)
		return
>>>>>>> tg-pr-88929

	//use power
	if(!use_energy(active_power_usage, force = FALSE))
		is_printing = FALSE
		update_appearance(UPDATE_OVERLAYS)
		return

<<<<<<< HEAD
/// Checks to see if the target reagent is being created (reacting) and if so prevents transfer
/// Only prevents reactant from being moved so that people can still manlipulate input reagents
/obj/machinery/chem_master/proc/check_reactions(datum/reagent/reagent, datum/reagents/holder)
	if(!reagent)
		return FALSE
	var/canMove = TRUE
	for(var/datum/equilibrium/equilibrium as anything in holder.reaction_list)
		if(equilibrium.reaction.reaction_flags & REACTION_COMPETITIVE)
			continue
		for(var/datum/reagent/result as anything in equilibrium.reaction.required_reagents)
			if(result == reagent.type)
				canMove = FALSE
	if(!canMove)
		say("Cannot move reagent during reaction!")
	return canMove

/// Retrieve REF to the best container for provided reagent
/obj/machinery/chem_master/proc/get_suggested_container(datum/reagent/reagent)
	var/preferred_container = reagent.default_container
	for(var/category in printable_containers)
		for(var/container in printable_containers[category])
			if(container == preferred_container)
				return REF(container)
	return default_container

/obj/machinery/chem_master/examine(mob/user)
	. = ..()
	if(in_range(user, src) || isobserver(user))
		. += span_notice("The status display reads:<br>Reagent buffer capacity: <b>[reagents.maximum_volume]</b> units.<br>Number of containers printed at once increased by <b>[100 * (printing_amount / initial(printing_amount)) - 100]%</b>.")
=======
	//print the stuff
	var/obj/item/reagent_containers/item = new selected_container(drop_location())
	adjust_item_drop_location(item)
	item.name = item_name
	item.reagents.clear_reagents()
	reagents.trans_to(item, volume_in_each, transferred_by = user)
	printing_progress++
	update_appearance(UPDATE_OVERLAYS)

	//print more items
	item_count --
	if(item_count > 0)
		addtimer(CALLBACK(src, PROC_REF(create_containers), user, item_count, item_name, volume_in_each), printing_speed)
	else
		is_printing = FALSE
		update_appearance(UPDATE_OVERLAYS)
>>>>>>> tg-pr-88929

/obj/machinery/chem_master/condimaster
	name = "CondiMaster 3000"
	desc = "Used to create condiments and other cooking supplies."
	icon_state = "condimaster"
<<<<<<< HEAD
	has_container_suggestion = TRUE

/obj/machinery/chem_master/condimaster/load_printable_containers()
	printable_containers = list(
		CAT_CONDIMENTS = GLOB.chem_master_containers[CAT_CONDIMENTS],
	)

#undef TRANSFER_MODE_DESTROY
#undef TRANSFER_MODE_MOVE
#undef TARGET_BEAKER
#undef TARGET_BUFFER
=======

/obj/machinery/chem_master/condimaster/load_printable_containers()
	var/static/list/containers
	if(!length(containers))
		containers = list(CAT_CONDIMENTS = GLOB.reagent_containers[CAT_CONDIMENTS])
	return containers

#undef MAX_CONTAINER_PRINT_AMOUNT
>>>>>>> tg-pr-88929
