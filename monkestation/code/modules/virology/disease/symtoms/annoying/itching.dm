/datum/symptom/itching
	name = "Itching"
	desc = "Makes you Itch!"
	stage = 1
	badness = EFFECT_DANGER_ANNOYING
	severity = 2
	var/scratch = FALSE
<<<<<<< HEAD:monkestation/code/modules/virology/disease/symtoms/annoying/itching.dm
=======
	threshold_descs = list(
		"Transmission 6" = "Increases frequency of itching.",
		"Stage Speed 7" = "The host will scratch itself when itching, causing superficial damage.",
	)
>>>>>>> tg-pr-88929:code/datums/diseases/advance/symptoms/itching.dm
	///emote cooldowns
	COOLDOWN_DECLARE(itching_cooldown)
	///if FALSE, there is a percentage chance that the mob will emote scratching while itching_cooldown is on cooldown. If TRUE, won't emote again until after the off cooldown scratch occurs.
	var/off_cooldown_scratched = FALSE
<<<<<<< HEAD:monkestation/code/modules/virology/disease/symtoms/annoying/itching.dm
=======

/datum/symptom/itching/Start(datum/disease/advance/active_disease)
	. = ..()
	if(!.)
		return
	if(active_disease.totalTransmittable() >= 6) //itch more often
		symptom_delay_min = 1
		symptom_delay_max = 4
	if(active_disease.totalStageSpeed() >= 7) //scratch
		scratch = TRUE
>>>>>>> tg-pr-88929:code/datums/diseases/advance/symptoms/itching.dm

/datum/symptom/itching/activate(mob/living/mob)
	if(!iscarbon(mob))
		return
<<<<<<< HEAD:monkestation/code/modules/virology/disease/symtoms/annoying/itching.dm
	var/mob/living/carbon/affected_mob = mob
	var/obj/item/bodypart/bodypart = affected_mob.get_bodypart(affected_mob.get_random_valid_zone(even_weights = TRUE))
	if(bodypart && IS_ORGANIC_LIMB(bodypart) && !(bodypart.bodypart_flags & BODYPART_PSEUDOPART))  //robotic limbs will mean less scratching overall (why are golems able to damage themselves with self-scratching, but not androids? the world may never know)
		var/can_scratch = scratch && !affected_mob.incapacitated()
		if(can_scratch)
			bodypart.receive_damage(0.5)
		//below handles emotes, limiting the emote of emotes passed to chat
		if(COOLDOWN_FINISHED(src, itching_cooldown) || !COOLDOWN_FINISHED(src, itching_cooldown) && prob(60) && !off_cooldown_scratched)
			affected_mob.visible_message("[can_scratch ? span_warning("[affected_mob] scratches [affected_mob.p_their()] [bodypart.plaintext_zone].") : ""]", span_warning("Your [bodypart.plaintext_zone] itches. [can_scratch ? " You scratch it." : ""]"))
			COOLDOWN_START(src, itching_cooldown, 5 SECONDS)
			if(!off_cooldown_scratched && !COOLDOWN_FINISHED(src, itching_cooldown))
				off_cooldown_scratched = TRUE
			else
				off_cooldown_scratched = FALSE
=======

	var/announce_scratch = COOLDOWN_FINISHED(src, itching_cooldown) || (!COOLDOWN_FINISHED(src, itching_cooldown) && prob(60) && !off_cooldown_scratched)
	if (!active_disease.affected_mob.itch(silent = !announce_scratch, can_scratch = scratch) || !announce_scratch)
		return
	COOLDOWN_START(src, itching_cooldown, 5 SECONDS)
	if(!off_cooldown_scratched && !COOLDOWN_FINISHED(src, itching_cooldown))
		off_cooldown_scratched = TRUE
	else
		off_cooldown_scratched = FALSE
>>>>>>> tg-pr-88929:code/datums/diseases/advance/symptoms/itching.dm
