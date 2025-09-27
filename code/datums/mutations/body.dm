//These mutations change your overall "form" somehow, like size

//Epilepsy gives a very small chance to have a seizure every life tick, knocking you unconscious.
/datum/mutation/epilepsy
	name = "Epilepsy"
	desc = "A genetic defect that sporadically causes seizures."
	instability = NEGATIVE_STABILITY_MODERATE
	quality = NEGATIVE
	text_gain_indication = span_danger("You get a headache.")
	synchronizer_coeff = 1
	power_coeff = 1
	energy_coeff = 1 // MONKESTATION ADDITION

/datum/mutation/epilepsy/on_life(seconds_per_tick, times_fired)
//	if(SPT_PROB(0.5 * GET_MUTATION_SYNCHRONIZER(src), seconds_per_tick)) // MONKESTATION EDIT OLD
	if(SPT_PROB(0.5 * GET_MUTATION_SYNCHRONIZER(src) / GET_MUTATION_ENERGY(src), seconds_per_tick)) // MONKESTATION EDIT NEW
		trigger_seizure()

/datum/mutation/epilepsy/proc/trigger_seizure()
	if(owner.stat != CONSCIOUS)
		return
	owner.visible_message(span_danger("[owner] starts having a seizure!"), span_userdanger("You have a seizure!"))
	owner.Unconscious(200 * GET_MUTATION_POWER(src))
	owner.set_jitter(2000 SECONDS * GET_MUTATION_POWER(src)) //yes this number looks crazy but the jitter animations are amplified based on the duration.
	owner.add_mood_event("epilepsy", /datum/mood_event/epilepsy)
	addtimer(CALLBACK(src, PROC_REF(jitter_less)), 9 SECONDS)

/datum/mutation/epilepsy/proc/jitter_less()
	if(QDELETED(owner))
		return

	owner.set_jitter(20 SECONDS)

/datum/mutation/epilepsy/on_acquiring(mob/living/carbon/human/acquirer)
	. = ..()
	if(!.)
		return
	RegisterSignal(owner, COMSIG_MOB_FLASHED, PROC_REF(get_flashed_nerd))

/datum/mutation/epilepsy/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	UnregisterSignal(owner, COMSIG_MOB_FLASHED)

/datum/mutation/epilepsy/proc/get_flashed_nerd()
	SIGNAL_HANDLER

	if(!prob(30))
		return
	trigger_seizure()


//Unstable DNA induces random mutations!
/datum/mutation/bad_dna
	name = "Unstable DNA"
	desc = "Strange mutation that causes the holder to randomly mutate."
	instability = NEGATIVE_STABILITY_MAJOR
	quality = NEGATIVE
	text_gain_indication = span_danger("You feel strange.")
	locked = TRUE

/datum/mutation/bad_dna/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return
	to_chat(owner, text_gain_indication)
	var/mob/new_mob
	if(prob(95))
		switch(rand(1,3))
			if(1)
				new_mob = owner.easy_random_mutate(NEGATIVE + MINOR_NEGATIVE)
			if(2)
				new_mob = owner.random_mutate_unique_identity()
			if(3)
				new_mob = owner.random_mutate_unique_features()
	else
		new_mob = owner.easy_random_mutate(POSITIVE)
	if(new_mob && ismob(new_mob))
		owner = new_mob
	. = owner
	on_losing(owner)


//Cough gives you a chronic cough that causes you to drop items.
/datum/mutation/cough
	name = "Cough"
	desc = "A chronic cough."
	instability = NEGATIVE_STABILITY_MODERATE
	quality = MINOR_NEGATIVE
	text_gain_indication = span_danger("You start coughing.")
	synchronizer_coeff = 1
	power_coeff = 1
	energy_coeff = 1 // MONKESTATION ADDITION

/datum/mutation/cough/on_life(seconds_per_tick, times_fired)
//	if(SPT_PROB(2.5 * GET_MUTATION_SYNCHRONIZER(src), seconds_per_tick) && owner.stat == CONSCIOUS) // MONKESTATION EDIT OLD
	if(SPT_PROB(2.5 * GET_MUTATION_SYNCHRONIZER(src) / GET_MUTATION_ENERGY(src), seconds_per_tick) && owner.stat == CONSCIOUS) // MONKESTATION EDIT NEW
		owner.drop_all_held_items()
		owner.emote("cough")
		if(GET_MUTATION_POWER(src) > 1)
			var/cough_range = GET_MUTATION_POWER(src) * 4
			var/turf/target = get_ranged_target_turf(owner, REVERSE_DIR(owner.dir), cough_range)
			owner.throw_at(target, cough_range, GET_MUTATION_POWER(src))

/datum/mutation/paranoia
	name = "Paranoia"
	desc = "Subject is easily terrified, and may suffer from hallucinations."
	instability = NEGATIVE_STABILITY_MODERATE
	quality = NEGATIVE
	text_gain_indication = span_danger("You feel screams echo through your mind...")
	text_lose_indication = span_notice("The screaming in your mind fades.")

/datum/mutation/paranoia/on_life(seconds_per_tick, times_fired)
	if(SPT_PROB(2.5, seconds_per_tick) && owner.stat == CONSCIOUS)
		owner.emote("scream")
		if(prob(25))
			owner.adjust_hallucinations(40 SECONDS)

//Dwarfism shrinks your body and lets you pass tables.
/datum/mutation/dwarfism
	name = "Dwarfism"
	desc = "A mutation believed to be the cause of dwarfism."
	quality = POSITIVE
	difficulty = 16
<<<<<<< HEAD
	instability = 5
	conflicts = list(/datum/mutation/gigantism)
=======
	instability = POSITIVE_INSTABILITY_MINOR
	conflicts = list(/datum/mutation/human/gigantism, /datum/mutation/human/acromegaly)
>>>>>>> tg-pr-88929
	locked = TRUE // Default intert species for now, so locked from regular pool.

/datum/mutation/dwarfism/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return
	ADD_TRAIT(owner, TRAIT_DWARF, GENETIC_MUTATION)
	owner.visible_message(span_danger("[owner] suddenly shrinks!"), span_notice("Everything around you seems to grow.."))

/datum/mutation/dwarfism/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	//We're leaving the size traits permanent until someone wants to separate the mutation from customization aspects
	REMOVE_TRAIT(owner, TRAIT_DWARF, GENETIC_MUTATION)
	owner.visible_message(span_danger("[owner] suddenly grows!"), span_notice("Everything around you seems to shrink.."))

/datum/mutation/human/acromegaly
	name = "Acromegaly"
	desc = "A mutation believed to be the cause of acromegaly, or 'being unusually tall'."
	quality = MINOR_NEGATIVE
	difficulty = 16
	instability = NEGATIVE_STABILITY_MODERATE
	synchronizer_coeff = 1
	conflicts = list(/datum/mutation/human/dwarfism)

/datum/mutation/human/acromegaly/on_acquiring(mob/living/carbon/human/owner)
	if(..())
		return
	ADD_TRAIT(owner, TRAIT_TOO_TALL, GENETIC_MUTATION)
	owner.visible_message(span_danger("[owner] suddenly grows tall!"), span_notice("You feel a small strange urge to fight small men with slingshots. Or maybe play some basketball."))
	RegisterSignal(owner, COMSIG_MOVABLE_MOVED, PROC_REF(head_bonk))
	owner.regenerate_icons()

/datum/mutation/human/acromegaly/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	REMOVE_TRAIT(owner, TRAIT_TOO_TALL, GENETIC_MUTATION)
	owner.visible_message(span_danger("[owner] suddenly shrinks!"), span_notice("You return to your usual height."))
	UnregisterSignal(owner, COMSIG_MOVABLE_MOVED, PROC_REF(head_bonk))
	owner.regenerate_icons()

// This is specifically happening because they're not used to their new height and are stumbling around into machinery made for normal humans
/datum/mutation/human/acromegaly/proc/head_bonk(mob/living/parent)
	SIGNAL_HANDLER
	var/atom/movable/whacked_by = (locate(/obj/machinery/door/airlock) in parent.loc) || (locate(/obj/machinery/door/firedoor) in parent.loc) || (locate(/obj/structure/mineral_door) in parent.loc)
	if(!whacked_by || prob(100 - (8 *  GET_MUTATION_SYNCHRONIZER(src))))
		return
	to_chat(parent, span_danger("You hit your head on \the [whacked_by]'s header!"))
	var/dmg = HAS_TRAIT(parent, TRAIT_HEAD_INJURY_BLOCKED) ? rand(1,4) : rand(2,9)
	parent.apply_damage(dmg, BRUTE, BODY_ZONE_HEAD)
	parent.do_attack_animation(whacked_by, ATTACK_EFFECT_PUNCH)
	playsound(whacked_by, 'sound/effects/bang.ogg', 10, TRUE)
	parent.adjust_staggered_up_to(STAGGERED_SLOWDOWN_LENGTH, 10 SECONDS)

/datum/mutation/human/gigantism
	name = "Gigantism" //negative version of dwarfism
	desc = "The cells within the subject spread out to cover more area, making the subject appear larger."
	quality = MINOR_NEGATIVE
	difficulty = 12
	conflicts = list(/datum/mutation/human/dwarfism)

/datum/mutation/human/gigantism/on_acquiring(mob/living/carbon/human/owner)
	if(..())
		return
	ADD_TRAIT(owner, TRAIT_GIANT, GENETIC_MUTATION)
	owner.update_transform(1.25)
	owner.visible_message(span_danger("[owner] suddenly grows!"), span_notice("Everything around you seems to shrink.."))

/datum/mutation/human/gigantism/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	REMOVE_TRAIT(owner, TRAIT_GIANT, GENETIC_MUTATION)
	owner.update_transform(0.8)
	owner.visible_message(span_danger("[owner] suddenly shrinks!"), span_notice("Everything around you seems to grow.."))

//Clumsiness has a very large amount of small drawbacks depending on item.
/datum/mutation/clumsy
	name = "Clumsiness"
	desc = "A genome that inhibits certain brain functions, causing the holder to appear clumsy. Honk!"
	instability = NEGATIVE_STABILITY_MAJOR
	quality = MINOR_NEGATIVE
	text_gain_indication = span_danger("You feel lightheaded.")

/datum/mutation/clumsy/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return
	ADD_TRAIT(owner, TRAIT_CLUMSY, GENETIC_MUTATION)

/datum/mutation/clumsy/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	REMOVE_TRAIT(owner, TRAIT_CLUMSY, GENETIC_MUTATION)


//Tourettes causes you to randomly stand in place and shout.
/datum/mutation/tourettes
	name = "Tourette's Syndrome"
	desc = "A chronic twitch that forces the user to scream nonsense." //definitely needs rewriting
	quality = NEGATIVE
	instability = 0
	text_gain_indication = span_danger("You twitch.")
	synchronizer_coeff = 1
	power_coeff = 1 // MONKESTATION ADDITION
	energy_coeff = 1 // MONKESTATION ADDITION

/datum/mutation/tourettes/on_life(seconds_per_tick, times_fired)
//	if(SPT_PROB(5 * GET_MUTATION_SYNCHRONIZER(src), seconds_per_tick) && owner.stat == CONSCIOUS && !owner.IsStun()) // MONKESTATION EDIT OLD
	if(SPT_PROB(5 * GET_MUTATION_SYNCHRONIZER(src) / GET_MUTATION_ENERGY(src), seconds_per_tick) && owner.stat == CONSCIOUS && !owner.IsStun()) // MONKESTATION EDIT NEW
		switch(rand(1, 3))
			if(1)
				owner.emote("twitch")
			if(2 to 3)
//				owner.say("[prob(50) ? ";" : ""][pick("SHIT", "PISS", "FUCK", "MROW", "ANIMES", "LIZZZARD", "HELP")]", forced=name) // MONKESTATION EDIT OLD
				owner.say("[prob(50) ? ";" : ""][pick("SHIT", "PISS", "FUCK", "MROW", "ANIMES", "LIZZZARD", "HELP")][GET_MUTATION_POWER(src) > 1 ? "!!" : ""]", forced=name) // MONKESTATION EDIT NEW
		var/x_offset_old = owner.pixel_x
		var/y_offset_old = owner.pixel_y
		var/x_offset = owner.pixel_x + rand(-2,2)
		var/y_offset = owner.pixel_y + rand(-1,1)
		animate(owner, pixel_x = x_offset, pixel_y = y_offset, time = 1)
		animate(owner, pixel_x = x_offset_old, pixel_y = y_offset_old, time = 1)

//Deafness makes you deaf.
/datum/mutation/deaf
	name = "Deafness"
	desc = "The holder of this genome is completely deaf."
	instability = NEGATIVE_STABILITY_MAJOR
	quality = NEGATIVE
	text_gain_indication = span_danger("You can't seem to hear anything.")

/datum/mutation/deaf/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return
	ADD_TRAIT(owner, TRAIT_DEAF, GENETIC_MUTATION)

/datum/mutation/deaf/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	REMOVE_TRAIT(owner, TRAIT_DEAF, GENETIC_MUTATION)

//Monified turns you into a monkey.
/datum/mutation/race
	name = "Monkified"
	desc = "A strange genome, believing to be what differentiates monkeys from humans."
	text_gain_indication = span_green("You feel unusually monkey-like.")
	text_lose_indication = span_notice("You feel like your old self.")
	quality = NEGATIVE
	instability = NEGATIVE_STABILITY_MAJOR // mmmonky
	remove_on_aheal = FALSE
	locked = TRUE //Species specific, keep out of actual gene pool
	mutadone_proof = TRUE
	var/datum/species/original_species = /datum/species/human
	var/original_name

<<<<<<< HEAD
/datum/mutation/race/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
=======
/datum/mutation/human/race/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(.)
>>>>>>> tg-pr-88929
		return
	if(ismonkey(owner))
		return
	original_species = owner.dna.species.type
	original_name = owner.real_name
	owner.monkeyize()

<<<<<<< HEAD
/datum/mutation/race/on_losing(mob/living/carbon/human/owner)
=======
/datum/mutation/human/race/on_losing(mob/living/carbon/human/owner)
>>>>>>> tg-pr-88929
	if(owner.stat == DEAD)
		return
	. = ..()
	if(.)
		return
	if(QDELETED(owner))
		return
<<<<<<< HEAD
=======

	owner.fully_replace_character_name(null, original_name)
	owner.humanize(original_species)
>>>>>>> tg-pr-88929

	owner.fully_replace_character_name(null, original_name)
	owner.humanize(original_species)

/datum/mutation/glow
	name = "Glowy"
	desc = "You permanently emit a light with a random color and intensity."
	quality = POSITIVE
<<<<<<< HEAD
	text_gain_indication = "<span class='notice'>Your skin begins to glow softly.</span>"
	instability = 5
	power_coeff = 1
	conflicts = list(/datum/mutation/glow/anti)
	var/glow_power = 2.5
	var/glow_range = 2.5
	var/glow_color
=======
	text_gain_indication = span_notice("Your skin begins to glow softly.")
	instability = POSITIVE_INSTABILITY_MINI
	power_coeff = 1
	conflicts = list(/datum/mutation/human/glow/anti)
	var/glow_power = 2
	var/glow_range = 2.5
	var/glow_color
	var/obj/effect/dummy/lighting_obj/moblight/glow
>>>>>>> tg-pr-88929

	var/obj/effect/dummy/lighting_obj/moblight/glow

/datum/mutation/glow/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return
	glow_color = get_glow_color()
	glow = owner.mob_light()
	modify()
	RegisterSignal(src, COMSIG_LIGHT_EATER_ACT, PROC_REF(on_light_eater))

/datum/mutation/glow/modify()
	if(!glow)
		return
	glow.set_light_range_power_color(glow_range * GET_MUTATION_POWER(src), glow_power, glow_color)
	glow.set_light_on(TRUE)

// Override modify here without a parent call, because we don't actually give an action.
<<<<<<< HEAD
/datum/mutation/glow/setup()
=======
/datum/mutation/human/glow/modify()
>>>>>>> tg-pr-88929
	if(!glow)
		return

	glow.set_light_range_power_color(glow_range * GET_MUTATION_POWER(src), glow_power, glow_color)
<<<<<<< HEAD

/datum/mutation/glow/proc/on_light_eater(mob/living/carbon/human/source, datum/light_eater)
	SIGNAL_HANDLER
	if(!glow)
		return
	glow.set_light_on(FALSE)
	addtimer(CALLBACK(src, PROC_REF(modify)), 20 SECONDS * GET_MUTATION_SYNCHRONIZER(src), TIMER_UNIQUE|TIMER_OVERRIDE) //We're out for 20 seconds (reduced by sychronizer)
	return COMPONENT_BLOCK_LIGHT_EATER
=======
>>>>>>> tg-pr-88929

/datum/mutation/glow/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return
<<<<<<< HEAD
	UnregisterSignal(glow, COMSIG_LIGHT_EATER_ACT)
	QDEL_NULL(glow)
=======
	QDEL_NULL(glow)

/// Returns a color for the glow effect
/datum/mutation/human/glow/proc/get_glow_color()
	return pick(COLOR_RED, COLOR_BLUE, COLOR_YELLOW, COLOR_GREEN, COLOR_PURPLE, COLOR_ORANGE)
>>>>>>> tg-pr-88929

/// Returns a color for the glow effect
/datum/mutation/glow/proc/get_glow_color()
	return pick(COLOR_RED, COLOR_BLUE, COLOR_YELLOW, COLOR_GREEN, COLOR_PURPLE, COLOR_ORANGE)

/datum/mutation/glow/anti
	name = "Anti-Glow"
	desc = "Your skin seems to attract and absorb nearby light creating 'darkness' around you."
<<<<<<< HEAD
	text_gain_indication = "<span class='notice'>The light around you seems to disappear.</span>"
	glow_power = -1.5
	conflicts = list(/datum/mutation/glow)
=======
	text_gain_indication = span_notice("The light around you seems to disappear.")
	conflicts = list(/datum/mutation/human/glow)
	instability = POSITIVE_INSTABILITY_MINOR
>>>>>>> tg-pr-88929
	locked = TRUE
	glow_power = -1.5

<<<<<<< HEAD
/datum/mutation/glow/anti/get_glow_color()
=======
/datum/mutation/human/glow/anti/get_glow_color()
>>>>>>> tg-pr-88929
	return COLOR_BLACK

/datum/mutation/strong
	name = "Strength"
	desc = "The user's muscles slightly expand. Commonly seen in top-ranking boxers."
	quality = POSITIVE
	text_gain_indication = span_notice("You feel strong.")
	instability = POSITIVE_INSTABILITY_MINI
	difficulty = 16

<<<<<<< HEAD
/datum/mutation/stimmed
=======
/datum/mutation/human/strong/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return
	ADD_TRAIT(owner, TRAIT_STRENGTH, GENETIC_MUTATION)

/datum/mutation/human/strong/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return
	REMOVE_TRAIT(owner, TRAIT_STRENGTH, GENETIC_MUTATION)


/datum/mutation/human/stimmed
>>>>>>> tg-pr-88929
	name = "Stimmed"
	desc = "The user's chemical balance is more robust. This mutation is known to slightly improve workout efficiency."
	quality = POSITIVE
	instability = POSITIVE_INSTABILITY_MINI
	text_gain_indication = span_notice("You feel stimmed.")
	difficulty = 16

<<<<<<< HEAD
/datum/mutation/insulated
=======
/datum/mutation/human/stimmed/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return
	ADD_TRAIT(owner, TRAIT_STIMMED, GENETIC_MUTATION)

/datum/mutation/human/stimmed/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return
	REMOVE_TRAIT(owner, TRAIT_STIMMED, GENETIC_MUTATION)

/datum/mutation/human/insulated
>>>>>>> tg-pr-88929
	name = "Insulated"
	desc = "The affected person does not conduct electricity."
	quality = POSITIVE
	text_gain_indication = span_notice("Your fingertips go numb.")
	text_lose_indication = span_notice("Your fingertips regain feeling.")
	difficulty = 16
	instability = POSITIVE_INSTABILITY_MODERATE

/datum/mutation/insulated/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return
	ADD_TRAIT(owner, TRAIT_SHOCKIMMUNE, GENETIC_MUTATION)

/datum/mutation/insulated/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	REMOVE_TRAIT(owner, TRAIT_SHOCKIMMUNE, GENETIC_MUTATION)

/datum/mutation/fire
	name = "Fiery Sweat"
	desc = "The user's skin will randomly combust, but is generally a lot more resilient to burning."
	quality = NEGATIVE
	text_gain_indication = span_warning("You feel hot.")
	text_lose_indication = span_notice("You feel a lot cooler.")
	conflicts = list(/datum/mutation/human/adaptation/heat)
	difficulty = 14
	synchronizer_coeff = 1
	power_coeff = 1
	energy_coeff = 1 // MONKESTATION ADDITION -- Energizer increases how often fiery sweat happens

/datum/mutation/fire/on_life(seconds_per_tick, times_fired)
//	if(SPT_PROB((0.05+(100-dna.stability)/19.5) * GET_MUTATION_SYNCHRONIZER(src), seconds_per_tick)) // MONKESTATION EDIT OLD
	if(SPT_PROB((0.05+(100-dna.stability)/19.5) * GET_MUTATION_SYNCHRONIZER(src) / GET_MUTATION_ENERGY(src), seconds_per_tick)) // MONKESTATION EDIT NEW
		owner.adjust_fire_stacks(2 * GET_MUTATION_POWER(src))
		owner.ignite_mob()

/datum/mutation/fire/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return
	owner.physiology.burn_mod *= 0.5

/datum/mutation/fire/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	owner.physiology.burn_mod *= 2

/datum/mutation/badblink
	name = "Spatial Instability"
	desc = "The victim of the mutation has a very weak link to spatial reality, and may be displaced. Often causes extreme nausea."
	quality = NEGATIVE
	text_gain_indication = span_warning("The space around you twists sickeningly.")
	text_lose_indication = span_notice("The space around you settles back to normal.")
	difficulty = 18//high so it's hard to unlock and abuse
	instability = NEGATIVE_STABILITY_MODERATE
	synchronizer_coeff = 1
	energy_coeff = 1
	power_coeff = 1
	var/warpchance = 0

/datum/mutation/badblink/on_life(seconds_per_tick, times_fired)
	if(SPT_PROB(warpchance, seconds_per_tick))
		var/warpmessage = pick(
		span_warning("With a sickening 720-degree twist of [owner.p_their()] back, [owner] vanishes into thin air."),
		span_warning("[owner] does some sort of strange backflip into another dimension. It looks pretty painful."),
		span_warning("[owner] does a jump to the left, a step to the right, and warps out of reality."),
		span_warning("[owner]'s torso starts folding inside out until it vanishes from reality, taking [owner] with it."),
		span_warning("One moment, you see [owner]. The next, [owner] is gone."))
		owner.visible_message(warpmessage, span_userdanger("You feel a wave of nausea as you fall through reality!"))
		var/warpdistance = rand(10, 15) * GET_MUTATION_POWER(src)
		do_teleport(owner, get_turf(owner), warpdistance, channel = TELEPORT_CHANNEL_FREE)
		owner.adjust_disgust(GET_MUTATION_SYNCHRONIZER(src) * (warpchance * warpdistance))
		warpchance = 0
		owner.visible_message(span_danger("[owner] appears out of nowhere!"))
	else
		warpchance += 0.0625 * seconds_per_tick / GET_MUTATION_ENERGY(src)

/datum/mutation/acidflesh
	name = "Acidic Flesh"
	desc = "Subject has acidic chemicals building up underneath the skin. This is often lethal."
	instability = NEGATIVE_STABILITY_MAJOR
	quality = NEGATIVE
	text_gain_indication = span_userdanger("A horrible burning sensation envelops you as your flesh turns to acid!")
	text_lose_indication = span_notice("A feeling of relief fills you as your flesh goes back to normal.")
	difficulty = 18//high so it's hard to unlock and use on others
	/// The cooldown for the warning message
	COOLDOWN_DECLARE(msgcooldown)

/* MONKESTATION REMOVAL -- Moved to the monkestation folder
/datum/mutation/acidflesh/on_life(seconds_per_tick, times_fired)
	if(SPT_PROB(13, seconds_per_tick))
		if(COOLDOWN_FINISHED(src, msgcooldown))
			to_chat(owner, span_danger("Your acid flesh bubbles..."))
			COOLDOWN_START(src, msgcooldown, 20 SECONDS)
		if(prob(15))
			owner.acid_act(rand(30, 50), 10)
			owner.visible_message(span_warning("[owner]'s skin bubbles and pops."), span_userdanger("Your bubbling flesh pops! It burns!"))
<<<<<<< HEAD
			playsound(owner,'sound/weapons/sear.ogg', 50, TRUE)
*/

/datum/mutation/gigantism
	name = "Gigantism"
	desc = "The cells within the subject spread out to cover more area, making the subject appear larger."
	quality = MINOR_NEGATIVE
	difficulty = 12
	conflicts = list(/datum/mutation/dwarfism)

/datum/mutation/gigantism/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return
	ADD_TRAIT(owner, TRAIT_GIANT, GENETIC_MUTATION)
/* handled in init_signals.dm
	owner.update_transform(1.25)
	owner.visible_message(span_danger("[owner] suddenly grows!"), span_notice("Everything around you seems to shrink.."))
*/

/datum/mutation/gigantism/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	REMOVE_TRAIT(owner, TRAIT_GIANT, GENETIC_MUTATION)
/* handled in init_signals.dm
	owner.update_transform(0.8)
	owner.visible_message(span_danger("[owner] suddenly shrinks!"), span_notice("Everything around you seems to grow.."))
*/
=======
			playsound(owner,'sound/items/weapons/sear.ogg', 50, TRUE)
>>>>>>> tg-pr-88929

/datum/mutation/spastic
	name = "Spastic"
	desc = "Subject suffers from muscle spasms."
	instability = NEGATIVE_STABILITY_MODERATE
	quality = NEGATIVE
	text_gain_indication = span_warning("You flinch.")
	text_lose_indication = span_notice("Your flinching subsides.")
	difficulty = 16

/datum/mutation/spastic/on_acquiring()
	. = ..()
	if(!.)
		return
	owner.apply_status_effect(/datum/status_effect/spasms)

/datum/mutation/spastic/on_losing()
	if(..())
		return
	owner.remove_status_effect(/datum/status_effect/spasms)

/datum/mutation/extrastun
	name = "Two Left Feet"
	desc = "A mutation that replaces the right foot with another left foot. Symptoms include kissing the floor when taking a step."
	instability = NEGATIVE_STABILITY_MODERATE
	quality = NEGATIVE
	text_gain_indication = span_warning("Your right foot feels... left.")
	text_lose_indication = span_notice("Your right foot feels alright.")
	difficulty = 16

/datum/mutation/extrastun/on_acquiring()
	. = ..()
	if(!.)
		return
	RegisterSignal(owner, COMSIG_MOVABLE_MOVED, PROC_REF(on_move))

/datum/mutation/extrastun/on_losing()
	. = ..()
	if(.)
		return
	UnregisterSignal(owner, COMSIG_MOVABLE_MOVED)

/* MONKESTATION REMOVAL -- Moved to the monkestation folder
///Triggers on moved(). Randomly makes the owner trip
/datum/mutation/extrastun/proc/on_move()
	SIGNAL_HANDLER

	if(prob(99.5)) //The brawl mutation
		return
	if(owner.buckled || owner.body_position == LYING_DOWN || HAS_TRAIT(owner, TRAIT_IMMOBILIZED) || owner.throwing || owner.movement_type & (VENTCRAWLING | FLYING | FLOATING))
		return //remove the 'edge' cases
	to_chat(owner, span_danger("You trip over your own feet."))
	owner.Knockdown(30)
*/

/datum/mutation/martyrdom
	name = "Internal Martyrdom"
	desc = "A mutation that makes the body destruct when near death. Not damaging, but very, VERY disorienting."
	instability = NEGATIVE_STABILITY_MAJOR // free stability >:)
	locked = TRUE
	quality = POSITIVE //not that cloning will be an option a lot but generally lets keep this around i guess?
<<<<<<< HEAD
	text_gain_indication = "<span class='warning'>You get an intense feeling of heartburn.</span>"
	text_lose_indication = "<span class='notice'>Your internal organs feel at ease.</span>"
	synchronizer_coeff = 1 // MONKESTATION ADDITION
	power_coeff = 1 // MONKESTATION ADDITION
=======
	text_gain_indication = span_warning("You get an intense feeling of heartburn.")
	text_lose_indication = span_notice("Your internal organs feel at ease.")
>>>>>>> tg-pr-88929

/datum/mutation/martyrdom/on_acquiring()
	. = ..()
	if(!.)
		return
	RegisterSignal(owner, COMSIG_MOB_STATCHANGE, PROC_REF(bloody_shower))

/datum/mutation/martyrdom/on_losing()
	. = ..()
	if(.)
		return TRUE
	UnregisterSignal(owner, COMSIG_MOB_STATCHANGE)

/datum/mutation/martyrdom/proc/bloody_shower(datum/source, new_stat)
	SIGNAL_HANDLER

	if(new_stat != HARD_CRIT)
		return
	var/list/organs = owner.get_organs_for_zone(BODY_ZONE_HEAD, TRUE)

	for(var/obj/item/organ/I in organs)
		qdel(I)

//	explosion(owner, light_impact_range = 2, adminlog = TRUE, explosion_cause = src) // MONKESTATION EDIT OLD
	explosion(owner, light_impact_range = 2 * GET_MUTATION_POWER(src), adminlog = TRUE, explosion_cause = src) // MONKESTATION EDIT NEW
	for(var/mob/living/carbon/human/splashed in view(2, owner))
		var/obj/item/organ/eyes/eyes = splashed.get_organ_slot(ORGAN_SLOT_EYES)
		if(eyes)
			to_chat(splashed, span_userdanger("You are blinded by a shower of blood!"))
			eyes.apply_organ_damage(5)
		else
			to_chat(splashed, span_userdanger("You are knocked down by a wave of... blood?!"))
		splashed.Stun(2 SECONDS)
		splashed.set_eye_blur_if_lower(40 SECONDS)
		splashed.adjust_confusion(3 SECONDS)
	for(var/mob/living/silicon/borgo in view(2, owner))
		to_chat(borgo, span_userdanger("Your sensors are disabled by a shower of blood!"))
		borgo.Paralyze(6 SECONDS)
	// MONKESTATION ADDITION START
	// If we are synchronized, we instead of gibbing drop all our blood on the floor and remove the mutation
	if(GET_MUTATION_SYNCHRONIZER(src) < 1)
		owner.investigate_log("had their brain deleted by the martyrdom mutation.", INVESTIGATE_DEATHS)
		var/turf/blood_turf = get_turf(owner)

		var/blood_amount = min(owner.blood_volume, initial(owner.blood_volume) * 5)
		var/datum/blood_type/blood = owner.get_blood_type()

		blood_turf.add_liquid(blood.reagent_type, blood_amount)
		owner.blood_volume = 0
		dna.remove_mutation(src, sources)
		return
	// MONKESTATION ADDITION END
	owner.investigate_log("has been gibbed by the martyrdom mutation.", INVESTIGATE_DEATHS)
	owner.gib(DROP_ALL_REMAINS)

/datum/mutation/headless
	name = "H.A.R.S."
	desc = "A mutation that makes the body reject the head, the brain receding into the chest. Stands for Head Allergic Rejection Syndrome. Warning: Removing this mutation is very dangerous, though it will regenerate non-vital head organs."
	instability = NEGATIVE_STABILITY_MAJOR
	difficulty = 12 //pretty good for traitors
	quality = NEGATIVE //holy shit no eyes or tongue or ears
	text_gain_indication = span_warning("Something feels off.")

/datum/mutation/headless/on_acquiring()
	. = ..()
<<<<<<< HEAD
	if(!.)
		return

	var/obj/item/organ/internal/brain/brain = owner.get_organ_slot(ORGAN_SLOT_BRAIN)
=======
	if(.)//cant add
		return TRUE

	var/obj/item/organ/brain/brain = owner.get_organ_slot(ORGAN_SLOT_BRAIN)
>>>>>>> tg-pr-88929
	if(brain)
		brain.Remove(owner, special = TRUE, movement_flags = NO_ID_TRANSFER)
		brain.zone = BODY_ZONE_CHEST
		brain.Insert(owner, special = TRUE, movement_flags = NO_ID_TRANSFER)

	var/obj/item/bodypart/head/head = owner.get_bodypart(BODY_ZONE_HEAD)
	if(head)
		owner.visible_message(span_warning("[owner]'s head splatters with a sickening crunch!"), ignored_mobs = list(owner))
		new /obj/effect/gibspawner/generic(get_turf(owner), owner)
<<<<<<< HEAD
		head.dismember(dam_type = BRUTE, silent = TRUE)
=======
>>>>>>> tg-pr-88929
		head.drop_organs()
		head.dismember(dam_type = BRUTE, silent = TRUE)
		qdel(head)
	RegisterSignal(owner, COMSIG_ATTEMPT_CARBON_ATTACH_LIMB, PROC_REF(abort_attachment))

/datum/mutation/headless/on_losing()
	. = ..()
	if(.)
		return TRUE
<<<<<<< HEAD
	var/obj/item/organ/internal/brain/brain = owner.get_organ_slot(ORGAN_SLOT_BRAIN)
	if(brain) //so this doesn't instantly kill you. we could delete the brain, but it lets people cure brain issues they /really/ shouldn't be
		brain.zone = initial(brain.zone)
=======

>>>>>>> tg-pr-88929
	UnregisterSignal(owner, COMSIG_ATTEMPT_CARBON_ATTACH_LIMB)
	var/successful = owner.regenerate_limb(BODY_ZONE_HEAD)
	if(!successful)
		stack_trace("HARS mutation head regeneration failed! (usually caused by headless syndrome having a head)")
		return TRUE
	var/obj/item/organ/brain/brain = owner.get_organ_slot(ORGAN_SLOT_BRAIN)
	if(brain)
		brain.Remove(owner, special = TRUE, movement_flags = NO_ID_TRANSFER)
		brain.zone = initial(brain.zone)
		brain.Insert(owner, special = TRUE, movement_flags = NO_ID_TRANSFER)

	owner.dna.species.regenerate_organs(owner, replace_current = FALSE, excluded_zones = list(BODY_ZONE_CHEST)) //replace_current needs to be FALSE to prevent weird adding and removing mutation healing
	owner.apply_damage(damage = 50, damagetype = BRUTE, def_zone = BODY_ZONE_HEAD) //and this to DISCOURAGE organ farming, or at least not make it free.
	owner.visible_message(span_warning("[owner]'s head returns with a sickening crunch!"), span_warning("Your head regrows with a sickening crack! Ouch."))
	new /obj/effect/gibspawner/generic(get_turf(owner), owner)

<<<<<<< HEAD

/datum/mutation/headless/proc/abort_attachment(datum/source, obj/item/bodypart/new_limb, special) //you aren't getting your head back
=======
/datum/mutation/human/headless/proc/abort_attachment(datum/source, obj/item/bodypart/new_limb, special) //you aren't getting your head back
>>>>>>> tg-pr-88929
	SIGNAL_HANDLER

	if(istype(new_limb, /obj/item/bodypart/head))
		return COMPONENT_NO_ATTACH

// Soft crit is disabed
/datum/mutation/inexorable
	name = "Inexorable"
	desc = "Your body can push on beyond the limits of normal human endurance. \
		However, pushing it too far can cause severe damage to your body."
	quality = POSITIVE
	// instability = POSITIVE_INSTABILITY_MODERATE // AWAITING TG#83439
	instability = 25
	text_gain_indication = span_notice("You feel inexorable.")
	text_lose_indication = span_notice("You suddenly feel more human.")
	difficulty = 24
	synchronizer_coeff = 1
	// mutation_traits = list(TRAIT_NOSOFTCRIT, TRAIT_ANALGESIA, TRAIT_NO_PAIN_EFFECTS) // AWAITING TG#83439

/datum/mutation/inexorable/on_acquiring(mob/living/carbon/human/acquirer)
	. = ..()
	if(!.)
		return
	acquirer.add_traits(list(TRAIT_NOSOFTCRIT, TRAIT_ANALGESIA, TRAIT_NO_PAIN_EFFECTS), GENETIC_MUTATION)
	RegisterSignal(acquirer, COMSIG_LIVING_HEALTH_UPDATE, PROC_REF(check_health))
	check_health()

/datum/mutation/inexorable/on_losing(mob/living/carbon/human/owner)
	. = ..()
	if(.)
		return
	UnregisterSignal(owner, COMSIG_LIVING_HEALTH_UPDATE)
	owner.remove_traits(list(TRAIT_NOSOFTCRIT, TRAIT_ANALGESIA, TRAIT_NO_PAIN_EFFECTS), GENETIC_MUTATION)
	REMOVE_TRAIT(owner, TRAIT_SOFTSPOKEN, REF(src))

/datum/mutation/inexorable/proc/check_health(...)
	SIGNAL_HANDLER
	if(owner.health > owner.crit_threshold || owner.stat != CONSCIOUS)
		REMOVE_TRAIT(owner, TRAIT_SOFTSPOKEN, REF(src))
	else
		ADD_TRAIT(owner, TRAIT_SOFTSPOKEN, REF(src))

/datum/mutation/inexorable/on_life(seconds_per_tick, times_fired)
	if(owner.health > owner.crit_threshold || owner.stat != CONSCIOUS || HAS_TRAIT(owner, TRAIT_STASIS))
		return
	var/multiplier = GET_MUTATION_SYNCHRONIZER(src)
	if(HAS_TRAIT(owner, TRAIT_NOCRITDAMAGE))
		multiplier *= 0.5
	// Gives you 30 seconds of being in soft crit... give or take
	if(HAS_TRAIT(owner, TRAIT_TOXIMMUNE) || HAS_TRAIT(owner, TRAIT_TOXINLOVER))
		owner.adjustBruteLoss(1 * seconds_per_tick * multiplier, forced = TRUE, updating_health = FALSE)
	else
		owner.adjustToxLoss(0.5 * seconds_per_tick * multiplier, forced = TRUE, updating_health = FALSE)
		owner.adjustBruteLoss(0.5 * seconds_per_tick * multiplier, forced = TRUE, updating_health = FALSE)
	// Offsets suffocation but not entirely
	owner.adjustOxyLoss(-0.5 * seconds_per_tick, forced = TRUE)
