/obj/item/gun/energy/laser/musket
	name = "laser musket"
	desc = "A hand-crafted laser weapon, it has a hand crank on the side to charge it up."
	icon_state = "musket"
	inhand_icon_state = "musket"
	worn_icon_state = "las_musket"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/musket)
	slot_flags = ITEM_SLOT_BACK
	obj_flags = UNIQUE_RENAME
<<<<<<< HEAD
	can_bayonet = TRUE
	knife_x_offset = 22
	knife_y_offset = 11
	//monke edit: fully charges per crank because it was really confusing and unintuitive
	//monke edit: increased cooldown time to compensate for increased charge
=======

/obj/item/gun/energy/laser/musket/add_bayonet_point()
	AddComponent(/datum/component/bayonet_attachable, offset_x = 22, offset_y = 11)
>>>>>>> tg-pr-88929

/obj/item/gun/energy/laser/musket/Initialize(mapload)
	. = ..()
	AddComponent( \
<<<<<<< HEAD
		/datum/component/gun_crank, \
		charging_cell = get_cell(), \
		charge_amount = STANDARD_CELL_CHARGE, \
		cooldown_time = 3 SECONDS, \
		charge_sound = 'sound/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.8 SECONDS, \
		charge_move = IGNORE_USER_LOC_CHANGE, \
		)
=======
		/datum/component/crank_recharge, \
		charging_cell = get_cell(), \
		charge_amount = STANDARD_CELL_CHARGE * 0.5, \
		cooldown_time = 2 SECONDS, \
		charge_sound = 'sound/items/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.8 SECONDS, \
		charge_move = IGNORE_USER_LOC_CHANGE, \
	)

/obj/item/gun/energy/laser/musket/update_icon_state()
	inhand_icon_state = "[initial(inhand_icon_state)][(get_charge_ratio() == 4 ? "charged" : "")]"
	return ..()
>>>>>>> tg-pr-88929

/obj/item/gun/energy/laser/musket/prime
	name = "heroic laser musket"
	desc = "A well-engineered, hand-charged laser weapon. Its capacitors hum with potential."
	icon_state = "musket_prime"
	inhand_icon_state = "musket_prime"
	worn_icon_state = "las_musket_prime"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/musket/prime)

<<<<<<< HEAD
/obj/item/gun/energy/laser/musket/prime/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/gun_crank, \
		charging_cell = get_cell(), \
		charge_amount = STANDARD_CELL_CHARGE, \
		cooldown_time = 2 SECONDS, \
		charge_sound = 'sound/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.8 SECONDS, \
		charge_move = IGNORE_USER_LOC_CHANGE, \
		)

/obj/item/gun/energy/laser/musket/syndicate
	name = "syndicate laser musket"
	desc = "A powerful laser(?) weapon, its 4 tetradimensional capacitors can hold 2 shots each, totaling to 8 shots. \
	Putting your hand on the control panel gives you a strange tingling feeling, this is probably how you charge it."
	icon = 'monkestation/icons/obj/guns/guns.dmi'
	icon_state = "musket_syndie"
	inhand_icon_state = "musket_syndie"
	lefthand_file = 'monkestation/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'monkestation/icons/mob/inhands/weapons/guns_righthand.dmi'
	worn_icon_state = "las_musket_syndie"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/musket/syndicate)
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/gun/energy/laser/musket/syndicate/Initialize(mapload) //it takes two hand slots and costs 12 tc, they deserve fast recharging
	. = ..()
	AddComponent( \
		/datum/component/gun_crank, \
		charging_cell = get_cell(), \
		charge_amount = STANDARD_CELL_CHARGE * 0.25, \
		cooldown_time = 1.5 SECONDS, \
		charge_sound = 'sound/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.3 SECONDS, \
		)

/obj/item/ammo_casing/energy/laser/musket/syndicate
	projectile_type = /obj/projectile/beam/laser/musket/syndicate
	e_cost = LASER_SHOTS(8, STANDARD_CELL_CHARGE)
	fire_sound = 'sound/weapons/laser2.ogg'

/obj/item/gun/energy/disabler/smoothbore
	name = "smoothbore disabler"
	desc = "A hand-crafted disabler, using a hard knock on an energy cell to fire the stunner laser. A lack of proper focusing means it has little accuracy."
=======

/obj/item/gun/energy/disabler/smoothbore
	name = "smoothbore disabler"
	desc = "A hand-crafted disabler, using a hard knock on an energy cell to fire the stunner laser. A lack of proper focusing means it has no accuracy whatsoever."
>>>>>>> tg-pr-88929
	icon_state = "smoothbore"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/smoothbore)
	shaded_charge = 1
	charge_sections = 1
<<<<<<< HEAD
	spread = 10 //monke edit: changed spread to 10 instead of 22.5
=======
	spread = 22.5
>>>>>>> tg-pr-88929

/obj/item/gun/energy/disabler/smoothbore/Initialize(mapload)
	. = ..()
	AddComponent( \
<<<<<<< HEAD
		/datum/component/gun_crank, \
		charging_cell = get_cell(), \
		charge_amount = STANDARD_CELL_CHARGE, \
		cooldown_time = 2 SECONDS, \
		charge_sound = 'sound/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.8 SECONDS, \
		charge_move = IGNORE_USER_LOC_CHANGE, \
		)
=======
		/datum/component/crank_recharge, \
		charging_cell = get_cell(), \
		charge_amount = STANDARD_CELL_CHARGE, \
		cooldown_time = 2 SECONDS, \
		charge_sound = 'sound/items/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.8 SECONDS, \
		charge_move = IGNORE_USER_LOC_CHANGE, \
	)
>>>>>>> tg-pr-88929

/obj/item/gun/energy/disabler/smoothbore/add_seclight_point()
	AddComponent(/datum/component/seclite_attachable, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight", \
		overlay_x = 18, \
<<<<<<< HEAD
		overlay_y = 12) //i swear 1812 being the overlay numbers was accidental
=======
		overlay_y = 12, \
	) //i swear 1812 being the overlay numbers was accidental
>>>>>>> tg-pr-88929

/obj/item/gun/energy/disabler/smoothbore/prime //much stronger than the other prime variants, so dont just put this in as maint loot
	name = "elite smoothbore disabler"
	desc = "An enhancement version of the smoothbore disabler pistol. Improved optics and cell type result in good accuracy and the ability to fire twice. \
	The disabler bolts also don't dissipate upon impact with armor, unlike the previous model."
	icon_state = "smoothbore_prime"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/smoothbore/prime)
	charge_sections = 2
	spread = 0 //could be like 5, but having just very tiny spread kinda feels like bullshit

<<<<<<< HEAD

/obj/item/gun/energy/laser/plasmacore //NTrep gun
	name = "PlasmaCore-6e"
	desc = "The PlasmaCore-6e is the newest gun in Nanotrasen's cutting edge line of laser weaponry. Featuring an experimental plasma based cell that can be mechanically recharged. Glory to Nanotrasen."
	icon = 'monkestation/icons/obj/weapons/guns/plasmacoresixe.dmi'
	icon_state = "plasma_core_six"
	charge_sections = 6
	cell_type = /obj/item/stock_parts/power_store/cell/plasmacore
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = list(/obj/item/ammo_casing/energy/laser/hellfire)
	can_charge = FALSE
	verb_say = "states"
	var/cranking = FALSE

/obj/item/gun/energy/laser/plasmacore/Initialize(mapload)
	. = ..()
	AddComponent( \
		/datum/component/gun_crank, \
		charging_cell = get_cell(), \
		charge_amount = STANDARD_CELL_CHARGE * 0.1, \
		cooldown_time = 1.5 SECONDS, \
		charge_sound = 'sound/weapons/laser_crank.ogg', \
		charge_sound_cooldown_time = 1.3 SECONDS, \
		)
	mutable_appearance(icon, "plasma_core_six_cell_backwards")
	RegisterSignals(src, list(COMSIG_START_CRANKING_GUN, COMSIG_GUN_CRANKING), PROC_REF(on_cranking))
	RegisterSignal(src, COMSIG_GUN_CRANKED, PROC_REF(on_cranked))

/obj/item/gun/energy/laser/plasmacore/proc/on_cranking(datum/source, mob/user)
	SIGNAL_HANDLER
	cranking = TRUE
	update_icon(UPDATE_OVERLAYS)

/obj/item/gun/energy/laser/plasmacore/proc/on_cranked(datum/source, mob/user)
	SIGNAL_HANDLER
	if(cell.charge == cell.maxcharge)
		say("Glory to Nanotrasen")
	cranking = FALSE
	update_icon(UPDATE_OVERLAYS)

/obj/item/gun/energy/laser/plasmacore/update_overlays()
	. = ..()
	. += "plasma_core_six_cell_[cranking ? "forwards" : "backwards"]"

/obj/item/stock_parts/power_store/cell/plasmacore
	name = "PlasmaCore-6e experimental cell"
	maxcharge = STANDARD_CELL_CHARGE * 0.6 // 6 shots at max charge
	icon = 'icons/obj/power.dmi'
	icon_state = "icell"
	custom_materials = list(/datum/material/glass=SMALL_MATERIAL_AMOUNT*0.4, /datum/material/plasma=SMALL_MATERIAL_AMOUNT)

=======
//Inferno and Cryo Pistols

/obj/item/gun/energy/laser/thermal //the common parent of these guns, it just shoots hard bullets, somoene might like that?
	name = "nanite pistol"
	desc = "A modified handcannon with a metamorphic reserve of decommissioned weaponized nanites. Spit globs of angry robots into the bad guys."
	icon_state = "infernopistol"
	inhand_icon_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/nanite)
	shaded_charge = TRUE
	ammo_x_offset = 1
	obj_flags = UNIQUE_RENAME
	w_class = WEIGHT_CLASS_NORMAL
	dual_wield_spread = 5 //as intended by the coders

/obj/item/gun/energy/laser/thermal/add_bayonet_point()
	AddComponent(/datum/component/bayonet_attachable, offset_x = 19, offset_y = 13)

/obj/item/gun/energy/laser/thermal/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_SELF|EMP_PROTECT_CONTENTS)
	AddComponent( \
		/datum/component/crank_recharge, \
		charging_cell = get_cell(), \
		spin_to_win = TRUE, \
		charge_amount = LASER_SHOTS(8, STANDARD_CELL_CHARGE), \
		cooldown_time = 0.8 SECONDS, \
		charge_sound = 'sound/items/weapons/kinetic_reload.ogg', \
		charge_sound_cooldown_time = 0.8 SECONDS, \
	)

/obj/item/gun/energy/laser/thermal/add_seclight_point()
	AddComponent(/datum/component/seclite_attachable, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight", \
		overlay_x = 15, \
		overlay_y = 9)

/obj/item/gun/energy/laser/thermal/inferno //the magma gun
	name = "inferno pistol"
	desc = "A modified handcannon with a metamorphic reserve of decommissioned weaponized nanites. Spit globs of molten angry robots into the bad guys. \
		While it doesn't manipulate temperature in and of itself, it does cause an violent eruption in anyone who is severely cold. Able to generate \
		ammunition by manually spinning the weapon's nanite canister."
	icon_state = "infernopistol"
	ammo_type = list(/obj/item/ammo_casing/energy/nanite/inferno)

/obj/item/gun/energy/laser/thermal/cryo //the ice gun
	name = "cryo pistol"
	desc = "A modified handcannon with a metamorphic reserve of decommissioned weaponized nanites. Spit shards of frozen angry robots into the bad guys. \
		While it doesn't manipulate temperature in and of itself, it does cause an internal explosion in anyone who is severely hot. Able to generate \
		ammunition by manually spinning the weapon's nanite canister."
	icon_state = "cryopistol"
	ammo_type = list(/obj/item/ammo_casing/energy/nanite/cryo)
>>>>>>> tg-pr-88929
