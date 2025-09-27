/datum/status_effect/fire_handler
	duration = STATUS_EFFECT_PERMANENT
	id = STATUS_EFFECT_ID_ABSTRACT
	alert_type = null
	status_type = STATUS_EFFECT_REFRESH //Custom code
	on_remove_on_mob_delete = TRUE
	tick_interval = 2 SECONDS
	processing_speed = STATUS_EFFECT_PRIORITY // monkestation edit: high-priority status effect processing
	/// Current amount of stacks we have
	var/stacks
	/// Maximum of stacks that we could possibly get
	var/stack_limit = MAX_FIRE_STACKS
	/// What status effect types do we remove uppon being applied. These are just deleted without any deduction from our or their stacks when forced.
	var/list/enemy_types
	/// What status effect types do we merge into if they exist. Ignored when forced.
	var/list/merge_types
	/// What status effect types do we override if they exist. These are simply deleted when forced.
	var/list/override_types
	/// For how much firestacks does one our stack count
	var/stack_modifier = 1
<<<<<<< HEAD
	/// how long have we been ON FIRE?
	var/ticks_on_fire = 0
=======
>>>>>>> tg-pr-88929

/datum/status_effect/fire_handler/refresh(mob/living/new_owner, new_stacks, forced = FALSE)
	if(forced)
		set_stacks(new_stacks)
	else
		adjust_stacks(new_stacks)

/datum/status_effect/fire_handler/on_creation(mob/living/new_owner, new_stacks, forced = FALSE)
	. = ..()
	var/turf/source_turf = get_turf(owner)
	if(istype(source_turf, /turf/open/floor/plating/ocean))
		qdel(src)
		return

	if(isanimal(owner))
		qdel(src)
		return
	if(isbasicmob(owner))
		if(!check_basic_mob_immunity(owner))
			qdel(src)
			return

	owner = new_owner
	set_stacks(new_stacks)

	for(var/enemy_type in enemy_types)
		var/datum/status_effect/fire_handler/enemy_effect = owner.has_status_effect(enemy_type)
		if(enemy_effect)
			if(forced)
				qdel(enemy_effect)
				continue

			var/cur_stacks = stacks
			adjust_stacks(-abs(enemy_effect.stacks * enemy_effect.stack_modifier / stack_modifier))
			enemy_effect.adjust_stacks(-abs(cur_stacks * stack_modifier / enemy_effect.stack_modifier))
			if(enemy_effect.stacks <= 0)
				qdel(enemy_effect)

			if(stacks <= 0)
				qdel(src)
				return

	if(!forced)
		var/list/merge_effects = list()
		for(var/merge_type in merge_types)
			var/datum/status_effect/fire_handler/merge_effect = owner.has_status_effect(merge_type)
			if(merge_effect)
				merge_effects += merge_effects

		if(LAZYLEN(merge_effects))
			for(var/datum/status_effect/fire_handler/merge_effect in merge_effects)
				merge_effect.adjust_stacks(stacks * stack_modifier / merge_effect.stack_modifier / LAZYLEN(merge_effects))
			qdel(src)
			return

	for(var/override_type in override_types)
		var/datum/status_effect/fire_handler/override_effect = owner.has_status_effect(override_type)
		if(override_effect)
			if(forced)
				qdel(override_effect)
				continue

			adjust_stacks(override_effect.stacks)
			qdel(override_effect)

/**
 * Setter and adjuster procs for firestacks
 *
 * Arguments:
 * - new_stacks
 *
 */

/datum/status_effect/fire_handler/proc/set_stacks(new_stacks)
	stacks = clamp(new_stacks, 0, stack_limit)
	cache_stacks()

/datum/status_effect/fire_handler/proc/adjust_stacks(new_stacks)
	stacks = clamp(stacks + new_stacks, 0, stack_limit)
	cache_stacks()

/// Checks if the applicable basic mob is immune to the status effect we're trying to apply. Returns TRUE if it is, FALSE if it isn't.
/datum/status_effect/fire_handler/proc/check_basic_mob_immunity(mob/living/basic/basic_owner)
	return (basic_owner.basic_mob_flags & FLAMMABLE_MOB)

/**
 * Refresher for mob's fire_stacks
 */

/datum/status_effect/fire_handler/proc/cache_stacks()
	owner.fire_stacks = 0
	var/was_on_fire = owner.on_fire
	owner.on_fire = FALSE
	for(var/datum/status_effect/fire_handler/possible_fire in owner.status_effects)
		owner.fire_stacks += possible_fire.stacks * possible_fire.stack_modifier

		if(!istype(possible_fire, /datum/status_effect/fire_handler/fire_stacks))
			continue

		var/datum/status_effect/fire_handler/fire_stacks/our_fire = possible_fire
		if(our_fire.on_fire)
			owner.on_fire = TRUE

	if(was_on_fire && !owner.on_fire)
		owner.clear_alert(ALERT_FIRE)
	else if(!was_on_fire && owner.on_fire)
		owner.throw_alert(ALERT_FIRE, /atom/movable/screen/alert/fire)
	owner.update_appearance(UPDATE_OVERLAYS)
	update_particles()

/datum/status_effect/fire_handler/fire_stacks
	id = "fire_stacks" //fire_stacks and wet_stacks should have different IDs or else has_status_effect won't work
	remove_on_fullheal = TRUE

	enemy_types = list(/datum/status_effect/fire_handler/wet_stacks)
	stack_modifier = 1

	/// If we're on fire
	var/on_fire = FALSE
	/// Reference to the mob light emitter itself
	var/obj/effect/dummy/lighting_obj/moblight
	/// Type of mob light emitter we use when on fire
	var/moblight_type = /obj/effect/dummy/lighting_obj/moblight/fire
	/// Cached particle type
	var/cached_state
<<<<<<< HEAD

/datum/status_effect/fire_handler/fire_stacks/tick(seconds_between_ticks, times_fired)
	var/turf/source_turf = get_turf(owner)
	if(istype(source_turf, /turf/open/floor/plating/ocean))
		qdel(src)
		return TRUE

=======

/datum/status_effect/fire_handler/fire_stacks/get_examine_text()
	if(owner.on_fire)
		return

	return "[owner.p_They()] [owner.p_are()] covered in something flammable."

/datum/status_effect/fire_handler/fire_stacks/proc/owner_touched_sparks()
	SIGNAL_HANDLER

	ignite()

/datum/status_effect/fire_handler/fire_stacks/on_creation(mob/living/new_owner, new_stacks, forced = FALSE)
	. = ..()
	RegisterSignal(owner, COMSIG_ATOM_TOUCHED_SPARKS, PROC_REF(owner_touched_sparks))

/datum/status_effect/fire_handler/fire_stacks/on_remove()
	UnregisterSignal(owner, COMSIG_ATOM_TOUCHED_SPARKS)
	if (cached_state)
		owner.remove_shared_particles(cached_state)

/datum/status_effect/fire_handler/fire_stacks/tick(seconds_between_ticks)
>>>>>>> tg-pr-88929
	if(stacks <= 0)
		qdel(src)
		return TRUE

	if(!on_fire)
		return TRUE

<<<<<<< HEAD
	if(HAS_TRAIT(owner, TRAIT_HUSK))
		adjust_stacks(-2 * seconds_between_ticks)
		if(stacks <= 0)
			extinguish()
	else
		adjust_stacks(owner.fire_stack_decay_rate * seconds_between_ticks)
=======
	var/decay_multiplier = HAS_TRAIT(owner, TRAIT_HUSK) ? 2 : 1 // husks decay twice as fast
	adjust_stacks(owner.fire_stack_decay_rate * decay_multiplier * seconds_between_ticks)
>>>>>>> tg-pr-88929

	if(stacks <= 0)
		qdel(src)
		return TRUE

	var/list/gases = owner.loc?.return_air()?.gases
	if(gases && (!gases[/datum/gas/oxygen] || gases[/datum/gas/oxygen][MOLES] < 1))
		qdel(src)
		return TRUE

	deal_damage(seconds_between_ticks)

/datum/status_effect/fire_handler/fire_stacks/update_particles()
	if (!on_fire)
		if (cached_state)
			owner.remove_shared_particles(cached_state)
		cached_state = null
		return

	var/particle_type = /particles/embers/minor
	if(stacks > MOB_BIG_FIRE_STACK_THRESHOLD)
		particle_type = /particles/embers

	if (cached_state == particle_type)
		return

	if (cached_state)
		owner.remove_shared_particles(cached_state)
	owner.add_shared_particles(particle_type)
	cached_state = particle_type

/**
 * Proc that handles damage dealing and all special effects
 *
 * Arguments:
 * - seconds_between_ticks
<<<<<<< HEAD
 * - times_fired
 *
 */

/datum/status_effect/fire_handler/fire_stacks/proc/deal_damage(seconds_between_ticks, times_fired, no_protection = FALSE)
	owner.on_fire_stack(seconds_between_ticks, times_fired, src)
=======
 *
 */

/datum/status_effect/fire_handler/fire_stacks/proc/deal_damage(seconds_per_tick)
	owner.on_fire_stack(seconds_per_tick, src)
>>>>>>> tg-pr-88929

	var/turf/location = get_turf(owner)
	location.hotspot_expose(700, 25 * seconds_between_ticks, TRUE)

<<<<<<< HEAD

	if(!ishuman(owner))
		return

	var/mob/living/carbon/human/toasty_person = owner

	if(toasty_person.get_insulation(FIRE_IMMUNITY_MAX_TEMP_PROTECT) >= 0.9)
		return

	var/fire_armor = (100 - toasty_person.getarmor(null, FIRE)) * 0.01

	switch(ticks_on_fire)
		if(0 to 3)
			toasty_person.apply_damage((0.20 * stacks * fire_armor), BURN)
		if(4 to 6)
			toasty_person.apply_damage((0.30 * stacks * fire_armor), BURN)
		if(7 to 9)
			toasty_person.apply_damage((0.40 * stacks * fire_armor), BURN)
		if(10 to INFINITY)
			toasty_person.apply_damage((0.50 * stacks * fire_armor), BURN)
	ticks_on_fire += 1 * seconds_between_ticks
=======
/**
 * Used to deal damage to humans and count their protection.
 *
 * Arguments:
 * - seconds_between_ticks
 * - no_protection: When set to TRUE, fire will ignore any possible fire protection
 *
 */

/datum/status_effect/fire_handler/fire_stacks/proc/harm_human(seconds_per_tick, no_protection = FALSE)
	var/mob/living/carbon/human/victim = owner
	var/thermal_protection = victim.get_thermal_protection()

	if(!no_protection)
		if(thermal_protection >= FIRE_IMMUNITY_MAX_TEMP_PROTECT)
			return
		if(thermal_protection >= FIRE_SUIT_MAX_TEMP_PROTECT)
			victim.adjust_bodytemperature(5.5 * seconds_per_tick)
			return

	var/amount_to_heat = (BODYTEMP_HEATING_MAX + (stacks * 12)) * 0.5 * seconds_per_tick
	if(owner.bodytemperature > BODYTEMP_FIRE_TEMP_SOFTCAP)
		// Apply dimishing returns upon temp beyond the soft cap
		amount_to_heat = amount_to_heat ** (BODYTEMP_FIRE_TEMP_SOFTCAP / owner.bodytemperature)

	victim.adjust_bodytemperature(amount_to_heat)
	if (!(HAS_TRAIT(victim, TRAIT_RESISTHEAT)))
		victim.add_mood_event("on_fire", /datum/mood_event/on_fire)
		victim.add_mob_memory(/datum/memory/was_burning)
>>>>>>> tg-pr-88929

/**
 * Handles mob ignition, should be the only way to set on_fire to TRUE
 *
 * Arguments:
 * - silent: When set to TRUE, no message is displayed
 *
 */

/datum/status_effect/fire_handler/fire_stacks/proc/ignite(silent = FALSE)
	if(HAS_TRAIT(owner, TRAIT_NOFIRE))
		return FALSE

	on_fire = TRUE
	if(!silent)
		owner.visible_message(span_warning("[owner] catches fire!"), span_userdanger("You're set on fire!"))

	if(moblight_type)
		if(moblight)
			qdel(moblight)
		moblight = new moblight_type(owner)

	cache_stacks()
	SEND_SIGNAL(owner, COMSIG_LIVING_IGNITED, owner)
	return TRUE

/**
 * Handles mob extinguishing, should be the only way to set on_fire to FALSE
 */

/datum/status_effect/fire_handler/fire_stacks/proc/extinguish()
	QDEL_NULL(moblight)
	on_fire = FALSE
	owner.clear_mood_event("on_fire")
	SEND_SIGNAL(owner, COMSIG_LIVING_EXTINGUISHED, owner)
	cache_stacks()
<<<<<<< HEAD
	for(var/obj/item/equipped in owner.get_equipped_items())
		equipped.wash(CLEAN_TYPE_ACID)
=======
	for(var/obj/item/equipped in (owner.get_equipped_items(INCLUDE_HELD)))
>>>>>>> tg-pr-88929
		equipped.extinguish()
	ticks_on_fire = 0

/datum/status_effect/fire_handler/fire_stacks/on_remove()
	if(on_fire)
		extinguish()
	set_stacks(0)
	UnregisterSignal(owner, COMSIG_ATOM_UPDATE_OVERLAYS)
	owner.update_appearance(UPDATE_OVERLAYS)
<<<<<<< HEAD
	if (cached_state)
		owner.remove_shared_particles(cached_state)
=======
>>>>>>> tg-pr-88929
	return ..()

/datum/status_effect/fire_handler/fire_stacks/on_apply()
	. = ..()
<<<<<<< HEAD
	if(HAS_TRAIT(owner, TRAIT_NOFIRE))
		return FALSE
	RegisterSignal(owner, COMSIG_ATOM_UPDATE_OVERLAYS, PROC_REF(add_fire_overlay))
=======
	RegisterSignal(owner, COMSIG_ATOM_UPDATE_OVERLAYS, PROC_REF(add_fire_overlay))
	RegisterSignal(owner, COMSIG_ATOM_EXTINGUISH, PROC_REF(extinguish))
>>>>>>> tg-pr-88929
	owner.update_appearance(UPDATE_OVERLAYS)

/datum/status_effect/fire_handler/fire_stacks/proc/add_fire_overlay(mob/living/source, list/overlays)
	SIGNAL_HANDLER

	if(stacks <= 0 || !on_fire)
		return

	var/mutable_appearance/created_overlay = owner.get_fire_overlay(stacks, on_fire)
<<<<<<< HEAD
	if(!isnull(created_overlay))
		overlays |= created_overlay

/obj/effect/dummy/lighting_obj/moblight/fire
	name = "fire"
	light_color = LIGHT_COLOR_FIRE
	light_outer_range = LIGHT_RANGE_FIRE
=======
	if(isnull(created_overlay))
		return

	overlays |= created_overlay
>>>>>>> tg-pr-88929

/datum/status_effect/fire_handler/wet_stacks
	id = "wet_stacks"

	enemy_types = list(/datum/status_effect/fire_handler/fire_stacks)
	stack_modifier = -1
	/// If the mob has the TRAIT_SLIPPERY_WHEN_WET trait, the mob gets this component while it's wet
	var/datum/component/slippery/slipperiness

/datum/status_effect/fire_handler/wet_stacks/on_apply()
	. = ..()
<<<<<<< HEAD
=======
	RegisterSignals(owner, list(SIGNAL_ADDTRAIT(TRAIT_WET_FOR_LONGER), SIGNAL_REMOVETRAIT(TRAIT_WET_FOR_LONGER)), PROC_REF(update_wet_stack_modifier))
	update_wet_stack_modifier()
	RegisterSignal(owner, SIGNAL_ADDTRAIT(TRAIT_SLIPPERY_WHEN_WET), PROC_REF(become_slippery))
	RegisterSignal(owner, SIGNAL_REMOVETRAIT(TRAIT_SLIPPERY_WHEN_WET), PROC_REF(no_longer_slippery))
	if(HAS_TRAIT(owner, TRAIT_SLIPPERY_WHEN_WET))
		become_slippery()
	ADD_TRAIT(owner, TRAIT_IS_WET,  TRAIT_STATUS_EFFECT(id))
>>>>>>> tg-pr-88929
	owner.add_shared_particles(/particles/droplets)

/datum/status_effect/fire_handler/wet_stacks/on_remove()
	. = ..()
<<<<<<< HEAD
	owner.remove_shared_particles(/particles/droplets)

/datum/status_effect/fire_handler/wet_stacks/tick(seconds_between_ticks)
	adjust_stacks(-0.5 * seconds_between_ticks)
	if(stacks <= 0)
		qdel(src)
=======
	REMOVE_TRAIT(owner, TRAIT_IS_WET, TRAIT_STATUS_EFFECT(id))
	if(HAS_TRAIT(owner, TRAIT_SLIPPERY_WHEN_WET))
		no_longer_slippery()
	owner.remove_shared_particles(/particles/droplets)

/datum/status_effect/fire_handler/wet_stacks/proc/update_wet_stack_modifier()
	SIGNAL_HANDLER
	stack_modifier = HAS_TRAIT(owner, TRAIT_WET_FOR_LONGER) ? -3.5 : -1

/datum/status_effect/fire_handler/wet_stacks/proc/become_slippery()
	SIGNAL_HANDLER
	slipperiness = owner.AddComponent(/datum/component/slippery, 5 SECONDS, lube_flags = SLIPPERY_WHEN_LYING_DOWN|NO_SLIP_WHEN_WALKING|WEAK_SLIDE)
	ADD_TRAIT(owner, TRAIT_NO_SLIP_WATER, TRAIT_STATUS_EFFECT(id))

/datum/status_effect/fire_handler/wet_stacks/proc/no_longer_slippery()
	SIGNAL_HANDLER
	QDEL_NULL(slipperiness)
	REMOVE_TRAIT(owner, TRAIT_NO_SLIP_WATER, TRAIT_STATUS_EFFECT(id))

/datum/status_effect/fire_handler/wet_stacks/get_examine_text()
	return "[owner.p_They()] look[owner.p_s()] a little soaked."

/datum/status_effect/fire_handler/wet_stacks/tick(seconds_between_ticks)
	var/decay = HAS_TRAIT(owner, TRAIT_WET_FOR_LONGER) ? -0.035 : -0.5
	adjust_stacks(decay * seconds_between_ticks)
	if(stacks <= 0)
		qdel(src)

/datum/status_effect/fire_handler/wet_stacks/check_basic_mob_immunity(mob/living/basic/basic_owner)
	return !(basic_owner.basic_mob_flags & IMMUNE_TO_GETTING_WET)
>>>>>>> tg-pr-88929
