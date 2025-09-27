///A lizards spines (those things on their back), but also including tail spines (gasp)
/obj/item/organ/spines
	name = "lizard spines"
	desc = "Not an actual spine, obviously."
	icon_state = "spines"

	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_EXTERNAL_SPINES

	preference = "feature_lizard_spines"

	dna_block = DNA_SPINES_BLOCK
	restyle_flags = EXTERNAL_RESTYLE_FLESH

	bodypart_overlay = /datum/bodypart_overlay/mutant/spines

	organ_flags = parent_type::organ_flags | ORGAN_EXTERNAL

<<<<<<< HEAD
/obj/item/organ/external/spines/Insert(mob/living/carbon/receiver, special, drop_if_replaced)
	. = ..()
	if(.)
		paired_tail = locate(/obj/item/organ/external/tail/lizard) in receiver.organs //We want specifically a lizard tail, so we don't use the slot.
		paired_tail?.paired_spines = src
=======
/obj/item/organ/spines/on_mob_insert(mob/living/carbon/receiver, special, movement_flags)
	// If we have a tail, attempt to add a tail spines overlay
	var/obj/item/organ/tail/our_tail = receiver.get_organ_slot(ORGAN_SLOT_EXTERNAL_TAIL)
	our_tail?.try_insert_tail_spines(our_tail.bodypart_owner)
	return ..()
>>>>>>> tg-pr-88929

/obj/item/organ/spines/on_mob_remove(mob/living/carbon/organ_owner, special, movement_flags)
	// If we have a tail, remove any tail spines overlay
	var/obj/item/organ/tail/our_tail = organ_owner.get_organ_slot(ORGAN_SLOT_EXTERNAL_TAIL)
	our_tail?.remove_tail_spines(our_tail.bodypart_owner)
	return ..()

///Bodypart overlay for spines
/datum/bodypart_overlay/mutant/spines
	layers = EXTERNAL_ADJACENT|EXTERNAL_BEHIND
	feature_key = "spines"
	dyable = TRUE

/datum/bodypart_overlay/mutant/spines/get_global_feature_list()
<<<<<<< HEAD
	return GLOB.spines_list

/datum/bodypart_overlay/mutant/spines/get_base_icon_state()
	return (wagging ? "wagging_" : "") + sprite_datum.icon_state //add the wagging tag if we be wagging
=======
	return SSaccessories.spines_list
>>>>>>> tg-pr-88929

/datum/bodypart_overlay/mutant/spines/can_draw_on_bodypart(mob/living/carbon/human/human)
	. = ..()
	if(human.wear_suit && (human.wear_suit.flags_inv & HIDEJUMPSUIT))
		return FALSE

/datum/bodypart_overlay/mutant/spines/set_dye_color(new_color, obj/item/organ/tail/organ)
	var/obj/item/organ/tail/tail = organ?.owner.get_organ_slot(ORGAN_SLOT_EXTERNAL_TAIL)
	tail?.tail_spines_overlay?.set_dye_color(new_color, organ)
	return ..()
