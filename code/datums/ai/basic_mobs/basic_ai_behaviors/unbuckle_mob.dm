/datum/ai_behavior/unbuckle_mob

/datum/ai_behavior/unbuckle_mob/perform(seconds_per_tick, datum/ai_controller/controller)
<<<<<<< HEAD
	. = ..()

=======
>>>>>>> tg-pr-88929
	var/mob/living/living_pawn = controller.pawn
	var/atom/movable/buckled_to = living_pawn.buckled

	if(isnull(buckled_to))
<<<<<<< HEAD
		finish_action(controller, FALSE)
		return

	buckled_to.unbuckle_mob(living_pawn)
	finish_action(controller, TRUE)
=======
		return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_FAILED

	buckled_to.unbuckle_mob(living_pawn)
	return AI_BEHAVIOR_DELAY | AI_BEHAVIOR_SUCCEEDED
>>>>>>> tg-pr-88929
