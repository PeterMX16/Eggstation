/obj/machinery/dance_machine
	name = "jukebox"
	desc = "A classic music player."
	icon = 'icons/obj/machines/music.dmi'
	icon_state = "jukebox"
	base_icon_state = "jukebox"
	verb_say = "states"
	density = TRUE
	req_access = list(ACCESS_BAR)
	processing_flags = START_PROCESSING_MANUALLY
	/// Cooldown between "Error" sound effects being played
	COOLDOWN_DECLARE(jukebox_error_cd)
<<<<<<< HEAD

/obj/machinery/dance_machine/disco
	name = "radiant dance machine mark IV"
	desc = "The first three prototypes were discontinued after mass casualty incidents."
	icon_state = "disco"
	req_access = list(ACCESS_ENGINEERING)
	anchored = FALSE
	var/list/spotlights = list()
	var/list/sparkles = list()

/obj/machinery/dance_machine/disco/indestructible
	name = "radiant dance machine mark V"
	desc = "Now redesigned with data gathered from the extensive disco and plasma research."
	req_access = null
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	flags_1 = NODECONSTRUCT_1

/datum/track
	var/song_name = "generic"
	var/song_path = null
	var/song_length = 0
	var/song_beat = 0

/datum/track/New(name, path, length, beat)
	song_name = name
	song_path = path
	song_length = length
	song_beat = beat
=======
	/// Cooldown between being allowed to play another song
	COOLDOWN_DECLARE(jukebox_song_cd)
	/// TimerID to when the current song ends
	var/song_timerid
	/// The actual music player datum that handles the music
	var/datum/jukebox/music_player
>>>>>>> tg-pr-88929

/obj/machinery/dance_machine/Initialize(mapload)
	. = ..()
	music_player = new(src)

<<<<<<< HEAD
/obj/machinery/dance_machine/Destroy()
	dance_over()
	return ..()

/obj/machinery/dance_machine/attackby(obj/item/O, mob/user, params)
	if(!active && !(flags_1 & NODECONSTRUCT_1))
		if(O.tool_behaviour == TOOL_WRENCH)
			if(!anchored && !isinspace())
				to_chat(user,span_notice("You secure [src] to the floor."))
				set_anchored(TRUE)
			else if(anchored)
				to_chat(user,span_notice("You unsecure and disconnect [src]."))
				set_anchored(FALSE)
			playsound(src, 'sound/items/deconstruct.ogg', 50, TRUE)
			return
	return ..()

/obj/machinery/dance_machine/update_icon_state()
	icon_state = "[initial(icon_state)][active ? "-active" : null]"
	return ..()

/obj/machinery/dance_machine/ui_status(mob/user)
=======
/obj/machinery/jukebox/Destroy()
	stop_music()
	QDEL_NULL(music_player)
	return ..()

/obj/machinery/jukebox/examine(mob/user)
	. = ..()
	if(music_player.active_song_sound)
		. += "Now playing: [music_player.selection.song_name]"

/obj/machinery/jukebox/no_access
	req_access = null

/obj/machinery/jukebox/wrench_act(mob/living/user, obj/item/tool)
	if(!isnull(music_player.active_song_sound))
		return NONE

	if(default_unfasten_wrench(user, tool) == SUCCESSFUL_UNFASTEN)
		return ITEM_INTERACT_SUCCESS

	return ITEM_INTERACT_BLOCKING

/obj/machinery/jukebox/update_icon_state()
	icon_state = "[base_icon_state][music_player.active_song_sound ? "-active" : null]"
	return ..()

/obj/machinery/jukebox/ui_status(mob/user, datum/ui_state/state)
	if(isobserver(user))
		return ..()
>>>>>>> tg-pr-88929
	if(!anchored)
		to_chat(user,span_warning("This device must be anchored by a wrench!"))
		return UI_CLOSE
	if(!allowed(user))
		to_chat(user,span_warning("Error: Access Denied."))
		user.playsound_local(src, 'sound/machines/compiler/compiler-failure.ogg', 25, TRUE)
		return UI_CLOSE
	if(!length(music_player.songs))
		to_chat(user,span_warning("Error: No music tracks have been authorized for your station. Petition Central Command to resolve this issue."))
		user.playsound_local(src, 'sound/machines/compiler/compiler-failure.ogg', 25, TRUE)
		return UI_CLOSE
	return ..()

/obj/machinery/dance_machine/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Jukebox", name)
		ui.open()

<<<<<<< HEAD
/obj/machinery/dance_machine/ui_data(mob/user)
	var/list/data = list()
	data["active"] = active
	data["songs"] = list()
	for(var/datum/track/S in songs)
		var/list/track_data = list(
			name = S.song_name
		)
		data["songs"] += list(track_data)
	data["track_selected"] = null
	data["track_length"] = null
	data["track_beat"] = null
	if(selection)
		data["track_selected"] = selection.song_name
		data["track_length"] = DisplayTimeText(selection.song_length)
		data["track_beat"] = selection.song_beat
	data["volume"] = volume
	return data

/obj/machinery/dance_machine/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
=======
/obj/machinery/jukebox/ui_data(mob/user)
	return music_player.get_ui_data()

/obj/machinery/jukebox/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
>>>>>>> tg-pr-88929
	. = ..()
	if(.)
		return

	var/mob/user = ui.user
	switch(action)
		if("toggle")
<<<<<<< HEAD
			if(QDELETED(src))
				return
			if(!active)
				if(stop > world.time)
					to_chat(user, span_warning("Error: The device is still resetting from the last activation, it will be ready again in [DisplayTimeText(stop-world.time)]."))
					if(!COOLDOWN_FINISHED(src, jukebox_error_cd))
						return
					playsound(src, 'sound/misc/compiler-failure.ogg', 50, TRUE)
					COOLDOWN_START(src, jukebox_error_cd, 15 SECONDS)
					return
=======
			if(isnull(music_player.active_song_sound))
				if(!COOLDOWN_FINISHED(src, jukebox_song_cd))
					to_chat(usr, span_warning("Error: The device is still resetting from the last activation, \
						it will be ready again in [DisplayTimeText(COOLDOWN_TIMELEFT(src, jukebox_song_cd))]."))
					if(COOLDOWN_FINISHED(src, jukebox_error_cd))
						playsound(src, 'sound/machines/compiler/compiler-failure.ogg', 33, TRUE)
						COOLDOWN_START(src, jukebox_error_cd, 15 SECONDS)
					return TRUE

>>>>>>> tg-pr-88929
				activate_music()
			else
<<<<<<< HEAD
				stop = 0
				return TRUE
		if("select_track")
			if(active)
				to_chat(user, span_warning("Error: You cannot change the song until the current one is over."))
				return
			var/list/available = list()
			for(var/datum/track/S in songs)
				available[S.song_name] = S
			var/selected = params["track"]
			if(QDELETED(src) || !selected || !istype(available[selected], /datum/track))
				return
			selection = available[selected]
=======
				stop_music()

>>>>>>> tg-pr-88929
			return TRUE

		if("select_track")
			if(!isnull(music_player.active_song_sound))
				to_chat(usr, span_warning("Error: You cannot change the song until the current one is over."))
				return TRUE

			var/datum/track/new_song = music_player.songs[params["track"]]
			if(QDELETED(src) || !istype(new_song, /datum/track))
				return TRUE

			music_player.selection = new_song
			return TRUE

		if("set_volume")
			var/new_volume = params["volume"]
			if(new_volume == "reset" || new_volume == "max")
				music_player.set_volume_to_max()
			else if(new_volume == "min")
				music_player.set_new_volume(0)
			else if(isnum(text2num(new_volume)))
				music_player.set_new_volume(text2num(new_volume))
			return TRUE

		if("loop")
			music_player.sound_loops = !!params["looping"]
			return TRUE

<<<<<<< HEAD
/obj/machinery/dance_machine/proc/activate_music()
	active = TRUE
=======
/obj/machinery/jukebox/proc/activate_music()
	if(!isnull(music_player.active_song_sound))
		return FALSE

	music_player.start_music()
>>>>>>> tg-pr-88929
	update_use_power(ACTIVE_POWER_USE)
	update_appearance(UPDATE_ICON_STATE)
	if(!music_player.sound_loops)
		song_timerid = addtimer(CALLBACK(src, PROC_REF(stop_music)), music_player.selection.song_length, TIMER_UNIQUE|TIMER_STOPPABLE|TIMER_DELETE_ME)
	return TRUE

/obj/machinery/jukebox/proc/stop_music()
	if(!isnull(song_timerid))
		deltimer(song_timerid)

	music_player.unlisten_all()

	if(!QDELING(src))
		COOLDOWN_START(src, jukebox_song_cd, 10 SECONDS)
		playsound(src,'sound/machines/terminal/terminal_off.ogg',50,TRUE)
		update_use_power(IDLE_POWER_USE)
		update_appearance(UPDATE_ICON_STATE)
	return TRUE

/obj/machinery/jukebox/on_set_is_operational(old_value)
	if(!is_operational)
		stop_music()

/obj/machinery/jukebox/disco
	name = "radiant dance machine mark IV"
	desc = "The first three prototypes were discontinued after mass casualty incidents."
	icon_state = "disco"
	base_icon_state = "disco"
	req_access = list(ACCESS_ENGINEERING)
	anchored = FALSE

	/// Spotlight effects being played
	VAR_PRIVATE/list/obj/item/flashlight/spotlight/spotlights = list()
	/// Sparkle effects being played
	VAR_PRIVATE/list/obj/effect/overlay/sparkles/sparkles = list()

/obj/machinery/jukebox/disco/indestructible
	name = "radiant dance machine mark V"
	desc = "Now redesigned with data gathered from the extensive disco and plasma research."
	req_access = null
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

<<<<<<< HEAD
/obj/machinery/dance_machine/disco/activate_music()
	..()
=======
/obj/machinery/jukebox/disco/activate_music()
	. = ..()
	if(!.)
		return
>>>>>>> tg-pr-88929
	dance_setup()
	lights_spin()
	begin_processing()

/obj/machinery/jukebox/disco/stop_music()
	. = ..()
	if(!.)
		return
	QDEL_LIST(spotlights)
	QDEL_LIST(sparkles)
	end_processing()

/obj/machinery/jukebox/disco/process()
	var/dance_num = rand(1, 4) //all will do the same dance
	for(var/mob/living/dancer in music_player.get_active_listeners())
		if(!(dancer.mobility_flags & MOBILITY_MOVE))
			continue
		if(HAS_TRAIT(dancer, TRAIT_DISCO_DANCER))
			continue
		dance(dancer, dance_num)

/obj/machinery/dance_machine/disco/proc/dance_setup()
	var/turf/cen = get_turf(src)
	FOR_DVIEW(var/turf/t, 3, get_turf(src),INVISIBILITY_LIGHTING)
		if(t.x == cen.x && t.y > cen.y)
			spotlights += new /obj/item/flashlight/spotlight(t, 1 + get_dist(src, t), 30 - (get_dist(src, t) * 8), COLOR_SOFT_RED)
			continue
		if(t.x == cen.x && t.y < cen.y)
			spotlights += new /obj/item/flashlight/spotlight(t, 1 + get_dist(src, t), 30 - (get_dist(src, t) * 8), LIGHT_COLOR_PURPLE)
			continue
		if(t.x > cen.x && t.y == cen.y)
			spotlights += new /obj/item/flashlight/spotlight(t, 1 + get_dist(src, t), 30 - (get_dist(src, t) * 8), LIGHT_COLOR_DIM_YELLOW)
			continue
		if(t.x < cen.x && t.y == cen.y)
			spotlights += new /obj/item/flashlight/spotlight(t, 1 + get_dist(src, t), 30 - (get_dist(src, t) * 8), LIGHT_COLOR_GREEN)
			continue
		if((t.x+1 == cen.x && t.y+1 == cen.y) || (t.x+2 == cen.x && t.y+2 == cen.y))
			spotlights += new /obj/item/flashlight/spotlight(t, 1.4 + get_dist(src, t), 30 - (get_dist(src, t) * 8), LIGHT_COLOR_ORANGE)
			continue
		if((t.x-1 == cen.x && t.y-1 == cen.y) || (t.x-2 == cen.x && t.y-2 == cen.y))
			spotlights += new /obj/item/flashlight/spotlight(t, 1.4 + get_dist(src, t), 30 - (get_dist(src, t) * 8), LIGHT_COLOR_CYAN)
			continue
		if((t.x-1 == cen.x && t.y+1 == cen.y) || (t.x-2 == cen.x && t.y+2 == cen.y))
			spotlights += new /obj/item/flashlight/spotlight(t, 1.4 + get_dist(src, t), 30 - (get_dist(src, t) * 8), LIGHT_COLOR_BLUEGREEN)
			continue
		if((t.x+1 == cen.x && t.y-1 == cen.y) || (t.x+2 == cen.x && t.y-2 == cen.y))
			spotlights += new /obj/item/flashlight/spotlight(t, 1.4 + get_dist(src, t), 30 - (get_dist(src, t) * 8), LIGHT_COLOR_BLUE)
			continue
		continue
	FOR_DVIEW_END

/obj/machinery/dance_machine/disco/proc/hierofunk()
	for(var/i in 1 to 10)
		spawn_atom_to_turf(/obj/effect/temp_visual/hierophant/telegraph/edge, src, 1, FALSE)
		sleep(0.5 SECONDS)

#define DISCO_INFENO_RANGE (rand(85, 115)*0.01)

/obj/machinery/dance_machine/disco/proc/lights_spin()
	for(var/i in 1 to 25)
		if(QDELETED(src) || isnull(music_player.active_song_sound))
			return
		var/obj/effect/overlay/sparkles/S = new /obj/effect/overlay/sparkles(src)
		S.alpha = 0
		sparkles += S
		switch(i)
			if(1 to 8)
				S.orbit(src, 30, TRUE, 60, 36, TRUE)
			if(9 to 16)
				S.orbit(src, 62, TRUE, 60, 36, TRUE)
			if(17 to 24)
				S.orbit(src, 95, TRUE, 60, 36, TRUE)
			if(25)
				S.pixel_y = 7
				S.forceMove(get_turf(src))
		sleep(0.7 SECONDS)
	for(var/s in sparkles)
		var/obj/effect/overlay/sparkles/reveal = s
		reveal.alpha = 255
	while(!isnull(music_player.active_song_sound))
		for(var/g in spotlights) // The multiples reflects custom adjustments to each colors after dozens of tests
			var/obj/item/flashlight/spotlight/glow = g
			if(QDELETED(glow))
				stack_trace("[glow?.gc_destroyed ? "Qdeleting glow" : "null entry"] found in [src].[gc_destroyed ? " Source qdeleting at the time." : ""]")
				return
			switch(glow.light_color)
				if(COLOR_SOFT_RED)
					if(glow.even_cycle)
						glow.set_light_on(FALSE)
						glow.set_light_color(LIGHT_COLOR_BLUE)
					else
						glow.set_light_range_power_color(glow.base_light_outer_range * DISCO_INFENO_RANGE, glow.light_power * 1.48, LIGHT_COLOR_BLUE)
						glow.set_light_on(TRUE)
				if(LIGHT_COLOR_BLUE)
					if(glow.even_cycle)
						glow.set_light_range_power_color(glow.base_light_outer_range * DISCO_INFENO_RANGE, glow.light_power * 2, LIGHT_COLOR_GREEN)
						glow.set_light_on(TRUE)
					else
						glow.set_light_on(FALSE)
						glow.set_light_color(LIGHT_COLOR_GREEN)
				if(LIGHT_COLOR_GREEN)
					if(glow.even_cycle)
						glow.set_light_on(FALSE)
						glow.set_light_color(LIGHT_COLOR_ORANGE)
					else
						glow.set_light_range_power_color(glow.base_light_outer_range * DISCO_INFENO_RANGE, glow.light_power * 0.5, LIGHT_COLOR_ORANGE)
						glow.set_light_on(TRUE)
				if(LIGHT_COLOR_ORANGE)
					if(glow.even_cycle)
						glow.set_light_range_power_color(glow.base_light_outer_range * DISCO_INFENO_RANGE, glow.light_power * 2.27, LIGHT_COLOR_PURPLE)
						glow.set_light_on(TRUE)
					else
						glow.set_light_on(FALSE)
						glow.set_light_color(LIGHT_COLOR_PURPLE)
				if(LIGHT_COLOR_PURPLE)
					if(glow.even_cycle)
						glow.set_light_on(FALSE)
						glow.set_light_color(LIGHT_COLOR_BLUEGREEN)
					else
						glow.set_light_range_power_color(glow.base_light_outer_range * DISCO_INFENO_RANGE, glow.light_power * 0.44, LIGHT_COLOR_BLUEGREEN)
						glow.set_light_on(TRUE)
				if(LIGHT_COLOR_BLUEGREEN)
					if(glow.even_cycle)
						glow.set_light_range(glow.base_light_outer_range * DISCO_INFENO_RANGE)
						glow.set_light_color(LIGHT_COLOR_DIM_YELLOW)
						glow.set_light_on(TRUE)
					else
						glow.set_light_on(FALSE)
						glow.set_light_color(LIGHT_COLOR_DIM_YELLOW)
				if(LIGHT_COLOR_DIM_YELLOW)
					if(glow.even_cycle)
						glow.set_light_on(FALSE)
						glow.set_light_color(LIGHT_COLOR_CYAN)
					else
						glow.set_light_range(glow.base_light_outer_range * DISCO_INFENO_RANGE)
						glow.set_light_color(LIGHT_COLOR_CYAN)
						glow.set_light_on(TRUE)
				if(LIGHT_COLOR_CYAN)
					if(glow.even_cycle)
						glow.set_light_range_power_color(glow.base_light_outer_range * DISCO_INFENO_RANGE, glow.light_power * 0.68, COLOR_SOFT_RED)
						glow.set_light_on(TRUE)
					else
						glow.set_light_on(FALSE)
						glow.set_light_color(COLOR_SOFT_RED)
					glow.even_cycle = !glow.even_cycle
		if(prob(2))  // Unique effects for the dance floor that show up randomly to mix things up
			INVOKE_ASYNC(src, PROC_REF(hierofunk))
		sleep(music_player.selection.song_beat)
		if(QDELETED(src))
			return

#undef DISCO_INFENO_RANGE

<<<<<<< HEAD
/obj/machinery/dance_machine/disco/proc/dance(mob/living/M) //Show your moves
	set waitfor = FALSE
	switch(rand(0,9))
		if(0 to 1)
			dance2(M)
		if(2 to 3)
			dance3(M)
		if(4 to 6)
			dance4(M)
		if(7 to 9)
			dance5(M)

/obj/machinery/dance_machine/disco/proc/dance2(mob/living/M)
	for(var/i in 0 to 9)
		dance_rotate(M, CALLBACK(M, TYPE_PROC_REF(/mob, dance_flip)))
		sleep(2 SECONDS)
=======
/obj/machinery/jukebox/disco/proc/dance(mob/living/dancer, dance_num) //Show your moves
	ADD_TRAIT(dancer, TRAIT_DISCO_DANCER, REF(src))
	switch(dance_num)
		if(1)
			dance1(dancer)
		if(2)
			dance2(dancer)
		if(3)
			start_dance3(dancer)
		if(4)
			dance4(dancer)
>>>>>>> tg-pr-88929

/mob/proc/dance_flip()
	if(dir == WEST)
		emote("flip")

<<<<<<< HEAD
/obj/machinery/dance_machine/disco/proc/dance3(mob/living/M)
	var/matrix/initial_matrix = matrix(M.transform)
	for (var/i in 1 to 75)
		if (!M)
			return
		switch(i)
			if (1 to 15)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(0,1)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
			if (16 to 30)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(1,-1)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
			if (31 to 45)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(-1,-1)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
			if (46 to 60)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(-1,1)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
			if (61 to 75)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(1,0)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
		M.setDir(turn(M.dir, 90))
		switch (M.dir)
			if (NORTH)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(0,3)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
			if (SOUTH)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(0,-3)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
			if (EAST)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(3,0)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
			if (WEST)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(-3,0)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
		sleep(0.1 SECONDS)
	M.lying_fix()

/obj/machinery/dance_machine/disco/proc/dance4(mob/living/M)
	var/speed = rand(1,3)
	set waitfor = 0
	var/time = 30
	while(time)
		sleep(speed)
		for(var/i in 1 to speed)
			M.setDir(pick(GLOB.cardinals))
			for(var/mob/living/carbon/NS in rangers)
				NS.set_resting(!NS.resting, TRUE, TRUE)
		time--

/obj/machinery/dance_machine/disco/proc/dance5(mob/living/M)
	animate(M, transform = matrix(180, MATRIX_ROTATE), time = 1, loop = 0)
	var/matrix/initial_matrix = matrix(M.transform)
	for (var/i in 1 to 60)
		if (!M)
			return
		if (i<31)
			initial_matrix = matrix(M.transform)
			initial_matrix.Translate(0,1)
			animate(M, transform = initial_matrix, time = 1, loop = 0)
		if (i>30)
			initial_matrix = matrix(M.transform)
			initial_matrix.Translate(0,-1)
			animate(M, transform = initial_matrix, time = 1, loop = 0)
		M.setDir(turn(M.dir, 90))
		switch (M.dir)
			if (NORTH)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(0,3)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
			if (SOUTH)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(0,-3)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
			if (EAST)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(3,0)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
			if (WEST)
				initial_matrix = matrix(M.transform)
				initial_matrix.Translate(-3,0)
				animate(M, transform = initial_matrix, time = 1, loop = 0)
		sleep(1 SECONDS)
	M.lying_fix()

/mob/living/proc/lying_fix()
//MONKESTATION EDIT START : Fixes this breaking the mob's size
	// animate(src, transform = null, time = 1, loop = 0) - original
	// lying_prev = 0 - original
	rebuild_transform()
//MONKESTATION EDIT END

/obj/machinery/dance_machine/proc/dance_over()
	for(var/mob/living/L in rangers)
		if(!L || !L.client)
			continue
		L.stop_sound_channel(CHANNEL_JUKEBOX)
	rangers = list()

/obj/machinery/dance_machine/disco/dance_over()
	..()
	QDEL_LIST(spotlights)
	QDEL_LIST(sparkles)

/obj/machinery/dance_machine/process()
	if(world.time < stop && active)
		var/sound/song_played = sound(selection.song_path)

		for(var/mob/M in range(10,src))
			if(!M.client || !(M.client.prefs.read_preference(/datum/preference/toggle/sound_jukebox)))
				continue
			if(!(M in rangers))
				rangers[M] = TRUE
				M.playsound_local(get_turf(M), null, volume, channel = CHANNEL_JUKEBOX, sound_to_use = song_played, use_reverb = FALSE)
		for(var/mob/L in rangers)
			if(get_dist(src,L) > 10 || !(L.client.prefs.read_preference(/datum/preference/toggle/sound_jukebox)))
				rangers -= L
				if(!L || !L.client)
					continue
				L.stop_sound_channel(CHANNEL_JUKEBOX)
	else if(active)
		active = FALSE
		update_use_power(IDLE_POWER_USE)
		STOP_PROCESSING(SSobj, src)
		dance_over()
		playsound(src,'sound/machines/terminal_off.ogg',50,TRUE)
		update_appearance()
		stop = world.time + 100

/obj/machinery/dance_machine/disco/process()
	. = ..()
	if(active)
		for(var/mob/living/M in rangers)
			if(prob(5+(allowed(M)*4)) && (M.mobility_flags & MOBILITY_MOVE))
				dance(M)
=======
/obj/machinery/jukebox/disco/proc/dance1(mob/living/dancer)
	addtimer(TRAIT_CALLBACK_REMOVE(dancer, TRAIT_DISCO_DANCER, REF(src)), 6.5 SECONDS, TIMER_CLIENT_TIME)
	for(var/i in 0 to (6 SECONDS) step (1.5 SECONDS))
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(dance_rotate), dancer, CALLBACK(dancer, TYPE_PROC_REF(/mob, dance_flip))), i, TIMER_CLIENT_TIME)

/obj/machinery/jukebox/disco/proc/dance2(mob/living/dancer, dance_length = 2.5 SECONDS)
	var/matrix/initial_matrix = matrix(dancer.transform)
	var/list/transforms = list(
		"[NORTH]" = matrix(dancer.transform).Translate(0, 3),
		"[EAST]" = matrix(dancer.transform).Translate(3, 0),
		"[SOUTH]" = matrix(dancer.transform).Translate(0, -3),
		"[WEST]" = matrix(dancer.transform).Translate(-1, -1),
	)
	addtimer(VARSET_CALLBACK(dancer, transform, initial_matrix), dance_length + 0.5 SECONDS, TIMER_CLIENT_TIME)
	addtimer(TRAIT_CALLBACK_REMOVE(dancer, TRAIT_DISCO_DANCER, REF(src)), dance_length + 0.5 SECONDS)
	for (var/i in 1 to dance_length)
		addtimer(CALLBACK(src, PROC_REF(animate_dance2), dancer, transforms, initial_matrix), i, TIMER_CLIENT_TIME)

/obj/machinery/jukebox/disco/proc/animate_dance2(mob/living/dancer, list/transforms, matrix/initial_matrix)
	dancer.setDir(turn(dancer.dir, 90))
	animate(dancer, transform = transforms[num2text(dancer.dir)], time = 1, loop = 0)
	animate(transform = initial_matrix, time = 2, loop = 0)

/obj/machinery/jukebox/disco/proc/start_dance3(mob/living/dancer, dance_length = 3 SECONDS)
	var/initially_resting = dancer.resting
	var/direction_index = 1 //this should allow everyone to dance in the same direction
	addtimer(TRAIT_CALLBACK_REMOVE(dancer, TRAIT_DISCO_DANCER, REF(src)), dance_length + 0.2 SECONDS)
	addtimer(CALLBACK(dancer, TYPE_PROC_REF(/mob/living, set_resting), initially_resting, TRUE, TRUE), dance_length + 0.2 SECONDS, TIMER_CLIENT_TIME)
	for (var/i in 1 to dance_length step 2) // 1 = 0.1 seconds
		addtimer(CALLBACK(src, PROC_REF(dance3), dancer, GLOB.cardinals[direction_index]), i, TIMER_CLIENT_TIME)
		direction_index++
		if(direction_index > GLOB.cardinals.len)
			direction_index = 1

/obj/machinery/jukebox/disco/proc/dance3(mob/living/dancer, dir)
	dancer.setDir(dir)
	dancer.set_resting(!dancer.resting, silent = TRUE, instant = TRUE)

/obj/machinery/jukebox/disco/proc/dance4(mob/living/dancer, dance_length = 1.5 SECONDS)
	var/matrix/initial_matrix = matrix(dancer.transform)
	animate(dancer, transform = matrix(dancer.transform).Turn(180), time = 2, loop = 0)
	dancer.emote("spin")
	addtimer(CALLBACK(src, PROC_REF(dance4_revert), dancer, initial_matrix), dance_length, TIMER_CLIENT_TIME)

/obj/machinery/jukebox/disco/proc/dance4_revert(mob/living/dancer, matrix/starting_matrix)
	animate(dancer, transform = starting_matrix, time = 5, loop = 0)
	REMOVE_TRAIT(dancer, TRAIT_DISCO_DANCER, REF(src))
>>>>>>> tg-pr-88929
