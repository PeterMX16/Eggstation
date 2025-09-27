/// Attaches to a turf so it spawns a crate when a certain amount of points are added to it.
/datum/component/bitrunning_points
	/// The amount required to spawn a crate
	var/points_goal = 10
	/// A special condition limits this from spawning a crate
	var/points_received = 0

<<<<<<< HEAD
=======

>>>>>>> tg-pr-88929
/datum/component/bitrunning_points/Initialize(datum/lazy_template/virtual_domain/domain)
	. = ..()
	if(!isturf(parent))
		return COMPONENT_INCOMPATIBLE

	RegisterSignal(domain, COMSIG_BITRUNNER_GOAL_POINT, PROC_REF(on_add_points))

<<<<<<< HEAD
=======

>>>>>>> tg-pr-88929
/// Listens for points to be added which will eventually spawn a crate.
/datum/component/bitrunning_points/proc/on_add_points(datum/source, points_to_add)
	SIGNAL_HANDLER

	points_received += points_to_add

	if(points_received < points_goal)
		return

	reveal()

<<<<<<< HEAD
/// Spawns the crate with some effects
/datum/component/bitrunning_points/proc/reveal()
	playsound(src, 'sound/magic/blink.ogg', 50, TRUE)

	var/turf/tile = parent
	new /obj/structure/closet/crate/secure/bitrunning/encrypted(tile)
=======

/// Spawns the crate with some effects
/datum/component/bitrunning_points/proc/reveal()
	playsound(src, 'sound/effects/magic/blink.ogg', 50, TRUE)

	var/turf/tile = parent
	var/obj/structure/closet/crate/secure/bitrunning/encrypted/crate = new()
	crate.forceMove(tile) // Triggers any on-move effects on that turf
>>>>>>> tg-pr-88929

	var/datum/effect_system/spark_spread/quantum/sparks = new(tile)
	sparks.set_up(number = 5, location = tile)
	sparks.start()

	qdel(src)
