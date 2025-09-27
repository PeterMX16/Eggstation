PROCESSING_SUBSYSTEM_DEF(projectiles)
	name = "Projectiles"
	wait = 0
	stat_tag = "PP"
<<<<<<< HEAD
	flags = SS_NO_INIT | SS_TICKER | SS_HIBERNATE
	var/global_max_tick_moves = 10
	var/global_pixel_speed = 2
	var/global_iterations_per_move = 16

/datum/controller/subsystem/processing/projectiles/proc/set_pixel_speed(new_speed)
	global_pixel_speed = new_speed
	for(var/i in processing)
		var/obj/projectile/P = i
		if(istype(P)) //there's non projectiles on this too.
			P.set_pixel_speed(new_speed)

/datum/controller/subsystem/processing/projectiles/vv_edit_var(var_name, var_value)
	switch(var_name)
		if(NAMEOF(src, global_pixel_speed))
			set_pixel_speed(var_value)
			return TRUE
		else
			return ..()
=======
	flags = SS_NO_INIT|SS_TICKER
	/*
	 * Maximum amount of pixels a projectile can pass per tick *unless* its a hitscan projectile.
	 * This prevents projectiles from turning into essentially hitscans if SSprojectiles starts chugging
	 * and projectiles accumulate a bunch of overtime they try to process next tick to fly through half the map.
	 * Shouldn't really be increased past 5 tiles per tick because this maxes out at 100 FPS (recommended as of now)
	 * and making a projectile faster than that will make it look jumpy because it'll be passing inconsistent
	 * amounts of pixels per tick.
	 */
	var/max_pixels_per_tick = ICON_SIZE_ALL * 5
	/*
	 * How many pixels a projectile with a speed value of 1 passes in a tick. Currently all speed values
	 * assume that 1 speed = 1 tile per decisecond, but this is a variable so that admins/debuggers can edit
	 * in order to debug projectile behavior by evenly slowing or speeding all of them up.
	 */
	var/pixels_per_decisecond = ICON_SIZE_ALL
>>>>>>> tg-pr-88929
