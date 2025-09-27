<<<<<<< HEAD
#define ONLY_TURF 1

=======
>>>>>>> tg-pr-88929
/// Gives all current occupants a notification that the server is going down
/obj/machinery/quantum_server/proc/begin_shutdown(mob/user)
	if(isnull(generated_domain))
		return

	if(!length(avatar_connection_refs))
<<<<<<< HEAD
		balloon_alert(user, "powering down domain...")
		playsound(src, 'sound/machines/terminal_off.ogg', 40, 2)
		reset()
		return

	balloon_alert(user, "notifying clients...")
	playsound(src, 'sound/machines/terminal_alert.ogg', 100, TRUE)
=======
		balloon_alert_to_viewers("powering down domain...")
		playsound(src, 'sound/machines/terminal/terminal_off.ogg', 40, vary = TRUE)
		reset()
		return

	balloon_alert_to_viewers("notifying clients...")
	playsound(src, 'sound/machines/terminal/terminal_alert.ogg', 100, vary = TRUE)
>>>>>>> tg-pr-88929
	user.visible_message(
		span_danger("[user] begins depowering the server!"),
		span_notice("You start disconnecting clients..."),
		span_danger("You hear frantic keying on a keyboard."),
	)

	SEND_SIGNAL(src, COMSIG_BITRUNNER_SHUTDOWN_ALERT, user)

	if(!do_after(user, 20 SECONDS, src))
		return

	reset()

<<<<<<< HEAD
/**
 * ### Quantum Server Cold Boot
 * Procedurally links the 3 booting processes together.
 *
 * This is the starting point if you have an id. Does validation and feedback on steps
 */
/obj/machinery/quantum_server/proc/cold_boot_map(mob/user, map_key)
=======

/// Links all the loading processes together - does validation for booting a map
/obj/machinery/quantum_server/proc/cold_boot_map(map_key)
>>>>>>> tg-pr-88929
	if(!is_ready)
		return FALSE

	if(isnull(map_key))
<<<<<<< HEAD
		balloon_alert(user, "no domain specified.")
		return FALSE

	if(generated_domain)
		balloon_alert(user, "stop the current domain first.")
		return FALSE

	if(length(avatar_connection_refs))
		balloon_alert(user, "all clients must disconnect!")
		return FALSE

	is_ready = FALSE
	playsound(src, 'sound/machines/terminal_processing.ogg', 30, 2)

	if(!initialize_domain(map_key) || !initialize_safehouse() || !initialize_map_items() || !load_mob_segments())
		balloon_alert(user, "initialization failed.")
=======
		balloon_alert_to_viewers("no domain specified!")
		return FALSE

	if(generated_domain)
		balloon_alert_to_viewers("stop the current domain first!")
		return FALSE

	if(length(avatar_connection_refs))
		balloon_alert_to_viewers("all clients must disconnect!")
		return FALSE

	is_ready = FALSE
	playsound(src, 'sound/machines/terminal/terminal_processing.ogg', 30, 2)

	/// If any one of these fail, it reverts the entire process
	if(!load_domain(map_key) || !load_map_items() || !load_mob_segments())
		balloon_alert_to_viewers("initialization failed!")
>>>>>>> tg-pr-88929
		scrub_vdom()
		is_ready = TRUE
		return FALSE

<<<<<<< HEAD
=======
	SSblackbox.record_feedback("tally", "bitrunning_domain_loaded", 1, map_key)

>>>>>>> tg-pr-88929
	is_ready = TRUE

	var/spawn_chance = clamp((threat * glitch_chance), 5, threat_prob_max)
	if(prob(spawn_chance))
		setup_glitch()

<<<<<<< HEAD
	playsound(src, 'sound/machines/terminal_insert_disc.ogg', 30, 2)
	balloon_alert(user, "domain loaded.")
=======
	playsound(src, 'sound/machines/terminal/terminal_insert_disc.ogg', 30, vary = TRUE)
	balloon_alert_to_viewers("domain loaded.")
>>>>>>> tg-pr-88929
	generated_domain.start_time = world.time
	points -= generated_domain.cost
	update_use_power(ACTIVE_POWER_USE)
	update_appearance()

<<<<<<< HEAD
	if(generated_domain.announce_to_ghosts)
		notify_ghosts("Bitrunners have loaded a domain that offers ghost interactions. Check the spawners menu for more information.",
			source = src,
			header = "Matrix Glitch",
			ignore_key = POLL_IGNORE_GLITCH,
=======
	if(broadcasting)
		start_broadcasting_network(BITRUNNER_CAMERA_NET)

	if(generated_domain.announce_to_ghosts)
		notify_ghosts("Bitrunners have loaded a domain that offers ghost interactions. Check the spawners menu for more information.",
			src,
			"Matrix Glitch",
>>>>>>> tg-pr-88929
		)

	return TRUE

<<<<<<< HEAD
/// Initializes a new domain if the given key is valid and the user has enough points
/obj/machinery/quantum_server/proc/initialize_domain(map_key)
	var/datum/lazy_template/virtual_domain/to_load

	for(var/datum/lazy_template/virtual_domain/available as anything in subtypesof(/datum/lazy_template/virtual_domain))
		if(map_key != initial(available.key) || points < initial(available.cost))
			continue
		to_load = available
		break

	if(isnull(to_load))
		return FALSE

	generated_domain = new to_load()
	RegisterSignal(generated_domain, COMSIG_LAZY_TEMPLATE_LOADED, PROC_REF(on_template_loaded))
	generated_domain.lazy_load()

	return TRUE

/// Loads in necessary map items, sets mutation targets, etc
/obj/machinery/quantum_server/proc/initialize_map_items()
	var/turf/goal_turfs = list()
	var/turf/crate_turfs = list()
=======

/// Initializes a new domain if the given key is valid and the user has enough points
/obj/machinery/quantum_server/proc/load_domain(map_key)
	for(var/datum/lazy_template/virtual_domain/available in SSbitrunning.all_domains)
		if(map_key == available.key && points >= available.cost)
			generated_domain = available
			RegisterSignal(generated_domain, COMSIG_LAZY_TEMPLATE_LOADED, PROC_REF(on_template_loaded))
			generated_domain.lazy_load()
			return TRUE

	return FALSE


/// Loads in necessary map items like hololadder spawns, caches, etc
/obj/machinery/quantum_server/proc/load_map_items()
	var/turf/goal_turfs = list()
	var/turf/cache_turfs = list()
	var/turf/curiosity_turfs = list()
>>>>>>> tg-pr-88929

	for(var/obj/effect/landmark/bitrunning/thing in GLOB.landmarks_list)
		if(istype(thing, /obj/effect/landmark/bitrunning/hololadder_spawn))
			exit_turfs += get_turf(thing)
			qdel(thing) // i'm worried about multiple servers getting confused so lets clean em up
			continue

		if(istype(thing, /obj/effect/landmark/bitrunning/cache_goal_turf))
			var/turf/tile = get_turf(thing)
			goal_turfs += tile
			RegisterSignal(tile, COMSIG_ATOM_ENTERED, PROC_REF(on_goal_turf_entered))
			RegisterSignal(tile, COMSIG_ATOM_EXAMINE, PROC_REF(on_goal_turf_examined))
			qdel(thing)
			continue

		if(istype(thing, /obj/effect/landmark/bitrunning/cache_spawn))
<<<<<<< HEAD
			crate_turfs += get_turf(thing)
=======
			cache_turfs += get_turf(thing)
			qdel(thing)
			continue

		if(istype(thing, /obj/effect/landmark/bitrunning/curiosity_spawn))
			curiosity_turfs += get_turf(thing)
>>>>>>> tg-pr-88929
			qdel(thing)
			continue

		if(istype(thing, /obj/effect/landmark/bitrunning/loot_signal))
			var/turf/signaler_turf = get_turf(thing)
			signaler_turf.AddComponent(/datum/component/bitrunning_points, generated_domain)
			qdel(thing)
<<<<<<< HEAD
=======
			continue

		if(istype(thing, /obj/effect/landmark/bitrunning/permanent_exit))
			var/turf/tile = get_turf(thing)
			exit_turfs += tile
			qdel(thing)

			new /obj/structure/hololadder(tile)

>>>>>>> tg-pr-88929

	if(!length(exit_turfs))
		CRASH("Failed to find exit turfs on generated domain.")
	if(!length(goal_turfs))
		CRASH("Failed to find send turfs on generated domain.")

<<<<<<< HEAD
	if(length(crate_turfs))
		shuffle_inplace(crate_turfs)
		new /obj/structure/closet/crate/secure/bitrunning/encrypted(pick(crate_turfs))

	return TRUE

/// Loads the safehouse
/obj/machinery/quantum_server/proc/initialize_safehouse()
	var/list/turf/safehouse_load_turf = list()
	for(var/obj/effect/landmark/bitrunning/safehouse_spawn/spawner in GLOB.landmarks_list)
		safehouse_load_turf += get_turf(spawner)
		qdel(spawner)
		break

	if(!length(safehouse_load_turf))
		CRASH("Failed to find safehouse load landmark on map.")

	var/datum/map_template/safehouse/safehouse = new generated_domain.safehouse_path()
	safehouse.load(safehouse_load_turf[ONLY_TURF])
	generated_safehouse = safehouse

	return TRUE
=======
	if(!attempt_spawn_cache(cache_turfs))
		return FALSE

	while(length(curiosity_turfs))
		var/turf/picked_turf = attempt_spawn_curiosity(curiosity_turfs)
		if(!picked_turf)
			break
		generated_domain.secondary_loot_generated += 1
		curiosity_turfs -= picked_turf

	return TRUE

>>>>>>> tg-pr-88929

/// Stops the current virtual domain and disconnects all users
/obj/machinery/quantum_server/proc/reset(fast = FALSE)
	is_ready = FALSE

	sever_connections()

	if(!fast)
		notify_spawned_threats()
		addtimer(CALLBACK(src, PROC_REF(scrub_vdom)), 15 SECONDS, TIMER_UNIQUE|TIMER_STOPPABLE)
	else
		scrub_vdom() // used in unit testing, no need to wait for callbacks

<<<<<<< HEAD
	addtimer(CALLBACK(src, PROC_REF(cool_off)), min(server_cooldown_time * capacitor_coefficient), TIMER_UNIQUE|TIMER_STOPPABLE|TIMER_DELETE_ME)
=======
	addtimer(CALLBACK(src, PROC_REF(cool_off)), ROUND_UP(server_cooldown_time * capacitor_coefficient), TIMER_UNIQUE|TIMER_STOPPABLE|TIMER_DELETE_ME)
>>>>>>> tg-pr-88929
	update_appearance()

	update_use_power(IDLE_POWER_USE)
	domain_randomized = FALSE
	retries_spent = 0

<<<<<<< HEAD
/// Deletes all the tile contents
=======
	stop_broadcasting_network(BITRUNNER_CAMERA_NET)


/// Tries to clean up everything in the domain
>>>>>>> tg-pr-88929
/obj/machinery/quantum_server/proc/scrub_vdom()
	sever_connections() /// just in case someone's connected
	SEND_SIGNAL(src, COMSIG_BITRUNNER_DOMAIN_SCRUBBED) // avatar cleanup just in case

	if(length(generated_domain.reservations))
		var/datum/turf_reservation/res = generated_domain.reservations[1]
		res.Release()

<<<<<<< HEAD
	var/list/datum/weakref/creatures = spawned_threat_refs + mutation_candidate_refs
=======
	var/list/creatures = spawned_threat_refs + mutation_candidate_refs
>>>>>>> tg-pr-88929
	for(var/datum/weakref/creature_ref as anything in creatures)
		var/mob/living/creature = creature_ref?.resolve()
		if(isnull(creature))
			continue

<<<<<<< HEAD
		creature.dust() // sometimes mobs just don't die
=======
		creature.dust(just_ash = TRUE, force = TRUE) // sometimes mobs just don't die

	generated_domain.secondary_loot_generated = 0
>>>>>>> tg-pr-88929

	avatar_connection_refs.Cut()
	exit_turfs = list()
	generated_domain = null
<<<<<<< HEAD
	generated_safehouse = null
	mutation_candidate_refs.Cut()
	spawned_threat_refs.Cut()

#undef ONLY_TURF
=======
	mutation_candidate_refs.Cut()
	spawned_threat_refs.Cut()
>>>>>>> tg-pr-88929
