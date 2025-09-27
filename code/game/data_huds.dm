/*
 * Data HUDs have been rewritten in a more generic way.
 * In short, they now use an observer-listener pattern.
 * See code/datum/hud.dm for the generic hud datum.
 * Update the HUD icons when needed with the appropriate hook. (see below)
 */

/* DATA HUD DATUMS */

/atom/proc/add_to_all_human_data_huds()
	for(var/datum/atom_hud/data/human/hud in GLOB.huds)
		hud.add_atom_to_hud(src)

/atom/proc/remove_from_all_data_huds()
	for(var/datum/atom_hud/data/hud in GLOB.huds)
		hud.remove_atom_from_hud(src)

/datum/atom_hud/data

/datum/atom_hud/data/human/medical
	hud_icons = list(STATUS_HUD, HEALTH_HUD, NANITE_HUD)

/datum/atom_hud/data/human/medical/basic/add_atom_to_single_mob_hud(mob/M, mob/living/carbon/H)
	if(check_sensors(H))
		..()

/datum/atom_hud/data/human/medical/basic/proc/update_suit_sensors(mob/living/carbon/H)
	check_sensors(H) ? add_atom_to_hud(H) : remove_atom_from_hud(H)

/datum/atom_hud/data/human/medical/basic/proc/check_sensors(mob/living/carbon/human/H)
	if(!istype(H))
		return FALSE
	var/obj/item/clothing/under/U = H.w_uniform
	if(!istype(U))
		return FALSE
	if(U.has_sensor < HAS_SENSORS)
		return FALSE
	if(U.sensor_mode <= SENSOR_VITALS)
		return FALSE
	return TRUE

/datum/atom_hud/data/human/medical/advanced

/datum/atom_hud/data/human/medical/basic/sensors
	hud_icons = list(SENSOR_HUD)

/datum/atom_hud/data/human/medical/basic/sensors/update_suit_sensors(mob/living/carbon/H)
	check_sensors(H) ? add_atom_to_hud(H) : remove_atom_from_hud(H)

/datum/atom_hud/data/human/medical/advanced

/datum/atom_hud/data/human/security

/datum/atom_hud/data/human/security/basic
	hud_icons = list(ID_HUD)

/datum/atom_hud/data/human/security/advanced
<<<<<<< HEAD
	hud_icons = list(ID_HUD, IMPTRACK_HUD, IMPLOYAL_HUD, IMPCHEM_HUD, WANTED_HUD, NANITE_HUD, PERMIT_HUD) //monkestation edit: adds NANITE_HUD and PERMIT_HUD
=======
	hud_icons = list(ID_HUD, IMPSEC_FIRST_HUD, IMPLOYAL_HUD, IMPSEC_SECOND_HUD, WANTED_HUD)
>>>>>>> tg-pr-88929

/datum/atom_hud/data/human/fan_hud
	hud_icons = list(FAN_HUD)

/datum/atom_hud/data/diagnostic
<<<<<<< HEAD

/datum/atom_hud/data/diagnostic/basic
	hud_icons = list(DIAG_HUD, DIAG_STAT_HUD, DIAG_BATT_HUD, DIAG_MECH_HUD, DIAG_BOT_HUD, DIAG_TRACK_HUD, DIAG_CAMERA_HUD, DIAG_AIRLOCK_HUD, DIAG_LAUNCHPAD_HUD, NANITE_HUD, DIAG_NANITE_FULL_HUD)

/datum/atom_hud/data/diagnostic/advanced
	hud_icons = list(DIAG_HUD, DIAG_STAT_HUD, DIAG_BATT_HUD, DIAG_MECH_HUD, DIAG_BOT_HUD, DIAG_TRACK_HUD, DIAG_CAMERA_HUD, DIAG_AIRLOCK_HUD, DIAG_LAUNCHPAD_HUD, DIAG_PATH_HUD, NANITE_HUD, DIAG_NANITE_FULL_HUD)

=======
	hud_icons = list(DIAG_HUD, DIAG_STAT_HUD, DIAG_BATT_HUD, DIAG_MECH_HUD, DIAG_BOT_HUD, DIAG_TRACK_HUD, DIAG_CAMERA_HUD, DIAG_AIRLOCK_HUD, DIAG_LAUNCHPAD_HUD)

>>>>>>> tg-pr-88929
/datum/atom_hud/data/bot_path
	hud_icons = list(DIAG_PATH_HUD)

/datum/atom_hud/data/bot_path/private
	uses_global_hud_category = FALSE

/datum/atom_hud/abductor
	hud_icons = list(GLAND_HUD)

/datum/atom_hud/ai_detector
	hud_icons = list(AI_DETECT_HUD)

/datum/atom_hud/data/human/permit
	hud_icons = list(PERMIT_HUD)

/datum/atom_hud/borer
	hud_icons = list(BORER_HUD)

/datum/atom_hud/ai_detector/show_to(mob/new_viewer)
	. = ..()
	if(!new_viewer || hud_users_all_z_levels.len != 1)
		return
	for(var/mob/eye/camera/ai/eye as anything in GLOB.camera_eyes)
		eye.update_ai_detect_hud()

/datum/atom_hud/data/malf_apc
	hud_icons = list(MALF_APC_HUD)

/* MED/SEC/DIAG HUD HOOKS */

/*
 * THESE HOOKS SHOULD BE CALLED BY THE MOB SHOWING THE HUD
 */

/***********************************************
Medical HUD! Basic mode needs suit sensors on.
************************************************/

//HELPERS

//called when a carbon changes virus
/mob/living/carbon/proc/check_virus()
	var/threat
	var/severity
	if(HAS_TRAIT(src, TRAIT_DISEASELIKE_SEVERITY_MEDIUM))
		severity = DISEASE_SEVERITY_MEDIUM
		threat = get_disease_severity_value(severity)

	for(var/thing in diseases)
		var/datum/disease/D = thing
		if(!(D.visibility_flags & HIDDEN_SCANNER) && !(D.disease_flags & DISEASE_DORMANT))
			if(!threat || get_disease_severity_value(D.severity) > threat) //a buffing virus gets an icon
				threat = get_disease_severity_value(D.severity)
				severity = D.severity
	return severity


/mob/living/carbon/proc/check_virus_new()
	var/total_threat = 0
	for(var/thing in diseases)
		var/datum/disease/D = thing
		if(!(D.visibility_flags & HIDDEN_SCANNER) && !(D.disease_flags & DISEASE_DORMANT))
			for(var/datum/symptom/symptom as anything in D.symptoms)
				total_threat += text2num(symptom.badness)
	return total_threat

//helper for getting the appropriate health status
/proc/RoundHealth(mob/living/M)
	if(M.stat == DEAD || (HAS_TRAIT(M, TRAIT_FAKEDEATH)))
		return "health-100" //what's our health? it doesn't matter, we're dead, or faking
	var/maxi_health = M.maxHealth
	if(iscarbon(M) && M.health < 0)
		maxi_health = 100 //so crit shows up right for aliens and other high-health carbon mobs; noncarbons don't have crit.
	var/resulthealth = (M.health / maxi_health) * 100
	switch(resulthealth)
		if(100 to INFINITY)
			return "health100"
		if(90.625 to 100)
			return "health93.75"
		if(84.375 to 90.625)
			return "health87.5"
		if(78.125 to 84.375)
			return "health81.25"
		if(71.875 to 78.125)
			return "health75"
		if(65.625 to 71.875)
			return "health68.75"
		if(59.375 to 65.625)
			return "health62.5"
		if(53.125 to 59.375)
			return "health56.25"
		if(46.875 to 53.125)
			return "health50"
		if(40.625 to 46.875)
			return "health43.75"
		if(34.375 to 40.625)
			return "health37.5"
		if(28.125 to 34.375)
			return "health31.25"
		if(21.875 to 28.125)
			return "health25"
		if(15.625 to 21.875)
			return "health18.75"
		if(9.375 to 15.625)
			return "health12.5"
		if(1 to 9.375)
			return "health6.25"
		if(-50 to 1)
			return "health0"
		if(-85 to -50)
			return "health-50"
		if(-99 to -85)
			return "health-85"
		else
			return "health-100"

//HOOKS

//called when a human changes suit sensors
/mob/living/carbon/proc/update_suit_sensors()
	var/datum/atom_hud/data/human/medical/basic/B = GLOB.huds[DATA_HUD_MEDICAL_BASIC]
	var/datum/atom_hud/data/human/medical/basic/sensors/S = GLOB.huds[DATA_HUD_SENSORS]
	B.update_suit_sensors(src)
	S.update_suit_sensors(src)

//called when a living mob changes health
/mob/living/proc/med_hud_set_health()
	set_hud_image_state(HEALTH_HUD, "hud[RoundHealth(src)]")

<<<<<<< HEAD
	holder.icon_state = "hud[RoundHealth(src)]"
	holder.pixel_y = get_cached_height() - world.icon_size

//for carbon suit sensors
/mob/living/carbon/med_hud_set_health()
	..()

//called when a carbon changes stat, virus or XENO_HOST
/mob/living/proc/med_hud_set_status()
	var/image/holder = hud_list?[STATUS_HUD]
	var/image/sensors = hud_list?[SENSOR_HUD]
	if (isnull(holder))
		return

	holder.pixel_y = get_cached_height() - world.icon_size
	if(stat == DEAD || (HAS_TRAIT(src, TRAIT_FAKEDEATH)))
		if(sensors)
			SET_PLANE_EXPLICIT(sensors, ABOVE_LIGHTING_PLANE, src)
			sensors.icon_state = "sensors"

		holder.icon_state = "huddead"
	else
		sensors?.icon_state = null
		holder.icon_state = "hudhealthy"

/mob/living/carbon/med_hud_set_status()
	var/image/holder = hud_list?[STATUS_HUD]
	if (isnull(holder))
		return

	var/virus_threat = check_virus()
	holder.pixel_y = get_cached_height() - world.icon_size
	if(HAS_TRAIT(src, TRAIT_BLOB_ALLY)) //Monkestation edit: In the edge where case a blob host has a xeno in them. I think the fact they are a blob host is more important.
		holder.icon_state = "hudill5"
	else if(HAS_TRAIT(src, TRAIT_XENO_HOST))
		holder.icon_state = "hudxeno"
	else if(stat == DEAD || (HAS_TRAIT(src, TRAIT_FAKEDEATH)))
		if(((key || get_ghost(FALSE, TRUE)) && (can_defib() & DEFIB_REVIVABLE_STATES)) || HAS_TRAIT(src, TRAIT_MIND_TEMPORARILY_GONE))
			holder.icon_state = "huddefib"
=======
// Called when a carbon changes stat, virus or XENO_HOST
// Returns TRUE if the mob is considered "perfectly healthy", FALSE otherwise
/mob/living/proc/med_hud_set_status()
	if(stat == DEAD || (HAS_TRAIT(src, TRAIT_FAKEDEATH)))
		set_hud_image_state(STATUS_HUD, "huddead")
		return FALSE

	set_hud_image_state(STATUS_HUD, "hudhealthy")
	return TRUE

/mob/living/carbon/med_hud_set_status()
	if(HAS_TRAIT(src, TRAIT_XENO_HOST))
		set_hud_image_state(STATUS_HUD, "hudxeno")
		return FALSE

	if(stat == DEAD || (HAS_TRAIT(src, TRAIT_FAKEDEATH)))
		if(HAS_TRAIT(src, TRAIT_MIND_TEMPORARILY_GONE) || can_defib_client())
			set_hud_image_state(STATUS_HUD, "huddefib")
		else if(HAS_TRAIT(src, TRAIT_GHOSTROLE_ON_REVIVE))
			set_hud_image_state(STATUS_HUD, "hudghost")
>>>>>>> tg-pr-88929
		else
			set_hud_image_state(STATUS_HUD, "huddead")
		return FALSE

	var/virus_threat = check_virus()
	if (!virus_threat)
		set_hud_image_state(STATUS_HUD, "hudhealthy")
		return TRUE

	switch(virus_threat)
		if(DISEASE_SEVERITY_UNCURABLE)
			set_hud_image_state(STATUS_HUD, "hudill6")
		if(DISEASE_SEVERITY_BIOHAZARD)
			set_hud_image_state(STATUS_HUD, "hudill5")
		if(DISEASE_SEVERITY_DANGEROUS)
			set_hud_image_state(STATUS_HUD, "hudill4")
		if(DISEASE_SEVERITY_HARMFUL)
			set_hud_image_state(STATUS_HUD, "hudill3")
		if(DISEASE_SEVERITY_MEDIUM)
			set_hud_image_state(STATUS_HUD, "hudill2")
		if(DISEASE_SEVERITY_MINOR)
			set_hud_image_state(STATUS_HUD, "hudill1")
		if(DISEASE_SEVERITY_NONTHREAT)
			set_hud_image_state(STATUS_HUD, "hudill0")
		if(DISEASE_SEVERITY_POSITIVE)
			set_hud_image_state(STATUS_HUD, "hudbuff")
	return FALSE

/mob/living/carbon/human/med_hud_set_status()
	. = ..()
	if (!.)
		return
	var/obj/item/clothing/under/uniform = w_uniform
	if(istype(uniform) && uniform.has_sensor == BROKEN_SENSORS)
		set_hud_image_state(STATUS_HUD, "hudnosensor")
		return FALSE


/***********************************************
FAN HUDs! For identifying other fans on-sight.
************************************************/

//HOOKS

/mob/living/carbon/human/proc/fan_hud_set_fandom()
<<<<<<< HEAD
	var/image/holder = hud_list[FAN_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
	holder.icon_state = "hudfan_no"

=======
>>>>>>> tg-pr-88929
	var/obj/item/clothing/under/undershirt = w_uniform
	if(!istype(undershirt))
		set_hud_image_inactive(FAN_HUD)
		return

<<<<<<< HEAD
	for(var/accessory in undershirt.attached_accessories)
		if(istype(accessory, /obj/item/clothing/accessory/mime_fan_pin))
			holder.icon_state = "mime_fan_pin"
			break

		if(istype(accessory, /obj/item/clothing/accessory/clown_enjoyer_pin))
			holder.icon_state = "clown_enjoyer_pin"
			break

=======
>>>>>>> tg-pr-88929
	set_hud_image_active(FAN_HUD)
	for(var/accessory in undershirt.attached_accessories)
		if(istype(accessory, /obj/item/clothing/accessory/mime_fan_pin))
			set_hud_image_state(FAN_HUD, "mime_fan_pin")
			return

		if(istype(accessory, /obj/item/clothing/accessory/clown_enjoyer_pin))
			set_hud_image_state(FAN_HUD, "clown_enjoyer_pin")
			return

	set_hud_image_state(FAN_HUD, "hudfan_no")

/***********************************************
Security HUDs! Basic mode shows only the job.
************************************************/

//HOOKS

/mob/living/carbon/human/proc/sec_hud_set_ID()
<<<<<<< HEAD
	var/image/holder = hud_list[ID_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
=======
>>>>>>> tg-pr-88929
	var/sechud_icon_state = wear_id?.get_sechud_job_icon_state()
	if(!sechud_icon_state || HAS_TRAIT(src, TRAIT_UNKNOWN))
		sechud_icon_state = "hudno_id"
	set_hud_image_state(ID_HUD, sechud_icon_state)
	sec_hud_set_security_status()
//monkestation edit start
	var/image/permit_holder = hud_list[PERMIT_HUD]
	permit_holder.pixel_y = get_cached_height() - world.icon_size
	var/permit_icon_state = wear_id?.get_gun_permit_iconstate()
	if(!permit_icon_state)
		permit_icon_state = "hudfan_no"
	permit_holder.icon_state = permit_icon_state
//monkestation edit end

/mob/living/proc/sec_hud_set_implants()
	for(var/hud_type in (list(IMPSEC_FIRST_HUD, IMPLOYAL_HUD, IMPSEC_SECOND_HUD) & hud_list))
		set_hud_image_inactive(hud_type)

<<<<<<< HEAD
	for(var/obj/item/implant/I in implants)
		if(istype(I, /obj/item/implant/tracking))
			holder = hud_list[IMPTRACK_HUD]
			holder.pixel_y = get_cached_height() - world.icon_size
			holder.icon_state = "hud_imp_tracking"
			set_hud_image_active(IMPTRACK_HUD)

		else if(istype(I, /obj/item/implant/chem))
			holder = hud_list[IMPCHEM_HUD]
			holder.pixel_y = get_cached_height() - world.icon_size
			holder.icon_state = "hud_imp_chem"
			set_hud_image_active(IMPCHEM_HUD)

	if(HAS_TRAIT(src, TRAIT_MINDSHIELD))
		holder = hud_list[IMPLOYAL_HUD]
		holder.pixel_y = get_cached_height() - world.icon_size
		holder.icon_state = "hud_imp_loyal"
		set_hud_image_active(IMPLOYAL_HUD)

/mob/living/carbon/human/proc/sec_hud_set_security_status()
	var/image/holder = hud_list[WANTED_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
=======
	var/security_slot = 1 //Which of the two security hud slots are we putting found security implants in?
	for(var/obj/item/implant/current_implant in implants)
		if(current_implant.implant_flags & IMPLANT_TYPE_SECURITY)
			switch(security_slot)
				if(1)
					set_hud_image_state(IMPSEC_FIRST_HUD, current_implant.hud_icon_state)
					set_hud_image_active(IMPSEC_FIRST_HUD)
					security_slot++

				if(2) //Theoretically if we somehow get multiple sec implants, whatever the most recently implanted implant is will take over the 2nd position
					set_hud_image_state(IMPSEC_SECOND_HUD, current_implant.hud_icon_state, x_offset = (ICON_SIZE_X / 4 - 1)) //Adds an offset that mirrors the hud blip to the other side of the mob
					set_hud_image_active(IMPSEC_SECOND_HUD)

	if(HAS_TRAIT(src, TRAIT_MINDSHIELD))
		set_hud_image_state(IMPLOYAL_HUD, "hud_imp_loyal")
		set_hud_image_active(IMPLOYAL_HUD)

/mob/living/carbon/human/proc/sec_hud_set_security_status()
	if(!hud_list)
		// We haven't finished initializing yet, huds will be updated once we are
		return

	if (HAS_TRAIT(src, TRAIT_ALWAYS_WANTED))
		set_hud_image_state(WANTED_HUD, "hudwanted")
		set_hud_image_active(WANTED_HUD)
		return

>>>>>>> tg-pr-88929
	var/perp_name = get_face_name(get_id_name(""))

	crew_hud_set_crew_status()

	if(!perp_name || !GLOB.manifest)
		set_hud_image_inactive(WANTED_HUD)
		return

	var/datum/record/crew/target = find_record(perp_name)

	if(!target || target.wanted_status == WANTED_NONE)
		set_hud_image_inactive(WANTED_HUD)
		return

	switch(target.wanted_status)
		if(WANTED_ARREST)
			set_hud_image_state(WANTED_HUD, "hudwanted")
		if(WANTED_PRISONER)
			set_hud_image_state(WANTED_HUD, "hudincarcerated")
		if(WANTED_SUSPECT)
			set_hud_image_state(WANTED_HUD, "hudsuspected")
		if(WANTED_PAROLE)
			set_hud_image_state(WANTED_HUD, "hudparolled")
		if(WANTED_DISCHARGED)
			set_hud_image_state(WANTED_HUD, "huddischarged")

	set_hud_image_active(WANTED_HUD)

//Utility functions

/**
 * Updates the visual security huds on all mobs in GLOB.human_list that match the name passed to it.
 */
/proc/update_matching_security_huds(perp_name)
	for (var/mob/living/carbon/human/h as anything in GLOB.human_list)
		if (h.get_face_name(h.get_id_name("")) == perp_name)
			h.sec_hud_set_security_status()

/**
 * Updates the visual security huds on all mobs in GLOB.human_list
 */
/proc/update_all_security_huds()
	for(var/mob/living/carbon/human/h as anything in GLOB.human_list)
		h.sec_hud_set_security_status()

/***********************************************
Diagnostic HUDs!
************************************************/

/mob/living/proc/hud_set_nanite_indicator()
	var/image/holder = hud_list[NANITE_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
	holder.icon_state = null
	if(HAS_TRAIT(src, TRAIT_NANITE_MONITORING))
		holder.icon_state = "nanite_ping"

//For Diag health and cell bars!
/proc/RoundDiagBar(value)
	switch(value * 100)
		if(95 to INFINITY)
			return "max"
		if(80 to 100)
			return "good"
		if(60 to 80)
			return "high"
		if(40 to 60)
			return "med"
		if(20 to 40)
			return "low"
		if(1 to 20)
			return "crit"
		else
			return "dead"

//Sillycone hooks
/mob/living/silicon/proc/diag_hud_set_health()
<<<<<<< HEAD
	var/image/holder = hud_list[DIAG_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
=======
>>>>>>> tg-pr-88929
	if(stat == DEAD)
		set_hud_image_state(DIAG_HUD, "huddiagdead")
	else
		set_hud_image_state(DIAG_HUD, "huddiag[RoundDiagBar(health/maxHealth)]")

/mob/living/silicon/proc/diag_hud_set_status()
<<<<<<< HEAD
	var/image/holder = hud_list[DIAG_STAT_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
=======
>>>>>>> tg-pr-88929
	switch(stat)
		if(CONSCIOUS)
			set_hud_image_state(DIAG_STAT_HUD, "hudstat")
		if(UNCONSCIOUS, HARD_CRIT)
			set_hud_image_state(DIAG_STAT_HUD, "hudoffline")
		else
			set_hud_image_state(DIAG_STAT_HUD, "huddead2")

//Borgie battery tracking!
/mob/living/silicon/robot/proc/diag_hud_set_borgcell()
<<<<<<< HEAD
	var/image/holder = hud_list[DIAG_BATT_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
=======
>>>>>>> tg-pr-88929
	if(cell)
		var/chargelvl = (cell.charge/cell.maxcharge)
		set_hud_image_state(DIAG_BATT_HUD, "hudbatt[RoundDiagBar(chargelvl)]")
	else
		set_hud_image_state(DIAG_BATT_HUD, "hudnobatt")

//borg-AI shell tracking
<<<<<<< HEAD
/mob/living/silicon/robot/proc/diag_hud_set_aishell() //Shows tracking beacons on the mech
	var/image/holder = hud_list[DIAG_TRACK_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
=======
/mob/living/silicon/robot/proc/diag_hud_set_aishell() //Shows if AI is controlling a cyborg via a BORIS module
>>>>>>> tg-pr-88929
	if(!shell) //Not an AI shell
		set_hud_image_inactive(DIAG_TRACK_HUD)
		return
	if(deployed) //AI shell in use by an AI
		set_hud_image_state(DIAG_TRACK_HUD, "hudtrackingai")
	else //Empty AI shell
		set_hud_image_state(DIAG_TRACK_HUD, "hudtracking")
	set_hud_image_active(DIAG_TRACK_HUD)

//AI side tracking of AI shell control
<<<<<<< HEAD
/mob/living/silicon/ai/proc/diag_hud_set_deployed() //Shows tracking beacons on the mech
	var/image/holder = hud_list[DIAG_TRACK_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
=======
/mob/living/silicon/ai/proc/diag_hud_set_deployed() //Shows if AI is currently shunted into a BORIS borg
>>>>>>> tg-pr-88929
	if(!deployed_shell)
		set_hud_image_inactive(DIAG_TRACK_HUD)
		return
	//AI is currently controlling a shell
	set_hud_image_state(DIAG_TRACK_HUD, "hudtrackingai")
	set_hud_image_active(DIAG_TRACK_HUD)

/*~~~~~~~~~~~~~~~~~~~~
	BIG STOMPY MECHS
~~~~~~~~~~~~~~~~~~~~~*/
/obj/vehicle/sealed/mecha/proc/diag_hud_set_mechhealth()
<<<<<<< HEAD
	var/image/holder = hud_list[DIAG_MECH_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
	holder.icon_state = "huddiag[RoundDiagBar(atom_integrity/max_integrity)]"


/obj/vehicle/sealed/mecha/proc/diag_hud_set_mechcell()
	var/image/holder = hud_list[DIAG_BATT_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
=======
	set_hud_image_state(DIAG_MECH_HUD, "huddiag[RoundDiagBar(atom_integrity/max_integrity)]")

/obj/vehicle/sealed/mecha/proc/diag_hud_set_mechcell()
>>>>>>> tg-pr-88929
	if(cell)
		var/chargelvl = cell.charge/cell.maxcharge
		set_hud_image_state(DIAG_BATT_HUD, "hudbatt[RoundDiagBar(chargelvl)]")
	else
		set_hud_image_state(DIAG_BATT_HUD, "hudnobatt")

/obj/vehicle/sealed/mecha/proc/diag_hud_set_mechstat()
<<<<<<< HEAD
	var/image/holder = hud_list[DIAG_STAT_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
	if(internal_damage)
		holder.icon_state = "hudwarn"
		set_hud_image_active(DIAG_STAT_HUD)
=======
	if(!internal_damage)
		set_hud_image_inactive(DIAG_STAT_HUD)
>>>>>>> tg-pr-88929
		return

	set_hud_image_state(DIAG_STAT_HUD, "hudwarn")
	set_hud_image_active(DIAG_STAT_HUD)

///Shows tracking beacons on the mech
/obj/vehicle/sealed/mecha/proc/diag_hud_set_mechtracking()
<<<<<<< HEAD
	var/image/holder = hud_list[DIAG_TRACK_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
=======
>>>>>>> tg-pr-88929
	var/new_icon_state //This var exists so that the holder's icon state is set only once in the event of multiple mech beacons.
	for(var/obj/item/mecha_parts/mecha_tracking/tracker in trackers)
		if(tracker.ai_beacon) //Beacon with AI uplink
			new_icon_state = "hudtrackingai"
			break //Immediately terminate upon finding an AI beacon to ensure it is always shown over the normal one, as mechs can have several trackers.
		else
			new_icon_state = "hudtracking"
	set_hud_image_state(DIAG_TRACK_HUD, new_icon_state)

///Shows inbuilt camera on the mech; if the camera's view range was affected by an EMP, shows a red blip while it's affected
/obj/vehicle/sealed/mecha/proc/diag_hud_set_camera()
<<<<<<< HEAD
	var/image/holder = hud_list[DIAG_CAMERA_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
	if(chassis_camera?.is_emp_scrambled)
		holder.icon_state = "hudcamera_empd"
=======
	if(!chassis_camera)
		set_hud_image_inactive(DIAG_CAMERA_HUD)
>>>>>>> tg-pr-88929
		return

	set_hud_image_active(DIAG_CAMERA_HUD)
	if(chassis_camera?.is_emp_scrambled)
		set_hud_image_state(DIAG_CAMERA_HUD, "hudcamera_empd")
	else
		set_hud_image_state(DIAG_CAMERA_HUD, "hudcamera")

/*~~~~~~~~~
	Bots!
~~~~~~~~~~*/
/mob/living/simple_animal/bot/proc/diag_hud_set_bothealth()
<<<<<<< HEAD
	var/image/holder = hud_list[DIAG_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
	holder.icon_state = "huddiag[RoundDiagBar(health/maxHealth)]"

/mob/living/simple_animal/bot/proc/diag_hud_set_botstat() //On (With wireless on or off), Off, EMP'ed
	var/image/holder = hud_list[DIAG_STAT_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
=======
	set_hud_image_state(DIAG_HUD, "huddiag[RoundDiagBar(health/maxHealth)]")

/mob/living/simple_animal/bot/proc/diag_hud_set_botstat() //On (With wireless on or off), Off, EMP'ed
>>>>>>> tg-pr-88929
	if(bot_mode_flags & BOT_MODE_ON)
		set_hud_image_state(DIAG_STAT_HUD, "hudstat")
	else if(stat) //Generally EMP causes this
		set_hud_image_state(DIAG_STAT_HUD, "hudoffline")
	else //Bot is off
		set_hud_image_state(DIAG_STAT_HUD, "huddead2")

/mob/living/simple_animal/bot/proc/diag_hud_set_botmode() //Shows a bot's current operation
<<<<<<< HEAD
	var/image/holder = hud_list[DIAG_BOT_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
=======
>>>>>>> tg-pr-88929
	if(client) //If the bot is player controlled, it will not be following mode logic!
		set_hud_image_state(DIAG_BOT_HUD, "hudsentient")
		return

	switch(mode)
		if(BOT_SUMMON, BOT_RESPONDING) //Responding to PDA or AI summons
			set_hud_image_state(DIAG_BOT_HUD, "hudcalled")
		if(BOT_CLEANING, BOT_HEALING) //Cleanbot cleaning, repairbot fixing, or Medibot Healing
			set_hud_image_state(DIAG_BOT_HUD, "hudworking")
		if(BOT_PATROL, BOT_START_PATROL) //Patrol mode
			set_hud_image_state(DIAG_BOT_HUD, "hudpatrol")
		if(BOT_PREP_ARREST, BOT_ARREST, BOT_HUNT) //STOP RIGHT THERE, CRIMINAL SCUM!
			set_hud_image_state(DIAG_BOT_HUD, "hudalert")
		if(BOT_MOVING, BOT_DELIVER, BOT_GO_HOME, BOT_NAV) //Moving to target for normal bots, moving to deliver or go home for MULES.
			set_hud_image_state(DIAG_BOT_HUD, "hudmove")
		else
			set_hud_image_state(DIAG_BOT_HUD, "")

/mob/living/simple_animal/bot/mulebot/proc/diag_hud_set_mulebotcell()
<<<<<<< HEAD
	var/image/holder = hud_list[DIAG_BATT_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
=======
>>>>>>> tg-pr-88929
	if(cell)
		var/chargelvl = (cell.charge/cell.maxcharge)
		set_hud_image_state(DIAG_BATT_HUD, "hudbatt[RoundDiagBar(chargelvl)]")
	else
<<<<<<< HEAD
		holder.icon_state = "hudnobatt"
=======
		set_hud_image_state(DIAG_STAT_HUD, "hudnobatt")

>>>>>>> tg-pr-88929
/*~~~~~~~~~~~~
	Airlocks!
~~~~~~~~~~~~~*/
/obj/machinery/door/airlock/proc/diag_hud_set_electrified()
	if(secondsElectrified == MACHINE_NOT_ELECTRIFIED)
		set_hud_image_inactive(DIAG_AIRLOCK_HUD)
		return

	var/image/holder = hud_list[DIAG_AIRLOCK_HUD]
	holder.icon_state = "electrified"
	set_hud_image_active(DIAG_AIRLOCK_HUD)

<<<<<<< HEAD
#define CACHED_WIDTH_INDEX "width"
#define CACHED_HEIGHT_INDEX "height"
/atom/proc/get_cached_width()
	if (isnull(icon))
		return 0
	var/alist/dimensions = get_icon_dimensions(icon)
=======
/// Applies hacked overlay for malf AIs
/obj/machinery/power/apc/proc/set_hacked_hud()
	var/image/holder = hud_list[MALF_APC_HUD]
	holder.loc = get_turf(src)
	SET_PLANE(holder,ABOVE_LIGHTING_PLANE,src)
	set_hud_image_active(MALF_APC_HUD)

#define CACHED_WIDTH_INDEX "width"
#define CACHED_HEIGHT_INDEX "height"

/atom/proc/get_cached_width()
	if (isnull(icon))
		return 0
	var/list/dimensions = get_icon_dimensions(icon)
>>>>>>> tg-pr-88929
	return dimensions[CACHED_WIDTH_INDEX]

/atom/proc/get_cached_height()
	if (isnull(icon))
		return 0
<<<<<<< HEAD
	var/alist/dimensions = get_icon_dimensions(icon)
	return dimensions[CACHED_HEIGHT_INDEX]
#undef CACHED_WIDTH_INDEX
#undef CACHED_HEIGHT_INDEX

/***********************************************
MONKE, crew hud for silicon.
************************************************/

/datum/atom_hud/data/human/crew_hud
	hud_icons = list(CREW_HUD)

/mob/living/carbon/human/proc/crew_hud_set_crew_status()
	var/image/holder = hud_list[CREW_HUD]
	holder.pixel_y = get_cached_height() - world.icon_size
	var/crew_name = get_face_name(get_id_name(""))

	if(!crew_name || !GLOB.manifest || istype(wear_id?.GetID(), /obj/item/card/id/advanced/chameleon))
		holder.icon_state = null
		set_hud_image_inactive(CREW_HUD)
		return

	var/datum/record/crew/target = find_record(crew_name)

	if(!target && !(crew_name == "Unknown"))
		holder.icon_state = "hudnotcrew"
		set_hud_image_active(CREW_HUD)
		return
	else
		holder.icon_state = null
		set_hud_image_inactive(CREW_HUD)
		return
=======
	var/list/dimensions = get_icon_dimensions(icon)
	return dimensions[CACHED_HEIGHT_INDEX]

#undef CACHED_WIDTH_INDEX
#undef CACHED_HEIGHT_INDEX

/atom/proc/get_visual_width()
	var/width = get_cached_width()
	var/height = get_cached_height()
	var/scale_list = list(
		width * transform.a + height * transform.b + transform.c,
		width * transform.a + transform.c,
		height * transform.b + transform.c,
		transform.c
	)
	return max(scale_list) - min(scale_list)

/atom/proc/get_visual_height()
	var/width = get_cached_width()
	var/height = get_cached_height()
	var/scale_list = list(
		width * transform.d + height * transform.e + transform.f,
		width * transform.d + transform.f,
		height * transform.e + transform.f,
		transform.f
	)
	return max(scale_list) - min(scale_list)

/atom/proc/adjust_hud_position(image/holder, animate_time = null)
	if (animate_time)
		animate(holder, pixel_x = -(get_cached_width() - ICON_SIZE_X) / 2, pixel_y = get_cached_height() - ICON_SIZE_Y, time = animate_time)
		return
	holder.pixel_x = -(get_cached_width() - ICON_SIZE_X) / 2
	holder.pixel_y = get_cached_height() - ICON_SIZE_Y

/atom/proc/set_hud_image_state(hud_type, hud_state, x_offset = 0, y_offset = 0)
	if (!hud_list) // Still initializing
		return
	var/image/holder = hud_list[hud_type]
	if (!holder)
		return
	if (!istype(holder)) // Can contain lists for HUD_LIST_LIST hinted HUDs, if someone fucks up and passes this here we wanna know about it
		CRASH("[src] ([type]) had a HUD_LIST_LIST hud_type [hud_type] passed into set_hud_image_state!")
	holder.icon_state = hud_state
	adjust_hud_position(holder)
	if (x_offset || y_offset)
		holder.pixel_x += x_offset
		holder.pixel_y += y_offset
>>>>>>> tg-pr-88929
