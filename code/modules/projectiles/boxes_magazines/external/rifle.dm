/obj/item/ammo_box/magazine/sr10mm
	name = "rifle magazine (10mm)"
	desc = "A well-worn magazine fitted for the surplus rifle."
	icon_state = "75"
	ammo_type = /obj/item/ammo_casing/c10mm
	max_ammo = 10
	multiple_sprites = AMMO_BOX_FULL_EMPTY

<<<<<<< HEAD
/obj/item/ammo_box/magazine/m10mm/rifle/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[LAZYLEN(stored_ammo) ? "full" : "empty"]"


///M90-GL and Boarder AR

/obj/item/ammo_box/magazine/m556
	name = "toploader magazine (5.56mm)"
	icon_state = "5.56m"
	ammo_type = /obj/item/ammo_casing/a556
	caliber = CALIBER_A556
	max_ammo = 30
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/m556/phasic
	name = "toploader magazine (5.56mm Phasic)"
	ammo_type = /obj/item/ammo_casing/a556/phasic

/obj/item/ammo_box/magazine/m223
	name = "toploader magazine (.223)"
	icon_state = ".223"
	ammo_type = /obj/item/ammo_casing/a223
	caliber = CALIBER_A223
	max_ammo = 30
	multiple_sprites = AMMO_BOX_FULL_EMPTY

=======
/obj/item/ammo_box/magazine/m223
	name = "toploader magazine (.223)"
	icon_state = ".223"
	ammo_type = /obj/item/ammo_casing/a223
	caliber = CALIBER_A223
	max_ammo = 30
	multiple_sprites = AMMO_BOX_FULL_EMPTY

>>>>>>> tg-pr-88929
/obj/item/ammo_box/magazine/m223/phasic
	name = "toploader magazine (.223 Phasic)"
	ammo_type = /obj/item/ammo_casing/a223/phasic

<<<<<<< HEAD

///Rostokov "rifle"

/obj/item/ammo_box/magazine/rostokov9mm
	name = "rostokov magazine (9mm)"
	icon_state = "rostokov-1"
	base_icon_state = "rostokov"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 20

/obj/item/ammo_box/magazine/rostokov9mm/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]-[ammo_count() ? 1 : 0]"


// .40 Sol rifle magazines

/obj/item/ammo_box/magazine/c40sol_rifle
	name = "\improper Sol rifle short magazine"
	desc = "A shortened magazine for SolFed rifles, holds fifteen rounds."
	icon = 'monkestation/code/modules/blueshift/icons/obj/company_and_or_faction_based/carwo_defense_systems/ammo.dmi'
	icon_state = "rifle_short"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_TINY
	ammo_type = /obj/item/ammo_casing/c40sol
	caliber = CALIBER_SOL40LONG
	max_ammo = 15

/obj/item/ammo_box/magazine/c40sol_rifle/starts_empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/c40sol_rifle/standard
	name = "\improper Sol rifle magazine"
	desc = "A standard size magazine for SolFed rifles, holds thirty rounds."
	icon_state = "rifle_standard"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 30

/obj/item/ammo_box/magazine/c40sol_rifle/standard/starts_empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/c40sol_rifle/drum
	name = "\improper Sol rifle drum magazine"
	desc = "A massive drum magazine for SolFed rifles, holds sixty rounds."
	icon_state = "rifle_drum"
	w_class = WEIGHT_CLASS_BULKY
	max_ammo = 60

/obj/item/ammo_box/magazine/c40sol_rifle/drum/starts_empty
	start_empty = TRUE


// .310 Lanca magazines

/obj/item/ammo_box/magazine/lanca
	name = "\improper Lanca rifle magazine"
	desc = "A standard size magazine for Lanca rifles, holds five rounds."
	icon = 'monkestation/code/modules/blueshift/icons/obj/company_and_or_faction_based/szot_dynamica/ammo.dmi'
	icon_state = "lanca_mag"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	ammo_type = /obj/item/ammo_casing/strilka310
	caliber = CALIBER_STRILKA310
	max_ammo = 5

/obj/item/ammo_box/magazine/lanca/spawns_empty
	start_empty = TRUE
=======
// .38 (Battle Rifle) //

/obj/item/ammo_box/magazine/m38
	name = "battle rifle magazine (.38)"
	desc = "A magazine for a BR-38 battle rifle."
	icon_state = "38mag"
	base_icon_state = "38mag"
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = /obj/item/ammo_casing/c38
	caliber = CALIBER_38
	max_ammo = 15
	ammo_band_icon = "+38mag_ammo_band"
	ammo_band_color = null

/obj/item/ammo_box/magazine/m38/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state][ammo_count() ? "-ammo" : ""]"

/obj/item/ammo_box/magazine/m38/empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/m38/trac
	name = "battle rifle magazine (.38 TRAC)"
	desc = "A magazine for a BR-38 battle rifle. TRAC bullets embed a tracking implant within the target's body and are entirely nonlethal."
	ammo_type = /obj/item/ammo_casing/c38/trac
	ammo_band_color = COLOR_AMMO_TRACK

/obj/item/ammo_box/magazine/m38/match
	name = "battle rifle magazine (.38 Match)"
	desc = "A magazine for a BR-38 battle rifle. These rounds are manufactured within extremely tight tolerances, making them easy to show off trickshots with."
	ammo_type = /obj/item/ammo_casing/c38/match
	ammo_band_color = COLOR_AMMO_MATCH

/obj/item/ammo_box/magazine/m38/match/bouncy
	name = "battle rifle magazine (.38 Rubber)"
	desc = "A magazine for a BR-38 battle rifle. These rounds are incredibly bouncy and MOSTLY nonlethal, making them great to show off trickshots with."
	ammo_type = /obj/item/ammo_casing/c38/match/bouncy
	ammo_band_color = COLOR_AMMO_RUBBER

/obj/item/ammo_box/magazine/m38/true
	name = "battle rifle magazine (.38 True Strike)"
	desc = "A magazine for a BR-38 battle rifle. Bullets bounce towards new targets with surprising accuracy."
	ammo_type = /obj/item/ammo_casing/c38/match/true
	ammo_band_color = COLOR_AMMO_TRUESTRIKE

/obj/item/ammo_box/magazine/m38/dumdum
	name = "battle rifle magazine (.38 DumDum)"
	desc = "A magazine for a BR-38 battle rifle. These rounds expand on impact, allowing them to shred the target and cause massive bleeding. Very weak against armor and distant targets."
	ammo_type = /obj/item/ammo_casing/c38/dumdum
	ammo_band_color = COLOR_AMMO_DUMDUM

/obj/item/ammo_box/magazine/m38/hotshot
	name = "battle rifle magazine (.38 Hot Shot)"
	desc = "A magazine for a BR-38 battle rifle. Hot Shot bullets contain an incendiary payload."
	ammo_type = /obj/item/ammo_casing/c38/hotshot
	ammo_band_color = COLOR_AMMO_HOTSHOT

/obj/item/ammo_box/magazine/m38/iceblox
	name = "battle rifle magazine (.38 Iceblox)"
	desc = "A magazine for a BR-38 battle rifle. Iceblox bullets contain a cryogenic payload."
	ammo_type = /obj/item/ammo_casing/c38/iceblox
	ammo_band_color = COLOR_AMMO_ICEBLOX
>>>>>>> tg-pr-88929
