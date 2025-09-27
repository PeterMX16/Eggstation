/// Weaker smite, not outright gibbing your target, but a lot more bloody, and Sanguine school, so doesn't get affected by splattercasting.
/datum/action/cooldown/spell/touch/scream_for_me
	name = "Scream For Me"
	desc = "This wicked spell inflicts many severe wounds on your target, causing them to \
		likely bleed to death unless they receive immediate medical attention."
	button_icon_state = "scream_for_me"
	sound = null //trust me, you'll hear their wounds

	school = SCHOOL_SANGUINE
	invocation_type = INVOCATION_SHOUT
	cooldown_time = 60 SECONDS
	cooldown_reduction_per_rank = 10 SECONDS

	invocation = "SCREAM FOR ME!!"

	hand_path = /obj/item/melee/touch_attack/scream_for_me

/datum/action/cooldown/spell/touch/scream_for_me/on_antimagic_triggered(obj/item/melee/touch_attack/hand, mob/living/victim, mob/living/carbon/caster)
	caster.visible_message(
		span_warning("The feedback mutilates [caster]'s arm!"),
		span_userdanger("The spell bounces from [victim]'s skin back into your arm!"),
	)
	caster.cause_pain(BODY_ZONE_EVERYTHING, 50, BRUTE)
	var/obj/item/bodypart/to_wound = caster.get_holding_bodypart_of_item(hand)
<<<<<<< HEAD
	var/type_wound = pick(list(/datum/wound/slash/flesh/critical, /datum/wound/slash/flesh/severe))
	to_wound.force_wound_upwards(type_wound)
=======
	caster.cause_wound_of_type_and_severity(WOUND_SLASH, to_wound, WOUND_SEVERITY_MODERATE, WOUND_SEVERITY_CRITICAL)
>>>>>>> tg-pr-88929

/datum/action/cooldown/spell/touch/scream_for_me/cast_on_hand_hit(obj/item/melee/touch_attack/hand, mob/living/victim, mob/living/carbon/caster)
	if(!ishuman(victim))
		return
	var/mob/living/carbon/human/human_victim = victim
	human_victim.emote("scream")
	human_victim.cause_pain(BODY_ZONE_EVERYTHING, 50, BRUTE)
	for(var/obj/item/bodypart/to_wound as anything in human_victim.bodyparts)
<<<<<<< HEAD
		var/type_wound = pick(list(/datum/wound/slash/flesh/critical, /datum/wound/slash/flesh/severe))
		to_wound.force_wound_upwards(type_wound)
=======
		human_victim.cause_wound_of_type_and_severity(WOUND_SLASH, to_wound, WOUND_SEVERITY_MODERATE, WOUND_SEVERITY_CRITICAL)
>>>>>>> tg-pr-88929
	return TRUE

/obj/item/melee/touch_attack/scream_for_me
	name = "\improper bloody touch"
	desc = "Guaranteed to make your victims scream, or your money back!"
	icon = 'icons/obj/weapons/hand.dmi'
	icon_state = "scream_for_me"
	inhand_icon_state = "disintegrate"
