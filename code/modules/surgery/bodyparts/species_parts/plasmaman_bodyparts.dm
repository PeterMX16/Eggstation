/obj/item/bodypart/head/plasmaman
	icon = 'icons/mob/human/species/plasmaman/bodyparts.dmi'
	icon_state = "plasmaman_head"
	icon_static = 'icons/mob/human/species/plasmaman/bodyparts.dmi'
	biological_state = BIO_BONE
	limb_id = SPECIES_PLASMAMAN
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	burn_modifier = 1.5
	brute_modifier = 1.5
=======
	brute_modifier = 1.5 //Plasmemes are weak
	burn_modifier = 1.5 //Plasmemes are weak
	head_flags = HEAD_EYESPRITES
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/head/plasmaman/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/self_ignition)
>>>>>>> tg-pr-88929

//MONKESTATION ADDITION START
/*
	head_flags = HEAD_EYESPRITES
*/
	head_flags = HEAD_EYESPRITES | HEAD_HAIR
// MONKESTATION ADDITION END
/obj/item/bodypart/chest/plasmaman
	icon = 'icons/mob/human/species/plasmaman/bodyparts.dmi'
	icon_state = "plasmaman_chest"
	icon_static = 'icons/mob/human/species/plasmaman/bodyparts.dmi'
	biological_state = BIO_BONE
	limb_id = SPECIES_PLASMAMAN
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	ass_image = 'icons/ass/assplasma.png'
	burn_modifier = 1.5
	brute_modifier = 1.5
=======
	brute_modifier = 1.5 //Plasmemes are weak
	burn_modifier = 1.5 //Plasmemes are weak
	bodypart_flags = BODYPART_UNHUSKABLE
	wing_types = null

/obj/item/bodypart/chest/plasmaman/get_butt_sprite()
	return icon('icons/mob/butts.dmi', BUTT_SPRITE_PLASMA)

/obj/item/bodypart/chest/plasmaman/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/self_ignition)
>>>>>>> tg-pr-88929

/obj/item/bodypart/arm/left/plasmaman
	icon = 'icons/mob/human/species/plasmaman/bodyparts.dmi'
	icon_state = "plasmaman_l_arm"
<<<<<<< HEAD
	icon_static = 'icons/mob/species/plasmaman/bodyparts.dmi'
=======
	icon_static = 'icons/mob/human/species/plasmaman/bodyparts.dmi'
>>>>>>> tg-pr-88929
	biological_state = (BIO_BONE|BIO_JOINTED)
	limb_id = SPECIES_PLASMAMAN
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	burn_modifier = 1.5
	brute_modifier = 1.5
=======
	brute_modifier = 1.5 //Plasmemes are weak
	burn_modifier = 1.5 //Plasmemes are weak
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/arm/left/plasmaman/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/self_ignition)
>>>>>>> tg-pr-88929

/obj/item/bodypart/arm/right/plasmaman
	icon = 'icons/mob/human/species/plasmaman/bodyparts.dmi'
	icon_state = "plasmaman_r_arm"
<<<<<<< HEAD
	icon_static = 'icons/mob/species/plasmaman/bodyparts.dmi'
=======
	icon_static = 'icons/mob/human/species/plasmaman/bodyparts.dmi'
>>>>>>> tg-pr-88929
	biological_state = (BIO_BONE|BIO_JOINTED)
	limb_id = SPECIES_PLASMAMAN
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	burn_modifier = 1.5
	brute_modifier = 1.5
=======
	brute_modifier = 1.5 //Plasmemes are weak
	burn_modifier = 1.5 //Plasmemes are weak
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/arm/right/plasmaman/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/self_ignition)
>>>>>>> tg-pr-88929

/obj/item/bodypart/leg/left/plasmaman
	icon = 'icons/mob/human/species/plasmaman/bodyparts.dmi'
	icon_state = "plasmaman_l_leg"
<<<<<<< HEAD
	icon_static = 'icons/mob/species/plasmaman/bodyparts.dmi'
=======
	icon_static = 'icons/mob/human/species/plasmaman/bodyparts.dmi'
>>>>>>> tg-pr-88929
	biological_state = (BIO_BONE|BIO_JOINTED)
	limb_id = SPECIES_PLASMAMAN
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	burn_modifier = 1.5
	brute_modifier = 1.5
=======
	brute_modifier = 1.5 //Plasmemes are weak
	burn_modifier = 1.5 //Plasmemes are weak
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/leg/left/plasmaman/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/self_ignition)
>>>>>>> tg-pr-88929

/obj/item/bodypart/leg/right/plasmaman
	icon = 'icons/mob/human/species/plasmaman/bodyparts.dmi'
	icon_state = "plasmaman_r_leg"
<<<<<<< HEAD
	icon_static = 'icons/mob/species/plasmaman/bodyparts.dmi'
=======
	icon_static = 'icons/mob/human/species/plasmaman/bodyparts.dmi'
>>>>>>> tg-pr-88929
	biological_state = (BIO_BONE|BIO_JOINTED)
	limb_id = SPECIES_PLASMAMAN
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	burn_modifier = 1.5
	brute_modifier = 1.5
=======
	brute_modifier = 1.5 //Plasmemes are weak
	burn_modifier = 1.5 //Plasmemes are weak
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/leg/right/plasmaman/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/self_ignition)
>>>>>>> tg-pr-88929
