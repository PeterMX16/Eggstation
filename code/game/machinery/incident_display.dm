<<<<<<< HEAD
GLOBAL_LIST_EMPTY(map_delamination_counters)
=======
/**
 * List of incident displays on the map
 * Required as persistence subsystem loads after the ones present at mapload, and to reset to 0 upon explosion.
 */
GLOBAL_LIST_EMPTY(map_incident_displays)
>>>>>>> tg-pr-88929

/// Display days since last delam on incident sign
#define DISPLAY_DELAM (1<<0)
/// Display current number of tram hits on incident sign
#define DISPLAY_TRAM (1<<1)

DEFINE_BITFIELD(sign_features, list(
	"DISPLAY_DELAM" = DISPLAY_DELAM,
	"DISPLAY_TRAM" = DISPLAY_TRAM,
))

#define TREND_RISING "rising"
#define TREND_FALLING "falling"

<<<<<<< HEAD
#define NAME_DUAL "safety incident display"
#define NAME_DELAM "delamination incident display"
#define NAME_TRAM "tram incident display"

#define DESC_DUAL "A display that provides information on the station's safety record. Features an advert for SAFETY MOTH."
#define DESC_DELAM "A signs describe how long it's been since the last delamination incident. Features an advert for SAFETY MOTH."
#define DESC_TRAM "A display that provides the number of tram related safety incidents this shift. Features an advert for SAFETY MOTH."

/**
 * List of safety statistic signs on the map that have delam counting enabled.
 * Required as persistence subsystem loads after the ones present at mapload, and to reset to 0 upon explosion.
 */
=======
#define NAME_DELAM "delamination incident display"
#define NAME_TRAM "tram incident display"

#define DESC_DELAM "A signs describe how long it's been since the last delamination incident. Features an advert for SAFETY MOTH."
#define DESC_TRAM "A display that provides the number of tram related safety incidents this shift."

#define DISPLAY_PIXEL_1_W 21
#define DISPLAY_PIXEL_1_Z -2
#define DISPLAY_PIXEL_2_W 16
#define DISPLAY_PIXEL_2_Z -2
#define DISPLAY_BASE_ALPHA 64
#define DISPLAY_PIXEL_ALPHA 96

#define LIGHT_COLOR_NORMAL "#4b4290"
#define LIGHT_COLOR_SHAME "#e24e76"
>>>>>>> tg-pr-88929

/obj/machinery/incident_display
	name = NAME_DELAM
	desc = DESC_DELAM
	icon = 'icons/obj/machines/incident_display.dmi'
<<<<<<< HEAD
	icon_preview = "stat_display_delam"
	icon_state = "stat_display_delam"
=======
	icon_preview = "display_normal"
	icon_state = "display_normal"
>>>>>>> tg-pr-88929
	verb_say = "beeps"
	verb_ask = "bloops"
	verb_exclaim = "blares"
	idle_power_usage = 450
	max_integrity = 150
	integrity_failure = 0.75
	custom_materials = list(/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 4, /datum/material/alloy/titaniumglass = SHEET_MATERIAL_AMOUNT * 4)
	/// What statistics we want the sign to display
	var/sign_features = DISPLAY_DELAM
<<<<<<< HEAD
=======
	/// Delam digits color
	var/delam_display_color = COLOR_DISPLAY_YELLOW
	/// Tram hits digits color
	var/tram_display_color = COLOR_DISPLAY_BLUE
>>>>>>> tg-pr-88929
	/// Tram hits before hazard warning
	var/hit_threshold = 0
	/// Tram hits
	var/hit_count = 0
	/// Shifts without delam
	var/last_delam = 0
	/// Delam record high-score
	var/delam_record = 0
<<<<<<< HEAD

/obj/machinery/incident_display/dual
	name = NAME_DUAL
	desc = DESC_DUAL
	icon_preview = "stat_display_dual"
	icon_state = "stat_display_dual"
	sign_features = DISPLAY_DELAM | DISPLAY_TRAM
=======
	/// If the display is currently running live updated content
	var/live_display = FALSE
	/// The default advert to show on this display
	var/configured_advert
	/// Duration of the advert set on this display
	var/configured_advert_duration
	/// How often to show an advert
	var/advert_frequency = 30 SECONDS
	/// Timer for sign currently showing an advert
	COOLDOWN_DECLARE(active_advert)
	/// Cooldown until next advert
	COOLDOWN_DECLARE(advert_cooldown)

/obj/machinery/incident_display/bridge
>>>>>>> tg-pr-88929

/obj/machinery/incident_display/delam
	name = NAME_DELAM
	desc = DESC_DELAM
<<<<<<< HEAD
	icon_preview = "stat_display_delam"
	icon_state = "stat_display_delam"
	sign_features = DISPLAY_DELAM
=======
	sign_features = DISPLAY_DELAM
	configured_advert = "advert_meson"
	configured_advert_duration = 7 SECONDS
>>>>>>> tg-pr-88929

/obj/machinery/incident_display/tram
	name = NAME_TRAM
	desc = DESC_TRAM
<<<<<<< HEAD
	icon_preview = "stat_display_tram"
	icon_state = "stat_display_tram"
	sign_features = DISPLAY_TRAM

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/incident_display, 32)
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/incident_display/delam, 32)
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/incident_display/dual, 32)
=======
	sign_features = DISPLAY_TRAM

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/incident_display/bridge, 32)
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/incident_display/delam, 32)
>>>>>>> tg-pr-88929
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/incident_display/tram, 32)

/obj/machinery/incident_display/Initialize(mapload)
	..()
<<<<<<< HEAD
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/incident_display/LateInitialize()
	. = ..()
	GLOB.map_delamination_counters += src
	update_delam_count(SSpersistence.rounds_since_engine_exploded, SSpersistence.delam_highscore)
	for(var/obj/structure/industrial_lift/tram/tram as anything in GLOB.lifts)
		RegisterSignal(tram, COMSIG_TRAM_COLLISION, PROC_REF(update_tram_count))
=======
	register_context()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/incident_display/post_machine_initialize()
	. = ..()
	GLOB.map_incident_displays += src
	update_delam_count(SSpersistence.rounds_since_engine_exploded, SSpersistence.delam_highscore)
	RegisterSignal(SStransport, COMSIG_TRAM_COLLISION, PROC_REF(update_tram_count))
>>>>>>> tg-pr-88929

	update_appearance()

/obj/machinery/incident_display/Destroy()
<<<<<<< HEAD
	GLOB.map_delamination_counters -= src
	return ..()

/obj/machinery/incident_display/welder_act(mob/living/user, obj/item/tool)
	if(user.istate & ISTATE_HARM)
=======
	GLOB.map_incident_displays -= src
	return ..()

/obj/machinery/incident_display/process()
	if(!isnull(configured_advert) && COOLDOWN_FINISHED(src, advert_cooldown))// time to show an advert
		show_advert(advert = configured_advert, duration = configured_advert_duration)
		COOLDOWN_START(src, advert_cooldown, rand(advert_frequency - 5 SECONDS, advert_frequency + 5 SECONDS))
		return

	if(!live_display) // displaying static content, no processing required
		return

	if(machine_stat & (NOPOWER|BROKEN|MAINT))
		return

	if(COOLDOWN_FINISHED(src, active_advert)) // advert finished, revert to static content
		COOLDOWN_RESET(src, active_advert)
		live_display = FALSE
		update_appearance()

/obj/machinery/incident_display/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	if(!isliving(user))
		return

	var/mob/living/living_user = user

	if(held_item?.tool_behaviour == TOOL_WELDER && !living_user.combat_mode && atom_integrity < max_integrity)
		context[SCREENTIP_CONTEXT_LMB] = "repair display"

	if(held_item?.tool_behaviour == TOOL_MULTITOOL && !living_user.combat_mode)
		if(sign_features == DISPLAY_TRAM)
			context[SCREENTIP_CONTEXT_LMB] = "change to delam mode"
		else
			context[SCREENTIP_CONTEXT_LMB] = "change to tram mode"

	return CONTEXTUAL_SCREENTIP_SET

/obj/machinery/incident_display/welder_act(mob/living/user, obj/item/tool)
	if(user.combat_mode)
>>>>>>> tg-pr-88929
		return FALSE

	if(atom_integrity >= max_integrity && !(machine_stat & BROKEN))
		balloon_alert(user, "it doesn't need repairs!")
		return TRUE

	balloon_alert(user, "repairing display...")
<<<<<<< HEAD
	if(!tool.use_tool(src, user, 4 SECONDS, amount = 0, volume=50))
=======
	if(!tool.use_tool(src, user, 4 SECONDS, amount = 0, volume = 50))
>>>>>>> tg-pr-88929
		return TRUE

	balloon_alert(user, "repaired")
	atom_integrity = max_integrity
	set_machine_stat(machine_stat & ~BROKEN)
	update_appearance()
	return TRUE

// Switch modes with multitool
/obj/machinery/incident_display/multitool_act(mob/living/user, obj/item/tool)
<<<<<<< HEAD
	if(user.istate & ISTATE_HARM)
=======
	if(user.combat_mode)
>>>>>>> tg-pr-88929
		return FALSE

	if(sign_features == DISPLAY_TRAM)
		tool.play_tool_sound(src)
<<<<<<< HEAD
		balloon_alert(user, "set to dual")
		name = NAME_DUAL
		desc = DESC_DUAL
		icon_state = "stat_display_dual"
		sign_features = DISPLAY_DELAM | DISPLAY_TRAM
		update_delam_count(SSpersistence.rounds_since_engine_exploded, SSpersistence.delam_highscore)
		update_tram_count(src, SSpersistence.tram_hits_this_round)
		update_appearance()
		return TRUE
	else if(sign_features == DISPLAY_DELAM)
=======
		balloon_alert(user, "set to delam")
		name = NAME_DELAM
		desc = DESC_DELAM
		sign_features = DISPLAY_DELAM
		update_delam_count(SSpersistence.rounds_since_engine_exploded, SSpersistence.delam_highscore)
		update_appearance()
		return TRUE
	else
>>>>>>> tg-pr-88929
		tool.play_tool_sound(src)
		balloon_alert(user, "set to tram")
		name = NAME_TRAM
		desc = DESC_TRAM
<<<<<<< HEAD
		icon_state = "stat_display_tram"
=======
>>>>>>> tg-pr-88929
		sign_features = DISPLAY_TRAM
		update_tram_count(src, SSpersistence.tram_hits_this_round)
		update_appearance()
		return TRUE
<<<<<<< HEAD
	else if(sign_features == (DISPLAY_DELAM + DISPLAY_TRAM))
		tool.play_tool_sound(src)
		balloon_alert(user, "set to delam")
		name = NAME_DELAM
		desc = DESC_DELAM
		icon_state = "stat_display_delam"
		sign_features = DISPLAY_DELAM
		update_delam_count(SSpersistence.rounds_since_engine_exploded, SSpersistence.delam_highscore)
		update_appearance()
		return TRUE
=======
>>>>>>> tg-pr-88929

// EMP causes the display to display random numbers or outright break.
/obj/machinery/incident_display/emp_act(severity)
	. = ..()
	if(prob(50))
		set_machine_stat(machine_stat | BROKEN)
		update_appearance()
		return
<<<<<<< HEAD
	name = NAME_DUAL
	desc = DESC_DUAL
	icon_state = "stat_display_dual"
	sign_features = DISPLAY_DELAM | DISPLAY_TRAM
	hit_threshold = rand(1,99)
	hit_count = rand(1,99)
	last_delam = rand(1,99)
	delam_record = rand(1,99)
	update_appearance()

/obj/machinery/incident_display/deconstruct()
	if(flags_1 & NODECONSTRUCT_1)
		return

=======

	hit_threshold = rand(1,99)
	hit_count = rand(1,99)

	if(prob(33))
		last_delam = 0
		delam_record = 0
	else
		last_delam = rand(1,99)
		delam_record = rand(1,99)

	update_appearance()

/obj/machinery/incident_display/on_deconstruction(disassembled)
>>>>>>> tg-pr-88929
	new /obj/item/stack/sheet/mineral/titanium(drop_location(), 2)
	new /obj/item/shard(drop_location())
	new /obj/item/shard(drop_location())

<<<<<<< HEAD
	qdel(src)

=======
/**
 * Update the delamination count on the display
 *
 * Use the provided args to update the incident display when in delam mode.
 * Arguments:
 * * new_count - number of shifts without a delam
 * * record - current high score for the delam count
 */
>>>>>>> tg-pr-88929
/obj/machinery/incident_display/proc/update_delam_count(new_count, record)
	delam_record = record
	last_delam = min(new_count, 199)
	update_appearance()

<<<<<<< HEAD
=======
/**
 * Update the tram hit count on the display
 *
 * Sign receives a signal from SStransport that the tram has hit someone, and updates the count.
 * Arguments:
 * * source - hopefully is the transport subsystem
 * * tram_collisions - current number of tram hits
 */
>>>>>>> tg-pr-88929
/obj/machinery/incident_display/proc/update_tram_count(source, tram_collisions)
	SIGNAL_HANDLER

	hit_count = min(tram_collisions, 199)
	update_appearance()

<<<<<<< HEAD
/obj/machinery/incident_display/update_appearance(updates=ALL)
	. = ..()
	if(machine_stat & NOPOWER)
		icon_state = "stat_display_blank"
		set_light(0)
		return

	if(machine_stat & BROKEN)
		icon_state = "stat_display_broken"
		set_light(l_outer_range = 1.7, l_power = 1.5, l_color = LIGHT_COLOR_DARK_BLUE)
		return

	if(sign_features == (DISPLAY_DELAM + DISPLAY_TRAM))
		icon_state = "stat_display_dual"
	else if(sign_features == DISPLAY_DELAM)
		icon_state = "stat_display_delam"
	else if(sign_features == DISPLAY_TRAM)
		icon_state = "stat_display_tram"

	set_light(l_outer_range = 1.7, l_power = 1.5, l_color = LIGHT_COLOR_FAINT_BLUE)
=======
/**
 * Run an animated advert on the display
 *
 * Arguments:
 * * advert - icon state to flick to
 * * duration - length of the advert animation
 */
/obj/machinery/incident_display/proc/show_advert(advert, duration = 7 SECONDS)
	COOLDOWN_START(src, active_advert, duration)
	live_display = TRUE
	update_appearance()
	flick(advert, src)

/obj/machinery/incident_display/update_appearance(updates = ALL)
	. = ..()
	if(machine_stat & NOPOWER)
		icon_state = "display_normal"
		set_light(l_on = FALSE)
		return
	else if(machine_stat & BROKEN)
		icon_state = "display_broken"
		set_light(l_range = 1.7, l_power = 1.5, l_color = LIGHT_COLOR_NORMAL, l_on = TRUE)
	else if((sign_features & DISPLAY_DELAM) && last_delam <= 0) // you done fucked up
		icon_state = "display_shame"
		set_light(l_range = 1.7, l_power = 1.5, l_color = LIGHT_COLOR_SHAME, l_on = TRUE)
	else
		icon_state = "display_normal"
		set_light(l_range = 1.7, l_power = 1.5, l_color = LIGHT_COLOR_NORMAL, l_on = TRUE)
>>>>>>> tg-pr-88929

/obj/machinery/incident_display/update_overlays()
	. = ..()
	if(machine_stat & (NOPOWER|BROKEN))
		return

<<<<<<< HEAD
	var/mutable_appearance/moff_base_emissive = emissive_appearance(icon, "moff_base_emissive", src, alpha = src.alpha)
	. += moff_base_emissive

	if(sign_features & DISPLAY_DELAM)
		var/mutable_appearance/delam_base_emissive = emissive_appearance(icon, "delam_base_emissive", src, alpha = src.alpha)
		var/delam_display_color
		. += delam_base_emissive
		if(!last_delam)
			delam_display_color = LIGHT_COLOR_INTENSE_RED
		else
			delam_display_color = LIGHT_COLOR_HOLY_MAGIC

		var/delam_pos1 = last_delam % 10
		var/mutable_appearance/delam_pos1_overlay = mutable_appearance(icon, "num_[delam_pos1]")
		var/mutable_appearance/delam_pos1_emissive = emissive_appearance(icon, "num_[delam_pos1]_e", src, alpha = src.alpha)
		delam_pos1_overlay.color = delam_display_color
		delam_pos1_overlay.pixel_w = 9
		delam_pos1_emissive.pixel_w = 9
		delam_pos1_overlay.pixel_z = 4
		delam_pos1_emissive.pixel_z = 4
		. += delam_pos1_overlay
		. += delam_pos1_emissive

		var/delam_pos2 = (last_delam / 10) % 10
		var/mutable_appearance/delam_pos2_overlay = mutable_appearance(icon, "num_[delam_pos2]")
		var/mutable_appearance/delam_pos2_emissive = emissive_appearance(icon, "num_[delam_pos2]_e", src, alpha = src.alpha)
		delam_pos2_overlay.color = delam_display_color
		delam_pos2_overlay.pixel_w = 4
		delam_pos2_emissive.pixel_w = 4
		delam_pos2_overlay.pixel_z = 4
		delam_pos2_emissive.pixel_z = 4
=======
	. += emissive_appearance(icon, "display_emissive", src, alpha = DISPLAY_BASE_ALPHA)

	if(COOLDOWN_STARTED(src, active_advert)) // we don't show the static content during adverts
		return

	if(sign_features & DISPLAY_DELAM)
		. += mutable_appearance(icon, "overlay_delam")
		. += emissive_appearance(icon, "overlay_delam", src, alpha = DISPLAY_PIXEL_ALPHA)

		var/delam_pos1 = clamp(last_delam, 0, 199) % 10
		var/mutable_appearance/delam_pos1_overlay = mutable_appearance(icon, "num_[delam_pos1]")
		var/mutable_appearance/delam_pos1_emissive = emissive_appearance(icon, "num_[delam_pos1]", src, alpha = DISPLAY_PIXEL_ALPHA)
		delam_pos1_overlay.color = delam_display_color
		delam_pos1_overlay.pixel_w = DISPLAY_PIXEL_1_W
		delam_pos1_emissive.pixel_w = DISPLAY_PIXEL_1_W
		delam_pos1_overlay.pixel_z = DISPLAY_PIXEL_1_Z
		delam_pos1_emissive.pixel_z = DISPLAY_PIXEL_1_Z
		. += delam_pos1_overlay
		. += delam_pos1_emissive

		var/delam_pos2 = (clamp(last_delam, 0, 199) / 10) % 10
		var/mutable_appearance/delam_pos2_overlay = mutable_appearance(icon, "num_[delam_pos2]")
		var/mutable_appearance/delam_pos2_emissive = emissive_appearance(icon, "num_[delam_pos2]", src, alpha = DISPLAY_PIXEL_ALPHA)
		delam_pos2_overlay.color = delam_display_color
		delam_pos2_overlay.pixel_w = DISPLAY_PIXEL_2_W
		delam_pos2_emissive.pixel_w = DISPLAY_PIXEL_2_W
		delam_pos2_overlay.pixel_z = DISPLAY_PIXEL_2_Z
		delam_pos2_emissive.pixel_z = DISPLAY_PIXEL_2_Z
>>>>>>> tg-pr-88929
		. += delam_pos2_overlay
		. += delam_pos2_emissive

		if(last_delam >= 100)
<<<<<<< HEAD
			var/mutable_appearance/there_i_fixed_it_overlay = mutable_appearance(icon, "num_100_red")
			var/mutable_appearance/there_i_fixed_it_emissive = emissive_appearance(icon, "num_100_red", src, alpha = src.alpha)
			. += there_i_fixed_it_overlay
			. += there_i_fixed_it_emissive

		if(last_delam == delam_record)
			var/mutable_appearance/delam_trend_overlay = mutable_appearance(icon, TREND_RISING)
			var/mutable_appearance/delam_trend_emissive = emissive_appearance(icon, "[TREND_RISING]_e", src, alpha = src.alpha)
			delam_trend_overlay.color = LIGHT_COLOR_VIVID_GREEN
			delam_trend_overlay.pixel_w = 1
			delam_trend_emissive.pixel_w = 1
			delam_trend_overlay.pixel_z = 6
			delam_trend_emissive.pixel_z = 6
=======
			. += mutable_appearance(icon, "num_100_red")
			. += emissive_appearance(icon, "num_100_red", src, alpha = DISPLAY_BASE_ALPHA)

		if(last_delam == delam_record)
			var/mutable_appearance/delam_trend_overlay = mutable_appearance(icon, TREND_RISING)
			var/mutable_appearance/delam_trend_emissive = emissive_appearance(icon, "[TREND_RISING]", src, alpha = DISPLAY_PIXEL_ALPHA)
			delam_trend_overlay.color = COLOR_DISPLAY_GREEN
>>>>>>> tg-pr-88929
			. += delam_trend_overlay
			. += delam_trend_emissive
		else
			var/mutable_appearance/delam_trend_overlay = mutable_appearance(icon, TREND_FALLING)
<<<<<<< HEAD
			var/mutable_appearance/delam_trend_emissive = emissive_appearance(icon, "[TREND_FALLING]_e", src, alpha = src.alpha)
			delam_trend_overlay.color = LIGHT_COLOR_INTENSE_RED
			delam_trend_overlay.pixel_w = 1
			delam_trend_emissive.pixel_w = 1
			delam_trend_overlay.pixel_z = 6
			delam_trend_emissive.pixel_z = 6
=======
			var/mutable_appearance/delam_trend_emissive = emissive_appearance(icon, "[TREND_FALLING]", src, alpha = DISPLAY_PIXEL_ALPHA)
			delam_trend_overlay.color = COLOR_DISPLAY_RED
>>>>>>> tg-pr-88929
			. += delam_trend_overlay
			. += delam_trend_emissive

	if(sign_features & DISPLAY_TRAM)
<<<<<<< HEAD
		var/mutable_appearance/tram_base_emissive = emissive_appearance(icon, "tram_base_emissive", src, alpha = src.alpha)
		var/tram_display_color = LIGHT_COLOR_BABY_BLUE

		var/tram_pos1 = hit_count % 10
		var/mutable_appearance/tram_pos1_overlay = mutable_appearance(icon, "num_[tram_pos1]")
		var/mutable_appearance/tram_pos1_emissive = emissive_appearance(icon, "num_[tram_pos1]_e", src, alpha = src.alpha)
		. += tram_base_emissive
		tram_pos1_overlay.color = tram_display_color
		tram_pos1_overlay.pixel_w = 9
		tram_pos1_emissive.pixel_w = 9
		tram_pos1_overlay.pixel_z = -6
		tram_pos1_emissive.pixel_z = -6
=======
		. += mutable_appearance(icon, "overlay_tram")
		. += emissive_appearance(icon, "overlay_tram", src, alpha = DISPLAY_PIXEL_ALPHA)

		var/tram_pos1 = hit_count % 10
		var/mutable_appearance/tram_pos1_overlay = mutable_appearance(icon, "num_[tram_pos1]")
		var/mutable_appearance/tram_pos1_emissive = emissive_appearance(icon, "num_[tram_pos1]", src, alpha = DISPLAY_PIXEL_ALPHA)
		tram_pos1_overlay.color = tram_display_color
		tram_pos1_overlay.pixel_w = DISPLAY_PIXEL_1_W
		tram_pos1_emissive.pixel_w = DISPLAY_PIXEL_1_W
		tram_pos1_overlay.pixel_z = DISPLAY_PIXEL_1_Z
		tram_pos1_emissive.pixel_z = DISPLAY_PIXEL_1_Z
>>>>>>> tg-pr-88929
		. += tram_pos1_overlay
		. += tram_pos1_emissive

		var/tram_pos2 = (hit_count / 10) % 10
		var/mutable_appearance/tram_pos2_overlay = mutable_appearance(icon, "num_[tram_pos2]")
<<<<<<< HEAD
		var/mutable_appearance/tram_pos2_emissive = emissive_appearance(icon, "num_[tram_pos2]_e", src, alpha = src.alpha)
		tram_pos2_overlay.color = tram_display_color
		tram_pos2_overlay.pixel_w = 4
		tram_pos2_emissive.pixel_w = 4
		tram_pos2_overlay.pixel_z = -6
		tram_pos2_emissive.pixel_z = -6
=======
		var/mutable_appearance/tram_pos2_emissive = emissive_appearance(icon, "num_[tram_pos2]", src, alpha = DISPLAY_PIXEL_ALPHA)
		tram_pos2_overlay.color = tram_display_color
		tram_pos2_overlay.pixel_w = DISPLAY_PIXEL_2_W
		tram_pos2_emissive.pixel_w = DISPLAY_PIXEL_2_W
		tram_pos2_overlay.pixel_z = DISPLAY_PIXEL_2_Z
		tram_pos2_emissive.pixel_z = DISPLAY_PIXEL_2_Z
>>>>>>> tg-pr-88929
		. += tram_pos2_overlay
		. += tram_pos2_emissive

		if(hit_count >= 100)
<<<<<<< HEAD
			var/mutable_appearance/there_i_fixed_it_overlay = mutable_appearance(icon, "num_100_blue")
			var/mutable_appearance/there_i_fixed_it_emissive = emissive_appearance(icon, "num_100_blue", src, alpha = src.alpha)
			. += there_i_fixed_it_overlay
			. += there_i_fixed_it_emissive

		if(hit_count > SSpersistence.tram_hits_last_round)
			var/mutable_appearance/tram_trend_overlay = mutable_appearance(icon, TREND_RISING)
			var/mutable_appearance/tram_trend_emissive = emissive_appearance(icon, "[TREND_RISING]_e", src, alpha = src.alpha)
			tram_trend_overlay.color = LIGHT_COLOR_INTENSE_RED
			tram_trend_overlay.pixel_w = 1
			tram_trend_emissive.pixel_w = 1
			tram_trend_overlay.pixel_z = -4
			tram_trend_emissive.pixel_z = -4
=======
			. += mutable_appearance(icon, "num_100_blue")
			. += emissive_appearance(icon, "num_100_blue", src, alpha = DISPLAY_BASE_ALPHA)

		if(hit_count > SSpersistence.tram_hits_last_round)
			var/mutable_appearance/tram_trend_overlay = mutable_appearance(icon, TREND_RISING)
			var/mutable_appearance/tram_trend_emissive = emissive_appearance(icon, "[TREND_RISING]", src, alpha = DISPLAY_PIXEL_ALPHA)
			tram_trend_overlay.color = COLOR_DISPLAY_RED
>>>>>>> tg-pr-88929
			. += tram_trend_overlay
			. += tram_trend_emissive
		else
			var/mutable_appearance/tram_trend_overlay = mutable_appearance(icon, TREND_FALLING)
<<<<<<< HEAD
			var/mutable_appearance/tram_trend_emissive = emissive_appearance(icon, "[TREND_FALLING]_e", src, alpha = src.alpha)
			tram_trend_overlay.color = LIGHT_COLOR_VIVID_GREEN
			tram_trend_overlay.pixel_w = 1
			tram_trend_emissive.pixel_w = 1
			tram_trend_overlay.pixel_z = -4
			tram_trend_emissive.pixel_z = -4
=======
			var/mutable_appearance/tram_trend_emissive = emissive_appearance(icon, "[TREND_FALLING]", src, alpha = DISPLAY_PIXEL_ALPHA)
			tram_trend_overlay.color = COLOR_DISPLAY_GREEN
>>>>>>> tg-pr-88929
			. += tram_trend_overlay
			. += tram_trend_emissive

/obj/machinery/incident_display/examine(mob/user)
	. = ..()
<<<<<<< HEAD

	if(sign_features & DISPLAY_DELAM)
		. += span_info("It has been [last_delam] shift\s since the last delamination event at this Nanotrasen facility.")
		switch (last_delam)
			if(0)
				. += span_info("In case you didn't notice.<br/>")
			if(1)
				. += span_info("Let's do better today.<br/>")
			if(2 to 5)
				. += span_info("There's room for improvement.<br/>")
			if(6 to 10)
				. += span_info("Good work!<br/>")
			if(69)
				. += span_info("Nice.<br/>")
			else
				. += span_info("Incredible!<br/>")

	if(sign_features & DISPLAY_TRAM)
		. += span_info("The station has had [hit_count] tram incident\s this shift.")
		switch (hit_count)
=======
	if(atom_integrity < max_integrity)
		. += span_notice("It can be repaired with a [EXAMINE_HINT("welder")].")

	if(sign_features & DISPLAY_DELAM)
		. += span_notice("It can be changed to display tram hits with a [EXAMINE_HINT("multitool")].")
		if(last_delam >= 0)
			. += span_info("It has been [last_delam] shift\s since the last delamination event at this Nanotrasen facility.")
			switch(last_delam)
				if(0)
					. += span_info("Let's do better today.<br/>")
				if(1 to 5)
					. += span_info("There's room for improvement.<br/>")
				if(6 to 10)
					. += span_info("Good work!<br/>")
				if(69)
					. += span_info("Nice.<br/>")
				else
					. += span_info("Incredible!<br/>")
		else
			. += span_info("The supermatter crystal has delaminated, in case you didn't notice.")

	if(sign_features & DISPLAY_TRAM)
		. += span_notice("It can be changed to display delam-free shifts with a [EXAMINE_HINT("multitool")].")
		. += span_info("The station has had [hit_count] tram incident\s this shift.")
		switch(hit_count)
>>>>>>> tg-pr-88929
			if(0)
				. += span_info("Fantastic! Champions of safety.<br/>")
			if(1)
				. += span_info("Let's do better tomorrow.<br/>")
			if(2 to 5)
				. += span_info("There's room for improvement.<br/>")
			if(6 to 10)
				. += span_info("Good work! Nanotrasen's finest!<br/>")
			if(69)
				. += span_info("Nice.<br/>")
			else
				. += span_info("Incredible! You're probably reading this from medbay.<br/>")

#undef DISPLAY_DELAM
#undef DISPLAY_TRAM

<<<<<<< HEAD
#undef NAME_DUAL
#undef NAME_DELAM
#undef NAME_TRAM

#undef DESC_DUAL
#undef DESC_DELAM
#undef DESC_TRAM
=======
#undef NAME_DELAM
#undef NAME_TRAM

#undef DESC_DELAM
#undef DESC_TRAM

#undef TREND_RISING
#undef TREND_FALLING

#undef DISPLAY_PIXEL_1_W
#undef DISPLAY_PIXEL_1_Z
#undef DISPLAY_PIXEL_2_W
#undef DISPLAY_PIXEL_2_Z
#undef DISPLAY_BASE_ALPHA
#undef DISPLAY_PIXEL_ALPHA

#undef LIGHT_COLOR_NORMAL
#undef LIGHT_COLOR_SHAME
>>>>>>> tg-pr-88929
