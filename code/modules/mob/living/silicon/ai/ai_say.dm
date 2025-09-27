/mob/living/silicon/ai/compose_track_href(atom/movable/speaker, namepart)
//	var/mob/M = speaker.GetSource() // MONKESTATION EDIT OLD
	var/mob/M = speaker.GetJob() // MONKESTATION EDIT NEW -- NTSL
	if(M)
		return "<a href='byond://?src=[REF(src)];track=[html_encode(namepart)]'>"
	return ""

/mob/living/silicon/ai/compose_job(atom/movable/speaker, message_langs, raw_message, radio_freq)
	//Also includes the </a> for AI hrefs, for convenience.
	if(jobtitles)
		return "[radio_freq ? " (" + speaker.GetJob() + ")" : ""]" + "[speaker.GetSource() ? "</a>" : ""]"
	return "[speaker.GetSource() ? "</a>" : ""]"

/mob/living/silicon/ai/try_speak(message, ignore_spam = FALSE, forced = null, filterproof = FALSE)
	// AIs cannot speak if silent AI is on.
	// Unless forced is set, as that's probably stating laws or something.
	if(!forced && CONFIG_GET(flag/silent_ai))
		to_chat(src, span_danger("The ability for AIs to speak is currently disabled via server config."))
		return FALSE

	return ..()

/mob/living/silicon/ai/radio(message, list/message_mods = list(), list/spans, language)
	if(incapacitated)
		return FALSE
	if(!radio_enabled) //AI cannot speak if radio is disabled (via intellicard) or depowered.
		to_chat(src, span_danger("Your radio transmitter is offline!"))
		return FALSE
	. = ..()
	if(.)
		return .
	if(message_mods[MODE_HEADSET])
		if(radio)
			radio.talk_into(src, message, , spans, language, message_mods)
		return NOPASS
	else if(message_mods[RADIO_EXTENSION] in GLOB.radiochannels)
		if(radio)
			radio.talk_into(src, message, message_mods[RADIO_EXTENSION], spans, language, message_mods)
			return NOPASS
	return FALSE

//For holopads only. Usable by AI.
/mob/living/silicon/ai/proc/holopad_talk(message, language)
	message = trim(message)

	if (!message)
		return

	var/obj/machinery/holopad/active_pad = current
	if(istype(active_pad) && active_pad.masters[src])//If there is a hologram and its master is the user.
		var/obj/effect/overlay/holo_pad_hologram/ai_holo = active_pad.masters[src]
		var/turf/padturf = get_turf(active_pad)
		var/padloc
		if(padturf)
			padloc = AREACOORD(padturf)
		else
			padloc = "(UNKNOWN)"
		src.log_talk(message, LOG_SAY, tag="HOLOPAD in [padloc]")
		ai_holo.say(message, sanitize = FALSE, language = language)
	else
		to_chat(src, span_alert("No holopad connected."))


// Make sure that the code compiles with AI_VOX undefined
#ifdef AI_VOX
/mob/living/silicon/ai
	var/datum/vox_holder/ai/vox_holder

/mob/living/silicon/ai/Initialize(mapload, datum/ai_laws/L, mob/target_ai)
	. = ..()
	vox_holder = new(src)

<<<<<<< HEAD
/mob/living/silicon/ai/Destroy()
	QDEL_NULL(vox_holder)
	return ..()
=======
	if(incapacitated)
		return
>>>>>>> tg-pr-88929

/datum/vox_holder/ai
	check_hearing = TRUE
	var/mob/living/silicon/ai/parent

<<<<<<< HEAD
/datum/vox_holder/ai/New(mob/living/silicon/ai/parent)
	. = ..()
	src.parent = parent
=======
	var/index = 0
	for(var/word in GLOB.vox_sounds)
		index++
		dat += "<A href='byond://?src=[REF(src)];say_word=[word]'>[capitalize(word)]</A>"
		if(index != GLOB.vox_sounds.len)
			dat += " / "
>>>>>>> tg-pr-88929

/datum/vox_holder/ai/Destroy(force)
	parent = null
	return ..()

/datum/vox_holder/ai/ui_host(mob/user)
	return parent

/datum/vox_holder/ai/ui_state(mob/user)
	return GLOB.default_state

<<<<<<< HEAD
/datum/vox_holder/ai/default_origin_turf(mob/speaker)
	return get_turf(parent)

/proc/play_vox_word_legacy(word, ai_turf, mob/only_listener)
=======
	var/message = tgui_input_text(
		src,
		"WARNING: Misuse of this verb can result in you being job banned. More help is available in 'Announcement Help'",
		"Announcement",
		src.last_announcement,
		max_length = MAX_MESSAGE_LEN,
	)

	if(!message || announcing_vox > world.time)
		return

	last_announcement = message

	if(incapacitated)
		return

	if(control_disabled)
		to_chat(src, span_warning("Wireless interface disabled, unable to interact with announcement PA."))
		return

	var/list/words = splittext(trim(message), " ")
	var/list/incorrect_words = list()

	if(words.len > 30)
		words.len = 30

	for(var/word in words)
		word = LOWER_TEXT(trim(word))
		if(!word)
			words -= word
			continue
		if(!GLOB.vox_sounds[word])
			incorrect_words += word

	if(incorrect_words.len)
		to_chat(src, span_notice("These words are not available on the announcement system: [english_list(incorrect_words)]."))
		return

	announcing_vox = world.time + VOX_DELAY

	log_message("made a vocal announcement with the following message: [message].", LOG_GAME)
	log_talk(message, LOG_SAY, tag="VOX Announcement")

	var/list/players = list()
	var/turf/ai_turf = get_turf(src)
	for(var/mob/player_mob as anything in GLOB.player_list)
		var/turf/player_turf = get_turf(player_mob)
		if(is_valid_z_level(ai_turf, player_turf))
			players += player_mob
	minor_announce(capitalize(message), "[name] announces:", players = players, should_play_sound = CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(does_target_have_vox_off)))

	for(var/word in words)
		play_vox_word(word, ai_turf, null)


/proc/play_vox_word(word, ai_turf, mob/only_listener)
>>>>>>> tg-pr-88929

	word = LOWER_TEXT(word)

	var/datum/vox_voice/used_vox_voice = GLOB.vox_voices[/datum/vox_voice/normal::name]
	if(used_vox_voice.sounds[word])
		var/sound_file = used_vox_voice.sounds[word]
		var/sound/voice = sound(sound_file, wait = 1, channel = CHANNEL_VOX)
		voice.status = SOUND_STREAM

	// If there is no single listener, broadcast to everyone in the same z level
		if(!only_listener)
			// Play voice for all mobs in the z level
			for(var/mob/player_mob as anything in GLOB.player_list)
<<<<<<< HEAD
				if(player_mob.client && !player_mob.client?.prefs)
					stack_trace("[player_mob] ([player_mob.ckey]) has null prefs, which shouldn't be possible!")
					continue

				if(!player_mob.can_hear() || !(player_mob.client?.prefs.read_preference(/datum/preference/toggle/sound_vox)))
					continue

=======
				if(!player_mob.can_hear() || !safe_read_pref(player_mob.client, /datum/preference/toggle/sound_ai_vox))
					continue

>>>>>>> tg-pr-88929
				var/turf/player_turf = get_turf(player_mob)
				if(!is_valid_z_level(ai_turf, player_turf))
					continue

				SEND_SOUND(player_mob, voice)
		else
			SEND_SOUND(only_listener, voice)
		return TRUE
	return FALSE
<<<<<<< HEAD
=======

/proc/does_target_have_vox_off(mob/target)
	return !safe_read_pref(target.client, /datum/preference/toggle/sound_ai_vox)

#undef VOX_DELAY
>>>>>>> tg-pr-88929
#endif
