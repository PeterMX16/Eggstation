/* Backpacks
 * Contains:
 * Backpack
 * Backpack Types
 * Satchel Types
 */

/*
 * Backpack
 */

/obj/item/storage/backpack
	name = "backpack"
	desc = "You wear this on your back and put items into it."
	icon = 'icons/obj/storage/backpack.dmi'
	worn_icon = 'icons/mob/clothing/back/backpack.dmi'
	icon_state = "backpack"
	inhand_icon_state = "backpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK //ERROOOOO
	resistance_flags = NONE
	max_integrity = 300
<<<<<<< HEAD
	var/shoulder_carry = FALSE
	var/satchel_movespeed_modifier = PAIRED_STORAGE_DEFAULT_SLOWDOWN
=======
	storage_type = /datum/storage/backpack
	pickup_sound = 'sound/items/handling/backpack/backpack_pickup1.ogg'
	drop_sound = 'sound/items/handling/backpack/backpack_drop1.ogg'
	equip_sound = 'sound/items/equip/backpack_equip.ogg'
	sound_vary = TRUE
>>>>>>> tg-pr-88929

/obj/item/storage/backpack/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/attack_equip)

/obj/item/storage/backpack/equipped(mob/user, slot, initial)
	. = ..()
	check_belt_satchel(user)

/obj/item/storage/backpack/dropped(mob/user, silent)
	. = ..()
	check_belt_satchel(user)

/obj/item/storage/backpack/proc/check_belt_satchel(mob/user)
	if(QDELETED(user))
		return
	user.remove_movespeed_modifier(/datum/movespeed_modifier/belt_satchel, update = FALSE)
	var/obj/item/storage/backpack/back_item = user.get_item_by_slot(ITEM_SLOT_BACK)
	var/obj/item/storage/backpack/belt_item = user.get_item_by_slot(ITEM_SLOT_BELT)
	if(istype(back_item) && istype(belt_item))
		user.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/belt_satchel, min(back_item.satchel_movespeed_modifier, belt_item.satchel_movespeed_modifier))
	else
		user.update_movespeed()
/*
 * Backpack Types
 */

/obj/item/bag_of_holding_inert
	name = "inert bag of holding"
	desc = "What is currently a just an unwieldly block of metal with a slot ready to accept a bluespace anomaly core."
	icon = 'icons/obj/storage/backpack.dmi'
	worn_icon = 'icons/mob/clothing/back/backpack.dmi'
	icon_state = "bag_of_holding-inert"
	inhand_icon_state = "brokenpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	resistance_flags = FIRE_PROOF
	item_flags = NO_MAT_REDEMPTION

/obj/item/bag_of_holding_inert/Initialize(mapload)
	. = ..()
	var/static/list/recipes = list(/datum/crafting_recipe/boh)
	AddElement(/datum/element/slapcrafting, recipes)

/obj/item/storage/backpack/holding
	name = "bag of holding"
	desc = "A backpack that opens into a localized pocket of bluespace."
	icon_state = "bag_of_holding"
	inhand_icon_state = "holdingpack"
	resistance_flags = FIRE_PROOF
	item_flags = NO_MAT_REDEMPTION
	armor_type = /datum/armor/backpack_holding
	storage_type = /datum/storage/bag_of_holding
	pickup_sound = null
	drop_sound = null

/datum/armor/backpack_holding
	fire = 60
	acid = 50

/obj/item/storage/backpack/holding/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] is jumping into [src]! It looks like [user.p_theyre()] trying to commit suicide."))
	user.dropItemToGround(src, TRUE)
	user.Stun(100, ignore_canstun = TRUE)
	sleep(2 SECONDS)
	playsound(src, SFX_RUSTLE, 50, TRUE, -5)
	user.suicide_log()
	qdel(user)


/obj/item/storage/backpack/santabag
	name = "Santa's Gift Bag"
	desc = "Space Santa uses this to deliver presents to all the nice children in space in Christmas! Wow, it's pretty big!"
	icon_state = "giftbag0"
	inhand_icon_state = "giftbag"
	w_class = WEIGHT_CLASS_BULKY

/obj/item/storage/backpack/santabag/Initialize(mapload)
	. = ..()
	regenerate_presents()

/obj/item/storage/backpack/santabag/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] places [src] over [user.p_their()] head and pulls it tight! It looks like [user.p_they()] [user.p_are()]n't in the Christmas spirit..."))
	return OXYLOSS

/obj/item/storage/backpack/santabag/proc/regenerate_presents()
	addtimer(CALLBACK(src, PROC_REF(regenerate_presents)), 30 SECONDS)

	var/mob/user = get(loc, /mob)
	if(!istype(user))
		return
	if(HAS_MIND_TRAIT(user, TRAIT_CANNOT_OPEN_PRESENTS))
		var/turf/floor = get_turf(src)
		var/obj/item/thing = new /obj/item/gift/anything(floor)
		if(!atom_storage.attempt_insert(thing, user, override = TRUE, force = STORAGE_SOFT_LOCKED))
			qdel(thing)


/obj/item/storage/backpack/cultpack
	name = "trophy rack"
	desc = "It's useful for both carrying extra gear and proudly declaring your insanity."
	icon_state = "backpack-cult"
	inhand_icon_state = "backpack"
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER

/obj/item/storage/backpack/clown
	name = "Giggles von Honkerton"
	desc = "It's a backpack made by Honk! Co."
	icon_state = "backpack-clown"
	inhand_icon_state = "clownpack"

/obj/item/storage/backpack/explorer
	name = "explorer bag"
	desc = "A robust backpack for stashing your loot."
	icon_state = "backpack-explorer"
	inhand_icon_state = "explorerpack"

/obj/item/storage/backpack/mime
	name = "Parcel Parceaux"
	desc = "A silent backpack made for those silent workers. Silence Co."
	icon_state = "backpack-mime"
	inhand_icon_state = "mimepack"

/obj/item/storage/backpack/medic
	name = "medical backpack"
	desc = "It's a backpack especially designed for use in a sterile environment."
	icon_state = "backpack-medical"
	inhand_icon_state = "medicalpack"

/obj/item/storage/backpack/coroner
	name = "coroner backpack"
	desc = "It's a backpack especially designed for use in an undead environment."
	icon_state = "backpack-coroner"
	inhand_icon_state = "coronerpack"

/obj/item/storage/backpack/security
	name = "security backpack"
	desc = "It's a very robust backpack."
	icon_state = "backpack-security"
	inhand_icon_state = "securitypack"

/obj/item/storage/backpack/captain
	name = "captain's backpack"
	desc = "It's a special backpack made exclusively for Nanotrasen officers."
	icon_state = "backpack-captain"
	inhand_icon_state = "captainpack"

/obj/item/storage/backpack/industrial
	name = "industrial backpack"
	desc = "It's a tough backpack for the daily grind of station life."
	icon_state = "backpack-engineering"
	inhand_icon_state = "engiepack"
	resistance_flags = FIRE_PROOF

/obj/item/storage/backpack/botany
	name = "botany backpack"
	desc = "It's a backpack made of all-natural fibers."
	icon_state = "backpack-hydroponics"
	inhand_icon_state = "botpack"

/obj/item/storage/backpack/chemistry
	name = "chemistry backpack"
	desc = "A backpack specially designed to repel stains and hazardous liquids."
	icon_state = "backpack-chemistry"
	inhand_icon_state = "chempack"

/obj/item/storage/backpack/genetics
	name = "genetics backpack"
	desc = "A bag designed to be super tough, just in case someone hulks out on you."
	icon_state = "backpack-genetics"
	inhand_icon_state = "genepack"

/obj/item/storage/backpack/science
	name = "science backpack"
	desc = "A specially designed backpack. It's fire resistant and smells vaguely of plasma."
	icon_state = "backpack-science"
	inhand_icon_state = "scipack"

/obj/item/storage/backpack/virology
	name = "virology backpack"
	desc = "A backpack made of hypo-allergenic fibers. It's designed to help prevent the spread of disease. Smells like monkey."
	icon_state = "backpack-virology"
	inhand_icon_state = "viropack"

<<<<<<< HEAD
//MONKESTATION EDIT START// adds generic backpack and touches up the sprites
=======
/obj/item/storage/backpack/floortile
	name = "floortile backpack"
	desc = "It's a backpack especially designed for use in floortiles..."
	icon_state = "floortile_backpack"
	inhand_icon_state = "backpack"

>>>>>>> tg-pr-88929
/obj/item/storage/backpack/ert
	name = "emergency response team backpack"
	desc = "A spacious backpack with lots of pockets."
	icon_state = "ert_plain"
	inhand_icon_state = "securitypack"
	resistance_flags = FIRE_PROOF
	alternate_worn_layer = ABOVE_BODY_FRONT_HEAD_LAYER

/obj/item/storage/backpack/ert/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 25 //lots of pockets

/obj/item/storage/backpack/ert/commander
	name = "emergency response team commander backpack"
	desc = "A spacious backpack with lots of pockets, worn by the Commander of an Emergency Response Team."
	icon_state = "ert_commander"

/obj/item/storage/backpack/ert/security
	name = "emergency response team security backpack"
	desc = "A spacious backpack with lots of pockets, worn by Security Officers of an Emergency Response Team."
	icon_state = "ert_security"

/obj/item/storage/backpack/ert/medical
	name = "emergency response team medical backpack"
	desc = "A spacious backpack with lots of pockets, worn by Medical Officers of an Emergency Response Team."
	icon_state = "ert_medical"

/obj/item/storage/backpack/ert/engineer
	name = "emergency response team engineer backpack"
	desc = "A spacious backpack with lots of pockets, worn by Engineers of an Emergency Response Team."
	icon_state = "ert_engineering"

/obj/item/storage/backpack/ert/janitor
	name = "emergency response team janitor backpack"
	desc = "A spacious backpack with lots of pockets, worn by Janitors of an Emergency Response Team."
	icon_state = "ert_janitor"

/obj/item/storage/backpack/ert/clown
	name = "emergency response team clown backpack"
	desc = "A spacious backpack with lots of pockets, worn by Clowns of an Emergency Response Team."
	icon_state = "ert_clown"

/obj/item/storage/backpack/ert/generic
	name = "emergency response team backpack"
	desc = "A spacious backpack with lots of pockets"
	icon_state = "ert_generic"
//MONKESTATION EDIT STOP

/obj/item/storage/backpack/saddlepack
	name = "saddlepack"
	desc = "A backpack designed to be saddled on a mount or carried on your back, and switch between the two on the fly. It's quite spacious, at the cost of making you feel like a literal pack mule."
	icon = 'icons/obj/storage/ethereal.dmi'
	worn_icon = 'icons/mob/clothing/back/ethereal.dmi'
	icon_state = "saddlepack"

/obj/item/storage/backpack/saddlepack/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 26

// MEAT MEAT MEAT MEAT MEAT

/obj/item/storage/backpack/meat
	name = "\improper MEAT"
	desc = "MEAT MEAT MEAT MEAT MEAT MEAT"
	icon_state = "meatmeatmeat"
	inhand_icon_state = "meatmeatmeat"
	force = 15
	throwforce = 15
	attack_verb_continuous = list("MEATS", "MEAT MEATS")
	attack_verb_simple = list("MEAT", "MEAT MEAT")
	custom_materials = list(/datum/material/meat = SHEET_MATERIAL_AMOUNT * 25) // MEAT
	///Sounds used in the squeak component
	var/list/meat_sounds = list('sound/effects/blob/blobattack.ogg' = 1)
	///Reagents added to the edible component, ingested when you EAT the MEAT
	var/list/meat_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 10,
	)
	///The food types of the edible component
	var/foodtypes = MEAT | RAW
	///How our MEAT tastes. It tastes like MEAT
	var/list/tastes = list("MEAT" = 1)
	///Eating verbs when consuming the MEAT
	var/list/eatverbs = list("MEAT", "absorb", "gnaw", "consume")

/obj/item/storage/backpack/meat/Initialize(mapload)
	. = ..()
	AddComponent(
		/datum/component/edible,\
		initial_reagents = meat_reagents,\
		foodtypes = foodtypes,\
		tastes = tastes,\
		eatverbs = eatverbs,\
	)
	AddComponent(/datum/component/squeak, meat_sounds)
	AddComponent(
		/datum/component/blood_walk,\
		blood_type = /obj/effect/decal/cleanable/blood,\
		blood_spawn_chance = 15,\
<<<<<<< HEAD
		max_blood = 300,\
	)
	AddComponent(
		/datum/component/bloody_spreader,\
		blood_left = INFINITY,\
=======
		max_blood = custom_materials[custom_materials[1]] / SHEET_MATERIAL_AMOUNT,\
	)
	AddComponent(
		/datum/component/bloody_spreader,\
		blood_left = custom_materials[custom_materials[1]] / SHEET_MATERIAL_AMOUNT,\
>>>>>>> tg-pr-88929
		blood_dna = list("MEAT DNA" = "MT+"),\
		diseases = null,\
	)

/*
 * Satchel Types
 */

/obj/item/storage/backpack/satchel
	name = "satchel"
	desc = "A trendy looking satchel."
	icon_state = "satchel-norm"
	inhand_icon_state = "satchel-norm"
	shoulder_carry = TRUE
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_BELT

/obj/item/storage/backpack/satchel/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = 18

/obj/item/storage/backpack/satchel/leather
	name = "leather satchel"
	desc = "It's a very fancy satchel made with fine leather."
	icon_state = "satchel-leather"
	inhand_icon_state = "satchel"

/obj/item/storage/backpack/satchel/leather/withwallet/PopulateContents()
	new /obj/item/storage/wallet/random(src)

/obj/item/storage/backpack/satchel/fireproof
	resistance_flags = FIRE_PROOF

/obj/item/storage/backpack/satchel/flowery
	name = "perfume scented satchel"
	desc = "It's a very fancy satchel made with fine leather."
	icon_state = "flowerybag"
	inhand_icon_state = "flowerybag"

/obj/item/storage/backpack/satchel/wing
	name = "angel wing satchel"
	desc = "A uniqe satchel that comes with hidden straps. How many chickens were felled for this look?"
	icon_state = "angelwing"
	inhand_icon_state = "satchel"

/obj/item/storage/backpack/satchel/wing/alt
	name = "devil wing satchel"
	desc = "A uniqe satchel that comes with hidden straps. How many chickens were felled for this look?"
	icon_state = "devilwing"
	inhand_icon_state = "devilwing"

/obj/item/storage/backpack/satchel/blackleather //MONKESTATION EDIT
	name = "black leather satchel"
	desc = "It's a fancy satchel made with plastic imitation leather."
	icon_state = "satchel-blackleather"
	inhand_icon_state = "satchel-blackleather"

/obj/item/storage/backpack/satchel/retro //MONKESTATION EDIT
	name = "retro satchel"
	desc = "A satchel commonly worn during planetary surveys."
	icon_state = "satchel-retro"
	inhand_icon_state = "satchel-retro"

/obj/item/storage/backpack/satchel/eng
	name = "industrial satchel"
	desc = "A tough satchel with extra pockets."
	icon_state = "satchel-engineering"
	inhand_icon_state = "satchel-eng"
	resistance_flags = FIRE_PROOF

/obj/item/storage/backpack/satchel/med
	name = "medical satchel"
	desc = "A sterile satchel used in medical departments."
	icon_state = "satchel-medical"
	inhand_icon_state = "satchel-med"

/obj/item/storage/backpack/satchel/vir
	name = "virologist satchel"
	desc = "A sterile satchel with virologist colours."
	icon_state = "satchel-virology"
	inhand_icon_state = "satchel-vir"

/obj/item/storage/backpack/satchel/chem
	name = "chemist satchel"
	desc = "A sterile satchel with chemist colours."
	icon_state = "satchel-chemistry"
	inhand_icon_state = "satchel-chem"

/obj/item/storage/backpack/satchel/coroner
	name = "coroner satchel"
	desc = "A satchel used to carry whatever's left of human bodies."
	icon_state = "satchel-coroner"
	inhand_icon_state = "satchel-coroner"

/obj/item/storage/backpack/satchel/gen
	name = "geneticist satchel"
	desc = "A sterile satchel with geneticist colours."
	icon_state = "satchel-genetics"
	inhand_icon_state = "satchel-gen"

/obj/item/storage/backpack/satchel/science
	name = "scientist satchel"
	desc = "Useful for holding research materials."
	icon_state = "satchel-science"
	inhand_icon_state = "satchel-sci"

/obj/item/storage/backpack/satchel/hyd
	name = "botanist satchel"
	desc = "A satchel made of all natural fibers."
	icon_state = "satchel-hydroponics"
	inhand_icon_state = "satchel-hyd"

/obj/item/storage/backpack/satchel/sec
	name = "security satchel"
	desc = "A robust satchel for security related needs."
	icon_state = "satchel-security"
	inhand_icon_state = "satchel-sec"

/obj/item/storage/backpack/satchel/explorer
	name = "explorer satchel"
	desc = "A robust satchel for stashing your loot."
	icon_state = "satchel-explorer"
	inhand_icon_state = "satchel-explorer"

/obj/item/storage/backpack/satchel/cap
	name = "captain's satchel"
	desc = "An exclusive satchel for Nanotrasen officers."
	icon_state = "satchel-captain"
	inhand_icon_state = "satchel-cap"

/obj/item/storage/backpack/satchel/flat
	name = "smuggler's satchel"
	desc = "A very slim satchel that can easily fit into tight spaces. Its contents cannot be detected by contraband scanners."
	icon_state = "satchel-flat"
	inhand_icon_state = "satchel-flat"
	w_class = WEIGHT_CLASS_NORMAL //Can fit in backpacks itself.

/obj/item/storage/backpack/satchel/flat/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/undertile, TRAIT_T_RAY_VISIBLE, INVISIBILITY_OBSERVER, use_anchor = TRUE)
	atom_storage.max_total_storage = 15
	atom_storage.set_holdable(cant_hold_list = /obj/item/storage/backpack/satchel/flat) //muh recursive backpacks
	ADD_TRAIT(src, TRAIT_CONTRABAND_BLOCKER, INNATE_TRAIT)

/obj/item/storage/backpack/satchel/flat/PopulateContents()
	for(var/items in 1 to 4)
		new /obj/effect/spawner/random/contraband(src)

/obj/item/storage/backpack/satchel/flat/with_tools/PopulateContents()
	new /obj/item/stack/tile/iron/base(src)
	new /obj/item/crowbar(src)

	..()

/obj/item/storage/backpack/satchel/flat/listening_post_secret_stash
	desc = "God, the stench from this thing is potent."

/obj/item/storage/backpack/satchel/flat/listening_post_secret_stash/PopulateContents()
	new /obj/item/seeds/cannabis(src)
	new /obj/item/food/grown/cannabis(src)
	new /obj/item/storage/box/donkpockets/donkpockethonk(src)
	new /obj/item/choice_beacon/pet(src)

	..()

/obj/item/storage/backpack/satchel/flat/empty/PopulateContents()
	return

/obj/item/storage/backpack/duffelbag
	name = "duffel bag"
	desc = "A large duffel bag for holding extra things."
	icon_state = "duffel"
	inhand_icon_state = "duffel"
	actions_types = list(/datum/action/item_action/zipper)
	storage_type = /datum/storage/duffel
	// How much to slow you down if your bag isn't zipped up
	var/zip_slowdown = 1
	/// If this bag is zipped (contents hidden) up or not
	/// Starts enabled so you're forced to interact with it to "get" it
	var/zipped_up = TRUE
	// How much time it takes to zip up (close) the duffelbag
	var/zip_up_duration = 0.5 SECONDS
	// Audio played during zipup
	var/zip_up_sfx = 'sound/items/zip/zip_up.ogg'
	// How much time it takes to unzip the duffel
	var/unzip_duration = 2.1 SECONDS
	// Audio played during unzip
	var/unzip_sfx = 'sound/items/zip/un_zip.ogg'

/obj/item/storage/backpack/duffelbag/Initialize(mapload)
	. = ..()
	set_zipper(TRUE)

/obj/item/storage/backpack/duffelbag/update_desc(updates)
	. = ..()
	desc = "[initial(desc)]<br>[zipped_up ? "It's zipped up, preventing you from accessing its contents." : "It's unzipped, and harder to move in."]"

/obj/item/storage/backpack/duffelbag/attack_self(mob/user, modifiers)
	if(loc != user) // God fuck TK
		return ..()
	if(zipped_up)
		return attack_hand(user, modifiers)
	else
		return attack_hand_secondary(user, modifiers)

/obj/item/storage/backpack/duffelbag/attack_self_secondary(mob/user, modifiers)
	attack_self(user, modifiers)
	return ..()

// If we're zipped, click to unzip
/obj/item/storage/backpack/duffelbag/attack_hand(mob/user, list/modifiers)
	if(loc != user)
		// Hacky, but please don't be cringe yeah?
		atom_storage.silent = TRUE
		. = ..()
		atom_storage.silent = initial(atom_storage.silent)
		return
	if(!zipped_up)
		return ..()

	balloon_alert(user, "unzipping...")
	playsound(src, unzip_sfx, 100, FALSE)
	var/datum/callback/can_unzip = CALLBACK(src, PROC_REF(zipper_matches), TRUE)
	if(!do_after(user, unzip_duration, src, extra_checks = can_unzip))
		user.balloon_alert(user, "unzip failed!")
		return
	balloon_alert(user, "unzipped")
	set_zipper(FALSE)
	return TRUE

// Vis versa
/obj/item/storage/backpack/duffelbag/attack_hand_secondary(mob/user, list/modifiers)
	if(loc != user)
		return ..()
	if(zipped_up)
		return SECONDARY_ATTACK_CALL_NORMAL

	balloon_alert(user, "zipping...")
	playsound(src, zip_up_sfx, 100, FALSE)
	var/datum/callback/can_zip = CALLBACK(src, PROC_REF(zipper_matches), FALSE)
	if(!do_after(user, zip_up_duration, src, extra_checks = can_zip))
		user.balloon_alert(user, "zip failed!")
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	balloon_alert(user, "zipped")
	set_zipper(TRUE)
	return SECONDARY_ATTACK_CONTINUE_CHAIN

/// Checks to see if the zipper matches the passed in state
/// Returns true if so, false otherwise
/obj/item/storage/backpack/duffelbag/proc/zipper_matches(matching_value)
	return zipped_up == matching_value

/obj/item/storage/backpack/duffelbag/proc/set_zipper(new_zip)
	zipped_up = new_zip
	SEND_SIGNAL(src, COMSIG_DUFFEL_ZIP_CHANGE, new_zip)
	if(zipped_up)
		slowdown = initial(slowdown)
		atom_storage.locked = STORAGE_SOFT_LOCKED
		atom_storage.display_contents = FALSE
		for(var/obj/item/weapon as anything in get_all_contents_type(/obj/item)) //close ui of this and all items inside dufflebag
			weapon.atom_storage?.close_all() //not everything has storage initialized
	else
		slowdown = zip_slowdown
		atom_storage.locked = STORAGE_NOT_LOCKED
		atom_storage.display_contents = TRUE

	if(isliving(loc))
		var/mob/living/wearer = loc
		wearer.update_equipment_speed_mods()
	update_appearance()

/obj/item/storage/backpack/duffelbag/cursed
	name = "living duffel bag"
	desc = "A cursed clown duffel bag that hungers for food of any kind. A warning label suggests that it eats food inside. \
		If that food happens to be a horribly ruined mess or the chef scrapped out of the microwave, or poisoned in some way, \
		then it might have negative effects on the bag..."
	icon_state = "duffel-curse"
	inhand_icon_state = "duffel-curse"
	zip_slowdown = 2
	max_integrity = 100

/obj/item/storage/backpack/duffelbag/cursed/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/curse_of_hunger, add_dropdel = TRUE)

/obj/item/storage/backpack/duffelbag/captain
	name = "captain's duffel bag"
	desc = "A large duffel bag for holding extra captainly goods."
	icon_state = "duffel-captain"
	inhand_icon_state = "duffel-captain"

/obj/item/storage/backpack/duffelbag/med
	name = "medical duffel bag"
	desc = "A large duffel bag for holding extra medical supplies."
	icon_state = "duffel-medical"
	inhand_icon_state = "duffel-med"

/obj/item/storage/backpack/duffelbag/coroner
	name = "coroner duffel bag"
	desc = "A large duffel bag for holding large amounts of organs at once."
	icon_state = "duffel-coroner"
	inhand_icon_state = "duffel-coroner"

/obj/item/storage/backpack/duffelbag/explorer
	name = "explorer duffel bag"
	desc = "A large duffel bag for holding extra exotic treasures."
	icon_state = "duffel-explorer"
	inhand_icon_state = "duffel-explorer"

/obj/item/storage/backpack/duffelbag/hydroponics
	name = "hydroponic's duffel bag"
	desc = "A large duffel bag for holding extra gardening tools."
	icon_state = "duffel-hydroponics"
	inhand_icon_state = "duffel-hydroponics"

/obj/item/storage/backpack/duffelbag/chemistry
	name = "chemistry duffel bag"
	desc = "A large duffel bag for holding extra chemical substances."
	icon_state = "duffel-chemistry"
	inhand_icon_state = "duffel-chemistry"

/obj/item/storage/backpack/duffelbag/genetics
	name = "geneticist's duffel bag"
	desc = "A large duffel bag for holding extra genetic mutations."
	icon_state = "duffel-genetics"
	inhand_icon_state = "duffel-genetics"

/obj/item/storage/backpack/duffelbag/science
	name = "scientist's duffel bag"
	desc = "A large duffel bag for holding extra scientific components."
	icon_state = "duffel-science"
	inhand_icon_state = "duffel-sci"

/obj/item/storage/backpack/duffelbag/virology
	name = "pathologist's duffel bag"
	desc = "A large duffel bag for holding extra viral bottles."
	icon_state = "duffel-virology"
	inhand_icon_state = "duffel-virology"

/obj/item/storage/backpack/duffelbag/sec
	name = "security duffel bag"
	desc = "A large duffel bag for holding extra security supplies and ammunition."
	icon_state = "duffel-security"
	inhand_icon_state = "duffel-sec"

/obj/item/storage/backpack/duffelbag/sec/surgery
	name = "surgical duffel bag"
	desc = "A large duffel bag for holding extra supplies - this one has a material inlay with space for various sharp-looking tools."

/obj/item/storage/backpack/duffelbag/sec/surgery/PopulateContents()
	new /obj/item/scalpel(src)
	new /obj/item/hemostat(src)
	new /obj/item/retractor(src)
	new /obj/item/circular_saw(src)
	new /obj/item/bonesetter(src)
	new /obj/item/surgicaldrill(src)
	new /obj/item/cautery(src)
	new /obj/item/surgical_drapes(src)
	new /obj/item/clothing/mask/surgical(src)
	new /obj/item/blood_filter(src)

/obj/item/storage/backpack/duffelbag/engineering
	name = "industrial duffel bag"
	desc = "A large duffel bag for holding extra tools and supplies."
	icon_state = "duffel-engineering"
	inhand_icon_state = "duffel-eng"
	resistance_flags = FIRE_PROOF

/obj/item/storage/backpack/duffelbag/drone
	name = "drone duffel bag"
	desc = "A large duffel bag for holding tools and hats."
	icon_state = "duffel-drone"
	inhand_icon_state = "duffel-drone"
	resistance_flags = FIRE_PROOF

/obj/item/storage/backpack/duffelbag/drone/PopulateContents()
	new /obj/item/screwdriver(src)
	new /obj/item/wrench(src)
	new /obj/item/weldingtool(src)
	new /obj/item/crowbar(src)
	new /obj/item/stack/cable_coil(src)
	new /obj/item/wirecutters(src)
	new /obj/item/multitool(src)

/obj/item/storage/backpack/duffelbag/clown
	name = "clown's duffel bag"
	desc = "A large duffel bag for holding lots of funny gags!"
	icon_state = "duffel-clown"
	inhand_icon_state = "duffel-clown"

/obj/item/storage/backpack/duffelbag/clown/cream_pie/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/food/pie/cream(src)

/obj/item/storage/backpack/fireproof
	resistance_flags = FIRE_PROOF

/obj/item/storage/backpack/duffelbag/syndie
	name = "suspicious looking duffel bag"
	desc = "A large duffel bag for holding extra tactical supplies. It contains an oiled plastitanium zipper for maximum speed tactical zipping, and is better balanced on your back than an average duffelbag. Can hold two bulky items!"
	icon_state = "duffel-syndie"
	inhand_icon_state = "duffel-syndieammo"
	storage_type = /datum/storage/duffel/syndicate
	resistance_flags = FIRE_PROOF
	// Less slowdown while unzipped. Still bulky, but it won't halve your movement speed in an active combat situation.
	zip_slowdown = 0.3
	// Faster unzipping. Utilizes the same noise as zipping up to fit the unzip duration.
	unzip_duration = 0.5 SECONDS
	unzip_sfx = 'sound/items/zip/zip_up.ogg'

/obj/item/storage/backpack/duffelbag/syndie/hitman
	desc = "A large duffel bag for holding extra things. There is a Nanotrasen logo on the back."
	icon_state = "duffel-syndieammo"
	inhand_icon_state = "duffel-syndieammo"

/obj/item/storage/backpack/duffelbag/syndie/hitman/PopulateContents()
	new /obj/item/clothing/under/costume/buttondown/slacks/service(src)
	new /obj/item/clothing/neck/tie/red/hitman(src)
	new /obj/item/clothing/accessory/waistcoat(src)
	new /obj/item/clothing/suit/toggle/lawyer/black(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/head/fedora(src)

/obj/item/storage/backpack/duffelbag/syndie/med
	name = "medical duffel bag"
	desc = "A large duffel bag for holding extra tactical medical supplies."
	icon_state = "duffel-syndiemed"
	inhand_icon_state = "duffel-syndiemed"

/obj/item/storage/backpack/duffelbag/syndie/surgery
	name = "surgery duffel bag"
	desc = "A suspicious looking duffel bag for holding surgery tools."
	icon_state = "duffel-syndiemed"
	inhand_icon_state = "duffel-syndiemed"

/obj/item/storage/backpack/duffelbag/syndie/surgery/PopulateContents()
	new /obj/item/scalpel/advanced(src)
	new /obj/item/retractor/advanced(src)
	new /obj/item/cautery/advanced(src)
	new /obj/item/surgical_drapes(src)
	new /obj/item/reagent_containers/medigel/sterilizine(src)
<<<<<<< HEAD
	new /obj/item/surgicaldrill(src)
=======
>>>>>>> tg-pr-88929
	new /obj/item/bonesetter(src)
	new /obj/item/blood_filter(src)
	new /obj/item/stack/medical/bone_gel(src)
	new /obj/item/stack/sticky_tape/surgical(src)
	new /obj/item/emergency_bed(src)
	new /obj/item/clothing/suit/jacket/straight_jacket(src)
	new /obj/item/clothing/mask/muzzle(src)
	new /obj/item/mmi/syndie(src)

/obj/item/storage/backpack/duffelbag/syndie/ammo
	name = "ammunition duffel bag"
	desc = "A large duffel bag for holding extra weapons ammunition and supplies."
	icon_state = "duffel-syndieammo"
	inhand_icon_state = "duffel-syndieammo"

/obj/item/storage/backpack/duffelbag/syndie/ammo/mech
	desc = "A large duffel bag, packed to the brim with various exosuit ammo."

/obj/item/storage/backpack/duffelbag/syndie/ammo/mech/PopulateContents()
	new /obj/item/mecha_ammo/scattershot(src)
	new /obj/item/mecha_ammo/scattershot(src)
	new /obj/item/mecha_ammo/scattershot(src)
	new /obj/item/mecha_ammo/scattershot(src)
	new /obj/item/storage/belt/utility/syndicate(src)

/obj/item/storage/backpack/duffelbag/syndie/ammo/mauler
	desc = "A large duffel bag, packed to the brim with various exosuit ammo."

/obj/item/storage/backpack/duffelbag/syndie/ammo/mauler/PopulateContents()
	new /obj/item/mecha_ammo/lmg(src)
	new /obj/item/mecha_ammo/lmg(src)
	new /obj/item/mecha_ammo/lmg(src)
	new /obj/item/mecha_ammo/missiles_srm(src)
	new /obj/item/mecha_ammo/missiles_srm(src)
	new /obj/item/mecha_ammo/missiles_srm(src)
	new /obj/item/compression_kit(src)
	new /obj/item/compression_kit(src)

<<<<<<< HEAD
/obj/item/storage/backpack/duffelbag/syndie/c20rbundle
	desc = "A large duffel bag containing a C-20r, some magazines, and a cheap looking suppressor."

/obj/item/storage/backpack/duffelbag/syndie/c20rbundle/PopulateContents()
	new /obj/item/ammo_box/magazine/smgm45(src)
	new /obj/item/ammo_box/magazine/smgm45(src)
	new /obj/item/ammo_box/magazine/smgm45(src)
	new /obj/item/gun/ballistic/automatic/c20r(src)
	new /obj/item/suppressor(src)

/obj/item/storage/backpack/duffelbag/syndie/bulldogbundle
	desc = "A large duffel bag containing a Bulldog, some drums, and a pair of thermal imaging glasses."

/obj/item/storage/backpack/duffelbag/syndie/bulldogbundle/PopulateContents()
	new /obj/item/gun/ballistic/shotgun/bulldog(src)
	new /obj/item/ammo_box/magazine/m12g(src)
	new /obj/item/ammo_box/magazine/m12g(src)
	new /obj/item/clothing/glasses/thermal/syndi(src)

=======
>>>>>>> tg-pr-88929
/obj/item/storage/backpack/duffelbag/syndie/med/medicalbundle
	desc = "A large duffel bag containing a medical equipment, a Donksoft LMG, a big jumbo box of riot darts, and a magboot MODsuit module."

/obj/item/storage/backpack/duffelbag/syndie/med/medicalbundle/PopulateContents()
	new /obj/item/mod/module/magboot(src)
	new /obj/item/storage/medkit/tactical/premium(src)
	new /obj/item/gun/ballistic/automatic/l6_saw/toy(src)
	new /obj/item/ammo_box/foambox/riot(src)

/obj/item/storage/backpack/duffelbag/syndie/med/bioterrorbundle
	desc = "A large duffel bag containing deadly chemicals, a handheld chem sprayer, Bioterror foam grenade, a Donksoft assault rifle, box of riot grade darts, a dart pistol, and a box of syringes."

/obj/item/storage/backpack/duffelbag/syndie/med/bioterrorbundle/PopulateContents()
	new /obj/item/reagent_containers/spray/chemsprayer/bioterror(src)
	new /obj/item/storage/box/syndie_kit/chemical(src)
	new /obj/item/gun/syringe/syndicate(src)
	new /obj/item/gun/ballistic/automatic/c20r/toy(src)
	new /obj/item/storage/box/syringes(src)
	new /obj/item/ammo_box/foambox/riot(src)
	// MONKESTATION EDIT START
	// MONKESTATION EDIT ORIGINAL new /obj/item/grenade/chem_grenade/bioterrorfoam(src)
	new /obj/item/grenade/chem_grenade/large/bioterrorfoam(src)
	// MONKESTATION EDIT END
	if(prob(5))
		new /obj/item/food/pizza/pineapple(src)

/obj/item/storage/backpack/duffelbag/syndie/c4/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/grenade/c4(src)

/obj/item/storage/backpack/duffelbag/syndie/x4/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/grenade/c4/x4(src)

/obj/item/storage/backpack/duffelbag/syndie/firestarter
	desc = "A large duffel bag containing a New Russian pyro backpack sprayer, Elite MODsuit, a Stechkin APS pistol, minibomb, ammo, and other equipment."

/obj/item/storage/backpack/duffelbag/syndie/firestarter/PopulateContents()
	new /obj/item/clothing/under/syndicate/soviet(src)
	new /obj/item/mod/control/pre_equipped/elite/flamethrower(src)
	new /obj/item/gun/ballistic/automatic/pistol/aps(src)
	new /obj/item/ammo_box/magazine/m9mm_aps/fire(src)
	new /obj/item/ammo_box/magazine/m9mm_aps/fire(src)
	new /obj/item/reagent_containers/cup/glass/bottle/vodka/badminka(src)
	new /obj/item/reagent_containers/hypospray/medipen/stimulants(src)
	new /obj/item/grenade/syndieminibomb(src)

// For ClownOps.
/obj/item/storage/backpack/duffelbag/clown/syndie
	storage_type = /datum/storage/duffel/syndicate

/obj/item/storage/backpack/duffelbag/clown/syndie/PopulateContents()
	new /obj/item/modular_computer/pda/clown(src)
	new /obj/item/clothing/under/rank/civilian/clown(src)
	new /obj/item/clothing/shoes/clown_shoes(src)
	new /obj/item/clothing/mask/gas/clown_hat(src)
	new /obj/item/bikehorn(src)
	new /obj/item/implanter/sad_trombone(src)

/obj/item/storage/backpack/henchmen
	name = "wings"
	desc = "Granted to the henchmen who deserve it. This probably doesn't include you."
	icon_state = "henchmen"
	inhand_icon_state = null

/obj/item/storage/backpack/duffelbag/cops
	name = "police bag"
	desc = "A large duffel bag for holding extra police gear."

/obj/item/storage/backpack/duffelbag/mining_conscript
	name = "mining conscription kit"
	desc = "A duffel bag containing everything a crewmember needs to support a shaft miner in the field."
	icon_state = "duffel-explorer"
	inhand_icon_state = "duffel-explorer"

/obj/item/storage/backpack/duffelbag/mining_conscript/PopulateContents()
	new /obj/item/clothing/glasses/meson(src)
	new /obj/item/t_scanner/adv_mining_scanner/lesser(src)
	new /obj/item/storage/bag/ore(src)
	new /obj/item/clothing/suit/hooded/explorer(src)
	new /obj/item/encryptionkey/headset_mining(src)
	new /obj/item/clothing/mask/gas/explorer(src)
	new /obj/item/card/id/advanced/mining(src)
	new /obj/item/gun/energy/recharge/kinetic_accelerator(src)
	new /obj/item/knife/combat/survival(src)
	new /obj/item/flashlight/seclite(src)

<<<<<<< HEAD
/obj/item/storage/backpack/cursed
	name = "Dirty Duffelbag"
	desc = "A cursed backpack"
	icon_state = "duffel-explorer"
	inhand_icon_state = "duffel-explorer"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/item/storage/backpack/cursed/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, "slasher")

// Special Mining Backpacks

/obj/item/storage/backpack/rockspider
	name = "Rockspider Pack"
	desc = "A surprisingly flexible and durable bag, capable of carrying up to three mining guns at once, for those who prowl the wastes with a passion for marksmanship. Due to its flexibility, it doesn't interfere with movement as badly as most bags when paired with a satchel."
	icon_state = "rockspider"
	inhand_icon_state = "backpack"
	satchel_movespeed_modifier = PAIRED_STORAGE_LIGHT_SLOWDOWN

/obj/item/storage/backpack/rockspider/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 3
	atom_storage.max_specific_storage = WEIGHT_CLASS_HUGE
	atom_storage.set_holdable(list(
		/obj/item/gun/ballistic/shotgun/autoshotgun,
		/obj/item/gun/ballistic/automatic/proto/pksmg/kineticlmg,
		/obj/item/gun/ballistic/shotgun/doublebarrel/kinetic,
		/obj/item/gun/ballistic/automatic/proto/pksmg,
		/obj/item/gun/ballistic/revolver/grenadelauncher/kinetic,
		/obj/item/gun/ballistic/rifle/minerjdj,
		/obj/item/gun/ballistic/revolver/govmining,
		/obj/item/gun/energy/recharge/kinetic_accelerator,
		/obj/item/gun/energy/recharge/kinetic_accelerator/glock,
		/obj/item/gun/energy/recharge/kinetic_accelerator/railgun,
		/obj/item/gun/energy/recharge/kinetic_accelerator/repeater,
		/obj/item/gun/energy/recharge/kinetic_accelerator/shockwave,
	))
	atom_storage.max_total_storage = 100

/obj/item/storage/backpack/ashduelist
	name = "Ashen Duelist Pack"
	desc = "A bag with a mount and holster, capable of carrying any crusher type weapon and a gun, for the aspiring duelist who needs a bit more than just a blade. Due to its flexibility, it doesn't interfere with movement as badly as most bags when paired with a satchel."
	icon_state = "ashenduelist"
	inhand_icon_state = "backpack"
	satchel_movespeed_modifier = PAIRED_STORAGE_LIGHT_SLOWDOWN

/obj/item/storage/backpack/ashduelist/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 2
	atom_storage.max_specific_storage = WEIGHT_CLASS_HUGE
	atom_storage.set_holdable(list(
		/obj/item/gun/ballistic/shotgun/autoshotgun,
		/obj/item/gun/ballistic/automatic/proto/pksmg/kineticlmg,
		/obj/item/gun/ballistic/shotgun/doublebarrel/kinetic,
		/obj/item/gun/ballistic/automatic/proto/pksmg,
		/obj/item/gun/ballistic/revolver/grenadelauncher/kinetic,
		/obj/item/gun/ballistic/rifle/minerjdj,
		/obj/item/gun/ballistic/revolver/govmining,
		/obj/item/gun/energy/recharge/kinetic_accelerator,
		/obj/item/gun/energy/recharge/kinetic_accelerator/glock,
		/obj/item/gun/energy/recharge/kinetic_accelerator/railgun,
		/obj/item/gun/energy/recharge/kinetic_accelerator/repeater,
		/obj/item/gun/energy/recharge/kinetic_accelerator/shockwave,
		/obj/item/kinetic_crusher,
		/obj/item/kinetic_crusher/machete,
		/obj/item/kinetic_crusher/spear,
		/obj/item/kinetic_crusher/hammer,
		/obj/item/kinetic_crusher/claw,
		/obj/item/kinetic_crusher/pilebunker,
		/obj/item/kinetic_crusher/knives,
		/obj/item/kinetic_crusher/sickle,
	))
	atom_storage.max_total_storage = 100

/obj/item/storage/backpack/trenchjockey
	name = "Trench Jockey Pack"
	desc = "A exceptionally spacious bag full of slots and pouches for different kinds of ammunition, for those who really need more than just one extra round. Despite its weight, it fits incredibly well with a satchel, and does not hinder your movement as much as a regular backpack would."
	icon_state = "trenchjockey"
	inhand_icon_state = "backpack"
	satchel_movespeed_modifier = PAIRED_STORAGE_LIGHT_SLOWDOWN

/obj/item/storage/backpack/trenchjockey/Initialize(mapload)
	. = ..()
	atom_storage.max_slots = 14 //TWO whole rows to fill with ammo, this should be PLENTY, if you run out you either spent way to long on lavaland and should go touch grass, or you have a TREMENDOUS skill issue
	atom_storage.max_specific_storage = WEIGHT_CLASS_HUGE
	atom_storage.set_holdable(list( //all the ammo for mining guns can be stored in here, but nothing else.
		/obj/item/ammo_box/magazine/pksmgmag,
		/obj/item/storage/box/kinetic,
		/obj/item/ammo_box/magazine/autoshotgun,
		/obj/item/ammo_casing/shotgun/hydrakinetic,
		/obj/item/storage/box/kinetic/autoshotgun,
		/obj/item/storage/box/kinetic/autoshotgun/smallcase,
		/obj/item/ammo_casing/a762/kinetic,
		/obj/item/ammo_box/a762/kinetic,
		/obj/item/storage/box/kinetic/kineticlmg,
		/obj/item/ammo_casing/a40mm/kinetic,
		/obj/item/storage/box/kinetic/grenadelauncher,
		/obj/item/ammo_casing/govmining,
		/obj/item/ammo_box/govmining,
		/obj/item/storage/box/kinetic/govmining,
		/obj/item/ammo_casing/minerjdj,
		/obj/item/ammo_casing/shotgun/kinetic,
		/obj/item/ammo_casing/shotgun/kinetic/sniperslug,
		/obj/item/ammo_casing/shotgun/kinetic/rockbreaker,
		/obj/item/storage/box/kinetic/shotgun,
		/obj/item/storage/box/kinetic/shotgun/sniperslug,
		/obj/item/storage/box/kinetic/shotgun/rockbreaker
	),
	list( //cant hold these
		/obj/item/storage/box/kinetic/govmining/bigcase,
		/obj/item/storage/box/kinetic/autoshotgun/bigcase,
		/obj/item/storage/box/kinetic/kineticlmg/bigcase,
		/obj/item/storage/box/kinetic/grenadelauncher/bigcase,
		/obj/item/storage/box/kinetic/minerjdj/bigcase, //just incase...
		/obj/item/storage/box/kinetic/shotgun/bigcase,
		/obj/item/storage/box/pksmg //also just incase...
	))

	atom_storage.max_total_storage = 100
=======
/*
 * Messenger Bag Types
 */

/obj/item/storage/backpack/messenger
	name = "messenger bag"
	desc = "A trendy looking messenger bag; sometimes known as a courier bag. Fashionable and portable."
	icon_state = "messenger"
	inhand_icon_state = "messenger"
	icon = 'icons/obj/storage/backpack.dmi'
	worn_icon = 'icons/mob/clothing/back/backpack.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'

/obj/item/storage/backpack/messenger/eng
	name = "industrial messenger bag"
	desc = "A tough messenger bag made of advanced treated leather for fireproofing. It also has more pockets than usual."
	icon_state = "messenger_engineering"
	inhand_icon_state = "messenger_engineering"
	resistance_flags = FIRE_PROOF

/obj/item/storage/backpack/messenger/med
	name = "medical messenger bag"
	desc = "A sterile messenger bag well loved by medics for its portability and sleek profile."
	icon_state = "messenger_medical"
	inhand_icon_state = "messenger_medical"

/obj/item/storage/backpack/messenger/vir
	name = "virologist messenger bag"
	desc = "A sterile messenger bag with virologist colours, useful for deploying biohazards in record times."
	icon_state = "messenger_virology"
	inhand_icon_state = "messenger_virology"

/obj/item/storage/backpack/messenger/chem
	name = "chemist messenger bag"
	desc = "A sterile messenger bag with chemist colours, good for getting to your alleyway deals on time."
	icon_state = "messenger_chemistry"
	inhand_icon_state = "messenger_chemistry"

/obj/item/storage/backpack/messenger/coroner
	name = "coroner messenger bag"
	desc = "A messenger bag used to sneak your way out of graveyards at a good pace."
	icon_state = "messenger_coroner"
	inhand_icon_state = "messenger_coroner"

/obj/item/storage/backpack/messenger/gen
	name = "geneticist messenger bag"
	desc = "A sterile messenger bag with geneticist colours, making a remarkably cute accessory for hulks."
	icon_state = "messenger_genetics"
	inhand_icon_state = "messenger_genetics"

/obj/item/storage/backpack/messenger/science
	name = "scientist messenger bag"
	desc = "Useful for holding research materials, and for speeding your way to different scan objectives."
	icon_state = "messenger_science"
	inhand_icon_state = "messenger_science"

/obj/item/storage/backpack/messenger/hyd
	name = "botanist messenger bag"
	desc = "A messenger bag made of all natural fibers, great for getting to the sesh in time."
	icon_state = "messenger_hydroponics"
	inhand_icon_state = "messenger_hydroponics"

/obj/item/storage/backpack/messenger/sec
	name = "security messenger bag"
	desc = "A robust messenger bag for security related needs."
	icon_state = "messenger_security"
	inhand_icon_state = "messenger_security"

/obj/item/storage/backpack/messenger/explorer
	name = "explorer messenger bag"
	desc = "A robust messenger bag for stashing your loot, as well as making a remarkably cute accessory for your drakebone armor."
	icon_state = "messenger_explorer"
	inhand_icon_state = "messenger_explorer"

/obj/item/storage/backpack/messenger/cap
	name = "captain's messenger bag"
	desc = "An exclusive messenger bag for Nanotrasen officers, made of real whale leather."
	icon_state = "messenger_captain"
	inhand_icon_state = "messenger_captain"

/obj/item/storage/backpack/messenger/clown
	name = "Giggles von Honkerton Jr."
	desc = "The latest in storage 'technology' from Honk Co. Hey, how does this fit so much with such a small profile anyway? The wearer will definitely never tell you."
	icon_state = "messenger_clown"
	inhand_icon_state = "messenger_clown"
>>>>>>> tg-pr-88929
