/*ALL DNA, SPECIES, AND GENETICS-RELATED DEFINES GO HERE*/

#define CHECK_DNA_AND_SPECIES(C) if(!(C.dna?.species)) return

#define UE_CHANGED "ue changed"
#define UI_CHANGED "ui changed"
#define UF_CHANGED "uf changed"

#define CHAMELEON_MUTATION_DEFAULT_TRANSPARENCY 204

// String identifiers for associative list lookup

//Types of usual mutations
#define POSITIVE 1
#define NEGATIVE 2
#define MINOR_NEGATIVE 4

<<<<<<< HEAD
//Mutation sources. As long as there is at least one, the mutation will stay up after a remove_mutation call
///Source for mutations that have been activated by completing a sequence or using an activator
#define MUTATION_SOURCE_ACTIVATED "activated"
///Source for mutations that have been added via mutators
#define MUTATION_SOURCE_MUTATOR "mutator"
///From timed dna injectors.
#define MUTATION_SOURCE_TIMED_INJECTOR "timed_injector"
///From mob/living/carbon/human/proc/crewlike_monkify()
#define MUTATION_SOURCE_CREW_MONKEY "crew_monkey"
#define MUTATION_SOURCE_MEDIEVAL_CTF "medieval_ctf"
#define MUTATION_SOURCE_DNA_VAULT "dna_vault"
///From the /datum/action/cooldown/spell/apply_mutations spell
#define MUTATION_SOURCE_SPELL "spell"
///From the heart eater component
#define MUTATION_SOURCE_HEART_EATER "heart_eater"
#define MUTATION_SOURCE_RAT_HEART "rat_heart"
#define MUTATION_SOURCE_CLOWN_CLUMSINESS "clown_clumsiness"
#define MUTATION_SOURCE_CHANGELING "changeling"
#define MUTATION_SOURCE_GHOST_ROLE "ghost_role"
#define MUTATION_SOURCE_WISHGRANTER "wishgranter"
#define MUTATION_SOURCE_VV "vv"
#define MUTATION_SOURCE_MANNITOIL "mannitoil"
#define MUTATION_SOURCE_MAINT_ADAPT "maint_adapt"
#define MUTATION_SOURCE_BURDENED_TRAUMA "burdened_trauma"
#define MUTATION_SOURCE_GENE_SYMPTOM "gene_symptom"
=======

//Mutation classes. Normal being on them, extra being additional mutations with instability and other being stuff you don't want people to fuck with like wizard mutate
/// A mutation that can be activated and deactivated by completing a sequence
#define MUT_NORMAL 1
/// A mutation that is in the mutations tab, and can be given and taken away through though the DNA console. Has a 0 before its name in the mutation section of the dna console
#define MUT_EXTRA 2
/// Cannot be interacted with by players through normal means. I.E. wizards mutate
#define MUT_OTHER 3
>>>>>>> tg-pr-88929

//DNA - Because fuck you and your magic numbers being all over the codebase.
#define DNA_BLOCK_SIZE 3

#define DNA_BLOCK_SIZE_COLOR DEFAULT_HEX_COLOR_LEN

#define DNA_GENDER_BLOCK 1
#define DNA_SKIN_TONE_BLOCK 2
#define DNA_EYE_COLOR_LEFT_BLOCK 3
#define DNA_EYE_COLOR_RIGHT_BLOCK 4
#define DNA_HAIRSTYLE_BLOCK 5
#define DNA_HAIR_COLOR_BLOCK 6
#define DNA_FACIAL_HAIRSTYLE_BLOCK 7
#define DNA_FACIAL_HAIR_COLOR_BLOCK 8
<<<<<<< HEAD

#define DNA_UNI_IDENTITY_BLOCKS 8

=======
#define DNA_HAIRSTYLE_GRADIENT_BLOCK 9
#define DNA_HAIR_COLOR_GRADIENT_BLOCK 10
#define DNA_FACIAL_HAIRSTYLE_GRADIENT_BLOCK 11
#define DNA_FACIAL_HAIR_COLOR_GRADIENT_BLOCK 12

#define DNA_UNI_IDENTITY_BLOCKS 12

/// This number needs to equal the total number of DNA blocks
>>>>>>> tg-pr-88929
#define DNA_MUTANT_COLOR_BLOCK 1
#define DNA_ETHEREAL_COLOR_BLOCK 2
#define DNA_LIZARD_MARKINGS_BLOCK 3
#define DNA_TAIL_BLOCK 4
#define DNA_LIZARD_TAIL_BLOCK 5
#define DNA_SNOUT_BLOCK 6
#define DNA_HORNS_BLOCK 7
#define DNA_FRILLS_BLOCK 8
#define DNA_SPINES_BLOCK 9
#define DNA_EARS_BLOCK 10
#define DNA_MOTH_WINGS_BLOCK 11
#define DNA_MOTH_ANTENNAE_BLOCK 12
#define DNA_MOTH_MARKINGS_BLOCK 13
#define DNA_MUSHROOM_CAPS_BLOCK 14
#define DNA_POD_HAIR_BLOCK 15
<<<<<<< HEAD
#define DNA_MUTANT_COLOR_SECONDARY 16
#define DNA_ARM_WINGS_BLOCK 17 // NON-MODULE CHANGE
#define DNA_AVIAN_EARS_BLOCK 18 // NON-MODULE CHANGE
#define DNA_AVIAN_TAIL_BLOCK 19 // NON-MODULE CHANGE
#define DNA_FEATHER_COLOR_BLOCK 20 // NON-MODULE CHANGE

/// This number needs to equal the total number of DNA blocks
#define DNA_FEATURE_BLOCKS 20
=======
#define DNA_FISH_TAIL_BLOCK 16

// Hey! Listen up if you're here because you're adding a species feature!
//
// You don't need to add a DNA block for EVERY species feature!
// You ONLY need DNA blocks if you intend to allow players to change it via GENETICS!
// (Which means having a DNA block for a feature tied to a mob without DNA is entirely pointless.)

/// Total amount of DNA blocks, must be equal to the highest DNA block number
#define DNA_FEATURE_BLOCKS 16
>>>>>>> tg-pr-88929

#define DNA_SEQUENCE_LENGTH 4
#define DNA_MUTATION_BLOCKS 8
#define DNA_UNIQUE_ENZYMES_LEN 32

<<<<<<< HEAD
///flag for the transfer_flag argument from dna/proc/copy_dna(). This one makes it so the SE is copied too.
#define COPY_DNA_SE (1<<0)
///flag for the transfer_flag argument from dna/proc/copy_dna(). This one copies the species.
#define COPY_DNA_SPECIES (1<<1)
///flag for the transfer_flag argument from dna/proc/copy_dna(). This one copies the mutations.
#define COPY_DNA_MUTATIONS (1<<2)

#define CLONER_FRESH_CLONE "fresh"
#define CLONER_MATURE_CLONE "mature"

/// Use this if you want to change the race's color without the player being able to pick their own color. AKA special color shifting
#define DYNCOLORS 7
#define AGENDER 8
///If we have a limb-specific overlay sprite
#define HAS_MARKINGS 9
/// Do not draw blood overlay
#define NOBLOODOVERLAY 10
///No augments, for monkeys in specific because they will turn into fucking freakazoids https://cdn.discordapp.com/attachments/326831214667235328/791313258912153640/102707682-fa7cad80-4294-11eb-8f13-8c689468aeb0.png
#define NOAUGMENTS 11
///will be assigned a universal vampire themed last name shared by their department. this is preferenced!
#define BLOOD_CLANS 12

#define REVIVESBYHEALING 13

=======
>>>>>>> tg-pr-88929
//organ slots
#define ORGAN_SLOT_ADAMANTINE_RESONATOR "adamantine_resonator"
#define ORGAN_SLOT_APPENDIX "appendix"
#define ORGAN_SLOT_BORER_ORGAN "borer_organ"
#define ORGAN_SLOT_BRAIN "brain"
#define ORGAN_SLOT_BRAIN_CEREBELLUM "brain_antidrop"
#define ORGAN_SLOT_BRAIN_CNS "brain_antistun"
#define ORGAN_SLOT_BREATHING_TUBE "breathing_tube"
#define ORGAN_SLOT_EARS "ears"
#define ORGAN_SLOT_EYES "eye_sight"
#define ORGAN_SLOT_HEART "heart"
#define ORGAN_SLOT_HEART_AID "heartdrive"
#define ORGAN_SLOT_HUD "eye_hud"
#define ORGAN_SLOT_LIVER "liver"
#define ORGAN_SLOT_SPLEEN "spleen" //monkestation addition
#define ORGAN_SLOT_LUNGS "lungs"
#define ORGAN_SLOT_PARASITE_EGG "parasite_egg"
#define ORGAN_SLOT_MONSTER_CORE "monstercore"
#define ORGAN_SLOT_RIGHT_ARM_AUG "r_arm_device"
#define ORGAN_SLOT_LEFT_ARM_AUG "l_arm_device" //This one ignores alphabetical order cause the arms should be together
#define ORGAN_SLOT_RIGHT_ARM_MUSCLE "r_arm_muscle"
#define ORGAN_SLOT_LEFT_ARM_MUSCLE "l_arm_muscle" //same as above
<<<<<<< HEAD
=======
#define ORGAN_SLOT_SPINE "spine"
>>>>>>> tg-pr-88929
#define ORGAN_SLOT_STOMACH "stomach"
#define ORGAN_SLOT_STOMACH_AID "stomach_aid"
#define ORGAN_SLOT_STORAGE_CAVITY "storage_cavity" // monkestation edit
#define ORGAN_SLOT_THRUSTERS "thrusters"
#define ORGAN_SLOT_TONGUE "tongue"
#define ORGAN_SLOT_VOICE "vocal_cords"
#define ORGAN_SLOT_ZOMBIE "zombie_infection"
#define ORGAN_SLOT_BRAIN_TUMOR "brain_tumor"
#define ORGAN_SLOT_BUTT "butt"
#define ORGAN_SLOT_BLADDER "bladder"
#define ORGAN_SLOT_LINK "cyber_link"
#define ORGAN_SLOT_RIGHT_LEG_AUG "r_leg_device"
#define ORGAN_SLOT_LEFT_LEG_AUG "l_leg_device"
#define ORGAN_SLOT_SPINAL "spinal_implant"
#define ORGAN_SLOT_BRAIN_NIF "nif"

/// Organ slot external
#define ORGAN_SLOT_EXTERNAL_TAIL "tail"
#define ORGAN_SLOT_EXTERNAL_SPINES "spines"
#define ORGAN_SLOT_EXTERNAL_SNOUT "snout"
#define ORGAN_SLOT_EXTERNAL_FRILLS "frills"
#define ORGAN_SLOT_EXTERNAL_HORNS "horns"
#define ORGAN_SLOT_EXTERNAL_WINGS "wings"
#define ORGAN_SLOT_EXTERNAL_ANTENNAE "antennae"
#define ORGAN_SLOT_EXTERNAL_POD_HAIR "pod_hair"
#define ORGAN_SLOT_EXTERNAL_ANIME_HEAD "anime_head"
#define ORGAN_SLOT_EXTERNAL_ANIME_CHEST "anime_chest"
#define ORGAN_SLOT_EXTERNAL_ANIME_BOTTOM "anime_bottom"
#define ORGAN_SLOT_EXTERNAL_FLORAN_LEAVES "floran_leaves"
#define ORGAN_SLOT_EXTERNAL_FLUFF "fluff"
#define ORGAN_SLOT_EXTERNAL_FEATHERS "feathers"

/// Xenomorph organ slots
#define ORGAN_SLOT_XENO_ACIDGLAND "acid_gland"
#define ORGAN_SLOT_XENO_EGGSAC "eggsac"
#define ORGAN_SLOT_XENO_HIVENODE "hive_node"
#define ORGAN_SLOT_XENO_NEUROTOXINGLAND "neurotoxin_gland"
#define ORGAN_SLOT_XENO_PLASMAVESSEL "plasma_vessel"
#define ORGAN_SLOT_XENO_RESINSPINNER "resin_spinner"

//organ defines
#define STANDARD_ORGAN_THRESHOLD 100
#define STANDARD_ORGAN_HEALING (50 / 100000)
/// designed to fail organs when left to decay for ~15 minutes
#define STANDARD_ORGAN_DECAY (111 / 100000)

//used for the can_chromosome var on mutations
#define CHROMOSOME_NEVER 0
#define CHROMOSOME_NONE 1
#define CHROMOSOME_USED 2

#define MUTATION_COEFFICIENT_UNMODIFIABLE -1

//used for mob's genetic gender (mainly just for pronouns, members of sexed species with plural gender refer to their physique for the actual sprites, which is not genetic)
#define GENDERS 4
#define G_MALE 1
#define G_FEMALE 2
#define G_PLURAL 3
#define G_NEUTER 4

/// Defines how a mob's organs_slot is ordered
/// Exists so Life()'s organ process order is consistent
GLOBAL_LIST_INIT(organ_process_order, list(
	ORGAN_SLOT_BRAIN,
	ORGAN_SLOT_LINK,
	ORGAN_SLOT_SPINAL,
	ORGAN_SLOT_APPENDIX,
	ORGAN_SLOT_RIGHT_ARM_AUG,
	ORGAN_SLOT_LEFT_ARM_AUG,
	ORGAN_SLOT_LEFT_ARM_MUSCLE,
	ORGAN_SLOT_RIGHT_ARM_MUSCLE,
<<<<<<< HEAD
	ORGAN_SLOT_RIGHT_LEG_AUG,
	ORGAN_SLOT_LEFT_LEG_AUG,
=======
>>>>>>> tg-pr-88929
	ORGAN_SLOT_STOMACH,
	ORGAN_SLOT_STOMACH_AID,
	ORGAN_SLOT_BREATHING_TUBE,
	ORGAN_SLOT_EARS,
	ORGAN_SLOT_EYES,
	ORGAN_SLOT_LUNGS,
	ORGAN_SLOT_HEART,
	ORGAN_SLOT_ZOMBIE,
	ORGAN_SLOT_THRUSTERS,
	ORGAN_SLOT_HUD,
	ORGAN_SLOT_LIVER,
	ORGAN_SLOT_SPLEEN, //monkestation addition
	ORGAN_SLOT_TONGUE,
	ORGAN_SLOT_VOICE,
	ORGAN_SLOT_ADAMANTINE_RESONATOR,
	ORGAN_SLOT_BORER_ORGAN,
	ORGAN_SLOT_HEART_AID,
	ORGAN_SLOT_BRAIN_CEREBELLUM,
	ORGAN_SLOT_BRAIN_CNS,
	ORGAN_SLOT_PARASITE_EGG,
	ORGAN_SLOT_MONSTER_CORE,
	ORGAN_SLOT_XENO_PLASMAVESSEL,
	ORGAN_SLOT_XENO_HIVENODE,
	ORGAN_SLOT_XENO_RESINSPINNER,
	ORGAN_SLOT_XENO_ACIDGLAND,
	ORGAN_SLOT_XENO_NEUROTOXINGLAND,
	ORGAN_SLOT_XENO_EGGSAC,))

//Defines for Golem Species IDs
#define SPECIES_GOLEM "golem"

// Defines for used in creating "perks" for the species preference pages.
/// A key that designates UI icon displayed on the perk.
#define SPECIES_PERK_ICON "ui_icon"
/// A key that designates the name of the perk.
#define SPECIES_PERK_NAME "name"
/// A key that designates the description of the perk.
#define SPECIES_PERK_DESC "description"
/// A key that designates what type of perk it is (see below).
#define SPECIES_PERK_TYPE "perk_type"

// The possible types each perk can be.
// Positive perks are shown in green, negative in red, and neutral in grey.
#define SPECIES_POSITIVE_PERK "positive"
#define SPECIES_NEGATIVE_PERK "negative"
#define SPECIES_NEUTRAL_PERK "neutral"

/// Golem food defines
#define GOLEM_FOOD_IRON "golem_food_iron"
#define GOLEM_FOOD_GLASS "golem_food_glass"
#define GOLEM_FOOD_URANIUM "golem_food_uranium"
#define GOLEM_FOOD_SILVER "golem_food_silver"
#define GOLEM_FOOD_PLASMA "golem_food_plasma"
#define GOLEM_FOOD_GOLD "golem_food_gold"
#define GOLEM_FOOD_DIAMOND "golem_food_diamond"
#define GOLEM_FOOD_TITANIUM "golem_food_titanium"
#define GOLEM_FOOD_PLASTEEL "golem_food_plasteel"
#define GOLEM_FOOD_BANANIUM "golem_food_bananium"
#define GOLEM_FOOD_BLUESPACE "golem_food_bluespace"
#define GOLEM_FOOD_GIBTONITE "golem_food_gibtonite"
#define GOLEM_FOOD_LIGHTBULB "golem_food_lightbulb"

/// Golem food datum singletons
GLOBAL_LIST_INIT(golem_stack_food_types, list(
	GOLEM_FOOD_IRON = new /datum/golem_food_buff/iron(),
	GOLEM_FOOD_GLASS = new /datum/golem_food_buff/glass(),
	GOLEM_FOOD_URANIUM = new /datum/golem_food_buff/uranium(),
	GOLEM_FOOD_SILVER = new /datum/golem_food_buff/silver(),
	GOLEM_FOOD_PLASMA = new /datum/golem_food_buff/plasma(),
	GOLEM_FOOD_GOLD = new /datum/golem_food_buff/gold(),
	GOLEM_FOOD_DIAMOND = new /datum/golem_food_buff/diamond(),
	GOLEM_FOOD_TITANIUM = new /datum/golem_food_buff/titanium(),
	GOLEM_FOOD_PLASTEEL = new /datum/golem_food_buff/plasteel(),
	GOLEM_FOOD_BANANIUM = new /datum/golem_food_buff/bananium(),
	GOLEM_FOOD_BLUESPACE = new /datum/golem_food_buff/bluespace(),
	GOLEM_FOOD_GIBTONITE = new /datum/golem_food_buff/gibtonite(),
	GOLEM_FOOD_LIGHTBULB = new /datum/golem_food_buff/lightbulb(),
))

/// Associated list of stack types to a golem food
GLOBAL_LIST_INIT(golem_stack_food_directory, list(
	/obj/item/gibtonite = GLOB.golem_stack_food_types[GOLEM_FOOD_GIBTONITE],
	/obj/item/light = GLOB.golem_stack_food_types[GOLEM_FOOD_LIGHTBULB],
	/obj/item/stack/sheet/iron = GLOB.golem_stack_food_types[GOLEM_FOOD_IRON],
	/obj/item/stack/ore/iron = GLOB.golem_stack_food_types[GOLEM_FOOD_IRON],
	/obj/item/stack/sheet/glass = GLOB.golem_stack_food_types[GOLEM_FOOD_GLASS],
	/obj/item/stack/sheet/mineral/uranium = GLOB.golem_stack_food_types[GOLEM_FOOD_URANIUM],
	/obj/item/stack/ore/uranium = GLOB.golem_stack_food_types[GOLEM_FOOD_URANIUM],
	/obj/item/stack/sheet/mineral/silver = GLOB.golem_stack_food_types[GOLEM_FOOD_SILVER],
	/obj/item/stack/ore/silver = GLOB.golem_stack_food_types[GOLEM_FOOD_SILVER],
	/obj/item/stack/sheet/mineral/plasma = GLOB.golem_stack_food_types[GOLEM_FOOD_PLASMA],
	/obj/item/stack/ore/plasma = GLOB.golem_stack_food_types[GOLEM_FOOD_PLASMA],
	/obj/item/stack/sheet/mineral/gold = GLOB.golem_stack_food_types[GOLEM_FOOD_GOLD],
	/obj/item/stack/ore/gold = GLOB.golem_stack_food_types[GOLEM_FOOD_GOLD],
	/obj/item/stack/sheet/mineral/diamond = GLOB.golem_stack_food_types[GOLEM_FOOD_DIAMOND],
	/obj/item/stack/ore/diamond = GLOB.golem_stack_food_types[GOLEM_FOOD_DIAMOND],
	/obj/item/stack/sheet/mineral/titanium = GLOB.golem_stack_food_types[GOLEM_FOOD_TITANIUM],
	/obj/item/stack/ore/titanium = GLOB.golem_stack_food_types[GOLEM_FOOD_TITANIUM],
	/obj/item/stack/sheet/plasteel = GLOB.golem_stack_food_types[GOLEM_FOOD_PLASTEEL],
	/obj/item/stack/ore/bananium = GLOB.golem_stack_food_types[GOLEM_FOOD_BANANIUM],
	/obj/item/stack/sheet/mineral/bananium = GLOB.golem_stack_food_types[GOLEM_FOOD_BANANIUM],
	/obj/item/stack/ore/bluespace_crystal = GLOB.golem_stack_food_types[GOLEM_FOOD_BLUESPACE],
	/obj/item/stack/ore/bluespace_crystal/refined = GLOB.golem_stack_food_types[GOLEM_FOOD_BLUESPACE],
	/obj/item/stack/ore/bluespace_crystal/artificial = GLOB.golem_stack_food_types[GOLEM_FOOD_BLUESPACE],
	/obj/item/stack/sheet/bluespace_crystal = GLOB.golem_stack_food_types[GOLEM_FOOD_BLUESPACE],
))
