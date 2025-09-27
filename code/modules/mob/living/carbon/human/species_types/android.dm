/datum/species/android
	name = "Android"
	id = SPECIES_ANDROID
	examine_limb_id = SPECIES_HUMAN
	inherent_traits = list(
<<<<<<< HEAD
		TRAIT_NO_UNDERWEAR,
		TRAIT_NO_DNA_COPY,
		TRAIT_NO_TRANSFORMATION_STING,
		TRAIT_NO_HUSK,
		TRAIT_GENELESS,
=======
		TRAIT_GENELESS,
		TRAIT_LIMBATTACHMENT,
		TRAIT_LIVERLESS_METABOLISM,
		TRAIT_NOBLOOD,
>>>>>>> tg-pr-88929
		TRAIT_NOBREATH,
		TRAIT_NOCRITDAMAGE,
		TRAIT_NOFIRE,
		TRAIT_NOHUNGER,
<<<<<<< HEAD
		/* TRAIT_NOMETABOLISM, */ // monkestation edit: making androids closer to IPCs
=======
		TRAIT_NO_DNA_COPY,
		TRAIT_NO_PLASMA_TRANSFORM,
		TRAIT_NO_UNDERWEAR,
		TRAIT_OVERDOSEIMMUNE,
>>>>>>> tg-pr-88929
		TRAIT_PIERCEIMMUNE,
		TRAIT_RADIMMUNE,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTHEAT,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_TOXIMMUNE,
<<<<<<< HEAD
		TRAIT_NOBLOOD,
		TRAIT_NO_DEBRAIN_OVERLAY,
		TRAIT_VIRUSIMMUNE,
		// monkestation edit: making androids closer to IPCs
		TRAIT_REVIVES_BY_HEALING,
		TRAIT_NO_DNA_COPY,
		TRAIT_XENO_IMMUNE,
		TRAIT_STABLELIVER,
		// monkestation end
	)

	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	meat = /obj/item/stack/sheet/plasteel{amount = 5}
	skinned_type = /obj/item/stack/sheet/iron{amount = 10}
	species_gibs = GIB_TYPE_ROBOTIC
	mutantbrain = /obj/item/organ/internal/brain/cybernetic
	mutanttongue = /obj/item/organ/internal/tongue/robot
=======
	)

	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	meat = null
	mutantbrain = /obj/item/organ/brain/cybernetic
	mutanttongue = /obj/item/organ/tongue/robot
>>>>>>> tg-pr-88929
	mutantstomach = null
	mutantappendix = null
	mutantheart = null
	mutantliver = null
	mutantlungs = null
<<<<<<< HEAD
	mutantappendix = null
	mutantbladder = null
	mutanteyes = /obj/item/organ/internal/eyes/robotic
	mutantears = /obj/item/organ/internal/ears/cybernetic
	mutantbutt = /obj/item/organ/internal/butt/cyber
=======
	mutanteyes = /obj/item/organ/eyes/robotic
	mutantears = /obj/item/organ/ears/cybernetic
>>>>>>> tg-pr-88929
	species_language_holder = /datum/language_holder/synthetic
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	reagent_tag = PROCESS_SYNTHETIC // They don't HAVE a liver, but if they did, they'd have synthetic chem processing.


	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/robot/android,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/robot/android,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/robot/android,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/robot/android,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/robot/android,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/robot/android,
	)

<<<<<<< HEAD

//Taken from TGstation
/datum/species/android/get_species_description()
	return "Androids are an entirely synthetic species."


/// Taken from TGstation.
/datum/species/android/create_pref_traits_perks()
	var/list/to_add = list()

	to_add += list(
	list(
=======
/datum/species/android/get_physical_attributes()
	return "Androids are almost, but not quite, identical to fully augmented humans. \
	Unlike those, though, they're completely immune to toxin damage, don't have blood or organs (besides their head), don't get hungry, and can reattach their limbs! \
	That said, an EMP will devastate them and they cannot process any chemicals."

/datum/species/android/get_species_description()
	return "Androids are an entirely synthetic species."

/datum/species/android/get_species_lore()
	return list(
		"Androids are a synthetic species created by Nanotrasen as an intermediary between humans and cyborgs."
	)

/datum/species/android/create_pref_traits_perks()
	var/list/perks = list()
	perks += list(list(
>>>>>>> tg-pr-88929
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
		SPECIES_PERK_ICON = FA_ICON_SHIELD_ALT,
		SPECIES_PERK_NAME = "Android Aptitude",
		SPECIES_PERK_DESC = "As a synthetic lifeform, Androids are immune to many forms of damage humans are susceptible to. \
			Fire, cold, heat, pressure, radiation, and toxins are all ineffective against them. \
			They also can't overdose on drugs, don't need to breathe or eat, can't catch on fire, and are immune to being pierced.",
<<<<<<< HEAD
	),
	list(
=======
	))
	perks += list(list(
>>>>>>> tg-pr-88929
		SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
		SPECIES_PERK_ICON = FA_ICON_COGS,
		SPECIES_PERK_NAME = "Modular Lifeform",
		SPECIES_PERK_DESC = "Android limbs are modular, allowing them to easily reattach severed bodyparts.",
<<<<<<< HEAD
	),
	list(
=======
	))
	perks += list(list(
>>>>>>> tg-pr-88929
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = FA_ICON_DNA,
		SPECIES_PERK_NAME = "Not Human After All",
		SPECIES_PERK_DESC = "There is no humanity behind the eyes of the Android, and as such, they have no DNA to genetically alter.",
<<<<<<< HEAD
	),
	list(
=======
	))
	return perks

/datum/species/android/create_pref_unique_perks()
	var/list/perks = list()
	perks += list(list(
>>>>>>> tg-pr-88929
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
		SPECIES_PERK_ICON = FA_ICON_SHIELD_HEART,
		SPECIES_PERK_NAME = "Some Components Optional",
		SPECIES_PERK_DESC = "Androids have very few internal organs. While they can survive without many of them, \
			they don't have any benefits from them either.",
<<<<<<< HEAD
	),
	list(
=======
	))
	perks += list(list(
>>>>>>> tg-pr-88929
		SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
		SPECIES_PERK_ICON = FA_ICON_ROBOT,
		SPECIES_PERK_NAME = "Synthetic",
		SPECIES_PERK_DESC = "Being synthetic, Androids are vulnernable to EMPs.",
<<<<<<< HEAD
	),
	)
	return to_add
=======
	))
	return perks
>>>>>>> tg-pr-88929
