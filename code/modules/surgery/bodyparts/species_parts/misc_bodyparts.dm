///SNAIL
/obj/item/bodypart/head/snail
	limb_id = SPECIES_SNAIL
	is_dimorphic = FALSE
<<<<<<< HEAD
	head_flags = HEAD_EYESPRITES|HEAD_DEBRAIN
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR
=======
	burn_modifier = 2
	head_flags = HEAD_EYESPRITES|HEAD_DEBRAIN
	biological_state = (BIO_FLESH|BIO_BLOODED)
	teeth_count = 0
>>>>>>> tg-pr-88929

/obj/item/bodypart/chest/snail
	limb_id = SPECIES_SNAIL
	is_dimorphic = FALSE
<<<<<<< HEAD
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR
=======
	burn_modifier = 2
	biological_state = (BIO_FLESH|BIO_BLOODED)
	wing_types = null
>>>>>>> tg-pr-88929

/obj/item/bodypart/arm/left/snail
	limb_id = SPECIES_SNAIL
	unarmed_attack_verbs = list("slap")
	unarmed_attack_effect = ATTACK_EFFECT_DISARM
<<<<<<< HEAD
	unarmed_damage_high = 0.5 //snails are soft and squishy
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR
=======
	unarmed_damage_low = 1
	unarmed_damage_high = 2 //snails are soft and squishy
	burn_modifier = 2
	biological_state = (BIO_FLESH|BIO_BLOODED)
>>>>>>> tg-pr-88929

/obj/item/bodypart/arm/right/snail
	limb_id = SPECIES_SNAIL
	unarmed_attack_verbs = list("slap")
	unarmed_attack_effect = ATTACK_EFFECT_DISARM
<<<<<<< HEAD
	unarmed_damage_high = 0.5
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/leg/left/snail
	limb_id = SPECIES_SNAIL
	unarmed_damage_high = 0.5
	speed_modifier = 3 //disgustingly slow
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/leg/right/snail
	limb_id = SPECIES_SNAIL
	unarmed_damage_high = 0.5
	speed_modifier = 3 //disgustingly slow
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/leg/left/zombie/infectious
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE
	speed_modifier = 0.8 //braaaaains
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/leg/right/zombie/infectious
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE
	speed_modifier = 0.8 //braaaaains
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR
=======
	unarmed_damage_low = 1
	unarmed_damage_high = 2 //snails are soft and squishy
	burn_modifier = 2
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/leg/left/snail
	limb_id = SPECIES_SNAIL
	unarmed_damage_low = 1
	unarmed_damage_high = 2 //snails are soft and squishy
	burn_modifier = 2
	biological_state = (BIO_FLESH|BIO_BLOODED)

/obj/item/bodypart/leg/right/snail
	limb_id = SPECIES_SNAIL
	unarmed_damage_low = 1
	unarmed_damage_high = 2 //snails are soft and squishy
	burn_modifier = 2
	biological_state = (BIO_FLESH|BIO_BLOODED)
>>>>>>> tg-pr-88929

///ABDUCTOR
/obj/item/bodypart/head/abductor
	limb_id = SPECIES_ABDUCTOR
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	head_flags = NONE
<<<<<<< HEAD
=======
	teeth_count = 0
>>>>>>> tg-pr-88929

/obj/item/bodypart/chest/abductor
	limb_id = SPECIES_ABDUCTOR
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
<<<<<<< HEAD
	ass_image = 'icons/ass/assgrey.png'
=======
	wing_types = null

/obj/item/bodypart/chest/abductor/get_butt_sprite()
	return icon('icons/mob/butts.dmi', BUTT_SPRITE_GREY)
>>>>>>> tg-pr-88929

/obj/item/bodypart/arm/left/abductor
	limb_id = SPECIES_ABDUCTOR
	should_draw_greyscale = FALSE
	hand_traits = list(TRAIT_CHUNKYFINGERS, TRAIT_CHUNKYFINGERS_IGNORE_BATON)

/obj/item/bodypart/arm/right/abductor
	limb_id = SPECIES_ABDUCTOR
	should_draw_greyscale = FALSE
	hand_traits = list(TRAIT_CHUNKYFINGERS, TRAIT_CHUNKYFINGERS_IGNORE_BATON)

/obj/item/bodypart/leg/left/abductor
	limb_id = SPECIES_ABDUCTOR
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/abductor
	limb_id = SPECIES_ABDUCTOR
	should_draw_greyscale = FALSE

<<<<<<< HEAD
///SLIME
/obj/item/bodypart/head/oozeling/slime
	limb_id = SPECIES_SLIMEPERSON
	is_dimorphic = FALSE

/obj/item/bodypart/chest/oozeling/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/arm/left/oozeling/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/arm/right/oozeling/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/leg/left/oozeling/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/leg/right/oozeling/slime
	limb_id = SPECIES_SLIMEPERSON

///LUMINESCENT
/obj/item/bodypart/head/oozeling/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/chest/oozeling/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/arm/left/oozeling/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/arm/right/oozeling/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/leg/left/oozeling/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/leg/right/oozeling/luminescent
=======
///JELLY
/obj/item/bodypart/head/jelly
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	is_dimorphic = TRUE
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage
	head_flags = HEAD_EYECOLOR | HEAD_EYESPRITES | HEAD_HAIR | HEAD_FACIAL_HAIR

/obj/item/bodypart/chest/jelly
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	is_dimorphic = TRUE
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage
	wing_types = list(/obj/item/organ/wings/functional/slime)

/obj/item/bodypart/chest/jelly/get_butt_sprite()
	return icon('icons/mob/butts.dmi', BUTT_SPRITE_SLIME)

/obj/item/bodypart/arm/left/jelly
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage

/obj/item/bodypart/arm/right/jelly
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage

/obj/item/bodypart/leg/left/jelly
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage

/obj/item/bodypart/leg/right/jelly
	biological_state = (BIO_FLESH|BIO_BLOODED)
	limb_id = SPECIES_JELLYPERSON
	dmg_overlay_type = null
	burn_modifier = 0.5 // = 1/2x generic burn damage

///SLIME
/obj/item/bodypart/head/jelly/slime
	limb_id = SPECIES_SLIMEPERSON
	is_dimorphic = FALSE

/obj/item/bodypart/chest/jelly/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/arm/left/jelly/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/arm/right/jelly/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/leg/left/jelly/slime
	limb_id = SPECIES_SLIMEPERSON

/obj/item/bodypart/leg/right/jelly/slime
	limb_id = SPECIES_SLIMEPERSON

///LUMINESCENT
/obj/item/bodypart/head/jelly/luminescent
	limb_id = SPECIES_LUMINESCENT
	teeth_count = 0

/obj/item/bodypart/chest/jelly/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/arm/left/jelly/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/arm/right/jelly/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/leg/left/jelly/luminescent
	limb_id = SPECIES_LUMINESCENT

/obj/item/bodypart/leg/right/jelly/luminescent
>>>>>>> tg-pr-88929
	limb_id = SPECIES_LUMINESCENT

///ZOMBIE
/obj/item/bodypart/head/zombie
	limb_id = SPECIES_ZOMBIE
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
<<<<<<< HEAD
	head_flags = HEAD_EYESPRITES | HEAD_DEBRAIN | HEAD_HAIR
	composition_effects = list(TRAIT_COLD_BLOODED = 0.5)
=======
	head_flags = HEAD_EYESPRITES|HEAD_DEBRAIN
>>>>>>> tg-pr-88929
	can_dismember = TRUE

/obj/item/bodypart/chest/zombie
	limb_id = SPECIES_ZOMBIE
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
<<<<<<< HEAD
	bodypart_traits = list(TRAIT_LIMBATTACHMENT)
	composition_effects = list(TRAIT_COLD_BLOODED = 0.5)
=======
	wing_types = null
>>>>>>> tg-pr-88929

/obj/item/bodypart/arm/left/zombie
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE
	composition_effects = list(TRAIT_COLD_BLOODED = 0.5)

/obj/item/bodypart/arm/right/zombie
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE
	composition_effects = list(TRAIT_COLD_BLOODED = 0.5)

/obj/item/bodypart/leg/left/zombie
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE
	composition_effects = list(TRAIT_COLD_BLOODED = 0.5)

/obj/item/bodypart/leg/right/zombie
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE
	composition_effects = list(TRAIT_COLD_BLOODED = 0.5)

/obj/item/bodypart/leg/left/zombie/infectious
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE
	speed_modifier = 0.8 //braaaaains

/obj/item/bodypart/leg/right/zombie/infectious
	limb_id = SPECIES_ZOMBIE
	should_draw_greyscale = FALSE
	speed_modifier = 0.8 //braaaaains

///PODPEOPLE
/obj/item/bodypart/head/pod
	limb_id = SPECIES_PODPERSON
	is_dimorphic = TRUE
<<<<<<< HEAD
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR
=======
	burn_modifier = 1.25
	head_flags = HEAD_EYESPRITES|HEAD_EYECOLOR|HEAD_EYEHOLES|HEAD_DEBRAIN
>>>>>>> tg-pr-88929

/obj/item/bodypart/chest/pod
	limb_id = SPECIES_PODPERSON
	is_dimorphic = TRUE
<<<<<<< HEAD
	ass_image = 'icons/ass/asspodperson.png'
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR
=======
	burn_modifier = 1.25
	wing_types = null

/obj/item/bodypart/chest/pod/get_butt_sprite()
	return icon('icons/mob/butts.dmi', BUTT_SPRITE_FLOWERPOT)
>>>>>>> tg-pr-88929

/obj/item/bodypart/arm/left/pod
	limb_id = SPECIES_PODPERSON
	unarmed_attack_verbs = list("slash", "lash")
	grappled_attack_verb = "lacerate"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
<<<<<<< HEAD
	unarmed_attack_sound = 'sound/weapons/slice.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'
	hand_traits = list(TRAIT_PLANT_SAFE)
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR
=======
	unarmed_attack_sound = 'sound/items/weapons/slice.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'
	burn_modifier = 1.25
>>>>>>> tg-pr-88929

/obj/item/bodypart/arm/right/pod
	limb_id = SPECIES_PODPERSON
	unarmed_attack_verbs = list("slash", "lash")
	grappled_attack_verb = "lacerate"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
<<<<<<< HEAD
	unarmed_attack_sound = 'sound/weapons/slice.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'
	hand_traits = list(TRAIT_PLANT_SAFE)
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/leg/left/pod
	limb_id = SPECIES_PODPERSON
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/leg/right/pod
	limb_id = SPECIES_PODPERSON
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR
=======
	unarmed_attack_sound = 'sound/items/weapons/slice.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'
	burn_modifier = 1.25

/obj/item/bodypart/leg/left/pod
	limb_id = SPECIES_PODPERSON
	burn_modifier = 1.25

/obj/item/bodypart/leg/right/pod
	limb_id = SPECIES_PODPERSON
	burn_modifier = 1.25
>>>>>>> tg-pr-88929

///FLY
/obj/item/bodypart/head/fly
	limb_id = SPECIES_FLYPERSON
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
<<<<<<< HEAD
//MONKESTATION ADDITION START
	/*
	head_flags = HEAD_EYESPRITES | HEAD_DEBRAIN
*/
	head_flags = HEAD_EYESPRITES | HEAD_DEBRAIN | HEAD_HAIR
//MONKESTATION ADDITION END
	bodypart_traits = list(TRAIT_ANTENNAE)
=======
	head_flags = HEAD_EYESPRITES|HEAD_EYEHOLES|HEAD_DEBRAIN
	teeth_count = 0
	bodypart_traits = list(TRAIT_ANTENNAE)

>>>>>>> tg-pr-88929
/obj/item/bodypart/chest/fly
	limb_id = SPECIES_FLYPERSON
	is_dimorphic = TRUE
	should_draw_greyscale = FALSE
<<<<<<< HEAD
	wing_types = list(/obj/item/organ/external/wings/functional/fly)
=======
	wing_types = list(/obj/item/organ/wings/functional/fly)
>>>>>>> tg-pr-88929
	bodypart_traits = list(TRAIT_TACKLING_FRAIL_ATTACKER)

/obj/item/bodypart/arm/left/fly
	limb_id = SPECIES_FLYPERSON
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/right/fly
	limb_id = SPECIES_FLYPERSON
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/fly
	limb_id = SPECIES_FLYPERSON
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/fly
	limb_id = SPECIES_FLYPERSON
	should_draw_greyscale = FALSE

///SHADOW
<<<<<<< HEAD
/obj/item/bodypart/head/shadow/darkspawn
	limb_id = SPECIES_DARKSPAWN
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	head_flags = NONE

/obj/item/bodypart/chest/shadow/darkspawn
	limb_id = SPECIES_DARKSPAWN
=======
/obj/item/bodypart/head/shadow
	limb_id = SPECIES_SHADOW
>>>>>>> tg-pr-88929
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	burn_modifier = 1.5
	head_flags = NONE

<<<<<<< HEAD
/obj/item/bodypart/arm/left/shadow/darkspawn
	limb_id = SPECIES_DARKSPAWN
=======
/obj/item/bodypart/chest/shadow
	limb_id = SPECIES_SHADOW
	is_dimorphic = FALSE
>>>>>>> tg-pr-88929
	should_draw_greyscale = FALSE
	burn_modifier = 1.5
	wing_types = null

<<<<<<< HEAD
/obj/item/bodypart/arm/right/shadow/darkspawn
	limb_id = SPECIES_DARKSPAWN
=======
/obj/item/bodypart/arm/left/shadow
	limb_id = SPECIES_SHADOW
>>>>>>> tg-pr-88929
	should_draw_greyscale = FALSE
	burn_modifier = 1.5

<<<<<<< HEAD
/obj/item/bodypart/leg/left/shadow/darkspawn
	limb_id = SPECIES_DARKSPAWN
=======
/obj/item/bodypart/arm/right/shadow
	limb_id = SPECIES_SHADOW
>>>>>>> tg-pr-88929
	should_draw_greyscale = FALSE
	burn_modifier = 1.5

<<<<<<< HEAD
/obj/item/bodypart/leg/right/shadow/darkspawn
	limb_id = SPECIES_DARKSPAWN
=======
/obj/item/bodypart/leg/left/shadow
	limb_id = SPECIES_SHADOW
>>>>>>> tg-pr-88929
	should_draw_greyscale = FALSE
	burn_modifier = 1.5

<<<<<<< HEAD
/obj/item/bodypart/arm/left/shadow/darkspawn
	limb_id = SPECIES_DARKSPAWN
=======
/obj/item/bodypart/leg/right/shadow
	limb_id = SPECIES_SHADOW
>>>>>>> tg-pr-88929
	should_draw_greyscale = FALSE
	burn_modifier = 1.5

/obj/item/bodypart/arm/right/shadow/darkspawn
	limb_id = SPECIES_DARKSPAWN
	should_draw_greyscale = FALSE

///SKELETON
/obj/item/bodypart/head/skeleton
	biological_state = BIO_BONE
	limb_id = SPECIES_SKELETON
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	head_flags = HEAD_HAIR
=======
	head_flags = NONE
	bodypart_flags = BODYPART_UNHUSKABLE
>>>>>>> tg-pr-88929

/obj/item/bodypart/chest/skeleton
	biological_state = BIO_BONE
	limb_id = SPECIES_SKELETON
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	bodypart_traits = list(TRAIT_LIMBATTACHMENT)
	wing_types = list(/obj/item/organ/external/wings/functional/skeleton)
=======
	bodypart_flags = BODYPART_UNHUSKABLE
	wing_types = list(/obj/item/organ/wings/functional/skeleton)
>>>>>>> tg-pr-88929

/obj/item/bodypart/arm/left/skeleton
	biological_state = (BIO_BONE|BIO_JOINTED)
	limb_id = SPECIES_SKELETON
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/arm/right/skeleton
	biological_state = (BIO_BONE|BIO_JOINTED)
	limb_id = SPECIES_SKELETON
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/leg/left/skeleton
	biological_state = (BIO_BONE|BIO_JOINTED)
	limb_id = SPECIES_SKELETON
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_flags = BODYPART_UNHUSKABLE

/obj/item/bodypart/leg/right/skeleton
	biological_state = (BIO_BONE|BIO_JOINTED)
	limb_id = SPECIES_SKELETON
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_flags = BODYPART_UNHUSKABLE

///MUSHROOM
/obj/item/bodypart/head/mushroom
	limb_id = SPECIES_MUSHROOM
	is_dimorphic = TRUE
<<<<<<< HEAD
	head_flags = NONE
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR
=======
	burn_modifier = 1.25
	head_flags = NONE
	teeth_count = 0
>>>>>>> tg-pr-88929

/obj/item/bodypart/chest/mushroom
	limb_id = SPECIES_MUSHROOM
	is_dimorphic = TRUE
	bodypart_traits = list(TRAIT_NO_JUMPSUIT)
<<<<<<< HEAD
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/arm/left/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 8
	unarmed_damage_high = 8
	unarmed_stun_threshold = 14
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/arm/right/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 8
	unarmed_damage_high = 8
	unarmed_stun_threshold = 14
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/leg/left/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 15
	unarmed_damage_high = 15
	unarmed_stun_threshold = 14
	speed_modifier = 0.75 //big fungus big fungus
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

/obj/item/bodypart/leg/right/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 15
	unarmed_damage_high = 15
	unarmed_stun_threshold = 14
	speed_modifier = 0.75 //big fungus big fungus
	palette = /datum/color_palette/generic_colors
	palette_key = MUTANT_COLOR

///GOLEMS (i hate xenobio SO FUCKING MUCH) (from 2022: Yeah I fucking feel your pain brother) (2024: yeah this is shit)
/obj/item/bodypart/head/golem
	biological_state = BIO_BONE
	bodytype = BODYTYPE_ORGANIC
=======
	burn_modifier = 1.25
	wing_types = null

/obj/item/bodypart/arm/left/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 6
	unarmed_damage_high = 14
	unarmed_effectiveness = 15
	burn_modifier = 1.25

/obj/item/bodypart/arm/right/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 6
	unarmed_damage_high = 14
	unarmed_effectiveness = 15
	burn_modifier = 1.25

/obj/item/bodypart/leg/left/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 9
	unarmed_damage_high = 21
	unarmed_effectiveness = 20
	burn_modifier = 1.25
	speed_modifier = 0.75

/obj/item/bodypart/leg/right/mushroom
	limb_id = SPECIES_MUSHROOM
	unarmed_damage_low = 9
	unarmed_damage_high = 21
	unarmed_effectiveness = 20
	burn_modifier = 1.25
	speed_modifier = 0.75

/// Dullahan head preserves organs inside it
/obj/item/bodypart/head/dullahan
	throwforce = 25 // It's also a potent weapon
	show_organs_on_examine = FALSE
	speech_span = null

/obj/item/bodypart/head/dullahan/Entered(obj/item/organ/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	if (!isorgan(arrived))
		return
	arrived.organ_flags |= ORGAN_FROZEN

/obj/item/bodypart/head/dullahan/Exited(obj/item/organ/gone, direction)
	. = ..()
	if (!isorgan(gone))
		return
	gone.organ_flags &= ~ORGAN_FROZEN


//GOLEM
/obj/item/bodypart/head/golem
	icon = 'icons/mob/human/species/golems.dmi'
	icon_static = 'icons/mob/human/species/golems.dmi'
	icon_state = "golem_head"
	biological_state = BIO_BONE
	bodytype = BODYTYPE_GOLEM | BODYTYPE_ORGANIC
>>>>>>> tg-pr-88929
	limb_id = SPECIES_GOLEM
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	head_flags = HEAD_EYESPRITES

/obj/item/bodypart/chest/golem
	biological_state = BIO_BONE
	acceptable_bodytype = BODYTYPE_ORGANIC
	bodytype =  BODYTYPE_ORGANIC
=======
	head_flags = NONE
	// too hard to drill through
	teeth_count = 0

/obj/item/bodypart/head/golem/Initialize(mapload)
	worn_ears_offset = new(
		attached_part = src,
		feature_key = OFFSET_EARS,
		offset_x = list("north" = 1, "south" = -1, "east" = 1, "west" = -1),
		offset_y = list("south" = 1),
	)
	worn_glasses_offset = new(
		attached_part = src,
		feature_key = OFFSET_GLASSES,
		offset_x = list("north" = 1, "south" = -1, "east" = 1, "west" = -1),
	)
	worn_head_offset = new(
		attached_part = src,
		feature_key = OFFSET_HEAD,
		offset_x = list("north" = 1, "south" = -1, "east" = 1, "west" = -1),
		offset_y = list("south" = 1),
	)
	worn_face_offset = new(
		attached_part = src,
		feature_key = OFFSET_FACE,
		offset_x = list("north" = 1, "south" = -1, "east" = 1, "west" = -1),
	)
	return ..()

/obj/item/bodypart/chest/golem
	icon = 'icons/mob/human/species/golems.dmi'
	icon_static = 'icons/mob/human/species/golems.dmi'
	icon_state = "golem_chest"
	biological_state = BIO_BONE
	acceptable_bodytype = BODYTYPE_GOLEM
	bodytype = BODYTYPE_GOLEM | BODYTYPE_ORGANIC
>>>>>>> tg-pr-88929
	limb_id = SPECIES_GOLEM
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_traits = list(TRAIT_NO_JUMPSUIT)
	wing_types = null

/obj/item/bodypart/chest/golem/Initialize(mapload)
	worn_belt_offset = new(
		attached_part = src,
		feature_key = OFFSET_BELT,
		offset_x = list("north" = 1, "south" = -1, "east" = 1, "west" = -1),
	)
	return ..()

/obj/item/bodypart/arm/left/golem
<<<<<<< HEAD
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_ORGANIC
=======
	icon = 'icons/mob/human/species/golems.dmi'
	icon_static = 'icons/mob/human/species/golems.dmi'
	icon_state = "golem_l_arm"
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_GOLEM | BODYTYPE_ORGANIC
>>>>>>> tg-pr-88929
	limb_id = SPECIES_GOLEM
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	hand_traits = list(TRAIT_CHUNKYFINGERS)
	unarmed_damage_low = 8 // I'd like to take the moment that maintaining all of these random ass golem speciese is hell and oranges was right
	unarmed_damage_high = 8
	unarmed_stun_threshold = 11

/obj/item/bodypart/arm/left/golem/set_owner(new_owner)
	. = ..()
	if (. == FALSE)
		return
	if (owner)
		owner.AddComponentFrom(REF(src), /datum/component/shovel_hands)
	if (isnull(.))
		return
	var/mob/living/carbon/old_owner = .
	old_owner.RemoveComponentSource(REF(src), /datum/component/shovel_hands)

/obj/item/bodypart/arm/right/golem
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype =  BODYTYPE_ORGANIC
	limb_id = SPECIES_GOLEM
	dmg_overlay_type = null
	hand_traits = list(TRAIT_CHUNKYFINGERS)
	unarmed_damage_low = 8
	unarmed_damage_high = 8
	unarmed_stun_threshold = 11
=======
	bodypart_traits = list(TRAIT_CHUNKYFINGERS, TRAIT_FIST_MINING, TRAIT_BOULDER_BREAKER)
	unarmed_damage_low = 5
	unarmed_damage_high = 14
	unarmed_effectiveness = 20

/obj/item/bodypart/arm/left/golem/Initialize(mapload)
	held_hand_offset =  new(
		attached_part = src,
		feature_key = OFFSET_HELD,
		offset_x = list("north" = -1, "south" = 2, "east" = 0, "west" = -3),
		offset_y = list("south" = -2),
	)
	return ..()

/obj/item/bodypart/arm/left/golem/clear_ownership(mob/living/carbon/old_owner)
	. = ..()

	old_owner.RemoveComponentSource(REF(src), /datum/component/shovel_hands)

/obj/item/bodypart/arm/left/golem/apply_ownership(mob/living/carbon/new_owner)
	. = ..()

	new_owner.AddComponentFrom(REF(src), /datum/component/shovel_hands)

/obj/item/bodypart/arm/right/golem
	icon = 'icons/mob/human/species/golems.dmi'
	icon_static = 'icons/mob/human/species/golems.dmi'
	icon_state = "golem_r_arm"
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_GOLEM | BODYTYPE_ORGANIC
	limb_id = SPECIES_GOLEM
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
	bodypart_traits = list(TRAIT_CHUNKYFINGERS, TRAIT_FIST_MINING, TRAIT_BOULDER_BREAKER)
	unarmed_damage_low = 5
	unarmed_damage_high = 14
	unarmed_effectiveness = 20

/obj/item/bodypart/arm/right/golem/Initialize(mapload)
	held_hand_offset =  new(
		attached_part = src,
		feature_key = OFFSET_HELD,
		offset_x = list("north" = 2, "south" = -2, "east" = 3, "west" = 0),
		offset_y = list("south" = -2),
	)
	return ..()

/obj/item/bodypart/arm/right/golem/clear_ownership(mob/living/carbon/old_owner)
	. = ..()

	old_owner.RemoveComponentSource(REF(src), /datum/component/shovel_hands)

/obj/item/bodypart/arm/right/golem/apply_ownership(mob/living/carbon/new_owner)
	. = ..()

	new_owner.AddComponentFrom(REF(src), /datum/component/shovel_hands)
>>>>>>> tg-pr-88929

/obj/item/bodypart/arm/right/golem/set_owner(new_owner)
	. = ..()
	if (. == FALSE)
		return
	if (owner)
		owner.AddComponentFrom(REF(src), /datum/component/shovel_hands)
	if (isnull(.))
		return
	var/mob/living/carbon/old_owner = .
	old_owner.RemoveComponentSource(REF(src), /datum/component/shovel_hands)

/obj/item/bodypart/leg/left/golem
<<<<<<< HEAD
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_ORGANIC
=======
	icon = 'icons/mob/human/species/golems.dmi'
	icon_static = 'icons/mob/human/species/golems.dmi'
	icon_state = "golem_l_leg"
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_GOLEM | BODYTYPE_ORGANIC
>>>>>>> tg-pr-88929
	limb_id = SPECIES_GOLEM
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	unarmed_damage_low = 11
	unarmed_damage_high = 11
	unarmed_stun_threshold = 11
	speed_modifier = 1.5

/obj/item/bodypart/leg/right/golem
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_ORGANIC
=======
	unarmed_damage_low = 7
	unarmed_damage_high = 21
	unarmed_effectiveness = 25

/obj/item/bodypart/leg/right/golem
	icon = 'icons/mob/human/species/golems.dmi'
	icon_static = 'icons/mob/human/species/golems.dmi'
	icon_state = "golem_r_leg"
	biological_state = (BIO_BONE|BIO_JOINTED)
	bodytype = BODYTYPE_GOLEM | BODYTYPE_ORGANIC
>>>>>>> tg-pr-88929
	limb_id = SPECIES_GOLEM
	should_draw_greyscale = FALSE
	dmg_overlay_type = null
<<<<<<< HEAD
	unarmed_damage_low = 11
	unarmed_damage_high = 11
	unarmed_stun_threshold = 11
	speed_modifier = 1.5
=======
	unarmed_damage_low = 7
	unarmed_damage_high = 21
	unarmed_effectiveness = 25
>>>>>>> tg-pr-88929

///flesh

/obj/item/bodypart/arm/left/flesh
	limb_id = BODYPART_ID_MEAT
	should_draw_greyscale = FALSE
	head_flags = NONE

/obj/item/bodypart/arm/left/flesh/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_IGNORED_BY_LIVING_FLESH, BODYPART_TRAIT)
	AddElement(/datum/element/living_limb_initialiser)

/obj/item/bodypart/arm/right/flesh
	limb_id = BODYPART_ID_MEAT
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/right/flesh/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_IGNORED_BY_LIVING_FLESH, BODYPART_TRAIT)
	AddElement(/datum/element/living_limb_initialiser)

/obj/item/bodypart/leg/left/flesh
	limb_id = BODYPART_ID_MEAT
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/flesh/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_IGNORED_BY_LIVING_FLESH, BODYPART_TRAIT)
	AddElement(/datum/element/living_limb_initialiser)

/obj/item/bodypart/leg/right/flesh
	limb_id = BODYPART_ID_MEAT
	should_draw_greyscale = FALSE

<<<<<<< HEAD
/obj/item/bodypart/leg/left/golem/cult
	limb_id = SPECIES_GOLEM_CULT
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/golem/cult
	limb_id = SPECIES_GOLEM_CULT
	should_draw_greyscale = FALSE

///CLOTH GOLEM
/obj/item/bodypart/head/golem/cloth
	limb_id = SPECIES_GOLEM_CLOTH
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/chest/golem/cloth
	limb_id = SPECIES_GOLEM_CLOTH
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/golem/cloth
	limb_id = SPECIES_GOLEM_CLOTH
	should_draw_greyscale = FALSE
	unarmed_damage_low = 7
	unarmed_damage_high = 7

/obj/item/bodypart/arm/right/golem/cloth
	limb_id = SPECIES_GOLEM_CLOTH
	should_draw_greyscale = FALSE
	unarmed_damage_low = 7
	unarmed_damage_high = 7

/obj/item/bodypart/leg/left/golem/cloth
	limb_id = SPECIES_GOLEM_CLOTH
	should_draw_greyscale = FALSE
	unarmed_damage_low = 12
	unarmed_damage_high = 12

/obj/item/bodypart/leg/right/golem/cloth
	limb_id = SPECIES_GOLEM_CLOTH
	should_draw_greyscale = FALSE
	unarmed_damage_low = 12
	unarmed_damage_high = 12

///CARDBOARD GOLEM
/obj/item/bodypart/head/golem/cardboard
	limb_id = SPECIES_GOLEM_CARDBOARD
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	head_flags = NONE

/obj/item/bodypart/chest/golem/cardboard
	limb_id = SPECIES_GOLEM_CARDBOARD
	is_dimorphic = TRUE
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/golem/cardboard
	limb_id = SPECIES_GOLEM_CARDBOARD
	should_draw_greyscale = FALSE
	unarmed_attack_verb = "whip"
	unarmed_attack_sound = 'sound/weapons/whip.ogg'
	unarmed_miss_sound = 'sound/weapons/etherealmiss.ogg'
	unarmed_damage_low = 8
	unarmed_damage_high = 8

/obj/item/bodypart/arm/right/golem/cardboard
	limb_id = SPECIES_GOLEM_CARDBOARD
	should_draw_greyscale = FALSE
	unarmed_attack_verb = "whip"
	unarmed_attack_sound = 'sound/weapons/whip.ogg'
	unarmed_miss_sound = 'sound/weapons/etherealmiss.ogg'
	unarmed_damage_low = 8
	unarmed_damage_high = 8

/obj/item/bodypart/leg/left/golem/cardboard
	limb_id = SPECIES_GOLEM_CARDBOARD
	should_draw_greyscale = FALSE
	unarmed_attack_sound = 'sound/weapons/whip.ogg'
	unarmed_miss_sound = 'sound/weapons/etherealmiss.ogg'
	unarmed_damage_low = 12
	unarmed_damage_high = 12

/obj/item/bodypart/leg/right/golem/cardboard
	limb_id = SPECIES_GOLEM_CARDBOARD
	should_draw_greyscale = FALSE
	unarmed_attack_sound = 'sound/weapons/whip.ogg'
	unarmed_miss_sound = 'sound/weapons/etherealmiss.ogg'
	unarmed_damage_low = 12
	unarmed_damage_high = 12

///DURATHREAD GOLEM
/obj/item/bodypart/head/golem/durathread
	limb_id = SPECIES_GOLEM_DURATHREAD
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	head_flags = NONE

/obj/item/bodypart/chest/golem/durathread
	limb_id = SPECIES_GOLEM_DURATHREAD
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/golem/durathread
	limb_id = SPECIES_GOLEM_DURATHREAD
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/right/golem/durathread
	limb_id = SPECIES_GOLEM_DURATHREAD
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/golem/durathread
	limb_id = SPECIES_GOLEM_DURATHREAD
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/golem/durathread
	limb_id = SPECIES_GOLEM_DURATHREAD
	should_draw_greyscale = FALSE

///BONE GOLEM
/obj/item/bodypart/head/golem/bone
	biological_state = BIO_BONE
	limb_id = SPECIES_GOLEM_BONE
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	head_flags = NONE

/obj/item/bodypart/chest/golem/bone
	biological_state = BIO_BONE
	limb_id = SPECIES_GOLEM_BONE
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/golem/bone
	biological_state = BIO_BONE
	limb_id = SPECIES_GOLEM_BONE
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/right/golem/bone
	biological_state = BIO_BONE
	limb_id = SPECIES_GOLEM_BONE
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/golem/bone
	biological_state = BIO_BONE
	limb_id = SPECIES_GOLEM_BONE
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/golem/bone
	biological_state = BIO_BONE
	limb_id = SPECIES_GOLEM_BONE
	should_draw_greyscale = FALSE

///SNOW GOLEM
/obj/item/bodypart/head/golem/snow
	limb_id = SPECIES_GOLEM_SNOW
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	head_flags = NONE

/obj/item/bodypart/chest/golem/snow
	limb_id = SPECIES_GOLEM_SNOW
	is_dimorphic = TRUE //WHO MADE SNOW BREASTS?
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/golem/snow
	limb_id = SPECIES_GOLEM_SNOW
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/right/golem/snow
	limb_id = SPECIES_GOLEM_SNOW
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/golem/snow
	limb_id = SPECIES_GOLEM_SNOW
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/golem/snow
	limb_id = SPECIES_GOLEM_SNOW
	should_draw_greyscale = FALSE

///URANIUM GOLEM
/obj/item/bodypart/arm/left/golem/uranium
	attack_type = BURN
	unarmed_attack_verb = "burn"
	unarmed_attack_sound = 'sound/weapons/sear.ogg'
	unarmed_damage_low = 10
	unarmed_damage_high = 10

/obj/item/bodypart/arm/right/golem/uranium
	attack_type = BURN
	unarmed_attack_verb = "burn"
	unarmed_attack_sound = 'sound/weapons/sear.ogg'
	unarmed_damage_low = 10
	unarmed_damage_high = 10

/obj/item/bodypart/leg/left/golem/uranium
	attack_type = BURN
	unarmed_attack_sound = 'sound/weapons/sear.ogg'
	unarmed_damage_low = 15
	unarmed_damage_high = 15

/obj/item/bodypart/leg/right/golem/uranium
	attack_type = BURN
	unarmed_attack_sound = 'sound/weapons/sear.ogg'
	unarmed_damage_low = 15
	unarmed_damage_high = 15

///PLASTEEL GOLEM
/obj/item/bodypart/arm/left/golem/plasteel
	unarmed_attack_verb = "smash"
	unarmed_attack_effect = ATTACK_EFFECT_SMASH
	unarmed_attack_sound = 'sound/effects/meteorimpact.ogg' //hits pretty hard
	unarmed_damage_low = 14
	unarmed_damage_high = 14
	unarmed_stun_threshold = 18

/obj/item/bodypart/arm/right/golem/plasteel
	unarmed_attack_verb = "smash"
	unarmed_attack_effect = ATTACK_EFFECT_SMASH
	unarmed_attack_sound = 'sound/effects/meteorimpact.ogg'
	unarmed_damage_low = 14
	unarmed_damage_high = 14
	unarmed_stun_threshold = 18


/obj/item/bodypart/leg/left/golem/plasteel
	unarmed_attack_effect = ATTACK_EFFECT_SMASH
	unarmed_attack_sound = 'sound/effects/meteorimpact.ogg'
	unarmed_damage_low = 22
	unarmed_damage_high = 22
	unarmed_stun_threshold = 18

/obj/item/bodypart/leg/right/golem/plasteel
	unarmed_attack_effect = ATTACK_EFFECT_SMASH
	unarmed_attack_sound = 'sound/effects/meteorimpact.ogg'
	unarmed_damage_low = 22
	unarmed_damage_high = 22
	unarmed_stun_threshold = 18

///BANANIUM GOLEM
/obj/item/bodypart/arm/left/golem/bananium
	unarmed_attack_verb = "honk"
	unarmed_attack_sound = 'sound/items/airhorn2.ogg'
	unarmed_damage_low = 0
	unarmed_damage_high = 1 //Harmless and can't stun

/obj/item/bodypart/arm/right/golem/bananium
	unarmed_attack_verb = "honk"
	unarmed_attack_sound = 'sound/items/airhorn2.ogg'
	unarmed_damage_low = 0
	unarmed_damage_high = 1

/obj/item/bodypart/leg/right/golem/bananium
	unarmed_attack_verb = "honk"
	unarmed_attack_sound = 'sound/items/airhorn2.ogg'
	unarmed_damage_low = 0
	unarmed_damage_high = 1

/obj/item/bodypart/leg/left/golem/bananium
	unarmed_attack_verb = "honk"
	unarmed_attack_sound = 'sound/items/airhorn2.ogg'
	unarmed_damage_low = 0
	unarmed_damage_high = 1

//DARKSPAWN
///SHADOW
/obj/item/bodypart/head/shadow
	limb_id = SPECIES_SHADOW
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE
	head_flags = NONE

/obj/item/bodypart/chest/shadow
	limb_id = SPECIES_SHADOW
	is_dimorphic = FALSE
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/shadow
	limb_id = SPECIES_SHADOW
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/right/shadow
	limb_id = SPECIES_SHADOW
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/left/shadow
	limb_id = SPECIES_SHADOW
	should_draw_greyscale = FALSE

/obj/item/bodypart/leg/right/shadow
	limb_id = SPECIES_SHADOW
	should_draw_greyscale = FALSE

/obj/item/bodypart/arm/left/shadow/nightmare
	hand_traits = list(TRAIT_CHUNKYFINGERS)

/obj/item/bodypart/arm/right/shadow/nightmare
	hand_traits = list(TRAIT_CHUNKYFINGERS)
=======
/obj/item/bodypart/leg/right/flesh/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_IGNORED_BY_LIVING_FLESH, BODYPART_TRAIT)
	AddElement(/datum/element/living_limb_initialiser)
>>>>>>> tg-pr-88929
