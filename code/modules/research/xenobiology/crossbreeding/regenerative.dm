/*
Regenerative extracts:
	Work like a legion regenerative core.
	Has a unique additional effect.

	HEAVILY REWORKED BY MONKESTATION, SEE [monkestation\code\modules\slimecore\crossbreeding\regenerative]
*/
/obj/item/slimecross/regenerative
	name = "regenerative extract"
	desc = "It's filled with a milky substance, and pulses like a heartbeat."
	effect = "regenerative"
	icon_state = "regenerative"
	effect_desc = "Completely heals your injuries, with no extra effects."

/obj/item/slimecross/regenerative/proc/core_effect(mob/living/carbon/human/target, mob/user)
	return
/obj/item/slimecross/regenerative/proc/core_effect_before(mob/living/carbon/human/target, mob/user)
	return

<<<<<<< HEAD
/* monkestation edit: overriden in [monkestation\code\modules\slimecore\crossbreeding\regenerative\extract.dm]
/obj/item/slimecross/regenerative/afterattack(atom/target,mob/user,prox)
	. = ..()
	if(!prox || !isliving(target))
=======
/obj/item/slimecross/regenerative/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(!isliving(interacting_with))
>>>>>>> tg-pr-88929
		return
	var/mob/living/H = interacting_with
	if(H.stat == DEAD)
		to_chat(user, span_warning("[src] will not work on the dead!"))
		return ITEM_INTERACT_BLOCKING
	if(H != user)
		user.visible_message(span_notice("[user] crushes [src] over [H], the milky goo quickly regenerating all of [H.p_their()] injuries!"),
			span_notice("You squeeze [src], and it bursts over [H], the milky goo regenerating [H.p_their()] injuries."))
	else
		user.visible_message(span_notice("[user] crushes [src] over [user.p_them()]self, the milky goo quickly regenerating all of [user.p_their()] injuries!"),
			span_notice("You squeeze [src], and it bursts in your hand, splashing you with milky goo which quickly regenerates your injuries!"))
	core_effect_before(H, user)
	user.do_attack_animation(interacting_with)
<<<<<<< HEAD
	H.revive(HEAL_ALL)
	core_effect(H, user)
	playsound(H, 'sound/effects/splat.ogg', 40, TRUE)
	qdel(src)
*/

/obj/item/slimecross/regenerative/grey
	colour = "grey" //Has no bonus effect.
	effect_desc = "Rapidly heals the target and does nothing else." // monkestation edit: updates effect_desc to reflect the rework
=======
	H.revive(HEAL_ALL & ~HEAL_REFRESH_ORGANS)
	core_effect(H, user)
	playsound(H, 'sound/effects/splat.ogg', 40, TRUE)
	qdel(src)
	return ITEM_INTERACT_SUCCESS

/obj/item/slimecross/regenerative/grey
	colour = SLIME_TYPE_GREY //Has no bonus effect.
	effect_desc = "Fully heals the target and does nothing else."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/orange
	colour = SLIME_TYPE_ORANGE

/obj/item/slimecross/regenerative/orange/core_effect_before(mob/living/target, mob/user)
	target.visible_message(span_warning("\The [src] boils over!"))
	for(var/turf/targetturf in RANGE_TURFS(1,target))
		if(!locate(/obj/effect/hotspot) in targetturf)
			new /obj/effect/hotspot(targetturf)

/obj/item/slimecross/regenerative/purple
<<<<<<< HEAD
	colour = "purple"
	effect_desc = "Rapidly heals the target at an even greater rate, and injects them with some regenerative jelly afterwards. Prevents softcrit while active." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_PURPLE
	effect_desc = "Fully heals the target and injects them with some regen jelly."
>>>>>>> tg-pr-88929

/* monkestation edit: moved functionality to status effect
/obj/item/slimecross/regenerative/purple/core_effect(mob/living/target, mob/user)
	target.reagents.add_reagent(/datum/reagent/medicine/regen_jelly,10)
*/

/obj/item/slimecross/regenerative/blue
<<<<<<< HEAD
	colour = "blue"
	effect_desc = "Rapidly heals the target and makes the floor wet." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_BLUE
	effect_desc = "Fully heals the target and makes the floor wet."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/blue/core_effect(mob/living/target, mob/user)
	if(isturf(target.loc))
		var/turf/open/T = get_turf(target)
		T.MakeSlippery(TURF_WET_WATER, min_wet_time = 10, wet_time_to_add = 5)
		target.visible_message(span_warning("The milky goo in the extract gets all over the floor!"))

/obj/item/slimecross/regenerative/metal
<<<<<<< HEAD
	colour = "metal"
	effect_desc = "Rapidly heals the target and encases the target in a locker." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_METAL
	effect_desc = "Fully heals the target and encases the target in a locker."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/metal/core_effect(mob/living/target, mob/user)
	target.visible_message(span_warning("The milky goo hardens and reshapes itself, encasing [target]!"))
	var/obj/structure/closet/C = new /obj/structure/closet(target.loc)
	C.name = "slimy closet"
	C.desc = "Looking closer, it seems to be made of a sort of solid, opaque, metal-like goo."
	if(target.mob_size > C.max_mob_size) //Prevents capturing megafauna or other large mobs in the closets
		C.bust_open()
		C.visible_message(span_warning("[target] is too big, and immediately breaks \the [C.name] open!"))
	else //This can't be allowed to actually happen to the too-big mobs or it breaks some actions
		target.forceMove(C)

/obj/item/slimecross/regenerative/yellow
<<<<<<< HEAD
	colour = "yellow"
	effect_desc = "Rapidly heals the target and fully recharges a single item on the target. Provides shock immunity while active." // monkestation edit: updates effect_desc to reflect the rework

/obj/item/slimecross/regenerative/yellow/core_effect(mob/living/target, mob/user)
	var/list/batteries = list()
	for(var/obj/item/stock_parts/power_store/cell/C in target.get_all_contents())
		if(C.charge < C.maxcharge)
			batteries += C
	if(batteries.len)
		var/obj/item/stock_parts/power_store/cell/ToCharge = pick(batteries)
=======
	colour = SLIME_TYPE_YELLOW
	effect_desc = "Fully heals the target and fully recharges a single item on the target."

/obj/item/slimecross/regenerative/yellow/core_effect(mob/living/target, mob/user)
	var/list/batteries = list()
	for(var/obj/item/stock_parts/power_store/C in target.get_all_contents())
		if(C.charge < C.maxcharge)
			batteries += C
	if(batteries.len)
		var/obj/item/stock_parts/power_store/ToCharge = pick(batteries)
>>>>>>> tg-pr-88929
		ToCharge.charge = ToCharge.maxcharge
		to_chat(target, span_notice("You feel a strange electrical pulse, and one of your electrical items was recharged."))

/obj/item/slimecross/regenerative/darkpurple
<<<<<<< HEAD
	colour = "dark purple"
	effect_desc = "Rapidly heals the target and gives them purple clothing if they are naked." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_DARK_PURPLE
	effect_desc = "Fully heals the target and gives them purple clothing if they are naked."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/darkpurple/core_effect(mob/living/target, mob/user)
	var/equipped = 0
	equipped += target.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/purple(null), ITEM_SLOT_FEET)
	equipped += target.equip_to_slot_or_del(new /obj/item/clothing/under/color/lightpurple(null), ITEM_SLOT_ICLOTHING)
	equipped += target.equip_to_slot_or_del(new /obj/item/clothing/gloves/color/purple(null), ITEM_SLOT_GLOVES)
	equipped += target.equip_to_slot_or_del(new /obj/item/clothing/head/soft/purple(null), ITEM_SLOT_HEAD)
	if(equipped > 0)
		target.visible_message(span_notice("The milky goo congeals into clothing!"))

/obj/item/slimecross/regenerative/darkblue
<<<<<<< HEAD
	colour = "dark blue"
	effect_desc = "Rapidly heals the target and fireproofs their clothes." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_DARK_BLUE
	effect_desc = "Fully heals the target and fireproofs their clothes."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/darkblue/core_effect(mob/living/target, mob/user)
	if(!ishuman(target))
		return
	var/mob/living/carbon/human/H = target
	var/fireproofed = FALSE
	if(H.get_item_by_slot(ITEM_SLOT_OCLOTHING))
		fireproofed = TRUE
		var/obj/item/clothing/C = H.get_item_by_slot(ITEM_SLOT_OCLOTHING)
		fireproof(C)
	if(H.get_item_by_slot(ITEM_SLOT_HEAD))
		fireproofed = TRUE
		var/obj/item/clothing/C = H.get_item_by_slot(ITEM_SLOT_HEAD)
		fireproof(C)
	if(fireproofed)
		target.visible_message(span_notice("Some of [target]'s clothing gets coated in the goo, and turns blue!"))

<<<<<<< HEAD
/obj/item/slimecross/regenerative/darkblue/proc/fireproof(obj/item/clothing/C)
	C.name = "fireproofed [C.name]"
	C.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
	C.add_atom_colour("#000080", FIXED_COLOUR_PRIORITY)
	C.max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	C.resistance_flags |= FIRE_PROOF

/obj/item/slimecross/regenerative/silver
	colour = "silver"
	effect_desc = "Rapidly heals the target, regenerating their nutrition at a far greater rate than normal" // monkestation edit: updates effect_desc to reflect the rework
=======
/obj/item/slimecross/regenerative/darkblue/proc/fireproof(obj/item/clothing/clothing_piece)
	clothing_piece.name = "fireproofed [clothing_piece.name]"
	clothing_piece.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
	clothing_piece.add_atom_colour(color_transition_filter(COLOR_NAVY, SATURATION_OVERRIDE), FIXED_COLOUR_PRIORITY)
	clothing_piece.max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	clothing_piece.heat_protection = clothing_piece.body_parts_covered
	clothing_piece.resistance_flags |= FIRE_PROOF

/obj/item/slimecross/regenerative/silver
	colour = SLIME_TYPE_SILVER
	effect_desc = "Fully heals the target and makes their belly feel round and full."
>>>>>>> tg-pr-88929

/* monkestation edit: replaced in [monkestation\code\modules\slimecore\crossbreeding\regenerative\extract.dm]
/obj/item/slimecross/regenerative/silver/core_effect(mob/living/target, mob/user)
	target.set_nutrition(NUTRITION_LEVEL_FULL - 1)
	to_chat(target, span_notice("You feel satiated."))
*/

/obj/item/slimecross/regenerative/bluespace
<<<<<<< HEAD
	colour = "bluespace"
	effect_desc = "Rapidly heals the target and teleports them to where this core was created." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_BLUESPACE
	effect_desc = "Fully heals the target and teleports them to where this core was created."
>>>>>>> tg-pr-88929
	var/turf/open/T

/obj/item/slimecross/regenerative/bluespace/core_effect(mob/living/target, mob/user)
	var/turf/old_location = get_turf(target)
	if(do_teleport(target, T, channel = TELEPORT_CHANNEL_QUANTUM)) //despite being named a bluespace teleportation method the quantum channel is used to preserve precision teleporting with a bag of holding
		old_location.visible_message(span_warning("[target] disappears in a shower of sparks!"))
		to_chat(target, span_danger("The milky goo teleports you somewhere it remembers!"))

	if(HAS_TRAIT(target, TRAIT_NO_TELEPORT))
		old_location.visible_message(span_warning("[target] sparks briefly, but is prevented from teleporting!"))

/obj/item/slimecross/regenerative/bluespace/Initialize(mapload)
	. = ..()
	T = get_turf(src)

/obj/item/slimecross/regenerative/sepia
<<<<<<< HEAD
	colour = "sepia"
	effect_desc = "Rapidly heals the target. After 10 seconds, relocate the target to the initial position the core was used with their previous health status." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_SEPIA
	effect_desc = "Fully heals the target. After 10 seconds, relocate the target to the initial position the core was used with their previous health status."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/sepia/core_effect_before(mob/living/target, mob/user)
	to_chat(target, span_notice("You try to forget how you feel."))
	target.AddComponent(/datum/component/dejavu)

/obj/item/slimecross/regenerative/cerulean
<<<<<<< HEAD
	colour = "cerulean"
	effect_desc = "Rapidly heals the target and makes a second regenerative core with no special effects." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_CERULEAN
	effect_desc = "Fully heals the target and makes a second regenerative core with no special effects."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/cerulean/core_effect(mob/living/target, mob/user)
	src.forceMove(user.loc)
	var/obj/item/slimecross/X = new /obj/item/slimecross/regenerative(user.drop_location())
	X.name = name
	X.desc = desc
	user.put_in_active_hand(X)
	to_chat(user, span_notice("Some of the milky goo congeals in your hand!"))

/obj/item/slimecross/regenerative/pyrite
<<<<<<< HEAD
	colour = "pyrite"
	effect_desc = "Rapidly heals and randomly colors the target." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_PYRITE
	effect_desc = "Fully heals and randomly colors the target."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/pyrite/core_effect(mob/living/target, mob/user)
	target.visible_message(span_warning("The milky goo coating [target] leaves [target.p_them()] a different color!"))
	target.add_atom_colour(color_transition_filter(rgb(rand(0,255), rand(0,255), rand(0,255)), SATURATION_OVERRIDE), WASHABLE_COLOUR_PRIORITY)

/obj/item/slimecross/regenerative/red
<<<<<<< HEAD
	colour = "red"
	effect_desc = "Rapidly heals the target and injects them with some ephedrine." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_RED
	effect_desc = "Fully heals the target and injects them with some ephedrine."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/red/core_effect(mob/living/target, mob/user)
	to_chat(target, span_notice("You feel... <i>faster.</i>"))
	target.reagents.add_reagent(/datum/reagent/medicine/ephedrine,3)

/obj/item/slimecross/regenerative/green
<<<<<<< HEAD
	colour = "green"
	effect_desc = "Rapidly heals the target and changes the species or color of a slime or jellyperson." // monkestation edit: updates effect_desc to reflect the rework

/obj/item/slimecross/regenerative/green/core_effect(mob/living/target, mob/user)
	if(isslime(target))
		target.visible_message(span_warning("\The [target] suddenly changes color!"))
		var/mob/living/basic/slime/S = target
		S.start_mutating(TRUE)
	else if(isoozeling(target))
		target.reagents.add_reagent(/datum/reagent/mutationtoxin/jelly, 5)


/obj/item/slimecross/regenerative/pink
	colour = "pink"
	effect_desc = "Rapidly heals the target and injects them with some krokodil." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_GREEN
	effect_desc = "Fully heals the target and changes the spieces or color of a slime or jellyperson."

/obj/item/slimecross/regenerative/green/core_effect(mob/living/target, mob/user)
	if(isslime(target))
		target.visible_message(span_warning("The [target] suddenly changes color!"))
		var/mob/living/basic/slime/target_slime = target
		target_slime.random_colour()
	if(isjellyperson(target))
		target.reagents.add_reagent(/datum/reagent/mutationtoxin/jelly,5)


/obj/item/slimecross/regenerative/pink
	colour = SLIME_TYPE_PINK
	effect_desc = "Fully heals the target and injects them with some krokodil."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/pink/core_effect(mob/living/target, mob/user)
	to_chat(target, span_notice("You feel more calm."))
	target.reagents.add_reagent(/datum/reagent/drug/krokodil,4)

/obj/item/slimecross/regenerative/gold
<<<<<<< HEAD
	colour = "gold"
	effect_desc = "Rapidly heals the target and produces a random coin." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_GOLD
	effect_desc = "Fully heals the target and produces a random coin."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/gold/core_effect(mob/living/target, mob/user)
	var/newcoin = get_random_coin()
	var/obj/item/coin/C = new newcoin(target.loc)
	playsound(C, 'sound/items/coinflip.ogg', 50, TRUE)
	target.put_in_hand(C)

/obj/item/slimecross/regenerative/oil
<<<<<<< HEAD
	colour = "oil"
	effect_desc = "Rapidly heals the target and flashes everyone in sight." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_OIL
	effect_desc = "Fully heals the target and flashes everyone in sight."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/oil/core_effect(mob/living/target, mob/user)
	playsound(src, 'sound/items/weapons/flash.ogg', 100, TRUE)
	for(var/mob/living/L in view(user,7))
		L.flash_act()

/obj/item/slimecross/regenerative/black
<<<<<<< HEAD
	colour = "black"
	effect_desc = "Rapidly heals the target and creates an imperfect duplicate of them made of slime, that fakes their death." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_BLACK
	effect_desc = "Fully heals the target and creates an imperfect duplicate of them made of slime, that fakes their death."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/black/core_effect_before(mob/living/target, mob/user)
	var/dummytype = target.type
	if(ismegafauna(target)) //Prevents megafauna duping in a lame way
		dummytype = /mob/living/basic/slime
		to_chat(user, span_warning("The milky goo flows over [target], falling into a weak puddle."))
	var/mob/living/dummy = new dummytype(target.loc)
	to_chat(target, span_notice("The milky goo flows from your skin, forming an imperfect copy of you."))
	if(iscarbon(target))
		var/mob/living/carbon/carbon_target = target
		var/mob/living/carbon/carbon_dummy = dummy
		carbon_dummy.real_name = carbon_target.real_name
		if(carbon_target.dna)
			carbon_target.dna.copy_dna(carbon_dummy.dna, COPY_DNA_SE|COPY_DNA_SPECIES)
		carbon_dummy.updateappearance(mutcolor_update = TRUE)
	dummy.adjustBruteLoss(target.getBruteLoss())
	dummy.adjustFireLoss(target.getFireLoss())
	dummy.adjustToxLoss(target.getToxLoss())
	dummy.death()

/obj/item/slimecross/regenerative/lightpink
<<<<<<< HEAD
	colour = "light pink"
	effect_desc = "Rapidly heals the target and also heals the user." // monkestation edit: updates effect_desc to reflect the rework
=======
	colour = SLIME_TYPE_LIGHT_PINK
	effect_desc = "Fully heals the target and also heals the user."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/lightpink/core_effect(mob/living/target, mob/user)
	if(!isliving(user))
		return
	if(target == user)
		return
	var/mob/living/U = user
	U.revive(HEAL_ALL & ~HEAL_REFRESH_ORGANS)
	to_chat(U, span_notice("Some of the milky goo sprays onto you, as well!"))

/obj/item/slimecross/regenerative/adamantine
<<<<<<< HEAD
	colour = "adamantine"
	effect_desc = "Rapidly heals the target, while boosting their armor and general resilience." // monkestation edit: updates effect_desc to reflect the rework, also a typo fix
=======
	colour = SLIME_TYPE_ADAMANTINE
	effect_desc = "Fully heals the target and boosts their armor."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/adamantine/core_effect(mob/living/target, mob/user) //WIP - Find out why this doesn't work.
	target.apply_status_effect(/datum/status_effect/slimeskin)

/obj/item/slimecross/regenerative/rainbow
<<<<<<< HEAD
	colour = "rainbow"
	effect_desc = "Fully heals the target, including all forms of damage, wounds, brain traumas, sickness, blood loss, and unsafe body temperature. Does not regrow limbs (except for oozelings) or refresh organs. Temporarily makes them immortal, but pacifistic." // monkestation edit: updates effect_desc to reflect the rework, also a typo fix
=======
	colour = SLIME_TYPE_RAINBOW
	effect_desc = "Fully heals the target and temporarily makes them immortal, but pacifistic."
>>>>>>> tg-pr-88929

/obj/item/slimecross/regenerative/rainbow/core_effect(mob/living/target, mob/user)
	target.apply_status_effect(/datum/status_effect/rainbow_protection)
