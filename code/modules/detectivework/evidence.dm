//CONTAINS: Evidence bags

/obj/item/evidencebag
	name = "evidence bag"
	desc = "An empty evidence bag."
	icon = 'icons/obj/storage/storage.dmi'
	icon_state = "evidenceobj"
	inhand_icon_state = ""
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON
<<<<<<< HEAD

/obj/item/evidencebag/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(interacting_with == loc || !isitem(interacting_with) || HAS_TRAIT(interacting_with, TRAIT_COMBAT_MODE_SKIP_INTERACTION))
		return NONE
	if(evidencebagEquip(interacting_with, user))
		return ITEM_INTERACT_SUCCESS
	return NONE

/obj/item/evidencebag/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	if(evidencebagEquip(tool, user))
		return ITEM_INTERACT_SUCCESS
	return NONE

/obj/item/evidencebag/handle_atom_del(atom/A)
	cut_overlays()
	w_class = initial(w_class)
	icon_state = initial(icon_state)
	desc = initial(desc)

/obj/item/evidencebag/proc/evidencebagEquip(obj/item/I, mob/user)
	if(!istype(I) || I.anchored)
		return FALSE

	if(loc.atom_storage && I.atom_storage)
		to_chat(user, span_warning("No matter what way you try, you can't get [I] to fit inside [src]."))
		return TRUE //begone infinite storage ghosts, begone from me

	if(HAS_TRAIT(I, TRAIT_NO_STORAGE_INSERT))
		to_chat(user, span_warning("No matter what way you try, you can't get [I] to fit inside [src]."))
		return TRUE

	if(istype(I, /obj/item/evidencebag))
		to_chat(user, span_warning("You find putting an evidence bag in another evidence bag to be slightly absurd."))
		return TRUE //now this is podracing

	if(loc in I.get_all_contents()) // fixes tg #39452, evidence bags could store their own location, causing I to be stored in the bag while being present inworld still, and able to be teleported when removed.
		to_chat(user, span_warning("You find putting [I] in [src] while it's still inside it quite difficult!"))
		return TRUE

	if(I.w_class > WEIGHT_CLASS_NORMAL)
		to_chat(user, span_warning("[I] won't fit in [src]!"))
		return TRUE

	if(contents.len)
		to_chat(user, span_warning("[src] already has something inside it!"))
		return TRUE

	if(!isturf(I.loc)) //If it isn't on the floor. Do some checks to see if it's in our hands or a box. Otherwise give up.
		if(I.loc.atom_storage) //in a container.
			I.loc.atom_storage.remove_single(user, I, src)
		if(!user.is_holding(I) || HAS_TRAIT(I, TRAIT_NODROP))
			return TRUE

	if(QDELETED(I))
		return TRUE

	user.visible_message(span_notice("[user] puts [I] into [src]."), span_notice("You put [I] inside [src]."),\
	span_hear("You hear a rustle as someone puts something into a plastic bag."))

=======
	drop_sound = 'sound/items/evidence_bag/evidence_bag_drop.ogg'
	pickup_sound = 'sound/items/evidence_bag/evidence_bag_pickup.ogg'
	sound_vary = TRUE

/obj/item/evidencebag/Initialize(mapload)
	. = ..()
	create_storage(
		max_slots = 1,
		max_specific_storage = WEIGHT_CLASS_NORMAL,
	)
	atom_storage.allow_quick_gather = TRUE
	atom_storage.collection_mode = COLLECT_ONE
	RegisterSignal(atom_storage, COMSIG_STORAGE_STORED_ITEM, PROC_REF(on_insert))
	RegisterSignal(atom_storage, COMSIG_STORAGE_REMOVED_ITEM, PROC_REF(on_remove))
	atom_storage.rustle_sound = 'sound/items/evidence_bag/evidence_bag_zip.ogg'
	atom_storage.remove_rustle_sound = 'sound/items/evidence_bag/evidence_bag_unzip.ogg'

/obj/item/evidencebag/update_desc(updates)
	. = ..()
	if(!atom_storage.get_total_weight())
		desc = src::desc
		return
	var/obj/item/inserted = locate(/obj/item) in atom_storage.real_location
	desc = "An evidence bag containing [inserted]. [inserted.desc]"

/obj/item/evidencebag/update_icon_state()
	. = ..()
	if(!atom_storage.get_total_weight())
		icon_state = "evidenceobj"
		return
>>>>>>> tg-pr-88929
	icon_state = "evidence"

/obj/item/evidencebag/update_overlays()
	. = ..()
	if(!atom_storage.get_total_weight())
		return
	var/obj/item/inserted = locate(/obj/item) in atom_storage.real_location
	var/mutable_appearance/in_evidence = new(inserted)
	in_evidence.plane = FLOAT_PLANE
	in_evidence.layer = FLOAT_LAYER
	in_evidence.pixel_x = 0
	in_evidence.pixel_y = 0
	. += in_evidence
	. += "evidence"

<<<<<<< HEAD
	desc = "An evidence bag containing [I]. [I.desc]"
	I.forceMove(src)
	update_weight_class(I.w_class)
	return TRUE
=======
/obj/item/evidencebag/proc/on_insert(datum/storage/storage, obj/item/to_insert, mob/user, force)
	SIGNAL_HANDLER

	update_weight_class(to_insert.w_class)

/obj/item/evidencebag/proc/on_remove(datum/storage/storage, obj/item/to_remove, atom/remove_to_loc, silent)
	SIGNAL_HANDLER

	if(!atom_storage.get_total_weight())
		return

	update_weight_class(WEIGHT_CLASS_TINY)
>>>>>>> tg-pr-88929

/obj/item/evidencebag/attack_self(mob/user)
	if(!atom_storage.get_total_weight())
		to_chat(user, span_notice("[src] is empty."))
		return
	user.visible_message(span_notice("[user] empties [src]."), span_notice("You empty [src]."),\
	span_hear("You hear someone rustle around in a plastic bag, and remove something."))
	playsound(src,'sound/items/evidence_bag/evidence_bag_unzip.ogg', 50, TRUE, SHORT_RANGE_SOUND_EXTRARANGE, ignore_walls = FALSE)
	atom_storage.remove_all()

/obj/item/storage/box/evidence
	name = "evidence bag box"
	desc = "A box claiming to contain evidence bags."

/obj/item/storage/box/evidence/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/evidencebag(src)
