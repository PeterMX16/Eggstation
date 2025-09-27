<<<<<<< HEAD
/**
 * # The path of Rust.
 *
 * Goes as follows:
 *
 * Blacksmith's Tale
 * Grasp of Rust
 * Leeching Walk
 * > Sidepaths:
 *   Priest's Ritual
 *   Armorer's Ritual
 *
 * Mark of Rust
 * Ritual of Knowledge
 * Rust Construction
 * > Sidepaths:
 *   Lionhunter Rifle
 *
 * Aggressive Spread
 * > Sidepaths:
 *   Curse of Corrosion
 *   Mawed Crucible
 *
 * Toxic Blade
 * Entropic Plume
 * > Sidepaths:
 *   Rusted Ritual
 *   Rust Charge
 *
 * Rustbringer's Oath
 */
=======

/datum/heretic_knowledge_tree_column/main/rust
	neighbour_type_left = /datum/heretic_knowledge_tree_column/blade_to_rust
	neighbour_type_right = /datum/heretic_knowledge_tree_column/rust_to_cosmic

	route = PATH_RUST
	ui_bgr = "node_rust"

	start = /datum/heretic_knowledge/limited_amount/starting/base_rust
	grasp = /datum/heretic_knowledge/rust_fist
	tier1 = /datum/heretic_knowledge/rust_regen
	mark = /datum/heretic_knowledge/mark/rust_mark
	ritual_of_knowledge = /datum/heretic_knowledge/knowledge_ritual/rust
	unique_ability = /datum/heretic_knowledge/spell/rust_construction
	tier2 = /datum/heretic_knowledge/spell/area_conversion
	blade = /datum/heretic_knowledge/blade_upgrade/rust
	tier3 =	/datum/heretic_knowledge/spell/entropic_plume
	ascension = /datum/heretic_knowledge/ultimate/rust_final

>>>>>>> tg-pr-88929
/datum/heretic_knowledge/limited_amount/starting/base_rust
	name = "Blacksmith's Tale"
	desc = "Opens up the Path of Rust to you. \
		Allows you to transmute a knife with any trash item into a Rusty Blade. \
		You can only create two at a time."
	gain_text = "\"Let me tell you a story\", said the Blacksmith, as he gazed deep into his rusty blade."
	required_atoms = list(
		/obj/item/knife = 1,
		/obj/item/trash = 1,
	)
	result_atoms = list(/obj/item/melee/sickly_blade/rust)
	research_tree_icon_path = 'icons/obj/weapons/khopesh.dmi'
	research_tree_icon_state = "rust_blade"

/datum/heretic_knowledge/rust_fist
	name = "Grasp of Rust"
	desc = "Your Mansus Grasp will deal 500 damage to non-living matter and rust any surface it touches. \
		Already rusted surfaces are destroyed. Surfaces and structures can only be rusted by using Right-Click. \
		Allows you to rust basic iron walls and floors."
	gain_text = "On the ceiling of the Mansus, rust grows as moss does on a stone."
	cost = 1
	research_tree_icon_path = 'icons/ui_icons/antags/heretic/knowledge.dmi'
	research_tree_icon_state = "grasp_rust"

/datum/heretic_knowledge/rust_fist/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	RegisterSignal(user, COMSIG_HERETIC_MANSUS_GRASP_ATTACK, PROC_REF(on_mansus_grasp))
	RegisterSignal(user, COMSIG_HERETIC_MANSUS_GRASP_ATTACK_SECONDARY, PROC_REF(on_secondary_mansus_grasp))
	our_heretic.increase_rust_strength()

/datum/heretic_knowledge/rust_fist/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
	UnregisterSignal(user, list(COMSIG_HERETIC_MANSUS_GRASP_ATTACK, COMSIG_HERETIC_MANSUS_GRASP_ATTACK_SECONDARY))

/datum/heretic_knowledge/rust_fist/proc/on_mansus_grasp(mob/living/source, mob/living/target)
	SIGNAL_HANDLER

	if(!issilicon(target) && !(target.mob_biotypes & MOB_ROBOTIC))
		return

	source.do_rust_heretic_act(target)

/datum/heretic_knowledge/rust_fist/proc/on_secondary_mansus_grasp(mob/living/source, atom/target)
	SIGNAL_HANDLER

	// Rusting an airlock causes it to lose power, mostly to prevent the airlock from shocking you.
	// This is a bit of a hack, but fixing this would require the entire wire cut/pulse system to be reworked.
	if(istype(target, /obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/airlock = target
		airlock.loseMainPower()

	source.do_rust_heretic_act(target)
	return COMPONENT_USE_HAND

/datum/heretic_knowledge/rust_regen
	name = "Leeching Walk"
	desc = "Grants you passive healing and resistance to batons while standing over rust."
	gain_text = "The speed was unparalleled, the strength unnatural. The Blacksmith was smiling."
<<<<<<< HEAD
	next_knowledge = list(
		/datum/heretic_knowledge/mark/rust_mark,
		/datum/heretic_knowledge/armor,
		/datum/heretic_knowledge/essence,
		/datum/heretic_knowledge/entropy_pulse,
	)
=======
>>>>>>> tg-pr-88929
	cost = 1
	research_tree_icon_path = 'icons/effects/eldritch.dmi'
	research_tree_icon_state = "cloud_swirl"


/datum/heretic_knowledge/rust_regen/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	user.AddElement(/datum/element/leeching_walk)

/datum/heretic_knowledge/rust_regen/on_lose(mob/user, datum/antagonist/heretic/our_heretic)
<<<<<<< HEAD
	UnregisterSignal(user, list(COMSIG_MOVABLE_MOVED, COMSIG_LIVING_LIFE))

/*
 * Signal proc for [COMSIG_MOVABLE_MOVED].
 *
 * Checks if we should have baton resistance on the new turf.
 */
/datum/heretic_knowledge/rust_regen/proc/on_move(mob/source, atom/old_loc, dir, forced, list/old_locs)
	SIGNAL_HANDLER

	var/turf/mover_turf = get_turf(source)
	if(HAS_TRAIT(mover_turf, TRAIT_RUSTY))
		ADD_TRAIT(source, TRAIT_BATON_RESISTANCE, type)
	else
		REMOVE_TRAIT(source, TRAIT_BATON_RESISTANCE, type)

/**
 * Signal proc for [COMSIG_LIVING_LIFE].
 *
 * Gradually heals the heretic ([source]) on rust,
 * including baton knockdown and stamina damage.
 */
/datum/heretic_knowledge/rust_regen/proc/on_life(mob/living/source, seconds_per_tick, times_fired)
	SIGNAL_HANDLER

	var/turf/our_turf = get_turf(source)
	if(!HAS_TRAIT(our_turf, TRAIT_RUSTY))
		return

	// Heals all damage + Stamina
	var/delta_time = DELTA_WORLD_TIME(SSmobs)
	var/needs_update = FALSE // Optimization, if nothing changes then don't update our owner's health.
	needs_update += source.adjustBruteLoss(-2 * delta_time, updating_health = FALSE)
	needs_update += source.adjustFireLoss(-2 * delta_time, updating_health = FALSE)
	needs_update += source.adjustToxLoss(-2 * delta_time, updating_health = FALSE, forced = TRUE) // Slimes are people too
	needs_update += source.adjustOxyLoss(-0.5 * delta_time, updating_health = FALSE)
	if(needs_update)
		source.updatehealth()
	source.stamina.adjust(2 * delta_time)
	// Reduces duration of stuns/etc
	source.AdjustAllImmobility(-0.5 SECONDS * delta_time)
	// Heals blood loss
	if(source.blood_volume < BLOOD_VOLUME_NORMAL)
		source.blood_volume += 2.5 * delta_time
=======
	user.RemoveElement(/datum/element/leeching_walk)
>>>>>>> tg-pr-88929

/datum/heretic_knowledge/mark/rust_mark
	name = "Mark of Rust"
	desc = "Your Mansus Grasp now applies the Mark of Rust. The mark is triggered from an attack with your Rusty Blade. \
		When triggered, your victim will suffer heavy disgust and confusion. \
		Allows you to rust reinforced walls and floors as well as plasteel."
	gain_text = "The Blacksmith looks away. To a place lost long ago. \"Rusted Hills help those in dire need... at a cost.\""
	mark_type = /datum/status_effect/eldritch/rust

/datum/heretic_knowledge/mark/rust_mark/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	. = ..()
	our_heretic.increase_rust_strength()

/datum/heretic_knowledge/knowledge_ritual/rust

/datum/heretic_knowledge/spell/rust_construction
	name = "Rust Construction"
	desc = "Grants you Rust Construction, a spell that allows you to raise a wall out of a rusted floor. \
		Anyone overtop the wall will be throw aside (or upwards) and sustain damage."
	gain_text = "Images of foreign and ominous structures began to dance in my mind. Covered head to toe in thick rust, \
		they no longer looked man made. Or perhaps they never were in the first place."
<<<<<<< HEAD
	next_knowledge = list(
		/datum/heretic_knowledge/spell/area_conversion,
		/datum/heretic_knowledge/rifle,
	)
	spell_to_add = /datum/action/cooldown/spell/pointed/rust_construction
=======
	action_to_add = /datum/action/cooldown/spell/pointed/rust_construction
>>>>>>> tg-pr-88929
	cost = 1

/datum/heretic_knowledge/spell/area_conversion
	name = "Aggressive Spread"
	desc = "Grants you Aggressive Spread, a spell that spreads rust to nearby surfaces. \
		Already rusted surfaces are destroyed \ Also improves the rusting abilities of non rust-heretics."
	gain_text = "All wise men know well not to visit the Rusted Hills... Yet the Blacksmith's tale was inspiring."
	action_to_add = /datum/action/cooldown/spell/aoe/rust_conversion
	cost = 1
	research_tree_icon_frame = 5

/datum/heretic_knowledge/spell/area_conversion/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	. = ..()
	our_heretic.increase_rust_strength(TRUE)

/datum/heretic_knowledge/blade_upgrade/rust
	name = "Toxic Blade"
	desc = "Your Rusty Blade now disgusts enemies on attack \ Allows you to rust Titanium and Plastitanium.."
	gain_text = "The Blacksmith hands you their blade. \"The Blade will guide you through the flesh, should you let it.\" \
		The heavy rust weights it down. You stare deeply into it. The Rusted Hills call for you, now."
	research_tree_icon_path = 'icons/ui_icons/antags/heretic/knowledge.dmi'
	research_tree_icon_state = "blade_upgrade_rust"

/datum/heretic_knowledge/blade_upgrade/rust/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	. = ..()
	our_heretic.increase_rust_strength()

/datum/heretic_knowledge/blade_upgrade/rust/do_melee_effects(mob/living/source, mob/living/target, obj/item/melee/sickly_blade/blade)
	if(source == target || !isliving(target))
		return
	target.adjust_disgust(50)

/datum/heretic_knowledge/spell/area_conversion/on_gain(mob/user, datum/antagonist/heretic/our_heretic)
	. = ..()
/datum/heretic_knowledge/spell/entropic_plume
	name = "Entropic Plume"
	desc = "Grants you Entropic Plume, a spell that releases a vexing wave of Rust. \
		Blinds, poisons, and inflicts Amok on any heathen it hits, causing them to strike \
		at friend or foe wildly. Also rusts and destroys and surfaces it hits and improves the rusting abilities of non-rust heretics."
	gain_text = "The corrosion was unstoppable. The rust was unpleasable. \
		The Blacksmith was gone, and you hold their blade. Champions of hope, the Rustbringer is nigh!"
<<<<<<< HEAD
	next_knowledge = list(
		/datum/heretic_knowledge/ultimate/rust_final,
		/datum/heretic_knowledge/summon/rusty,
		/datum/heretic_knowledge/spell/rust_charge,
	)
	spell_to_add = /datum/action/cooldown/spell/cone/staggered/entropic_plume
=======

	action_to_add = /datum/action/cooldown/spell/cone/staggered/entropic_plume
>>>>>>> tg-pr-88929
	cost = 1



/datum/heretic_knowledge/spell/entropic_plume/on_gain(mob/user)
	. = ..()
	var/datum/antagonist/heretic/our_heretic = GET_HERETIC(user)
	our_heretic.increase_rust_strength(TRUE)

/datum/heretic_knowledge/ultimate/rust_final
	name = "Rustbringer's Oath"
	desc = "The ascension ritual of the Path of Rust. \
		Bring 3 corpses to a transmutation rune on the bridge of the station to complete the ritual. \
		When completed, the ritual site will endlessly spread rust onto any surface, stopping for nothing. \
		Additionally, you will become extremely resilient on rust, healing at triple the rate \
		and becoming immune to many effects and dangers \ You will be able to rust almost anything upon ascending."
	gain_text = "Champion of rust. Corruptor of steel. Fear the dark, for the RUSTBRINGER has come! \
		The Blacksmith forges ahead! Rusted Hills, CALL MY NAME! WITNESS MY ASCENSION!"
<<<<<<< HEAD
	route = PATH_RUST
	ascension_achievement = /datum/award/achievement/misc/rust_ascension
	announcement_text = "%SPOOKY% Fear the decay, for the Rustbringer, %NAME% has ascended! None shall escape the corrosion! %SPOOKY%"
	announcement_sound = 'sound/ambience/antag/heretic/ascend_rust.ogg'
=======

	ascension_achievement = /datum/award/achievement/misc/rust_ascension
	announcement_text = "%SPOOKY% Fear the decay, for the Rustbringer, %NAME% has ascended! None shall escape the corrosion! %SPOOKY%"
	announcement_sound = 'sound/music/antag/heretic/ascend_rust.ogg'
>>>>>>> tg-pr-88929
	/// If TRUE, then immunities are currently active.
	var/immunities_active = FALSE
	/// A typepath to an area that we must finish the ritual in.
	var/area/ritual_location = /area/station/command/bridge
	/// A static list of traits we give to the heretic when on rust.
	var/static/list/conditional_immunities = list(
		TRAIT_BOMBIMMUNE,
		TRAIT_IGNORESLOWDOWN,
		TRAIT_NO_SLIP_ALL,
		TRAIT_NOBREATH,
		TRAIT_PIERCEIMMUNE,
		TRAIT_PUSHIMMUNE,
		TRAIT_RADIMMUNE,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTHEAT,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_SHOCKIMMUNE,
		TRAIT_SLEEPIMMUNE,
		TRAIT_STUNIMMUNE,
		// monkestation addition: pain system
		TRAIT_ABATES_SHOCK,
		TRAIT_ANALGESIA,
		TRAIT_NO_PAIN_EFFECTS,
		TRAIT_NO_SHOCK_BUILDUP,
		// monkestation end
	)

/datum/heretic_knowledge/ultimate/rust_final/on_research(mob/user, datum/antagonist/heretic/our_heretic)
	. = ..()
	// This map doesn't have a Bridge, for some reason??
	// Let them complete the ritual anywhere
	if(!GLOB.areas_by_type[ritual_location])
		ritual_location = null

/datum/heretic_knowledge/ultimate/rust_final/recipe_snowflake_check(mob/living/user, list/atoms, list/selected_atoms, turf/loc)
	if(ritual_location)
		var/area/our_area = get_area(loc)
		if(!istype(our_area, ritual_location))
			loc.balloon_alert(user, "ritual failed, must be in [initial(ritual_location.name)]!") // "must be in bridge"
			return FALSE

	return ..()

/datum/heretic_knowledge/ultimate/rust_final/on_finished_recipe(mob/living/user, list/selected_atoms, turf/loc)
	. = ..()
<<<<<<< HEAD
	new /datum/rust_spread(loc)
=======
	trigger(loc)
>>>>>>> tg-pr-88929
	RegisterSignal(user, COMSIG_MOVABLE_MOVED, PROC_REF(on_move))
	RegisterSignal(user, COMSIG_LIVING_LIFE, PROC_REF(on_life))
	user.client?.give_award(/datum/award/achievement/misc/rust_ascension, user)
	var/datum/action/cooldown/spell/aoe/rust_conversion/rust_spread_spell = locate() in user.actions
	rust_spread_spell?.cooldown_time /= 2

// I sure hope this doesn't have performance implications
/datum/heretic_knowledge/ultimate/rust_final/proc/trigger(turf/center)
	var/greatest_dist = 0
	var/list/turfs_to_transform = list()
	for (var/turf/transform_turf as anything in GLOB.station_turfs)
		if (transform_turf.turf_flags & NO_RUST)
			continue
		var/dist = get_dist(center, transform_turf)
		if (dist > greatest_dist)
			greatest_dist = dist
		if (!turfs_to_transform["[dist]"])
			turfs_to_transform["[dist]"] = list()
		turfs_to_transform["[dist]"] += transform_turf

	for (var/iterator in 1 to greatest_dist)
		if(!turfs_to_transform["[iterator]"])
			continue
		addtimer(CALLBACK(src, PROC_REF(transform_area), turfs_to_transform["[iterator]"]), (5 SECONDS) * iterator)

/datum/heretic_knowledge/ultimate/rust_final/proc/transform_area(list/turfs)
	turfs = shuffle(turfs)
	var/numturfs = length(turfs)
	var/first_third = turfs.Copy(1, round(numturfs * 0.33))
	var/second_third = turfs.Copy(round(numturfs * 0.33), round(numturfs * 0.66))
	var/third_third = turfs.Copy(round(numturfs * 0.66), numturfs)
	addtimer(CALLBACK(src, PROC_REF(delay_transform_turfs), first_third), 5 SECONDS)
	addtimer(CALLBACK(src, PROC_REF(delay_transform_turfs), second_third), 5 SECONDS * 0.33)
	addtimer(CALLBACK(src, PROC_REF(delay_transform_turfs), third_third), 5 SECONDS * 0.66)

/datum/heretic_knowledge/ultimate/rust_final/proc/delay_transform_turfs(list/turfs)
	for(var/turf/turf as anything in turfs)
		turf.rust_heretic_act(5)
		CHECK_TICK

/**
 * Signal proc for [COMSIG_MOVABLE_MOVED].
 *
 * Gives our heretic ([source]) buffs if they stand on rust.
 */
/datum/heretic_knowledge/ultimate/rust_final/proc/on_move(mob/living/source, atom/old_loc, dir, forced, list/old_locs)
	SIGNAL_HANDLER

	// If we're on a rusty turf, and haven't given out our traits, buff our guy
	var/turf/our_turf = get_turf(source)
	if(HAS_TRAIT(our_turf, TRAIT_RUSTY))
		if(!immunities_active)
			source.add_traits(conditional_immunities, type)
			source.add_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)
			immunities_active = TRUE

	// If we're not on a rust turf, and we have given out our traits, nerf our guy
	else
		if(immunities_active)
			source.remove_traits(conditional_immunities, type)
			source.remove_movespeed_mod_immunities(type, /datum/movespeed_modifier/damage_slowdown)
			immunities_active = FALSE

/**
 * Signal proc for [COMSIG_LIVING_LIFE].
 *
 * Gradually heals the heretic ([source]) on rust.
 */
/datum/heretic_knowledge/ultimate/rust_final/proc/on_life(mob/living/source, seconds_per_tick, times_fired)
	SIGNAL_HANDLER

	var/turf/our_turf = get_turf(source)
	if(!HAS_TRAIT(our_turf, TRAIT_RUSTY))
		return

<<<<<<< HEAD
	var/delta_time = DELTA_WORLD_TIME(SSmobs)
	var/needs_update = FALSE
	needs_update += source.adjustBruteLoss(-4 * delta_time, updating_health = FALSE)
	needs_update += source.adjustFireLoss(-4 * delta_time, updating_health = FALSE)
	needs_update += source.adjustToxLoss(-4 * delta_time, updating_health = FALSE, forced = TRUE)
	needs_update += source.adjustOxyLoss(-4 * delta_time, updating_health = FALSE)
	if(needs_update)
		source.updatehealth()
	source.stamina.adjust(20 * delta_time)

/**
 * #Rust spread datum
 *
 * Simple datum that automatically spreads rust around it.
 *
 * Simple implementation of automatically growing entity.
 */
/datum/rust_spread
	/// The rate of spread every tick.
	var/spread_per_sec = 6
	/// The very center of the spread.
	var/turf/centre
	/// List of turfs at the edge of our rust (but not yet rusted).
	var/list/edge_turfs = list()
	/// List of all turfs we've afflicted.
	var/list/rusted_turfs = list()
	/// Static blacklist of turfs we can't spread to.
	var/static/list/blacklisted_turfs = typecacheof(list(
		/turf/open/indestructible,
		/turf/closed/indestructible,
		/turf/open/space,
		/turf/open/lava,
		/turf/open/chasm
	))

/datum/rust_spread/New(loc)
	centre = get_turf(loc)
	centre.rust_heretic_act()
	rusted_turfs += centre
	START_PROCESSING(SSprocessing, src)

/datum/rust_spread/Destroy(force)
	centre = null
	edge_turfs.Cut()
	rusted_turfs.Cut()
	STOP_PROCESSING(SSprocessing, src)
	return ..()

/datum/rust_spread/process(seconds_per_tick)
	var/spread_amount = round(spread_per_sec * seconds_per_tick)

	if(length(edge_turfs) < spread_amount)
		compile_turfs()

	for(var/i in 0 to spread_amount)
		if(!length(edge_turfs))
			break
		var/turf/afflicted_turf = pick_n_take(edge_turfs)
		afflicted_turf.rust_heretic_act()
		rusted_turfs |= afflicted_turf

/**
 * Compile turfs
 *
 * Recreates the edge_turfs list.
 * Updates the rusted_turfs list, in case any turfs within were un-rusted.
 */
/datum/rust_spread/proc/compile_turfs()
	edge_turfs.Cut()

	var/max_dist = 1
	for(var/turf/found_turf as anything in rusted_turfs)
		if(!HAS_TRAIT(found_turf, TRAIT_RUSTY))
			rusted_turfs -= found_turf
		max_dist = max(max_dist, get_dist(found_turf, centre) + 1)

	for(var/turf/nearby_turf as anything in spiral_range_turfs(max_dist, centre, FALSE))
		if((nearby_turf in rusted_turfs) || is_type_in_typecache(nearby_turf, blacklisted_turfs))
			continue

		for(var/turf/line_turf as anything in get_line(nearby_turf, centre))
			if(get_dist(nearby_turf, line_turf) <= 1)
				edge_turfs |= nearby_turf
		CHECK_TICK
=======
	var/need_mob_update = FALSE
	var/base_heal_amt = 2.5 * DELTA_WORLD_TIME(SSmobs)
	need_mob_update += source.adjustBruteLoss(-base_heal_amt, updating_health = FALSE)
	need_mob_update += source.adjustFireLoss(-base_heal_amt, updating_health = FALSE)
	need_mob_update += source.adjustToxLoss(-base_heal_amt, updating_health = FALSE, forced = TRUE)
	need_mob_update += source.adjustOxyLoss(-base_heal_amt, updating_health = FALSE)
	need_mob_update += source.adjustStaminaLoss(-base_heal_amt * 4, updating_stamina = FALSE)
	if(source.blood_volume < BLOOD_VOLUME_NORMAL)
		source.blood_volume += base_heal_amt
	if(need_mob_update)
		source.updatehealth()
>>>>>>> tg-pr-88929
