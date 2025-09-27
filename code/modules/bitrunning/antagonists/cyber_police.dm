<<<<<<< HEAD
/datum/job/cyber_police
	title = ROLE_CYBER_POLICE

/datum/antagonist/bitrunning_glitch/cyber_police
	name = ROLE_CYBER_POLICE
	job_rank = ROLE_CYBER_POLICE
	show_to_ghosts = TRUE
	ui_name = "AntagInfoGlitch"

/datum/antagonist/bitrunning_glitch/cyber_police/greet()
	. = ..()
	owner.announce_objectives()

/datum/antagonist/bitrunning_glitch/cyber_police/on_gain()
=======
/datum/antagonist/bitrunning_glitch/cyber_police
	name = ROLE_CYBER_POLICE
	show_in_antagpanel = TRUE

/datum/antagonist/bitrunning_glitch/cyber_police/on_gain()
	. = ..()

>>>>>>> tg-pr-88929
	if(!ishuman(owner.current))
		stack_trace("humans only for this position")
		return

<<<<<<< HEAD
	forge_objectives()

	var/mob/living/carbon/human/player = owner.current

	player.equipOutfit(/datum/outfit/cyber_police)
	player.fully_replace_character_name(player.name, pick(GLOB.cyberauth_names))

	var/datum/martial_art/the_sleeping_carp/carp = new()
	carp.teach(player)

	player.add_traits(list(
		//TRAIT_NO_AUGMENTS,
		TRAIT_NO_DNA_COPY,
		TRAIT_NOBLOOD,
		TRAIT_NOBREATH,
		TRAIT_NOHUNGER,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_WEATHER_IMMUNE,
		), TRAIT_GENERIC,
	)

	player.faction |= list(
		FACTION_BOSS,
		FACTION_HIVEBOT,
		FACTION_HOSTILE,
		FACTION_SPIDER,
		FACTION_STICKMAN,
		ROLE_ALIEN,
		ROLE_CYBER_POLICE,
		ROLE_SYNDICATE,
	)

	return ..()

/datum/antagonist/bitrunning_glitch/cyber_police/forge_objectives()
	var/datum/objective/cyber_police_fluff/objective = new()
	objective.owner = owner
	objectives += objective

/datum/objective/cyber_police_fluff/New()
	var/list/explanation_texts = list(
		"Execute termination protocol on unauthorized entities.",
		"Initialize system purge of irregular anomalies.",
		"Deploy correction algorithms on aberrant code.",
		"Run debug routine on intruding elements.",
		"Start elimination procedure for system threats.",
		"Execute defense routine against non-conformity.",
		"Commence operation to neutralize intruding scripts.",
		"Commence clean-up protocol on corrupt data.",
		"Begin scan for aberrant code for termination.",
		"Initiate lockdown on all rogue scripts.",
		"Run integrity check and purge for digital disorder."
	)
	explanation_text = pick(explanation_texts)
	..()

/datum/objective/cyber_police_fluff/check_completion()
	var/list/servers = SSmachines.get_machines_by_type(/obj/machinery/quantum_server)
	if(!length(servers))
		return TRUE

	for(var/obj/machinery/quantum_server/server as anything in servers)
		if(!server.is_operational)
			continue
		return FALSE

	return TRUE
=======
	convert_agent()

	var/datum/martial_art/the_sleeping_carp/carp = new()
	carp.teach(owner.current)

/datum/outfit/cyber_police
	name = ROLE_CYBER_POLICE
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/color/black
	id = /obj/item/card/id/advanced
	id_trim = /datum/id_trim/cyber_police
	shoes = /obj/item/clothing/shoes/laceup
	uniform = /obj/item/clothing/under/suit/black_really

/datum/outfit/cyber_police/pre_equip(mob/living/carbon/human/user, visuals_only)
	if(!visuals_only)
		return

	user.set_facial_hairstyle("Shaved", update = FALSE)
	user.set_haircolor("#4B3D28", update = FALSE)
	user.set_hairstyle("Business Hair")

/datum/outfit/cyber_police/post_equip(mob/living/carbon/human/user, visuals_only)
	var/obj/item/clothing/under/officer_uniform = user.w_uniform
	if(officer_uniform)
		officer_uniform.has_sensor = NO_SENSORS
		officer_uniform.sensor_mode = SENSOR_OFF
		user.update_suit_sensors()

>>>>>>> tg-pr-88929
