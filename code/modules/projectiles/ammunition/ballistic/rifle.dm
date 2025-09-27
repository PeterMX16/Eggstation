// .310 Strilka (Sakhno Rifle)

/obj/item/ammo_casing/strilka310
	name = ".310 Strilka bullet casing"
	desc = "A .310 Strilka bullet casing. Casing is a bit of a fib, there is no case, its just a block of red powder."
	icon_state = "310-casing"
	caliber = CALIBER_STRILKA310
	projectile_type = /obj/projectile/bullet/strilka310

/obj/item/ammo_casing/strilka310/Initialize(mapload)
	. = ..()

	AddElement(/datum/element/caseless)

/obj/item/ammo_casing/strilka310/surplus
	name = ".310 Strilka surplus bullet casing"
	desc = "A surplus .310 Strilka bullet casing. Casing is a bit of a fib, there is no case, its just a block of red powder. Damp red powder at that."
	projectile_type = /obj/projectile/bullet/strilka310/surplus

/obj/item/ammo_casing/strilka310/enchanted
	projectile_type = /obj/projectile/bullet/strilka310/enchanted

/obj/item/ammo_casing/strilka310/phasic
	name = ".310 Strilka phasic bullet casing"
	desc = "A phasic .310 Strika bullet casing. "
	projectile_type = /obj/projectile/bullet/strilka310/phasic
// .223 (M-90gl Carbine)

/obj/item/ammo_casing/a223
	name = ".223 bullet casing"
	desc = "A .223 bullet casing."
	caliber = CALIBER_A223
	projectile_type = /obj/projectile/bullet/a223

/obj/item/ammo_casing/a223/phasic
	name = ".223 phasic bullet casing"
	desc = "A .223 phasic bullet casing."
	projectile_type = /obj/projectile/bullet/a223/phasic

/obj/item/ammo_casing/a223/weak
	projectile_type = /obj/projectile/bullet/a223/weak

/obj/item/ammo_casing/a223
	name = ".223 bullet casing"
	desc = "A .223 bullet casing."
	caliber = CALIBER_A223
	projectile_type = /obj/projectile/bullet/a223

/obj/item/ammo_casing/a223/phasic
	name = ".223 phasic bullet casing"
	desc = "A .223 phasic bullet casing."
	projectile_type = /obj/projectile/bullet/a223/phasic

/obj/item/ammo_casing/a223/weak
	projectile_type = /obj/projectile/bullet/a223/weak

// .40 Sol Long, caseless rifle bullets

/obj/item/ammo_casing/c40sol
	name = ".40 Sol Long lethal bullet casing"
	desc = "A SolFed standard caseless lethal rifle round."
	icon = 'monkestation/code/modules/blueshift/icons/obj/company_and_or_faction_based/carwo_defense_systems/ammo.dmi'
	icon_state = "40sol"
	caliber = CALIBER_SOL40LONG
	projectile_type = /obj/projectile/bullet/c40sol

/obj/item/ammo_casing/c40sol/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/caseless)

/obj/item/ammo_casing/c40sol/fragmentation  ///.40 Sol fragmentation rounds, embeds shrapnel in the target almost every time at close to medium range. Teeeechnically less lethals.
	name = ".40 Sol Long fragmentation bullet casing"
	desc = "A SolFed standard caseless fragmentation rifle round. Shatters upon impact, ejecting sharp shrapnel that can potentially incapacitate targets."
	icon_state = "40sol_disabler"
	projectile_type = /obj/projectile/bullet/c40sol/fragmentation
	advanced_print_req = TRUE
	harmful = FALSE

/obj/item/ammo_casing/c40sol/pierce   ///Bouncy and overpen
	name = ".40 Sol Long match bullet casing"
	desc = "A SolFed standard caseless match grade rifle round. Fires at a higher pressure and thus fires slightly faster projectiles. \
		Rumors say you can do sick ass wall bounce trick shots with these, though the official suggestion is to just shoot your target and \
		not the wall next to them."
	icon_state = "40sol_pierce"
	projectile_type = /obj/projectile/bullet/c40sol/pierce
	custom_materials = AMMO_MATS_AP
	advanced_print_req = TRUE

/obj/item/ammo_casing/c40sol/incendiary
	name = ".40 Sol Long incendiary bullet casing"
	desc = "A SolFed standard caseless incendiary rifle round. Leaves no flaming trail, only igniting targets on impact."
	icon_state = "40sol_flame"
	projectile_type = /obj/projectile/bullet/c40sol/incendiary
	custom_materials = AMMO_MATS_TEMP
	advanced_print_req = TRUE


///.310 Strilka, quite similar to 7.62 nagant in effect. Caseless

/obj/item/ammo_casing/strilka310
	name = ".310 Strilka bullet casing"
	desc = "A .310 Strilka bullet casing. Casing is a bit of a fib, there is no case, its just a block of red powder."
	icon_state = "310-casing"
	caliber = CALIBER_STRILKA310
	projectile_type = /obj/projectile/bullet/strilka310

/obj/item/ammo_casing/strilka310/Initialize(mapload)
	. = ..()

	AddElement(/datum/element/caseless)

/obj/item/ammo_casing/strilka310/surplus
	name = ".310 Strilka surplus bullet casing"
	desc = "A surplus .310 Strilka bullet casing. Casing is a bit of a fib, there is no case, its just a block of red powder. Damp red powder at that."
	projectile_type = /obj/projectile/bullet/strilka310/surplus

/obj/item/ammo_casing/strilka310/rubber
	name = ".310 Strilka rubber bullet casing"
	desc = "A .310 rubber bullet casing. Casing is a bit of a fib, there isn't one.\
	<br><br>\
	<i>RUBBER: Less than lethal ammo. Deals both stamina damage and regular damage.</i>"
	icon = 'monkestation/code/modules/blueshift/icons/obj/company_and_or_faction_based/xhihao_light_arms/ammo.dmi'
	icon_state = "310-casing-rubber"
	projectile_type = /obj/projectile/bullet/strilka310/rubber
	harmful = FALSE

/obj/item/ammo_casing/strilka310/ap
	name = ".310 Strilka armor-piercing bullet casing"
	desc = "A .310 armor-piercing bullet casing. Note, does not actually contain a casing.\
	<br><br>\
	<i>ARMOR-PIERCING: Improved armor-piercing capabilities, in return for less outright damage.</i>"
	icon = 'monkestation/code/modules/blueshift/icons/obj/company_and_or_faction_based/xhihao_light_arms/ammo.dmi'
	icon_state = "310-casing-ap"
	projectile_type = /obj/projectile/bullet/strilka310/ap
	custom_materials = AMMO_MATS_AP
	advanced_print_req = TRUE


///Mining heavy rifle

/obj/item/ammo_casing/minerjdj
	name = ".950 JDJ kinetic casing"
	desc = "A monster of a round for the 'Thor' Rifle, weighing over half a pound and capable of generating over 50,000 Joules of force. You might assume almost nothing could survive a round like this... but..."
	icon_state = ".950"
	caliber = CALIBER_MINER_950
	projectile_type = /obj/projectile/plasma/minerjdj

<<<<<<< HEAD
=======
/obj/item/ammo_casing/a40mm
	name = "40mm HE shell"
	desc = "A cased high explosive grenade that can only be activated once fired out of a grenade launcher."
	caliber = CALIBER_40MM
	icon_state = "40mmHE"
	projectile_type = /obj/projectile/bullet/a40mm
	newtonian_force = 1.25

/obj/item/ammo_casing/a40mm/rubber
	name = "40mm rubber shell"
	desc = "A cased rubber slug. The big brother of the beanbag slug, this thing will knock someone out in one. Doesn't do so great against anyone in armor."
	projectile_type = /obj/projectile/bullet/shotgun_beanbag/a40mm

/obj/item/ammo_casing/rebar
	name = "Sharpened Iron Rod"
	desc = "A Sharpened Iron rod. It's Pointy!"
	caliber = CALIBER_REBAR
	icon_state = "rod_sharp"
	base_icon_state = "rod_sharp"
	projectile_type = /obj/projectile/bullet/rebar
	newtonian_force = 1.5

/obj/item/ammo_casing/rebar/syndie
	name = "Jagged Iron Rod"
	desc = "An Iron rod, with notches cut into it. You really dont want this stuck in you."
	caliber = CALIBER_REBAR
	icon_state = "rod_jagged"
	base_icon_state = "rod_jagged"
	projectile_type = /obj/projectile/bullet/rebar/syndie

/obj/item/ammo_casing/rebar/zaukerite
	name = "Zaukerite Sliver"
	desc = "A sliver of a zaukerite crystal. Due to its irregular, jagged edges, removal of an embedded zaukerite sliver should only be done by trained surgeons."
	caliber = CALIBER_REBAR
	icon_state = "rod_zaukerite"
	base_icon_state = "rod_zaukerite"
	projectile_type = /obj/projectile/bullet/rebar/zaukerite

/obj/item/ammo_casing/rebar/hydrogen
	name = "Metallic Hydrogen Bolt"
	desc = "An ultra-sharp rod made from pure metallic hydrogen. Armor may as well not exist."
	caliber = CALIBER_REBAR
	icon_state = "rod_hydrogen"
	base_icon_state = "rod_hydrogen"
	projectile_type = /obj/projectile/bullet/rebar/hydrogen

/obj/item/ammo_casing/rebar/healium
	name = "Healium Crystal Bolt"
	desc = "Who needs a syringe gun, anyway?"
	caliber = CALIBER_REBAR
	icon_state = "rod_healium"
	base_icon_state =  "rod_healium"
	projectile_type = /obj/projectile/bullet/rebar/healium

/obj/item/ammo_casing/rebar/supermatter
	name = "Supermatter Bolt"
	desc = "Wait, how is the bow capable of firing this without dusting?"
	caliber = CALIBER_REBAR
	icon_state = "rod_supermatter"
	base_icon_state = "rod_supermatter"
	projectile_type = /obj/projectile/bullet/rebar/supermatter

/obj/item/ammo_casing/rebar/paperball
	name = "Paper Ball"
	desc = "Doink!"
	caliber = CALIBER_REBAR
	icon_state = "paperball"
	base_icon_state = "paperball"
	projectile_type = /obj/projectile/bullet/paperball
	newtonian_force = 0.5

/obj/item/ammo_casing/rebar/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/caseless, TRUE)

/obj/item/ammo_casing/rebar/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]"

>>>>>>> tg-pr-88929
