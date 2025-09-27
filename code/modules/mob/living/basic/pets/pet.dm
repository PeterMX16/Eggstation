/mob/living/basic/pet
	icon = 'icons/mob/simple/pets.dmi'
	mob_size = MOB_SIZE_SMALL
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	blood_volume = BLOOD_VOLUME_NORMAL
	/// if the mob is protected from being renamed by collars.
	var/unique_pet = FALSE

<<<<<<< HEAD
	/// Our collar
	var/obj/item/clothing/neck/petcollar/collar
	var/static/list/pet_foods = list(
		/obj/item/food/
	)

/mob/living/basic/pet/Initialize(mapload)
	. = ..()

	/// Can set the collar var beforehand to start the pet with a collar.
	if(collar)
		collar = new(src)
	add_traits(list(TRAIT_ADVANCEDTOOLUSER, TRAIT_CAN_STRIP), ROUNDSTART_TRAIT)
	AddElement(/datum/element/dextrous)
	AddElement(/datum/element/footstep, FOOTSTEP_MOB_BAREFOOT)
	AddElement(/datum/element/basic_eating, heal_amt = 10, food_types = pet_foods)
	AddComponent(/datum/component/personal_crafting)
	update_icon(UPDATE_OVERLAYS)

/mob/living/basic/pet/Destroy()
	. = ..()

	QDEL_NULL(collar)

/mob/living/basic/pet/attackby(obj/item/thing, mob/user, params)
	if(istype(thing, /obj/item/clothing/neck/petcollar) && !collar)
		add_collar(thing, user)
		return TRUE

	if(istype(thing, /obj/item/newspaper) && !stat)
		user.visible_message(span_notice("[user] baps [name] on the nose with the rolled up [thing]."))
		dance_rotate(src)
		return TRUE

	return ..()

/mob/living/basic/pet/update_overlays()
	. = ..()

	if(!collar || !collar_icon_state)
		return

	// Determine which status tag to add to the middle of the icon state.
	var/dead_tag = (stat == DEAD || HAS_TRAIT(src, TRAIT_FAKEDEATH)) ? "_dead" : null
	var/rest_tag = has_collar_resting_icon_state && resting ? "_rest" : null
	var/stat_tag = dead_tag || rest_tag || ""

	. += mutable_appearance(icon, "[collar_icon_state][stat_tag]collar")
	. += mutable_appearance(icon, "[collar_icon_state][stat_tag]tag")

/mob/living/basic/pet/gib(no_brain, no_organs, no_bodyparts, safe_gib = TRUE)
	remove_collar(drop_location(), update_visuals = FALSE)
	return ..()

/mob/living/basic/pet/revive(full_heal_flags = NONE, excess_healing = 0, force_grab_ghost = FALSE)
	. = ..()
	if(!.)
		return

	update_icon(UPDATE_OVERLAYS)
=======
>>>>>>> tg-pr-88929

/mob/living/basic/pet/death(gibbed)
	. = ..()
	add_memory_in_range(src, 7, /datum/memory/pet_died, deuteragonist = src) //Protagonist is the person memorizing it


