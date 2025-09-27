#define BLOOD_DRIP_RATE_MOD 90 //Greater number means creating blood drips more often while bleeding
<<<<<<< HEAD
#define DRUNK_POWER_TO_BLOOD_ALCOHOL 0.003 // Conversion between internal drunk power and common blood alcohol content
=======
// Conversion between internal drunk power and common blood alcohol content
#define DRUNK_POWER_TO_BLOOD_ALCOHOL 0.003
>>>>>>> tg-pr-88929

/****************************************************
				BLOOD SYSTEM
****************************************************/

// Takes care blood loss and regeneration
/mob/living/carbon/human/handle_blood(seconds_per_tick, times_fired)
<<<<<<< HEAD

	if(HAS_TRAIT(src, TRAIT_NOBLOOD) || HAS_TRAIT(src, TRAIT_FAKEDEATH))
		return

	if(bodytemperature < BLOOD_STOP_TEMP) // MONKESTATION EDIT: Made TRAIT_HUSK cascade into TRAIT_NOBLOOD, making snowflake checks unnecessary.
		return

	var/sigreturn = SEND_SIGNAL(src, COMSIG_HUMAN_ON_HANDLE_BLOOD, seconds_per_tick, times_fired)
	if(sigreturn & HANDLE_BLOOD_HANDLED)
		return
	//begin Monkestation addition
	//This is processing for spleen organ which effects blood regen
	var/mob/living/carbon/human/humantarget = src
	var/spleen_process = 0
	if(!HAS_TRAIT(src, TRAIT_SPLEENLESS_METABOLISM) && src.get_organ_slot(ORGAN_SLOT_SPLEEN) && !isnull(humantarget.dna.species.mutantspleen))
		spleen_process = 1
	if(blood_volume < BLOOD_VOLUME_OKAY)
		if(spleen_process)
			SEND_SIGNAL(src, COMSIG_SPLEEN_EMERGENCY)
	//End Monkestation addition

	if(!(sigreturn & HANDLE_BLOOD_NO_NUTRITION_DRAIN))
		if(blood_volume < BLOOD_VOLUME_NORMAL && !HAS_TRAIT(src, TRAIT_NOHUNGER))
			var/nutrition_ratio = 0
			switch(nutrition)
				if(0 to NUTRITION_LEVEL_STARVING)
					nutrition_ratio = 0.2
				if(NUTRITION_LEVEL_STARVING to NUTRITION_LEVEL_HUNGRY)
					nutrition_ratio = 0.4
				if(NUTRITION_LEVEL_HUNGRY to NUTRITION_LEVEL_FED)
					nutrition_ratio = 0.6
				if(NUTRITION_LEVEL_FED to NUTRITION_LEVEL_WELL_FED)
					nutrition_ratio = 0.8
				else
					nutrition_ratio = 1
			if(satiety > 80)
				nutrition_ratio *= 1.25
			adjust_nutrition(-nutrition_ratio * HUNGER_FACTOR * seconds_per_tick)
			if(spleen_process) //monkestation addition for spleens
				SEND_SIGNAL(src, COMSIG_SPLEEN_MULT_BLOODGEN, humantarget, blood_volume, nutrition_ratio, seconds_per_tick) //does blood generation process in spleen instead of below in else
			else
				blood_volume = min(blood_volume + (BLOOD_REGEN_FACTOR * nutrition_ratio * seconds_per_tick), BLOOD_VOLUME_NORMAL)

	// // we call lose_blood() here rather than quirk/process() to make sure that the blood loss happens in sync with life()
	// if(HAS_TRAIT(src, TRAIT_BLOOD_DEFICIENCY))
	// 	var/datum/quirk/blooddeficiency/blooddeficiency = get_quirk(/datum/quirk/blooddeficiency)
	// 	if(!isnull(blooddeficiency))
	// 		blooddeficiency.lose_blood(seconds_per_tick)

	//Effects of bloodloss
	if(!(sigreturn & HANDLE_BLOOD_NO_EFFECTS))
		var/word = pick("dizzy","woozy","faint")
		switch(blood_volume)
			if(BLOOD_VOLUME_MAX_LETHAL to INFINITY)
				if(SPT_PROB(7.5, seconds_per_tick))
					to_chat(src, span_userdanger("Blood starts to tear your skin apart. You're going to burst!"))
					investigate_log("has been gibbed by having too much blood.", INVESTIGATE_DEATHS)
					inflate_gib()
			if(BLOOD_VOLUME_EXCESS to BLOOD_VOLUME_MAX_LETHAL)
				if(SPT_PROB(5, seconds_per_tick))
					to_chat(src, span_warning("You feel your skin swelling."))
			if(BLOOD_VOLUME_MAXIMUM to BLOOD_VOLUME_EXCESS)
				if(SPT_PROB(5, seconds_per_tick))
					to_chat(src, span_warning("You feel terribly bloated."))
			if(BLOOD_VOLUME_OKAY to BLOOD_VOLUME_SAFE)
				if(SPT_PROB(2.5, seconds_per_tick))
					to_chat(src, span_warning("You feel [word]."))
				adjustOxyLoss(round(0.005 * (BLOOD_VOLUME_NORMAL - blood_volume) * seconds_per_tick, 1))
			if(BLOOD_VOLUME_BAD to BLOOD_VOLUME_OKAY)
				adjustOxyLoss(round(0.01 * (BLOOD_VOLUME_NORMAL - blood_volume) * seconds_per_tick, 1))
				if(SPT_PROB(2.5, seconds_per_tick))
					set_eye_blur_if_lower(12 SECONDS)
					to_chat(src, span_warning("You feel very [word]."))
			if(BLOOD_VOLUME_SURVIVE to BLOOD_VOLUME_BAD)
				adjustOxyLoss(2.5 * seconds_per_tick)
				if(SPT_PROB(7.5, seconds_per_tick))
					Unconscious(rand(20,60))
					to_chat(src, span_warning("You feel extremely [word]."))
			if(-INFINITY to BLOOD_VOLUME_SURVIVE)
				if(!HAS_TRAIT(src, TRAIT_NODEATH))
					investigate_log("has died of bloodloss.", INVESTIGATE_DEATHS)
					death()
=======
	// Under these circumstances blood handling is not necessary
	if(bodytemperature < BLOOD_STOP_TEMP || HAS_TRAIT(src, TRAIT_FAKEDEATH) || HAS_TRAIT(src, TRAIT_HUSK))
		return
	// Run the signal, still allowing mobs with noblood to "handle blood" in their own way
	var/sigreturn = SEND_SIGNAL(src, COMSIG_HUMAN_ON_HANDLE_BLOOD, seconds_per_tick, times_fired)
	if((sigreturn & HANDLE_BLOOD_HANDLED) || HAS_TRAIT(src, TRAIT_NOBLOOD))
		return

	//Blood regeneration if there is some space
	if(!(sigreturn & HANDLE_BLOOD_NO_NUTRITION_DRAIN))
		if(blood_volume < BLOOD_VOLUME_NORMAL && !HAS_TRAIT(src, TRAIT_NOHUNGER))
			var/nutrition_ratio = round(nutrition / NUTRITION_LEVEL_WELL_FED, 0.2)
			if(satiety > 80)
				nutrition_ratio *= 1.25
			adjust_nutrition(-nutrition_ratio * HUNGER_FACTOR * seconds_per_tick)
			blood_volume = min(blood_volume + (BLOOD_REGEN_FACTOR * nutrition_ratio * seconds_per_tick), BLOOD_VOLUME_NORMAL)
>>>>>>> tg-pr-88929

	//Bloodloss from wounds
	var/temp_bleed = 0
	for(var/obj/item/bodypart/iter_part as anything in bodyparts)
		temp_bleed += iter_part.cached_bleed_rate * seconds_per_tick

		if(iter_part.generic_bleedstacks) // If you don't have any bleedstacks, don't try and heal them
			iter_part.adjustBleedStacks(-1, 0)

	if(temp_bleed)
		bleed(temp_bleed)
		bleed_warn(temp_bleed)

	//Effects of bloodloss
	if(sigreturn & HANDLE_BLOOD_NO_OXYLOSS)
		return

	// Some effects are halved mid-combat.
	var/determined_mod = has_status_effect(/datum/status_effect/determined) ? 0.5 : 0

	var/word = pick("dizzy","woozy","faint")
	switch(blood_volume)
		if(BLOOD_VOLUME_EXCESS to BLOOD_VOLUME_MAX_LETHAL)
			if(SPT_PROB(7.5, seconds_per_tick))
				to_chat(src, span_userdanger("Blood starts to tear your skin apart. You're going to burst!"))
				investigate_log("has been gibbed by having too much blood.", INVESTIGATE_DEATHS)
				inflate_gib()
		// Way too much blood!
		if(BLOOD_VOLUME_EXCESS to BLOOD_VOLUME_MAX_LETHAL)
			if(SPT_PROB(5, seconds_per_tick))
				to_chat(src, span_warning("You feel your skin swelling."))
		// Too much blood
		if(BLOOD_VOLUME_MAXIMUM to BLOOD_VOLUME_EXCESS)
			if(SPT_PROB(5, seconds_per_tick))
				to_chat(src, span_warning("You feel terribly bloated."))
		// Low blood but not a big deal in the immediate
		if(BLOOD_VOLUME_OKAY to BLOOD_VOLUME_SAFE)
			if(SPT_PROB(2.5, seconds_per_tick))
				set_eye_blur_if_lower(2 SECONDS * determined_mod)
				if(prob(50))
					to_chat(src, span_danger("You feel [word]. It's getting a bit hard to breathe."))
					losebreath += 0.5 * determined_mod * seconds_per_tick
				else if(getStaminaLoss() < 25 * determined_mod)
					to_chat(src, span_danger("You feel [word]. It's getting a bit hard to focus."))
					adjustStaminaLoss(10 * determined_mod * REM * seconds_per_tick)
		// Pretty low blood, getting dangerous!
		if(BLOOD_VOLUME_RISKY to BLOOD_VOLUME_OKAY)
			if(SPT_PROB(5, seconds_per_tick))
				set_eye_blur_if_lower(2 SECONDS * determined_mod)
				set_dizzy_if_lower(2 SECONDS * determined_mod)
				if(prob(50))
					to_chat(src, span_bolddanger("You feel very [word]. It's getting hard to breathe!"))
					losebreath += 1 * determined_mod * seconds_per_tick
				else if(getStaminaLoss() < 40 * determined_mod)
					to_chat(src, span_bolddanger("You feel very [word]. It's getting hard to stay awake!"))
					adjustStaminaLoss(15 * determined_mod * REM * seconds_per_tick)
		// Very low blood, danger!!
		if(BLOOD_VOLUME_BAD to BLOOD_VOLUME_RISKY)
			if(SPT_PROB(5, seconds_per_tick))
				set_eye_blur_if_lower(4 SECONDS * determined_mod)
				set_dizzy_if_lower(4 SECONDS * determined_mod)
				if(prob(50))
					to_chat(src, span_userdanger("You feel extremely [word]! It's getting very hard to breathe!"))
					losebreath += 1.5 * determined_mod * seconds_per_tick
				else if(getStaminaLoss() < 80 * determined_mod)
					to_chat(src, span_userdanger("You feel extremely [word]! It's getting very hard to stay awake!"))
					adjustStaminaLoss(20 * determined_mod * REM * seconds_per_tick)
		// Critically low blood, death is near! Adrenaline won't help you here.
		if(BLOOD_VOLUME_SURVIVE to BLOOD_VOLUME_BAD)
			if(SPT_PROB(7.5, seconds_per_tick))
				Unconscious(rand(1 SECONDS, 2 SECONDS))
				to_chat(src, span_userdanger("You black out for a moment!"))
		// Instantly die upon this threshold
		if(-INFINITY to BLOOD_VOLUME_SURVIVE)
			if(!HAS_TRAIT(src, TRAIT_NODEATH))
				investigate_log("has died of bloodloss.", INVESTIGATE_DEATHS)
				death()

	// Blood ratio! if you have 280 blood, this equals 0.5 as that's half of the current value, 560.
	var/effective_blood_ratio = blood_volume / BLOOD_VOLUME_NORMAL
	var/target_oxyloss = max((1 - effective_blood_ratio) * 100, 0)

	// If your ratio is less than one (you're missing any blood) and your oxyloss is under missing blood %, start getting oxy damage.
	// This damage accrues faster the less blood you have.
	// If the damage surpasses the KO threshold for oxyloss, then we'll always tick up so you die eventually
	if(target_oxyloss > 0 && (getOxyLoss() < target_oxyloss || (target_oxyloss >= OXYLOSS_PASSOUT_THRESHOLD && stat >= UNCONSCIOUS)))
		// At roughly half blood this equals to 3 oxyloss per tick. At 90% blood it's close to 0.5
		var/rounded_oxyloss = round(0.01 * (BLOOD_VOLUME_NORMAL - blood_volume), 0.25) * seconds_per_tick
		adjustOxyLoss(rounded_oxyloss, updating_health = TRUE)

/// Has each bodypart update its bleed/wound overlay icon states
/mob/living/carbon/proc/update_bodypart_bleed_overlays()
	for(var/obj/item/bodypart/iter_part as anything in bodyparts)
		iter_part.update_part_wound_overlay()

//Makes a blood drop, leaking amt units of blood from the mob
<<<<<<< HEAD
/mob/living/carbon/proc/bleed(amt, no_visual = FALSE)
	if(HAS_TRAIT(src, TRAIT_GODMODE) || HAS_TRAIT(src, TRAIT_NOBLOOD))
=======
/mob/living/carbon/proc/bleed(amt)
	if(!blood_volume || HAS_TRAIT(src, TRAIT_GODMODE))
>>>>>>> tg-pr-88929
		return
	blood_volume = max(blood_volume - amt, 0)

	//Blood loss still happens in locker, floor stays clean
<<<<<<< HEAD
	if(!no_visual && isturf(loc) && prob(sqrt(amt) * 80))
		add_splatter_floor(loc, small_drip = (amt < 10))
=======
	if(isturf(loc) && prob(sqrt(amt)*BLOOD_DRIP_RATE_MOD))
		add_splatter_floor(loc, (amt <= 10))
>>>>>>> tg-pr-88929

/mob/living/carbon/human/bleed(amt, no_visual = FALSE)
	amt *= physiology.bleed_mod
	return ..()

/// A helper to see how much blood we're losing per tick
/mob/living/carbon/proc/get_bleed_rate()
	if(HAS_TRAIT(src, TRAIT_NOBLOOD))
		return 0
	var/bleed_amt = 0
	for(var/X in bodyparts)
		var/obj/item/bodypart/iter_bodypart = X
		bleed_amt += iter_bodypart.cached_bleed_rate
	return bleed_amt

/mob/living/carbon/human/get_bleed_rate()
	. = ..()
	. *= physiology.bleed_mod

/**
 * bleed_warn() is used to for carbons with an active client to occasionally receive messages warning them about their bleeding status (if applicable)
 *
 * Arguments:
 * * bleed_amt- When we run this from [/mob/living/carbon/human/proc/handle_blood] we already know how much blood we're losing this tick, so we can skip tallying it again with this
 * * forced-
 */
/mob/living/carbon/proc/bleed_warn(bleed_amt = 0, forced = FALSE)
	if(!client || HAS_TRAIT(src, TRAIT_NOBLOOD) || HAS_TRAIT(src, TRAIT_NO_BLEED_WARN))
		return
	if(!COOLDOWN_FINISHED(src, bleeding_message_cd) && !forced)
		return

	if(!bleed_amt) // if we weren't provided the amount of blood we lost this tick in the args
		bleed_amt = get_bleed_rate()

	var/bleeding_severity = ""
	var/next_cooldown = BLEEDING_MESSAGE_BASE_CD

	switch(bleed_amt)
		if(-INFINITY to 0)
			return
		if(0 to 1)
			bleeding_severity = "You feel light trickles of blood across your skin"
			next_cooldown *= 2.5
		if(1 to 3)
			bleeding_severity = "You feel a small stream of blood running across your body"
			next_cooldown *= 2
		if(3 to 5)
			bleeding_severity = "You skin feels clammy from the flow of blood leaving your body"
			next_cooldown *= 1.7
		if(5 to 7)
			bleeding_severity = "Your body grows more and more numb as blood streams out"
			next_cooldown *= 1.5
		if(7 to INFINITY)
			bleeding_severity = "Your heartbeat thrashes wildly trying to keep up with your bloodloss"

	var/rate_of_change = ", but it's getting better." // if there's no wounds actively getting bloodier or maintaining the same flow, we must be getting better!
	if(HAS_TRAIT(src, TRAIT_COAGULATING)) // if we have coagulant, we're getting better quick
		rate_of_change = ", but it's clotting up quickly!"
	else
		// flick through our wounds to see if there are any bleeding ones getting worse or holding flow (maybe move this to handle_blood and cache it so we don't need to cycle through the wounds so much)
		for(var/i in all_wounds)
			var/datum/wound/iter_wound = i
			if(!iter_wound.blood_flow)
				continue
			var/iter_wound_roc = iter_wound.get_bleed_rate_of_change()
			switch(iter_wound_roc)
				if(BLOOD_FLOW_INCREASING) // assume the worst, if one wound is getting bloodier, we focus on that
					rate_of_change = ", <b>and it's getting worse!</b>"
					break
				if(BLOOD_FLOW_STEADY) // our best case now is that our bleeding isn't getting worse
					rate_of_change = ", and it's holding steady."
				if(BLOOD_FLOW_DECREASING) // this only matters if none of the wounds fit the above two cases, included here for completeness
					continue

	to_chat(src, span_warning("[bleeding_severity][rate_of_change]"))
	COOLDOWN_START(src, bleeding_message_cd, next_cooldown)

/mob/living/proc/restore_blood()
	blood_volume = initial(blood_volume)

/mob/living/carbon/restore_blood()
	blood_volume = BLOOD_VOLUME_NORMAL
	for(var/i in bodyparts)
		var/obj/item/bodypart/BP = i
		BP.setBleedStacks(0)

/****************************************************
				BLOOD TRANSFERS
****************************************************/

//Gets blood from mob to a container or other mob, preserving all data in it.
<<<<<<< HEAD
/mob/living/proc/transfer_blood_to(atom/movable/AM, amount, forced)
	var/datum/blood_type/blood = get_blood_type()
	if(isnull(blood) || !AM.reagents)
=======
/mob/living/proc/transfer_blood_to(atom/movable/AM, amount, forced, ignore_incompatibility)
	if(!blood_volume || !AM.reagents)
>>>>>>> tg-pr-88929
		return FALSE
	if(blood_volume < BLOOD_VOLUME_BAD && !forced)
		return FALSE

	if(blood_volume < amount)
		amount = blood_volume

	blood_volume -= amount

<<<<<<< HEAD
	AM.reagents.add_reagent(blood.reagent_type, amount, blood.get_blood_data(src), bodytemperature)
=======
	var/list/blood_data = get_blood_data(blood_id)

	if(iscarbon(AM))
		var/mob/living/carbon/C = AM
		if(blood_id == C.get_blood_id())//both mobs have the same blood substance
			if(blood_id == /datum/reagent/blood) //normal blood
				if(blood_data["viruses"])
					for(var/thing in blood_data["viruses"])
						var/datum/disease/D = thing
						if((D.spread_flags & DISEASE_SPREAD_SPECIAL) || (D.spread_flags & DISEASE_SPREAD_NON_CONTAGIOUS))
							continue
						C.ForceContractDisease(D)
				if(!(blood_data["blood_type"] in get_safe_blood(C.dna.blood_type)) && !(ignore_incompatibility))
					C.reagents.add_reagent(/datum/reagent/toxin, amount * 0.5)
					return TRUE

			C.blood_volume = min(C.blood_volume + round(amount, 0.1), BLOOD_VOLUME_MAX_LETHAL)
			return TRUE

	AM.reagents.add_reagent(blood_id, amount, blood_data, bodytemperature)
>>>>>>> tg-pr-88929
	return TRUE

/*
/mob/living/proc/get_blood_data(blood_id)
	return

/mob/living/carbon/get_blood_data(blood_id)
	var/blood_data = list()
	//set the blood data
	blood_data["viruses"] = list()

	for(var/thing in diseases)
		var/datum/disease/D = thing
		blood_data["viruses"] += D.Copy()

	if (immune_system)
		blood_data["immunity"] = immune_system.GetImmunity()

	blood_data["blood_DNA"] = dna.unique_enzymes
	if(LAZYLEN(disease_resistances))
		blood_data["resistances"] = disease_resistances.Copy()
	var/list/temp_chem = list()
	for(var/datum/reagent/R in reagents.reagent_list)
		temp_chem[R.type] = R.volume
	blood_data["trace_chem"] = list2params(temp_chem)
	if(mind)
		blood_data["mind"] = mind
	else if(last_mind)
		blood_data["mind"] = last_mind
	if(ckey)
		blood_data["ckey"] = ckey
	else if(last_mind)
		blood_data["ckey"] = ckey(last_mind.key)

	if(!HAS_TRAIT_FROM(src, TRAIT_SUICIDED, REF(src)))
		blood_data["cloneable"] = 1
	blood_data["blood_type"] = dna.blood_type
	blood_data["gender"] = gender
	blood_data["real_name"] = real_name
	blood_data["features"] = dna.features
	blood_data["factions"] = faction
	blood_data["quirks"] = list()
	for(var/V in quirks)
		var/datum/quirk/T = V
		blood_data["quirks"] += T.type
	return blood_data
*/

/mob/living/proc/get_blood_type()
	RETURN_TYPE(/datum/blood_type)
	if(HAS_TRAIT(src, TRAIT_NOBLOOD))
		return null
	return GLOB.blood_types[/datum/blood_type/animal]

<<<<<<< HEAD
/mob/living/silicon/get_blood_type()
	return GLOB.blood_types[/datum/blood_type/oil]
=======
/mob/living/carbon/human/get_blood_id()
	if(HAS_TRAIT(src, TRAIT_HUSK) || !dna)
		return
	if(check_holidays(APRIL_FOOLS) && is_clown_job(mind?.assigned_role))
		return /datum/reagent/colorful_reagent
	if(dna.species.exotic_blood)
		return dna.species.exotic_blood
	else if(HAS_TRAIT(src, TRAIT_NOBLOOD))
		return
	return /datum/reagent/blood
>>>>>>> tg-pr-88929

/mob/living/simple_animal/bot/get_blood_type()
	return GLOB.blood_types[/datum/blood_type/oil]

/mob/living/basic/bot/get_blood_type()
	return GLOB.blood_types[/datum/blood_type/oil]

/mob/living/carbon/alien/get_blood_type()
	if(HAS_TRAIT(src, TRAIT_NOBLOOD)) // MONKESTATION EDIT: Made TRAIT_HUSK cascade into TRAIT_NOBLOOD, making snowflake checks unnecessary.
		return null
	return GLOB.blood_types[/datum/blood_type/xenomorph]

/mob/living/carbon/human/get_blood_type()
	if(!dna || HAS_TRAIT(src, TRAIT_NOBLOOD)) // MONKESTATION EDIT: Made TRAIT_HUSK cascade into TRAIT_NOBLOOD, making snowflake checks unnecessary.
		return null
	/*if(check_holidays(APRIL_FOOLS) && is_clown_job(mind?.assigned_role))
		return GLOB.blood_types[/datum/blood_type/clown]*/
	if(dna.species.exotic_bloodtype)
		return GLOB.blood_types[dna.species.exotic_bloodtype]
	return GLOB.blood_types[dna.human_blood_type]

/**
 * Returns TRUE if src is compatible with donor's blood, otherwise FALSE.
 * * donor: Carbon mob, the one that is donating blood.
 */
/mob/living/carbon/proc/get_blood_compatibility(mob/living/carbon/donor)
	var/patient_blood_data = get_blood_data(get_blood_id())
	var/donor_blood_data = donor.get_blood_data(donor.get_blood_id())
	return donor_blood_data["blood_type"] in get_safe_blood(patient_blood_data["blood_type"])

//to add a splatter of blood or other mob liquid.
<<<<<<< HEAD
/mob/living/proc/add_splatter_floor(turf/blood_turf = get_turf(src), small_drip)
	// Create a bit of metallic pollution, as that's how blood smells
	blood_turf?.pollute_turf(/datum/pollutant/metallic_scent, 30) // TODO Move to blood_datum
	return get_blood_type()?.make_blood_splatter(src, blood_turf, small_drip)
=======
/mob/living/proc/add_splatter_floor(turf/T, small_drip)
	if(get_blood_id() != /datum/reagent/blood)
		return
	if(!T)
		T = get_turf(src)
	if(isclosedturf(T) || (isgroundlessturf(T) && !GET_TURF_BELOW(T)))
		return
>>>>>>> tg-pr-88929

/mob/living/proc/do_splatter_effect(splat_dir = pick(GLOB.cardinals))
	var/obj/effect/temp_visual/dir_setting/bloodsplatter/splatter = new(get_turf(src), splat_dir, get_blood_type()?.color)
	splatter.color = get_blood_type()?.color

/**
 * This proc is a helper for spraying blood for things like slashing/piercing wounds and dismemberment.
 *
 * The strength of the splatter in the second argument determines how much it can dirty and how far it can go
 *
 * Arguments:
 * * splatter_direction: Which direction the blood is flying
 * * splatter_strength: How many tiles it can go, and how many items it can pass over and dirty
 */
/mob/living/proc/spray_blood(splatter_direction, splatter_strength = 3)
	if(QDELETED(src) || !isturf(loc) || QDELING(loc) || !blood_volume || HAS_TRAIT(src, TRAIT_NOBLOOD))
		return
	var/obj/effect/decal/cleanable/blood/hitsplatter/our_splatter = new(loc)
	if(QDELETED(our_splatter))
		return
	our_splatter.add_mob_blood(src)
	var/turf/targ = get_ranged_target_turf(src, splatter_direction, splatter_strength)
	our_splatter.fly_towards(targ, splatter_strength)

/mob/living/proc/get_blood_alcohol_content()
	var/blood_alcohol_content = 0
	var/datum/status_effect/inebriated/inebriation = has_status_effect(/datum/status_effect/inebriated)
	if(!isnull(inebriation))
		blood_alcohol_content = round(inebriation.drunk_value * DRUNK_POWER_TO_BLOOD_ALCOHOL, 0.01)

	return blood_alcohol_content

/**
 * Helper proc for throwing blood particles around, similar to the spray_blood proc.
 */
/mob/living/proc/blood_particles(amount = rand(1, 3), angle = rand(0,360), min_deviation = -30, max_deviation = 30, min_pixel_z = 0, max_pixel_z = 6)
	if(QDELETED(src) || !isturf(loc) || QDELING(loc) || !blood_volume || HAS_TRAIT(src, TRAIT_NOBLOOD))
		return
	for(var/i in 1 to amount)
		var/obj/effect/decal/cleanable/blood/particle/droplet = new(loc)
		if(QDELETED(droplet)) // if they're deleting upon init, let's not waste any more time, any others will prolly just do the same thing
			return
		droplet.color = get_blood_type()?.color
		droplet.add_mob_blood(src)
		droplet.pixel_z = rand(min_pixel_z, max_pixel_z)
		droplet.start_movement(angle + rand(min_deviation, max_deviation))

/mob/living/proc/get_blood_alcohol_content()
	var/blood_alcohol_content = 0
	var/datum/status_effect/inebriated/inebriation = has_status_effect(/datum/status_effect/inebriated)
	if(!isnull(inebriation))
		blood_alcohol_content = round(inebriation.drunk_value * DRUNK_POWER_TO_BLOOD_ALCOHOL, 0.01)

	return blood_alcohol_content

#undef BLOOD_DRIP_RATE_MOD
#undef DRUNK_POWER_TO_BLOOD_ALCOHOL
