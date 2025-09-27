/obj/item/clothing/under/rank/rnd
	icon = 'icons/obj/clothing/under/rnd.dmi'
	worn_icon = 'icons/mob/clothing/under/rnd.dmi'
<<<<<<< HEAD
	worn_icon_digitigrade = 'icons/mob/clothing/under/rnd_digi.dmi'
=======
	armor_type = /datum/armor/clothing_under/science

/datum/armor/clothing_under/science
	bio = 50
>>>>>>> tg-pr-88929

/obj/item/clothing/under/rank/rnd/research_director
	desc = "It's a suit worn by those with the know-how to achieve the position of \"Research Director\". Its fabric provides minor protection from biological contaminants."
	name = "research director's vest suit"
	icon_state = "director"
	inhand_icon_state = "lb_suit"
	armor_type = /datum/armor/clothing_under/rnd_research_director
	can_adjust = FALSE

/datum/armor/clothing_under/rnd_research_director
	bomb = 10
	bio = 50
	acid = 35

/obj/item/clothing/under/rank/rnd/research_director/doctor_hilbert
	desc = "A Research Director jumpsuit belonging to the late and great Doctor Hilbert. The suit sensors have long since fizzled out from the stress of the Hilbert's Hotel."
	has_sensor = NO_SENSORS
	random_sensor = FALSE

/obj/item/clothing/under/rank/rnd/research_director/skirt
	name = "research director's vest suitskirt"
	desc = "It's a suitskirt worn by those with the know-how to achieve the position of \"Research Director\". Its fabric provides minor protection from biological contaminants."
	icon_state = "director_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

<<<<<<< HEAD
=======
/obj/item/clothing/under/rank/rnd/research_director/alt
	name = "research director's tan suit"
	desc = "Maybe you'll engineer your own half-man, half-pig creature some day. Its fabric provides minor protection from biological contaminants."
	icon = 'icons/obj/clothing/under/shorts_pants_shirts.dmi'
	worn_icon = 'icons/mob/clothing/under/shorts_pants_shirts.dmi'
	icon_state = "buttondown_slacks"
	greyscale_config = /datum/greyscale_config/buttondown_slacks
	greyscale_config_worn = /datum/greyscale_config/buttondown_slacks/worn
	greyscale_colors = "#ffeeb6#c2d3da#402912#615233"
	can_adjust = TRUE
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/rnd/research_director/alt/skirt
	name = "research director's tan suitskirt"
	icon_state = "buttondown_skirt"
	greyscale_config = /datum/greyscale_config/buttondown_skirt
	greyscale_config_worn = /datum/greyscale_config/buttondown_skirt/worn
	body_parts_covered = CHEST|GROIN|ARMS
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

>>>>>>> tg-pr-88929
/obj/item/clothing/under/rank/rnd/research_director/turtleneck
	desc = "A Nanotrasen-purple turtleneck and black jeans, for a director with a superior sense of style."
	name = "research director's turtleneck"
	icon_state = "rdturtle"
	inhand_icon_state = "p_suit"
	can_adjust = TRUE
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/rnd/research_director/turtleneck/skirt
	name = "research director's turtleneck skirt"
	desc = "A Nanotrasen-purple turtleneck and a black skirt, for a director with a superior sense of style."
	icon_state = "rdturtle_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/rnd/scientist
	name = "scientist's jumpsuit"
	desc = "It's made of a special fiber that provides minor protection against explosives. It has markings that denote the wearer as a scientist."
	icon_state = "science"
	inhand_icon_state = "w_suit"
<<<<<<< HEAD
	armor_type = /datum/armor/rnd_scientist

/datum/armor/rnd_scientist
	bomb = 15 // Monkestation Edit: It provided no bomb protection before
	bio = 15

/obj/item/clothing/under/rank/rnd/scientist/skirt
	name = "scientist's jumpskirt"
	desc = "It's made of a special fiber that provides minor protection against explosives. It has markings that denote the wearer as a scientist."
	icon_state = "science_skirt"
	inhand_icon_state = "w_suit"
=======
	armor_type = /datum/armor/clothing_under/science

/obj/item/clothing/under/rank/rnd/scientist/skirt
	name = "scientist's jumpskirt"
	icon_state = "science_skirt"
>>>>>>> tg-pr-88929
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/rnd/roboticist
	desc = "It's a slimming black with reinforced seams; great for industrial work."
	name = "roboticist's jumpsuit"
	icon_state = "robotics"
	inhand_icon_state = null
	resistance_flags = NONE

/obj/item/clothing/under/rank/rnd/roboticist/skirt
	name = "roboticist's jumpskirt"
	desc = "It's a slimming black with reinforced seams; great for industrial work."
	icon_state = "robotics_skirt"
	inhand_icon_state = null
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/rnd/geneticist
	name = "geneticist's jumpsuit"
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a genetics rank stripe on it."
	icon_state = "genetics"
	inhand_icon_state = "w_suit"

/obj/item/clothing/under/rank/rnd/geneticist/skirt
	name = "geneticist's jumpskirt"
<<<<<<< HEAD
	desc = "It's made of a special fiber that gives special protection against biohazards. It has a genetics rank stripe on it."
	icon_state = "genetics_skirt"
	inhand_icon_state = "w_suit"
=======
	icon_state = "genetics_skirt"
>>>>>>> tg-pr-88929
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/rnd/xenobiologist
	desc = "It's special fibers lets it handle biohazards better. It has the pink stripe of a xenobiologist."
	name = "xenobiologist's jumpsuit"
	icon_state = "xenobio"
	inhand_icon_state = "w_suit"
	resistance_flags = NONE
	armor_type = /datum/armor/rnd_xenobiologist

/datum/armor/rnd_xenobiologist
	bio = 50

/obj/item/clothing/under/rank/rnd/xenobiologist/skirt
	name = "xenobiologist's jumpskirt"
	desc = "It's a slimming black with reinforced seams; great for industrial work."
	icon_state = "xenobio_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/rnd/scientist/utility
	name = "science utility uniform"
	desc = "A utility uniform worn by NT-certified Science staff."
	icon_state = "util_sci"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/under/rank/rnd/scientist/utility/syndicate
	desc = "A utility uniform worn by Science staff."
	armor_type = /datum/armor/clothing_under/utility_syndicate
	has_sensor = NO_SENSORS

/obj/item/clothing/under/rank/rnd/scientist/hlscience
	name = "science team uniform"
	desc = "A simple semi-formal uniform consisting of a grayish-blue shirt and off-white slacks, paired with a ridiculous, but mandatory, tie."
	icon_state = "hl_scientist"
	can_adjust = FALSE
	alternative_screams = list(	'monkestation/sound/voice/screams/misc/HL1 Scientist/scream_sci0.ogg',
								'monkestation/sound/voice/screams/misc/HL1 Scientist/scream_sci1.ogg',
								'monkestation/sound/voice/screams/misc/HL1 Scientist/scream_sci2.ogg')
