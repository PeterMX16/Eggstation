/obj/item/bodypart/head/moth
<<<<<<< HEAD
	icon_greyscale = 'icons/mob/species/moth/bodyparts_greyscale.dmi'
	icon_static = 'icons/mob/species/moth/bodyparts.dmi'
	limb_id = SPECIES_MOTH
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	head_flags = HEAD_LIPS |HEAD_EYESPRITES |HEAD_EYEHOLES | HEAD_DEBRAIN | HEAD_HAIR
	bodypart_traits = list(TRAIT_ANTENNAE)
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/chest/moth
	icon_greyscale = 'icons/mob/species/moth/bodyparts_greyscale.dmi'
	icon_static = 'icons/mob/species/moth/bodyparts.dmi'
	limb_id = SPECIES_MOTH
	is_dimorphic = TRUE
	should_draw_greyscale = FALSE
	wing_types = list(/obj/item/organ/external/wings/functional/moth/megamoth, /obj/item/organ/external/wings/functional/moth/mothra)
	bodypart_traits = list(TRAIT_TACKLING_WINGED_ATTACKER)
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/arm/left/moth
	icon_greyscale = 'icons/mob/species/moth/bodyparts_greyscale.dmi'
	icon_static = 'icons/mob/species/moth/bodyparts.dmi'
=======
	icon = 'icons/mob/human/species/moth/bodyparts.dmi'
	icon_state = "moth_head"
	icon_static = 'icons/mob/human/species/moth/bodyparts.dmi'
	limb_id = SPECIES_MOTH
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	head_flags = HEAD_LIPS|HEAD_EYESPRITES|HEAD_EYEHOLES|HEAD_DEBRAIN //what the fuck, moths have lips?
	teeth_count = 0
	bodypart_traits = list(TRAIT_ANTENNAE)

/obj/item/bodypart/chest/moth
	icon = 'icons/mob/human/species/moth/bodyparts.dmi'
	icon_state = "moth_chest_m"
	icon_static = 'icons/mob/human/species/moth/bodyparts.dmi'
	limb_id = SPECIES_MOTH
	is_dimorphic = TRUE
	should_draw_greyscale = FALSE
	wing_types = list(/obj/item/organ/wings/functional/moth/megamoth, /obj/item/organ/wings/functional/moth/mothra)
	bodypart_traits = list(TRAIT_TACKLING_WINGED_ATTACKER)

/obj/item/bodypart/chest/moth/get_butt_sprite()
	return icon('icons/mob/butts.dmi', BUTT_SPRITE_FUZZY)

/obj/item/bodypart/arm/left/moth
	icon = 'icons/mob/human/species/moth/bodyparts.dmi'
	icon_state = "moth_l_arm"
	icon_static = 'icons/mob/human/species/moth/bodyparts.dmi'
>>>>>>> tg-pr-88929
	limb_id = SPECIES_MOTH
	should_draw_greyscale = FALSE
	unarmed_attack_verbs = list("slash")
	grappled_attack_verb = "lacerate"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
<<<<<<< HEAD
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/arm/right/moth
	icon_greyscale = 'icons/mob/species/moth/bodyparts_greyscale.dmi'
	icon_static = 'icons/mob/species/moth/bodyparts.dmi'
=======
	unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'

/obj/item/bodypart/arm/right/moth
	icon = 'icons/mob/human/species/moth/bodyparts.dmi'
	icon_state = "moth_r_arm"
	icon_static = 'icons/mob/human/species/moth/bodyparts.dmi'
>>>>>>> tg-pr-88929
	limb_id = SPECIES_MOTH
	should_draw_greyscale = FALSE
	unarmed_attack_verbs = list("slash")
	grappled_attack_verb = "lacerate"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
<<<<<<< HEAD
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/leg/left/moth
	icon_greyscale = 'icons/mob/species/moth/bodyparts_greyscale.dmi'
	icon_static = 'icons/mob/species/moth/bodyparts.dmi'
=======
	unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'

/obj/item/bodypart/leg/left/moth
	icon = 'icons/mob/human/species/moth/bodyparts.dmi'
	icon_state = "moth_l_leg"
	icon_static = 'icons/mob/human/species/moth/bodyparts.dmi'
	limb_id = SPECIES_MOTH
>>>>>>> tg-pr-88929
	should_draw_greyscale = FALSE
	limb_id = SPECIES_MOTH
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/leg/right/moth
<<<<<<< HEAD
	icon_greyscale = 'icons/mob/species/moth/bodyparts_greyscale.dmi'
	icon_static = 'icons/mob/species/moth/bodyparts.dmi'
=======
	icon = 'icons/mob/human/species/moth/bodyparts.dmi'
	icon_state = "moth_r_leg"
	icon_static = 'icons/mob/human/species/moth/bodyparts.dmi'
	limb_id = SPECIES_MOTH
>>>>>>> tg-pr-88929
	should_draw_greyscale = FALSE
	limb_id = SPECIES_MOTH
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR
