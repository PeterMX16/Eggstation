/mob/living/carbon/death(gibbed)
	if(stat == DEAD)
		return

	losebreath = 0
	breathing_loop.stop() //This would've happened eventually but it's nice to make it stop immediatelly in this case
	if(!gibbed)
		add_memory_in_range(src, 7, /datum/memory/witnessed_death, protagonist = src)
	reagents.end_metabolization(src)

	. = ..()

	if(!gibbed && !QDELING(src)) //double check they didn't start getting deleted in ..()
		attach_rot()

	for(var/T in get_traumas())
		var/datum/brain_trauma/BT = T
		BT.on_death()

<<<<<<< HEAD
/mob/living/carbon/proc/inflate_gib() // Plays an animation that makes mobs appear to inflate before finally gibbing
	addtimer(CALLBACK(src, PROC_REF(gib), null, null, TRUE, TRUE), 25)
	var/matrix/M = matrix()
	M.Scale(1.8, 1.2)
	animate(src, time = 40, transform = M, easing = SINE_EASING)

/mob/living/carbon/gib(no_brain, no_organs, no_bodyparts, safe_gib = TRUE)
	add_memory_in_range(src, 7, /datum/memory/witness_gib, protagonist = src)
	if(safe_gib) // If you want to keep all the mob's items and not have them deleted MONKESTATION EDIT
		for(var/obj/item/W in src)
			dropItemToGround(W, violent = TRUE)
			if(prob(50))
				step(W, pick(GLOB.alldirs))
		var/atom/Tsec = drop_location()
		for(var/mob/M in src)
			M.forceMove(Tsec)
			visible_message(span_danger("[M] bursts out of [src]!"))
=======
/mob/living/carbon/gib(drop_bitflags=NONE)
	add_memory_in_range(src, 7, /datum/memory/witness_gib, protagonist = src)
	if(drop_bitflags & DROP_ITEMS)
		for(var/obj/item/W in src)
			if(dropItemToGround(W))
				if(prob(50))
					step(W, pick(GLOB.alldirs))
	var/atom/Tsec = drop_location()
	for(var/mob/M in src)
		M.forceMove(Tsec)
		visible_message(span_danger("[M] bursts out of [src]!"))
>>>>>>> tg-pr-88929
	return ..()

/mob/living/carbon/spill_organs(drop_bitflags=NONE)
	var/atom/Tsec = drop_location()
<<<<<<< HEAD
	if(!no_bodyparts)
		if(no_organs)//so the organs don't get transfered inside the bodyparts we'll drop.
			for(var/organ in organs)
				if(no_brain || !istype(organ, /obj/item/organ/internal/brain))
					qdel(organ)
		else //we're going to drop all bodyparts except chest, so the only organs that needs spilling are those inside it.
			for(var/obj/item/organ/organ as anything in organs)
				if(no_brain && istype(organ, /obj/item/organ/internal/brain))
					qdel(organ) //so the brain isn't transfered to the head when the head drops.
					continue
				var/org_zone = check_zone(organ.zone) //both groin and chest organs.
				if(org_zone != BODY_ZONE_CHEST)
					continue
				organ.Remove(src)
				organ.forceMove(Tsec)
				organ.fly_away(Tsec, horizontal_multiplier = 2, vertical_multiplier = 1.2)
	else
		for(var/obj/item/organ/organ as anything in organs)
			if(no_brain && istype(organ, /obj/item/organ/internal/brain))
				qdel(organ)
				continue
			if(no_organs && !istype(organ, /obj/item/organ/internal/brain))
				qdel(organ)
				continue
			organ.Remove(src)
			organ.forceMove(Tsec)
			organ.fly_away(Tsec, horizontal_multiplier = 2, vertical_multiplier = 1.2)

/// Launches all bodyparts away from the mob. skip_head will keep the head attached.
/mob/living/carbon/spread_bodyparts(skip_head = FALSE, skip_organ = FALSE, violent = FALSE)
	var/atom/Tsec = drop_location()
=======

	for(var/obj/item/organ/organ as anything in organs)
		if((drop_bitflags & DROP_BRAIN) && istype(organ, /obj/item/organ/brain))
			if((drop_bitflags & DROP_BODYPARTS) && (check_zone(organ.zone) != BODY_ZONE_CHEST)) // chests can't drop
				continue // the head will drop, so the brain should stay inside

			organ.Remove(src)
			organ.forceMove(Tsec)
			organ.throw_at(get_edge_target_turf(src, pick(GLOB.alldirs)), rand(1,3), 5)
			continue

		if((drop_bitflags & DROP_ORGANS) && !istype(organ, /obj/item/organ/brain))
			if((drop_bitflags & DROP_BODYPARTS) && (check_zone(organ.zone) != BODY_ZONE_CHEST))
				continue // only chest & groin organs will be ejected

			organ.Remove(src)
			organ.forceMove(Tsec)
			organ.throw_at(get_edge_target_turf(src, pick(GLOB.alldirs)), rand(1,3), 5)
			continue

		qdel(organ)

/mob/living/carbon/spread_bodyparts(drop_bitflags=NONE)
>>>>>>> tg-pr-88929
	for(var/obj/item/bodypart/part as anything in bodyparts)
		if(!(drop_bitflags & DROP_BRAIN) && part.body_zone == BODY_ZONE_HEAD)
			continue
		else if(part.body_zone == BODY_ZONE_CHEST)
			continue
		else if(part.body_zone == BODY_ZONE_CHEST)
			continue
		part.drop_limb(violent = violent)
		part.fly_away(Tsec, horizontal_multiplier = 2, vertical_multiplier = 1.2)

/mob/living/carbon/set_suicide(suicide_state) //you thought that box trick was pretty clever, didn't you? well now hardmode is on, boyo.
	. = ..()
	var/obj/item/organ/brain/userbrain = get_organ_slot(ORGAN_SLOT_BRAIN)
	if(userbrain)
		userbrain.suicided = suicide_state

/mob/living/carbon/can_suicide()
	if(!..())
		return FALSE
	if(!(mobility_flags & MOBILITY_USE)) //just while I finish up the new 'fun' suiciding verb. This is to prevent metagaming via suicide
		to_chat(src, span_warning("You can't commit suicide whilst immobile! (You can type Ghost instead however)."))
		return FALSE
	return TRUE
