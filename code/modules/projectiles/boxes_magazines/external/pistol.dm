<<<<<<< HEAD
//10mm mags

/obj/item/ammo_box/magazine/m10mm
	name = "pistol magazine (10mm)"
	desc = "A gun magazine."
	icon_state = "9x19p"
	base_icon_state = "9x19p"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = CALIBER_10MM
	max_ammo = 8
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/m10mm/fire
	name = "pistol magazine (10mm incendiary)"
	icon_state = "9x19pI"
	base_icon_state = "9x19pI"
	desc = "A 10mm pistol magazine. Loaded with rounds which ignite the target."
	ammo_type = /obj/item/ammo_casing/c10mm/fire

/obj/item/ammo_box/magazine/m10mm/hp
	name = "pistol magazine (10mm HP)"
	icon_state = "9x19pH"
	base_icon_state = "9x19pH"
	desc= "A 10mm pistol magazine. Loaded with hollow-point rounds, extremely effective against unarmored targets, but nearly useless against protective clothing."
	ammo_type = /obj/item/ammo_casing/c10mm/hp

/obj/item/ammo_box/magazine/m10mm/ap
	name = "pistol magazine (10mm AP)"
	icon_state = "9x19pA"
	base_icon_state = "9x19pA"
	desc= "A 10mm pistol magazine. Loaded with rounds which penetrate armour, but are less effective against normal targets."
	ammo_type = /obj/item/ammo_casing/c10mm/ap

/obj/item/ammo_box/magazine/r10mm
	name = "regal condor magazine (10mm)"
	icon_state = "r10mm-8"
	base_icon_state = "r10mm"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = CALIBER_10MM
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/r10mm/empty
	icon_state = "r10mm-0"
	start_empty = TRUE


//.45 mags

/obj/item/ammo_box/magazine/m45
	name = "handgun magazine (.45)"
	icon_state = "45-8"
	base_icon_state = "45"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = CALIBER_45
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE
=======
#define FIRE_BULLETS " Carries rounds which ignite targets and leave flaming trails, but inflict less damage."
#define HP_BULLETS " Carries hollow-point rounds which are effective against unarmored targets, but suffer greatly against armor."
#define AP_BULLETS " Carries armor-piercing rounds which are effective against armored targets, but less effective against unarmored targets."

// Makarov (9mm) //
>>>>>>> tg-pr-88929

/obj/item/ammo_box/magazine/whispering_jester_45_magazine
	name = "Whispering-Jester pistol magazine (.45)"
	desc = "A .45 pistol magazine for the Whispering-Jester handgun. Normaly chambered with caseless 45."
	icon = 'monkestation/icons/obj/weapons/guns/whispering_jester_45/item.dmi'
	icon_state = "mag_jester"
	multiple_sprites = AMMO_BOX_PER_BULLET
	ammo_type = /obj/item/ammo_casing/caseless/c45_caseless
	caliber = CALIBER_45
	max_ammo = 18

/obj/item/ammo_box/magazine/whispering_jester_45_magazine/big_lmao
	name = "screaming hilux magazine"
	desc = "Why oh god fucking why?"
	max_ammo = 45


//9mm mags

/obj/item/ammo_box/magazine/m9mm
	name = "pistol magazine (9mm)"
	icon_state = "9x19p"
	base_icon_state = "9x19p"
	desc = "A 9mm handgun magazine, suitable for the Makarov pistol."
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 12
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/m9mm/fire
	name = "pistol magazine (9mm incendiary)"
	icon_state = "9x19pI"
	base_icon_state = "9x19pI"
	desc = parent_type::desc + FIRE_BULLETS
	ammo_type = /obj/item/ammo_casing/c9mm/fire

/obj/item/ammo_box/magazine/m9mm/hp
	name = "pistol magazine (9mm HP)"
	icon_state = "9x19pH"
	base_icon_state = "9x19pH"
	desc = parent_type::desc + HP_BULLETS
	ammo_type = /obj/item/ammo_casing/c9mm/hp

/obj/item/ammo_box/magazine/m9mm/ap
	name = "pistol magazine (9mm AP)"
	icon_state = "9x19pA"
	base_icon_state = "9x19pA"
	desc = parent_type::desc + AP_BULLETS
	ammo_type = /obj/item/ammo_casing/c9mm/ap

// Stechkin APS (9mm) //

/obj/item/ammo_box/magazine/m9mm_aps
	name = "stechkin pistol magazine (9mm)"
	desc = "A 9mm handgun magazine, suitable for the Stechkin APS machine pistol."
	icon_state = "9mmaps-15"
	base_icon_state = "9mmaps"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 15

/obj/item/ammo_box/magazine/m9mm_aps/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[round(ammo_count(), 5)]"

/obj/item/ammo_box/magazine/m9mm_aps/fire
	name = "stechkin pistol magazine (9mm incendiary)"
	desc = parent_type::desc + FIRE_BULLETS
	ammo_type = /obj/item/ammo_casing/c9mm/fire

/obj/item/ammo_box/magazine/m9mm_aps/hp
	name = "stechkin pistol magazine (9mm HP)"
	desc = parent_type::desc + HP_BULLETS
	ammo_type = /obj/item/ammo_casing/c9mm/hp

/obj/item/ammo_box/magazine/m9mm_aps/ap
	name = "stechkin pistol magazine (9mm AP)"
	desc = parent_type::desc + AP_BULLETS
	ammo_type = /obj/item/ammo_casing/c9mm/ap

<<<<<<< HEAD

///.50ae mags

/obj/item/ammo_box/magazine/m50
	name = "handgun magazine (.50ae)"
	icon_state = "50ae"
	ammo_type = /obj/item/ammo_casing/a50ae
	caliber = CALIBER_50
	max_ammo = 7
	multiple_sprites = AMMO_BOX_PER_BULLET


// .35 Sol pistol magazines

/obj/item/ammo_box/magazine/c35sol_pistol
	name = "\improper Sol pistol magazine"
	desc = "A standard size magazine for SolFed pistols, holds twelve rounds."
	icon = 'monkestation/code/modules/blueshift/icons/obj/company_and_or_faction_based/carwo_defense_systems/ammo.dmi'
	icon_state = "pistol_35_standard"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_TINY
	ammo_type = /obj/item/ammo_casing/c35sol
	caliber = CALIBER_SOL35SHORT
	max_ammo = 12

/obj/item/ammo_box/magazine/c35sol_pistol/starts_empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/c35sol_pistol/stendo
	name = "\improper Sol extended pistol magazine"
	desc = "An extended magazine for SolFed pistols, holds sixteen rounds."
	icon_state = "pistol_35_stended"
	w_class = WEIGHT_CLASS_NORMAL
	max_ammo = 16

/obj/item/ammo_box/magazine/c35sol_pistol/stendo/starts_empty
	start_empty = TRUE


// .585 pistol magazines

/obj/item/ammo_box/magazine/c585trappiste_pistol
	name = "\improper Trappiste pistol magazine"
	desc = "A standard size magazine for Trappiste pistols, holds sixteen rounds."
	icon = 'monkestation/code/modules/blueshift/icons/obj/company_and_or_faction_based/trappiste_fabriek/ammo.dmi'
	icon_state = "pistol_585_standard"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_SMALL
	ammo_type = /obj/item/ammo_casing/c585trappiste
	caliber = CALIBER_585TRAPPISTE
	max_ammo = 16

/obj/item/ammo_box/magazine/c585trappiste_pistol/spawns_empty
	start_empty = TRUE


//.35 Auto pistol magazines

/obj/item/ammo_box/magazine/m35
	name = "\improper \"Paco\" pistol magazine (.35 Auto)"
	desc = "A .35 Auto pistol magazine for the Paco handgun. Consult your head of security before use."
	icon = 'monkestation/code/modules/security/icons/paco_ammo.dmi'
	icon_state = "35"
	base_icon_state = "35"
	ammo_type = /obj/item/ammo_casing/c35
	caliber = CALIBER_35
	max_ammo = 16
=======
// Ansem (10mm) //

/obj/item/ammo_box/magazine/m10mm
	name = "pistol magazine (10mm)"
	desc = "A 10mm handgun magazine, suitable for the Ansem pistol."
	icon_state = "9x19p"
	base_icon_state = "9x19p"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = CALIBER_10MM
	max_ammo = 8
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

/obj/item/ammo_box/magazine/m10mm/fire
	name = "pistol magazine (10mm incendiary)"
	icon_state = "9x19pI"
	base_icon_state = "9x19pI"
	desc = parent_type::desc + FIRE_BULLETS
	ammo_type = /obj/item/ammo_casing/c10mm/fire

/obj/item/ammo_box/magazine/m10mm/hp
	name = "pistol magazine (10mm HP)"
	icon_state = "9x19pH"
	base_icon_state = "9x19pH"
	desc = parent_type::desc + HP_BULLETS
	ammo_type = /obj/item/ammo_casing/c10mm/hp

/obj/item/ammo_box/magazine/m10mm/ap
	name = "pistol magazine (10mm AP)"
	icon_state = "9x19pA"
	base_icon_state = "9x19pA"
	desc = parent_type::desc + AP_BULLETS
	ammo_type = /obj/item/ammo_casing/c10mm/ap

// Regal Condor (10mm) //

/obj/item/ammo_box/magazine/r10mm
	name = "regal condor magazine (10mm Reaper)"
	desc = "A very expensive 10mm handgun magazine, suitable for the Regal Condor. Loaded with \"reaper\" rounds, which are dangerously effective against everything."
	icon_state = "r10mm-8"
	base_icon_state = "r10mm"
	ammo_type = /obj/item/ammo_casing/c10mm/reaper
	caliber = CALIBER_10MM
	max_ammo = 8
>>>>>>> tg-pr-88929
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_box/magazine/m35/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[round(ammo_count(), 2)]"

/obj/item/ammo_box/magazine/m35/rubber
	name = "\improper \"Paco\" pistol magazine (.35 Auto Rubber)"
	desc = "A .35 Auto rubber pistol magazine for the \"Paco\" handgun. Loaded with rubber ammo for assisting in arrests."
	icon_state = "35r"
	base_icon_state = "35r"
	ammo_type = /obj/item/ammo_casing/c35/rubber
	w_class = WEIGHT_CLASS_SMALL


<<<<<<< HEAD
=======
// M1911 (.45) //

/obj/item/ammo_box/magazine/m45
	name = "handgun magazine (.45)"
	desc = "A .45 handgun magazine, suitable for the M1911."
	icon_state = "45-8"
	base_icon_state = "45"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = CALIBER_45
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE

// Desert Eagle (.50 AE) //

/obj/item/ammo_box/magazine/m50
	name = "handgun magazine (.50 AE)"
	desc = "A .50 AE handgun magazine, suitable for the Desert Eagle."
	icon_state = "50ae"
	ammo_type = /obj/item/ammo_casing/a50ae
	caliber = CALIBER_50AE
	max_ammo = 7
	multiple_sprites = AMMO_BOX_PER_BULLET

#undef FIRE_BULLETS
#undef HP_BULLETS
#undef AP_BULLETS
>>>>>>> tg-pr-88929
