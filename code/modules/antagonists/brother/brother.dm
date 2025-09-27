/datum/antagonist/brother
	name = "\improper Brother"
	antagpanel_category = "Brother"
	job_rank = ROLE_BROTHER
	var/special_role = ROLE_BROTHER
	antag_hud_name = "brother"
	hijack_speed = 0.5
	ui_name = "AntagInfoBrother"
	suicide_cry = "FOR MY BROTHER!!"
	antag_moodlet = /datum/mood_event/focused
	hardcore_random_bonus = TRUE
<<<<<<< HEAD
	antag_flags = parent_type::antag_flags | FLAG_ANTAG_CAP_TEAM // monkestation addition
	stinger_sound = 'sound/ambience/antag/tatoralert.ogg'
	var/datum/action/bb/comms/comms_action
	var/datum/action/bb/gear/gear_action
	VAR_PRIVATE/datum/team/brother_team/team
=======
	stinger_sound = 'sound/music/antag/traitor/tatoralert.ogg'
	VAR_PRIVATE
		datum/team/brother_team/team
>>>>>>> tg-pr-88929

/datum/antagonist/brother/create_team(datum/team/brother_team/new_team)
	if(!new_team)
		return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	team = new_team
	set_hud_keys(REF(new_team))

/datum/antagonist/brother/get_team()
	return team

/datum/antagonist/brother/on_gain()
	objectives |= team.objectives
	owner.special_role = special_role
	finalize_brother()

	if (team.brothers_left <= 0)
		return ..()

	var/mob/living/carbon/carbon_owner = owner.current
	if (!istype(carbon_owner))
		return ..()

	grant_conversion_skills()
	carbon_owner.equip_conspicuous_item(new /obj/item/assembly/flash)

	var/is_first_brother = team.members.len == 1
	if (!is_first_brother)
		to_chat(carbon_owner, span_boldwarning("The Syndicate have higher expectations from you than others. They have granted you an extra flash to convert one other person."))

	return ..()

/datum/antagonist/brother/on_removal()
	owner.special_role = null
	remove_conversion_skills()
	return ..()

<<<<<<< HEAD
// Apply team-specific antag HUD.
/datum/antagonist/brother/apply_innate_effects(mob/living/mob_override)
	. = ..()
	if(QDELETED(comms_action))
		comms_action = new(src)
	if(QDELETED(gear_action) && !team.summoned_gear)
		gear_action = new(src)
	var/mob/living/target = mob_override || owner.current
	comms_action.Grant(target)
	gear_action?.Grant(target)
	add_team_hud(target, /datum/antagonist/brother, REF(team))

/datum/antagonist/brother/remove_innate_effects(mob/living/mob_override)
	. = ..()
	comms_action?.Remove(mob_override || owner.current)
	QDEL_NULL(comms_action)
	gear_action?.Remove(mob_override || owner.current)
	QDEL_NULL(gear_action)
=======
/// Give us the ability to add another brother
/datum/antagonist/brother/proc/grant_conversion_skills()
	var/mob/living/carbon/carbon_owner = owner.current
	if (!istype(carbon_owner))
		return
	carbon_owner.AddComponentFrom(REF(src), /datum/component/can_flash_from_behind)
	RegisterSignal(carbon_owner, COMSIG_MOB_SUCCESSFUL_FLASHED_CARBON, PROC_REF(on_mob_successful_flashed_carbon))

/// Take away the ability to add more brothers
/datum/antagonist/brother/proc/remove_conversion_skills()
	if (isnull(owner.current))
		return
	var/mob/living/carbon/carbon_owner = owner.current
	carbon_owner.RemoveComponentSource(REF(src), /datum/component/can_flash_from_behind)
	UnregisterSignal(carbon_owner, COMSIG_MOB_SUCCESSFUL_FLASHED_CARBON)

/datum/antagonist/brother/proc/on_mob_successful_flashed_carbon(mob/living/source, mob/living/carbon/flashed, obj/item/assembly/flash/flash)
	SIGNAL_HANDLER

	if (flashed.stat == DEAD)
		return

	if (flashed.stat != CONSCIOUS)
		flashed.balloon_alert(source, "unconscious!")
		return

#ifdef TESTING
	if (isnull(flashed.mind))
		flashed.mind_initialize()
#else
	if (isnull(flashed.mind) || !GET_CLIENT(flashed))
		flashed.balloon_alert(source, "[flashed.p_their()] mind is vacant!")
		return
#endif

	for(var/datum/objective/brother_objective as anything in source.mind.get_all_objectives())
		// If the objective has a target, are we flashing them?
		if(flashed == brother_objective.target?.current)
			flashed.balloon_alert(source, "that's your target!")
			return

	if (flashed.mind.has_antag_datum(/datum/antagonist/brother))
		flashed.balloon_alert(source, "[flashed.p_theyre()] loyal to someone else!")
		return

	if (HAS_TRAIT(flashed, TRAIT_UNCONVERTABLE))
		flashed.balloon_alert(source, "[flashed.p_they()] resist!")
		return

	if (!team.add_brother(flashed, key_name(source))) // Shouldn't happen given the former, more specific checks but just in case
		flashed.balloon_alert(source, "failed!")
		return

	source.log_message("converted [key_name(flashed)] to blood brother", LOG_ATTACK)
	flashed.log_message("was converted by [key_name(source)] to blood brother", LOG_ATTACK)
	log_game("[key_name(flashed)] was made into a blood brother by [key_name(source)]", list(
		"converted" = flashed,
		"converted by" = source,
	))
	flash.burn_out()
	flashed.mind.add_memory( \
		/datum/memory/recruited_by_blood_brother, \
		protagonist = flashed, \
		antagonist = owner.current, \
	)
	flashed.balloon_alert(source, "converted")
>>>>>>> tg-pr-88929

/datum/antagonist/brother/antag_panel_data()
	return "Conspirators : [get_brother_names()] | Remaining: [team.brothers_left]"

/datum/antagonist/brother/get_admin_commands()
	. = ..()
	.["Adjust Remaining Conversions"] = CALLBACK(src, PROC_REF(update_recruitments_remaining))

/// Add or remove the potential to put more bros in here
/datum/antagonist/brother/proc/update_recruitments_remaining(mob/admin)
	var/new_count = tgui_input_number(admin, "How many more people should be able to be recruited?", "Adjust Conversions Remaining", default = 1, min_value = 0)
	if (isnull(new_count))
		return
	team.set_brothers_left(new_count)

// monkestation start: refactor to use [get_base_preview_icon] for better midround polling images
/datum/antagonist/brother/get_base_preview_icon()
	var/mob/living/carbon/human/dummy/consistent/brother1 = new
	var/mob/living/carbon/human/dummy/consistent/brother2 = new
	var/datum/color_palette/generic_colors/located = brother1.dna.color_palettes[/datum/color_palette/generic_colors]

	located.ethereal_color = GLOB.color_list_ethereal["Faint Red"]
	brother1.set_species(/datum/species/ethereal)

	brother2.dna.features["moth_antennae"] = "Plain"
	brother2.dna.features["moth_markings"] = "None"
	brother2.dna.features["moth_wings"] = "Plain"
	brother2.set_species(/datum/species/moth)

	var/icon/brother1_icon = render_preview_outfit(/datum/outfit/job/quartermaster, brother1)
	var/icon/blood1_icon = icon('icons/effects/blood.dmi', "maskblood")
	blood1_icon.Blend(COLOR_BLOOD, ICON_MULTIPLY)
	brother1_icon.Blend(blood1_icon, ICON_OVERLAY)
	brother1_icon.Shift(WEST, 8)

	var/icon/brother2_icon = render_preview_outfit(/datum/outfit/job/scientist/consistent, brother2)
	var/icon/blood2_icon = icon('icons/effects/blood.dmi', "uniformblood")
	blood2_icon.Blend(COLOR_BLOOD, ICON_MULTIPLY)
	brother2_icon.Blend(blood2_icon, ICON_OVERLAY)
	brother2_icon.Shift(EAST, 8)

	var/icon/final_icon = brother1_icon
	final_icon.Blend(brother2_icon, ICON_OVERLAY)

	qdel(brother1)
	qdel(brother2)

	return final_icon

<<<<<<< HEAD
/datum/antagonist/brother/get_preview_icon()
	return finish_preview_icon(get_base_preview_icon())
// monkestation end

/datum/antagonist/brother/proc/get_brother_names(add_span = FALSE)
	var/list/names = list()
	for(var/datum/mind/brother as anything in team.members - owner)
		names += add_span ? span_name(brother.name) : brother.name
	return english_list(names)

=======
/datum/antagonist/brother/proc/get_brother_names()
	var/list/brothers = team.members - owner
	if (!length(brothers))
		return "none"

	var/brother_text = ""
	for(var/i = 1 to brothers.len)
		var/datum/mind/M = brothers[i]
		brother_text += M.name
		if(i == brothers.len - 1)
			brother_text += " and "
		else if(i != brothers.len)
			brother_text += ", "
	return brother_text

>>>>>>> tg-pr-88929
/datum/antagonist/brother/greet()
	to_chat(owner.current, span_alertsyndie("You are the [owner.special_role]."))
	owner.announce_objectives()

/datum/antagonist/brother/proc/finalize_brother()
	play_stinger()
	team.update_name()

/datum/antagonist/brother/admin_add(datum/mind/new_owner,mob/admin)
	var/datum/team/brother_team/team = new
	team.add_member(new_owner)
<<<<<<< HEAD
	team.forge_brother_objectives()
	new_owner.add_antag_datum(/datum/antagonist/brother, team)
	team.update_name()
	message_admins("[key_name_admin(admin)] made [key_name_admin(new_owner)] into a blood brother.")
	log_admin("[key_name(admin)] made [key_name(new_owner)] into a blood brother.")
=======
	new_owner.add_antag_datum(/datum/antagonist/brother, team)
	message_admins("[key_name_admin(admin)] made [key_name_admin(new_owner)] into a blood brother.")
	log_admin("[key_name(admin)] made [key_name(new_owner)] into a blood brother.")

/datum/antagonist/brother/apply_innate_effects(mob/living/mob_override)
	. = ..()
	var/mob/living/the_mob = owner.current || mob_override
	add_team_hud(the_mob)
>>>>>>> tg-pr-88929

/datum/antagonist/brother/ui_static_data(mob/user)
	var/list/data = list()
	data["antag_name"] = name
	data["objectives"] = get_objectives()
	return data

<<<<<<< HEAD
/datum/antagonist/brother/antag_token(datum/mind/hosts_mind, mob/spender)
	var/datum/team/brother_team/team = new
	if(isobserver(spender))
		var/mob/living/carbon/human/new_mob = spender.change_mob_type(/mob/living/carbon/human, delete_old_mob = TRUE)
		new_mob.equipOutfit(/datum/outfit/job/assistant)
		var/datum/mind/new_mind = new_mob.mind
		team.add_member(new_mind)
		team.forge_brother_objectives()
		new_mind.add_antag_datum(/datum/antagonist/brother, team)
	else
		team.add_member(hosts_mind)
		team.forge_brother_objectives()
		hosts_mind.add_antag_datum(/datum/antagonist/brother, team)

/datum/antagonist/brother/proc/communicate(message)
	if(!istext(message) || !length(message) || QDELETED(owner) || QDELETED(team))
		return
	owner.current.log_talk(html_decode(message), LOG_SAY, tag = "blood brother")
	var/formatted_msg = "<span class='[team.color]'><b><i>\[Blood Bond\]</i> [span_name("[owner.name]")]</b>: [message]</span>"
	for(var/datum/mind/brother as anything in team.members)
		var/mob/living/target = brother.current
		if(QDELETED(target))
			continue
		if(brother != owner)
			target.balloon_alert(target, "you hear a voice")
			target.playsound_local(get_turf(target), 'goon/sounds/misc/talk/radio_ai.ogg', vol = 25, vary = FALSE, pressure_affected = FALSE, use_reverb = FALSE)
		to_chat(target, formatted_msg, type = MESSAGE_TYPE_RADIO, avoid_highlighting = (brother == owner))
	for(var/dead_mob in GLOB.dead_mob_list)
		var/link = FOLLOW_LINK(dead_mob, owner.current)
		to_chat(dead_mob, "[link] [formatted_msg]", type = MESSAGE_TYPE_RADIO)
=======
/datum/team/brother_team
	name = "\improper Blood Brothers"
	member_name = "blood brother"
	var/brothers_left = 2

/datum/team/brother_team/New(starting_members)
	. = ..()
	if (prob(10))
		brothers_left += 1

/datum/team/brother_team/add_member(datum/mind/new_member)
	. = ..()
	if (!length(objectives))
		forge_brother_objectives()
	if (!new_member.has_antag_datum(/datum/antagonist/brother))
		add_brother(new_member.current)

/datum/team/brother_team/remove_member(datum/mind/member)
	if (!(member in members))
		return
	. = ..()
	member.remove_antag_datum(/datum/antagonist/brother)
	if (!length(members))
		qdel(src)
		return
	if (isnull(member.current))
		return
	for (var/datum/mind/brother_mind as anything in members)
		to_chat(brother_mind, span_warning("[span_bold("[member.current.real_name]")] is no longer your brother!"))
	update_name()

/// Adds a new brother to the team
/datum/team/brother_team/proc/add_brother(mob/living/new_brother, source)
#ifndef TESTING
	if (isnull(new_brother) || isnull(new_brother.mind) || !GET_CLIENT(new_brother) || new_brother.mind.has_antag_datum(/datum/antagonist/brother))
		return FALSE
#else
	if (isnull(new_brother) || new_brother.mind.has_antag_datum(/datum/antagonist/brother))
		return FALSE
#endif

	set_brothers_left(brothers_left - 1)
	for (var/datum/mind/brother_mind as anything in members)
		if (brother_mind == new_brother.mind)
			continue

		to_chat(brother_mind, span_notice("[span_bold("[new_brother.real_name]")] has been converted to aid you as your brother!"))
		if (brothers_left == 0)
			to_chat(brother_mind, span_notice("You cannot recruit any more brothers."))

	new_brother.mind.add_antag_datum(/datum/antagonist/brother, src)

	return TRUE

/datum/team/brother_team/proc/update_name()
	var/list/last_names = list()
	for(var/datum/mind/team_minds as anything in members)
		var/list/split_name = splittext(team_minds.name," ")
		last_names += split_name[split_name.len]

	if (last_names.len == 1)
		name = "[last_names[1]]'s Isolated Intifada"
	else
		name = "[initial(name)] of " + last_names.Join(" & ")

/datum/team/brother_team/proc/forge_brother_objectives()
	objectives = list()

	add_objective(new /datum/objective/convert_brother)

	var/is_hijacker = prob(10)
	for(var/i = 1 to max(1, CONFIG_GET(number/brother_objectives_amount) + (brothers_left > 2) - is_hijacker))
		forge_single_objective()
	if(is_hijacker)
		if(!locate(/datum/objective/hijack) in objectives)
			add_objective(new /datum/objective/hijack)
	else if(!locate(/datum/objective/escape) in objectives)
		add_objective(new /datum/objective/escape)

/datum/team/brother_team/proc/forge_single_objective()
	if(prob(50))
		if(LAZYLEN(active_ais()) && prob(100/GLOB.joined_player_list.len))
			add_objective(new /datum/objective/destroy, needs_target = TRUE)
		else if(prob(30))
			add_objective(new /datum/objective/maroon, needs_target = TRUE)
		else
			add_objective(new /datum/objective/assassinate, needs_target = TRUE)
	else
		add_objective(new /datum/objective/steal, needs_target = TRUE)

/// Control how many more people we can recruit
/datum/team/brother_team/proc/set_brothers_left(remaining_brothers)
	if (brothers_left == remaining_brothers)
		return

	if (brothers_left == 0 && remaining_brothers > 0)
		for (var/datum/mind/brother_mind as anything in members)
			var/datum/antagonist/brother/brother_datum = brother_mind.has_antag_datum(/datum/antagonist/brother)
			brother_datum?.grant_conversion_skills()

	else if (brothers_left > 0 && remaining_brothers <= 0)
		for (var/datum/mind/brother_mind as anything in members)
			var/datum/antagonist/brother/brother_datum = brother_mind.has_antag_datum(/datum/antagonist/brother)
			brother_datum?.remove_conversion_skills()
	brothers_left = remaining_brothers

/datum/objective/convert_brother
	name = "convert brother"
	explanation_text = "Convert a brainwashable person using your flash on them directly. Any handheld flash will work if you lose or break your starting flash."
	admin_grantable = FALSE
	martyr_compatible = TRUE

/datum/objective/convert_brother/check_completion()
	return length(team?.members) > 1
>>>>>>> tg-pr-88929
