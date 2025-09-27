/datum/job/quartermaster
	title = JOB_QUARTERMASTER
	description = "Coordinate cargo technicians and shaft miners, assist with \
		economical purchasing."
	department_head = list(JOB_HEAD_OF_PERSONNEL)
	// head_announce = list(RADIO_CHANNEL_SUPPLY) // Monkestation Edit- QMs are not heads. No head announcement for non-heads.
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 7
	supervisors = SUPERVISOR_HOP //Monkestation Edit - QMs are not command
	exp_requirements = 120
	exp_required_type_department = EXP_TYPE_SUPPLY
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "QUARTERMASTER"

	outfit = /datum/outfit/job/quartermaster
	plasmaman_outfit = /datum/outfit/plasmaman/cargo

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CAR

<<<<<<< HEAD
	liver_traits = list(TRAIT_PRETENDER_ROYAL_METABOLISM) // finally upgraded
=======
	mind_traits = list(HEAD_OF_STAFF_MIND_TRAITS)
	liver_traits = list(TRAIT_ROYAL_METABOLISM) // finally upgraded
>>>>>>> tg-pr-88929

	display_order = JOB_DISPLAY_ORDER_QUARTERMASTER
	bounty_types = CIV_JOB_RANDOM
	departments_list = list(
		/datum/job_department/cargo,
		)
	family_heirlooms = list(/obj/item/stamp, /obj/item/stamp/denied)
	mail_goodies = list(
		/obj/item/circuitboard/machine/emitter = 3
	)
	rpg_title = "Steward"
<<<<<<< HEAD
	job_flags = STATION_JOB_FLAGS | JOB_BOLD_SELECT_TEXT | JOB_CANNOT_OPEN_SLOTS
	ignore_human_authority = TRUE
=======
	job_flags = STATION_JOB_FLAGS | HEAD_OF_STAFF_JOB_FLAGS
	voice_of_god_power = 1.4 //Command staff has authority
	human_authority = JOB_AUTHORITY_NON_HUMANS_ALLOWED
>>>>>>> tg-pr-88929

/datum/outfit/job/quartermaster
	name = "Quartermaster"
	jobtype = /datum/job/quartermaster
	id_trim = /datum/id_trim/job/quartermaster
	id = /obj/item/card/id/advanced // Monkestation Edit - QM is not a head
	uniform = /obj/item/clothing/under/rank/cargo/qm
<<<<<<< HEAD
	belt = /obj/item/modular_computer/pda/quartermaster //Monkestation Edit - QM is not a head, re-defined the PDA to the non-head typepath.
	ears = /obj/item/radio/headset/headset_cargo //Monkestation Edit - QM is not a head, changed headset to standard cargo headset.
=======
	belt = /obj/item/modular_computer/pda/heads/quartermaster
	suit = /obj/item/clothing/suit/jacket/quartermaster
	ears = /obj/item/radio/headset/heads/qm
>>>>>>> tg-pr-88929
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/laceup
	l_hand = /obj/item/clipboard

	chameleon_extras = /obj/item/stamp/head/qm
