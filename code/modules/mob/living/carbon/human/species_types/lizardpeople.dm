/datum/species/lizard
	// Reptilian humanoids with scaled skin and tails.
	name = "\improper Lizardperson"
	plural_form = "Lizardfolk"
	id = SPECIES_LIZARD
<<<<<<< HEAD
	visual_gender = TRUE	//MONKESTATION EDIT - Dimorphic Lizards
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
		TRAIT_MUTANT_COLORS_SECONDARY,
		TRAIT_CAN_USE_FLIGHT_POTION,
=======
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
>>>>>>> tg-pr-88929
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_REPTILE
	body_markings = list(/datum/bodypart_overlay/simple/body_marking/lizard = "None")
	mutant_organs = list(
		/obj/item/organ/horns = "None",
		/obj/item/organ/frills = "None",
		/obj/item/organ/snout = "Round",
		/obj/item/organ/spines = "None",
		/obj/item/organ/tail/lizard = "Smooth",
	)
<<<<<<< HEAD
	mutanttongue = /obj/item/organ/internal/tongue/lizard
	mutantstomach = /obj/item/organ/internal/stomach/lizard
	mutantheart = /obj/item/organ/internal/heart/lizard
	mutantbrain = /obj/item/organ/internal/brain/lizard
=======
	mutanttongue = /obj/item/organ/tongue/lizard
>>>>>>> tg-pr-88929
	coldmod = 1.5
	heatmod = 0.67
	payday_modifier = 1.0
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_cookie = /obj/item/food/meat/slab
	meat = /obj/item/food/meat/slab/human/mutant/lizard
	skinned_type = /obj/item/stack/sheet/animalhide/lizard
<<<<<<< HEAD
	exotic_bloodtype = /datum/blood_type/crew/lizard
	inert_mutation = /datum/mutation/firebreath
	death_sound = 'sound/voice/lizard/deathsound.ogg'
=======
	exotic_bloodtype = "L"
	inert_mutation = /datum/mutation/human/firebreath
	death_sound = 'sound/mobs/humanoids/lizard/deathsound.ogg'
>>>>>>> tg-pr-88929
	species_language_holder = /datum/language_holder/lizard
	digitigrade_customization = DIGITIGRADE_FORCED //Monkestation Edit: OPTIONAL > FORCED

	mutanteyes = /obj/item/organ/internal/eyes/lizard
	// Lizards are coldblooded and can stand a greater temperature range than humans
<<<<<<< HEAD
	bodytemp_normal = (BODYTEMP_NORMAL - 7.5)
	bodytemp_heat_damage_limit = BODYTEMP_HEAT_LAVALAND_SAFE + 5 KELVIN // This puts lizards 10 above lavaland max heat for ash lizards.
=======
	bodytemp_heat_damage_limit = BODYTEMP_HEAT_LAVALAND_SAFE
>>>>>>> tg-pr-88929
	bodytemp_cold_damage_limit = (BODYTEMP_COLD_DAMAGE_LIMIT - 10)

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/lizard,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/lizard,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/lizard,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/lizard,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/lizard,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/lizard,
	)

<<<<<<< HEAD
/datum/species/lizard/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	. = ..()
	// melbert todo : temp / integrate this into the coldblooded trait
	// if you spawn on station is is expected you have already acclimated to the room temp (20c) (but give a little bit of leeway)
	if(is_station_level(C.z))
		C.bodytemperature = CELCIUS_TO_KELVIN(22.5 CELCIUS)

/datum/species/lizard/random_name(gender,unique,lastname)
	if(unique)
		return random_unique_lizard_name(gender)

	var/randname = lizard_name(gender)

	if(lastname)
		randname += " [lastname]"

	return randname

/datum/species/lizard/randomize_features(mob/living/carbon/human/human_mob)
	human_mob.dna.features["body_markings"] = pick(GLOB.body_markings_list)
	randomize_external_organs(human_mob)

=======
/// Lizards are cold blooded and do not stabilize body temperature naturally
/datum/species/lizard/body_temperature_core(mob/living/carbon/human/humi, seconds_per_tick, times_fired)
	return

/datum/species/lizard/randomize_features()
	var/list/features = ..()
	features["lizard_markings"] = pick(SSaccessories.lizard_markings_list)
	return features

/datum/species/lizard/get_scream_sound(mob/living/carbon/human/lizard)
	return pick(
		'sound/mobs/humanoids/lizard/lizard_scream_1.ogg',
		'sound/mobs/humanoids/lizard/lizard_scream_2.ogg',
		'sound/mobs/humanoids/lizard/lizard_scream_3.ogg',
	)

/datum/species/lizard/get_cough_sound(mob/living/carbon/human/lizard)
	if(lizard.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cough/female_cough1.ogg',
			'sound/mobs/humanoids/human/cough/female_cough2.ogg',
			'sound/mobs/humanoids/human/cough/female_cough3.ogg',
			'sound/mobs/humanoids/human/cough/female_cough4.ogg',
			'sound/mobs/humanoids/human/cough/female_cough5.ogg',
			'sound/mobs/humanoids/human/cough/female_cough6.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cough/male_cough1.ogg',
		'sound/mobs/humanoids/human/cough/male_cough2.ogg',
		'sound/mobs/humanoids/human/cough/male_cough3.ogg',
		'sound/mobs/humanoids/human/cough/male_cough4.ogg',
		'sound/mobs/humanoids/human/cough/male_cough5.ogg',
		'sound/mobs/humanoids/human/cough/male_cough6.ogg',
	)


/datum/species/lizard/get_cry_sound(mob/living/carbon/human/lizard)
	if(lizard.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cry/female_cry1.ogg',
			'sound/mobs/humanoids/human/cry/female_cry2.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cry/male_cry1.ogg',
		'sound/mobs/humanoids/human/cry/male_cry2.ogg',
		'sound/mobs/humanoids/human/cry/male_cry3.ogg',
	)


/datum/species/lizard/get_sneeze_sound(mob/living/carbon/human/lizard)
	if(lizard.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sneeze/female_sneeze1.ogg'
	return 'sound/mobs/humanoids/human/sneeze/male_sneeze1.ogg'

/datum/species/lizard/get_laugh_sound(mob/living/carbon/human/lizard)
	return 'sound/mobs/humanoids/lizard/lizard_laugh1.ogg'

/datum/species/lizard/get_sigh_sound(mob/living/carbon/human/lizard)
	if(lizard.physique == FEMALE)
		return SFX_FEMALE_SIGH
	return SFX_MALE_SIGH

/datum/species/lizard/get_sniff_sound(mob/living/carbon/human/lizard)
	if(lizard.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sniff/female_sniff.ogg'
	return 'sound/mobs/humanoids/human/sniff/male_sniff.ogg'

/datum/species/lizard/get_snore_sound(mob/living/carbon/human/lizard)
	if(lizard.physique == FEMALE)
		return SFX_SNORE_FEMALE
	return SFX_SNORE_MALE

/datum/species/lizard/get_hiss_sound(mob/living/carbon/human/lizard)
	return 'sound/mobs/humanoids/lizard/lizard_hiss.ogg'

/datum/species/lizard/get_physical_attributes()
	return "Lizardpeople can withstand slightly higher temperatures than most species, but they are very vulnerable to the cold \
		and can't regulate their body-temperature internally, making the vacuum of space extremely deadly to them."

>>>>>>> tg-pr-88929
/datum/species/lizard/get_species_description()
	return "The militaristic Lizardpeople hail originally from Tizira, but have grown \
		throughout their centuries in the stars to possess a large spacefaring \
		empire: though now they must contend with their younger, more \
		technologically advanced Human neighbours."

// Override for the default temperature perks, so we can give our specific "cold blooded" perk.
/datum/species/lizard/create_pref_temperature_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
		SPECIES_PERK_ICON = "thermometer-empty",
		SPECIES_PERK_NAME = "Cold-blooded",
		SPECIES_PERK_DESC = "Lizardpeople have higher tolerance for hot temperatures, but lower \
			tolerance for cold temperatures. Additionally, they cannot self-regulate their body temperature - \
			they are as cold or as warm as the environment around them is. Stay warm!",
	))

	return to_add

/*
Lizard subspecies: ASHWALKERS
*/
/datum/species/lizard/ashwalker
	name = "Ash Walker"
	id = SPECIES_LIZARD_ASH
<<<<<<< HEAD
	mutantlungs = /obj/item/organ/internal/lungs/lavaland
	mutantbrain = /obj/item/organ/internal/brain/primitive
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
		TRAIT_MUTANT_COLORS_SECONDARY,
		//TRAIT_LITERATE,
=======
	examine_limb_id = SPECIES_LIZARD
	mutantlungs = /obj/item/organ/lungs/lavaland
	mutantbrain = /obj/item/organ/brain/primitive
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
>>>>>>> tg-pr-88929
		TRAIT_VIRUSIMMUNE,
		TRAIT_CAN_USE_FLIGHT_POTION,
	)
	inherent_factions = list(FACTION_ASHWALKER)
	species_language_holder = /datum/language_holder/lizard/ash
	/*digitigrade_customization = DIGITIGRADE_FORCED*/ //MONKESTATION REMOVAL: not needed
	examine_limb_id = SPECIES_LIZARD
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/lizard,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/lizard/ashwalker,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/lizard/ashwalker,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/lizard/ashwalker,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/lizard/ashwalker,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/lizard/ashwalker,
	)

/datum/species/lizard/ashwalker/get_physical_attributes()
	return "Ash Walkers are identical to lizardpeople in almost all aspects. \
		Unlike them, they're always digitigrade, they can breathe Lavaland's often noxious atmosphere and resist viruses. They are usually illiterate."

/*
Lizard subspecies: SILVER SCALED
*/
/datum/species/lizard/silverscale
	name = "Silver Scale"
	id = SPECIES_LIZARD_SILVER
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_REPTILE
	inherent_traits = list(
		TRAIT_HOLY,
		TRAIT_NOBREATH,
		TRAIT_PIERCEIMMUNE,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_VIRUSIMMUNE,
		TRAIT_WINE_TASTER,
	)
	mutantlungs = null
	damage_modifier = 10 //very light silvery scales soften blows
	species_language_holder = /datum/language_holder/lizard/silver
<<<<<<< HEAD
	mutanttongue = /obj/item/organ/internal/tongue/lizard/silver
	exotic_bloodtype = /datum/blood_type/crew/lizard/silver
	armor = 10 //very light silvery scales soften blows
	changesource_flags = MIRROR_BADMIN | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN
=======
	mutanttongue = /obj/item/organ/tongue/lizard/silver
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN
>>>>>>> tg-pr-88929
	examine_limb_id = SPECIES_LIZARD
	///stored mutcolor for when we turn back off of a silverscale.
	var/old_mutcolor

<<<<<<< HEAD
/datum/species/lizard/silverscale/on_species_gain(mob/living/carbon/new_silverscale, datum/species/old_species, pref_load)
	var/mob/living/carbon/human/silverscale = new_silverscale
	var/datum/color_palette/generic_colors/palette = new_silverscale.dna.color_palettes[/datum/color_palette/generic_colors]
	old_mutcolor = palette.return_color(MUTANT_COLOR)
	old_eye_color_left = silverscale.eye_color_left
	old_eye_color_right = silverscale.eye_color_right
	palette.mutant_color = "#eeeeee"
	silverscale.eye_color_left = "#0000a0"
	silverscale.eye_color_right = "#0000a0"
	..()
	silverscale.add_filter("silver_glint", 2, list("type" = "outline", "color" = "#ffffff63", "size" = 2))

/datum/species/lizard/silverscale/on_species_loss(mob/living/carbon/old_silverscale, datum/species/new_species, pref_load)
	var/mob/living/carbon/human/was_silverscale = old_silverscale
	var/datum/color_palette/generic_colors/palette = was_silverscale.dna.color_palettes[/datum/color_palette/generic_colors]
	palette.mutant_color = old_mutcolor
	was_silverscale.eye_color_left = old_eye_color_left
	was_silverscale.eye_color_right = old_eye_color_right

=======
/datum/species/lizard/silverscale/get_physical_attributes()
	return "Silver Scales are to lizardpeople what angels are to humans. \
		Mostly identical, they are holy, don't breathe, don't get viruses, their hide cannot be pierced, love the taste of wine, \
		and their tongue allows them to turn into a statue, for some reason."

/datum/species/lizard/silverscale/on_species_gain(mob/living/carbon/human/new_silverscale, datum/species/old_species, pref_load, regenerate_icons)
	old_mutcolor = new_silverscale.dna.features["mcolor"]
	new_silverscale.dna.features["mcolor"] = "#eeeeee"
	new_silverscale.add_eye_color("#0000a0", EYE_COLOR_SPECIES_PRIORITY)
	. = ..()
	new_silverscale.add_filter("silver_glint", 2, list("type" = "outline", "color" = "#ffffff63", "size" = 2))

/datum/species/lizard/silverscale/on_species_loss(mob/living/carbon/human/was_silverscale, datum/species/new_species, pref_load)
	was_silverscale.dna.features["mcolor"] = old_mutcolor
	was_silverscale.remove_eye_color(EYE_COLOR_SPECIES_PRIORITY)
>>>>>>> tg-pr-88929
	was_silverscale.remove_filter("silver_glint")
	return ..()
