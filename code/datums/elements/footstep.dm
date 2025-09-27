///Footstep element. Plays footsteps at parents location when it is appropriate.
/datum/element/footstep
	element_flags = ELEMENT_DETACH_ON_HOST_DESTROY|ELEMENT_BESPOKE
	argument_hash_start_idx = 2
	///A list containing living mobs and the number of steps they have taken since the last time their footsteps were played.
	var/list/steps_for_living = list()
	///volume determines the extra volume of the footstep. This is multiplied by the base volume, should there be one.
	var/volume
	///e_range stands for extra range - aka how far the sound can be heard. This is added to the base value and ignored if there isn't a base value.
	var/e_range
	///footstep_type is a define which determines what kind of sounds should get chosen.
	var/footstep_type
	///This can be a list OR a soundfile OR null. Determines whatever sound gets played.
	var/footstep_sounds
	///Whether or not to add variation to the sounds played
	var/sound_vary = FALSE

/datum/element/footstep/Attach(datum/target, footstep_type = FOOTSTEP_MOB_BAREFOOT, volume = 0.5, e_range = -8, sound_vary = FALSE)
	. = ..()
	if(!ismovable(target))
		return ELEMENT_INCOMPATIBLE
	src.volume = volume
	src.e_range = e_range
	src.footstep_type = footstep_type
	src.sound_vary = sound_vary
	switch(footstep_type)
		if(FOOTSTEP_MOB_HUMAN)
			if(!ishuman(target))
				return ELEMENT_INCOMPATIBLE
			RegisterSignal(target, COMSIG_MOVABLE_MOVED, PROC_REF(play_humanstep))
			steps_for_living[target] = 0
			return
		if(FOOTSTEP_MOB_CLAW)
			footstep_sounds = GLOB.clawfootstep
		if(FOOTSTEP_MOB_BAREFOOT)
			footstep_sounds = GLOB.barefootstep
		if(FOOTSTEP_MOB_HEAVY)
			footstep_sounds = GLOB.heavyfootstep
		if(FOOTSTEP_MOB_SHOE)
			footstep_sounds = GLOB.footstep
		if(FOOTSTEP_MOB_RUST)
			footstep_sounds = 'sound/effects/footstep/rustystep1.ogg'
		if(FOOTSTEP_MOB_SLIME)
			footstep_sounds = 'sound/effects/footstep/slime1.ogg'
		if(FOOTSTEP_OBJ_SILICON)
			footstep_sounds = 'sound/effects/footstep/silicon_step.ogg'
			RegisterSignal(target, COMSIG_MOVABLE_MOVED, PROC_REF(play_simplestep_machine))
			return
		if(FOOTSTEP_OBJ_MACHINE)
			footstep_sounds = 'sound/effects/bang.ogg'
			RegisterSignal(target, COMSIG_MOVABLE_MOVED, PROC_REF(play_simplestep_machine))
			return
		if(FOOTSTEP_OBJ_ROBOT)
			footstep_sounds = 'sound/effects/tank_treads.ogg'
			RegisterSignal(target, COMSIG_MOVABLE_MOVED, PROC_REF(play_simplestep_machine))
			return
	RegisterSignal(target, COMSIG_MOVABLE_MOVED, PROC_REF(play_simplestep))
	steps_for_living[target] = 0

/datum/element/footstep/Detach(atom/movable/source)
	UnregisterSignal(source, COMSIG_MOVABLE_MOVED)
	steps_for_living -= source
	return ..()

///Prepares a footstep for living mobs. Determines if it should get played. Returns the turf it should get played on. Note that it is always a /turf/open
/datum/element/footstep/proc/prepare_step(mob/living/source)
	var/turf/open/turf = get_turf(source)
	if(!istype(turf))
		return

<<<<<<< HEAD
	if(!turf.footstep || source.buckled || source.throwing || source.movement_type & (VENTCRAWLING | FLYING) || HAS_TRAIT(source, TRAIT_IMMOBILIZED) || source.check_move_loop_flags(MOVEMENT_LOOP_DRAGGING))
		return

	if(source.body_position == LYING_DOWN) //play crawling sound if we're lying
		playsound(turf, 'sound/effects/footstep/crawl1.ogg', 15 * volume, falloff_distance = 1, vary = sound_vary, mixer_channel = CHANNEL_SOUND_FOOTSTEPS)
=======
	if(source.buckled || source.throwing || source.movement_type & (VENTCRAWLING | FLYING) || HAS_TRAIT(source, TRAIT_IMMOBILIZED) || CHECK_MOVE_LOOP_FLAGS(source, MOVEMENT_LOOP_OUTSIDE_CONTROL))
		return

	if(source.body_position == LYING_DOWN) //play crawling sound if we're lying
		if(turf.footstep)
			var/sound = 'sound/effects/footstep/crawl1.ogg'
			if(HAS_TRAIT(source, TRAIT_FLOPPING))
				sound = pick(SFX_FISH_PICKUP, 'sound/mobs/non-humanoids/fish/fish_drop1.ogg')
			playsound(turf, sound, 15 * volume, falloff_distance = 1, vary = sound_vary)
>>>>>>> tg-pr-88929
		return

	if(iscarbon(source) && source.move_intent == MOVE_INTENT_WALK)
		return // stealth

	steps_for_living[source] += 1
	var/steps = steps_for_living[source]

	if(steps >= 24)
		// right foot = 0, 4, 8, 12, 16, 20
		// left foot = 2, 6, 10, 14, 18, 22
		// 24 -> return to 0 -> right foot, repeat
		steps_for_living[source] = 0
		steps = 0

	if(steps % 2)
		// skipping every other step, anyways. gets noisy otherwise
		return

	if(steps % 6 != 0 && !source.has_gravity())
		// don't need to step as often when you hop around
		return

<<<<<<< HEAD
	. = list(FOOTSTEP_MOB_SHOE = turf.footstep, FOOTSTEP_MOB_BAREFOOT = turf.barefootstep, FOOTSTEP_MOB_HEAVY = turf.heavyfootstep, FOOTSTEP_MOB_CLAW = turf.clawfootstep, STEP_SOUND_PRIORITY = STEP_SOUND_NO_PRIORITY)
	SEND_SIGNAL(source, COMSIG_MOB_PREPARE_STEP_SOUND, .) // Used to override shoe material before turf
	SEND_SIGNAL(turf, COMSIG_TURF_PREPARE_STEP_SOUND, .)
	return .

/datum/element/footstep/proc/play_simplestep(mob/living/source, atom/oldloc, direction, forced, list/old_locs, momentum_change)
	SIGNAL_HANDLER
	var/turf/source_loc = get_turf(source)
=======
	var/list/footstep_data = list(
		FOOTSTEP_MOB_SHOE = turf.footstep,
		FOOTSTEP_MOB_BAREFOOT = turf.barefootstep,
		FOOTSTEP_MOB_HEAVY = turf.heavyfootstep,
		FOOTSTEP_MOB_CLAW = turf.clawfootstep,
		STEP_SOUND_PRIORITY = STEP_SOUND_NO_PRIORITY,
	)
	var/sigreturn = SEND_SIGNAL(turf, COMSIG_TURF_PREPARE_STEP_SOUND, footstep_data)
	if(sigreturn & FOOTSTEP_OVERRIDEN)
		return footstep_data
	if(isnull(turf.footstep))
		// The turf has no footstep sound (e.g. open space)
		// and none of the objects on that turf (e.g. catwalks) overrides it
		return null
	return footstep_data

/datum/element/footstep/proc/play_simplestep(mob/living/source, atom/oldloc, direction, forced, list/old_locs, momentum_change)
	SIGNAL_HANDLER

	if(source.moving_diagonally == SECOND_DIAG_STEP)
		return // to prevent a diagonal step from counting as 2

>>>>>>> tg-pr-88929
	if (forced || SHOULD_DISABLE_FOOTSTEPS(source))
		return

	var/list/prepared_steps = prepare_step(source)
<<<<<<< HEAD
	if(!prepared_steps)
		return

	if(isfile(footstep_sounds) || istext(footstep_sounds))
		playsound(source_loc, footstep_sounds, volume, falloff_distance = 1, vary = sound_vary, mixer_channel = CHANNEL_SOUND_FOOTSTEPS)
		return

	var/turf_footstep = prepared_steps[footstep_type]
	if(!turf_footstep)
		return
	playsound(source_loc, pick(footstep_sounds[turf_footstep][1]), footstep_sounds[turf_footstep][2] * volume, TRUE, footstep_sounds[turf_footstep][3] + e_range, falloff_distance = 1, vary = sound_vary, mixer_channel = CHANNEL_SOUND_FOOTSTEPS)

/datum/element/footstep/proc/play_humanstep(mob/living/carbon/human/source, atom/oldloc, direction, forced, list/old_locs, momentum_change)
	SIGNAL_HANDLER
	if (forced || SHOULD_DISABLE_FOOTSTEPS(source) || !momentum_change)
=======
	if(isnull(prepared_steps))
		return

	if(isfile(footstep_sounds) || istext(footstep_sounds))
		playsound(source.loc, footstep_sounds, volume, falloff_distance = 1, vary = sound_vary)
		return

	var/turf_footstep = prepared_steps[footstep_type]
	if(isnull(turf_footstep) || !footstep_sounds[turf_footstep])
		return
	playsound(source.loc, pick(footstep_sounds[turf_footstep][1]), footstep_sounds[turf_footstep][2] * volume, TRUE, footstep_sounds[turf_footstep][3] + e_range, falloff_distance = 1, vary = sound_vary)

/datum/element/footstep/proc/play_humanstep(mob/living/carbon/human/source, atom/oldloc, direction, forced, list/old_locs, momentum_change)
	SIGNAL_HANDLER

	if(source.moving_diagonally == SECOND_DIAG_STEP)
		return // to prevent a diagonal step from counting as 2

	if (forced || SHOULD_DISABLE_FOOTSTEPS(source) || !momentum_change)
		return

	var/list/prepared_steps = prepare_step(source)
	if(isnull(prepared_steps))
		return

	var/footstep_type = null
	var/list/footstep_sounds
	var/stepcount = steps_for_living[source]
	// any leg covering sounds defaults to shoe sounds
	if((source.wear_suit?.body_parts_covered|source.w_uniform?.body_parts_covered|source.shoes?.body_parts_covered) & FEET)
		footstep_type = FOOTSTEP_MOB_SHOE
	// now pick whether to draw from left foot or right foot sounds
	else
		var/obj/item/bodypart/leg/left_leg = source.get_bodypart(BODY_ZONE_L_LEG)
		var/obj/item/bodypart/leg/right_leg = source.get_bodypart(BODY_ZONE_R_LEG)
		if(stepcount == 2 || stepcount == 6)
			footstep_sounds = left_leg?.special_footstep_sounds || right_leg?.special_footstep_sounds
			footstep_type = left_leg?.footstep_type || right_leg?.footstep_type
		else
			footstep_sounds = right_leg?.special_footstep_sounds || left_leg?.special_footstep_sounds
			footstep_type = right_leg?.footstep_type || left_leg?.footstep_type

	// allow for snowflake effects to take priority
	if(!length(footstep_sounds))
		switch(footstep_type)
			if(FOOTSTEP_MOB_CLAW)
				footstep_sounds = GLOB.clawfootstep[prepared_steps[footstep_type]]
			if(FOOTSTEP_MOB_BAREFOOT)
				footstep_sounds = GLOB.barefootstep[prepared_steps[footstep_type]]
			if(FOOTSTEP_MOB_HEAVY)
				footstep_sounds = GLOB.heavyfootstep[prepared_steps[footstep_type]]
			if(FOOTSTEP_MOB_SHOE)
				footstep_sounds = GLOB.footstep[prepared_steps[footstep_type]]
			if(null)
				return
			else
				// Got an unsupported type, somehow
				CRASH("Invalid footstep type for human footstep: \[[footstep_type]\]")

	// no snowflake, and no (found) footstep sounds, nothing to do
	if(!length(footstep_sounds))
>>>>>>> tg-pr-88929
		return

	var/volume_multiplier = 1
	var/range_adjustment = 0

	if(HAS_TRAIT(source, TRAIT_LIGHT_STEP))
		volume_multiplier = 0.6
		range_adjustment = -2

<<<<<<< HEAD
	var/list/prepared_steps = prepare_step(source)
	if(!prepared_steps)
		return

	//cache for sanic speed (lists are references anyways)
	var/list/footstep_sounds = GLOB.footstep
	if(length(prepared_steps[STEP_SOUND_SHOE_OVERRIDE]))
		footstep_sounds = prepared_steps[STEP_SOUND_SHOE_OVERRIDE] // List was edited and wants to override our sounds.
	///list returned by playsound() filled by client mobs who heard the footstep. given to play_fov_effect()
=======
	// list returned by playsound() filled by client mobs who heard the footstep. given to play_fov_effect()
>>>>>>> tg-pr-88929
	var/list/heard_clients
	var/picked_sound = pick(footstep_sounds[1])
	var/picked_volume = footstep_sounds[2] * volume * volume_multiplier
	var/picked_range = footstep_sounds[3] + e_range + range_adjustment

<<<<<<< HEAD
	if ((source.wear_suit?.body_parts_covered | source.w_uniform?.body_parts_covered | source.shoes?.body_parts_covered) & FEET)
		// we are wearing shoes

		var/shoestep_type = prepared_steps[FOOTSTEP_MOB_SHOE]
		heard_clients = playsound(source.loc, pick(footstep_sounds[shoestep_type][1]),
			footstep_sounds[shoestep_type][2] * volume * volume_multiplier,
			TRUE,
			footstep_sounds[shoestep_type][3] + e_range + range_adjustment, falloff_distance = 1, vary = sound_vary, mixer_channel = CHANNEL_SOUND_FOOTSTEPS)
	else
		var/barefoot_type = prepared_steps[FOOTSTEP_MOB_BAREFOOT]
		var/leg_num = source.step_leg
		source.step_leg++
		if(source.step_leg > source.usable_legs)
			source.step_leg = 1
		var/bodypart_slot = leg_num == 2 ? BODY_ZONE_L_LEG : BODY_ZONE_R_LEG
		var/obj/item/bodypart/leg/gotten = source.get_bodypart(bodypart_slot)
		if(gotten?.step_sounds)
			heard_clients = playsound(source.loc, pick(gotten.step_sounds), 50, TRUE, falloff_distance = 1, vary = sound_vary)
		else
			var/static/list/bare_footstep_sounds = GLOB.barefootstep

			heard_clients = playsound(source.loc, pick(bare_footstep_sounds[barefoot_type][1]),
				bare_footstep_sounds[barefoot_type][2] * volume * volume_multiplier,
				TRUE,
				bare_footstep_sounds[barefoot_type][3] + e_range + range_adjustment, falloff_distance = 1, vary = sound_vary, mixer_channel = CHANNEL_SOUND_FOOTSTEPS)
=======
	heard_clients = playsound(
		source = source,
		soundin = picked_sound,
		vol = picked_volume,
		vary = sound_vary,
		extrarange = picked_range,
		falloff_distance = 1,
	)
>>>>>>> tg-pr-88929

	if(heard_clients)
		play_fov_effect(source, 5, "footstep", direction, ignore_self = TRUE, override_list = heard_clients)


///Prepares a footstep for machine walking
/datum/element/footstep/proc/play_simplestep_machine(atom/movable/source, atom/oldloc, direction, forced, list/old_locs, momentum_change)
	SIGNAL_HANDLER

<<<<<<< HEAD
=======
	if(source.moving_diagonally == SECOND_DIAG_STEP)
		return // to prevent a diagonal step from counting as 2

>>>>>>> tg-pr-88929
	if (forced || SHOULD_DISABLE_FOOTSTEPS(source))
		return

	var/turf/open/source_loc = get_turf(source)
	if(!istype(source_loc))
		return
<<<<<<< HEAD

	if(source.check_move_loop_flags(MOVEMENT_LOOP_DRAGGING))
		return

	playsound(source_loc, footstep_sounds, 50, falloff_distance = 1, vary = sound_vary)
=======
>>>>>>> tg-pr-88929

	if(CHECK_MOVE_LOOP_FLAGS(source, MOVEMENT_LOOP_OUTSIDE_CONTROL))
		return

	playsound(source_loc, footstep_sounds, 50, falloff_distance = 1, vary = sound_vary)
