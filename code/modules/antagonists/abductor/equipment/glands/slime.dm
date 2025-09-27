/obj/item/organ/heart/gland/slime
	abductor_hint = "gastric animation galvanizer. The abductee occasionally vomits slimes. Slimes will no longer attack the abductee."
	cooldown_low = 1 MINUTES
	cooldown_high = 2 MINUTES
	uses = -1
	icon_state = "slime"
	mind_control_uses = 1
	mind_control_duration = 4 MINUTES

/obj/item/organ/heart/gland/slime/on_mob_insert(mob/living/carbon/gland_owner)
	. = ..()
<<<<<<< HEAD
	//gland_owner.faction |= FACTION_SLIME
=======
	gland_owner.faction |= FACTION_SLIME
>>>>>>> tg-pr-88929
	gland_owner.grant_language(/datum/language/slime, source = LANGUAGE_GLAND)

/obj/item/organ/heart/gland/slime/on_mob_remove(mob/living/carbon/gland_owner)
	. = ..()
<<<<<<< HEAD
	//gland_owner.faction -= FACTION_SLIME
=======
	gland_owner.faction -= FACTION_SLIME
>>>>>>> tg-pr-88929
	gland_owner.remove_language(/datum/language/slime, source = LANGUAGE_GLAND)

/obj/item/organ/heart/gland/slime/activate()
	to_chat(owner, span_warning("You feel nauseated!"))
	owner.vomit(VOMIT_CATEGORY_DEFAULT, lost_nutrition = 20)

<<<<<<< HEAD
	var/mob/living/basic/slime/Slime = new(get_turf(owner))
	SEND_SIGNAL(Slime, COMSIG_FRIENDSHIP_CHANGE, owner, 110)
=======
	var/mob/living/basic/slime/new_baby_slime = new(get_turf(owner), /datum/slime_type/grey)
	new_baby_slime.befriend(owner)
>>>>>>> tg-pr-88929
