/obj/item/ammo_casing/energy/electrode
	projectile_type = /obj/projectile/energy/electrode
	select_name = "stun"
<<<<<<< HEAD
	fire_sound = 'sound/weapons/taser.ogg'
=======
	fire_sound = 'sound/items/weapons/taser.ogg'
>>>>>>> tg-pr-88929
	e_cost = LASER_SHOTS(5, STANDARD_CELL_CHARGE)
	harmful = FALSE
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect

/obj/item/ammo_casing/energy/electrode/hos // MONKE EDIT: 4th shot mode
	e_cost = LASER_SHOTS(6, STANDARD_CELL_CHARGE * 1.2)

/obj/item/ammo_casing/energy/electrode/spec
	e_cost = LASER_SHOTS(10, STANDARD_CELL_CHARGE)

/obj/item/ammo_casing/energy/electrode/gun
<<<<<<< HEAD
	fire_sound = 'sound/weapons/gun/pistol/shot.ogg'
=======
	fire_sound = 'sound/items/weapons/gun/pistol/shot.ogg'
>>>>>>> tg-pr-88929
	e_cost = LASER_SHOTS(10, STANDARD_CELL_CHARGE)

/obj/item/ammo_casing/energy/electrode/old
	e_cost = LASER_SHOTS(1, STANDARD_CELL_CHARGE)
<<<<<<< HEAD
=======

/obj/item/ammo_casing/energy/electrode/ai_turrets
	projectile_type = /obj/projectile/energy/electrode/ai_turrets
>>>>>>> tg-pr-88929

/obj/item/ammo_casing/energy/disabler
	projectile_type = /obj/projectile/beam/disabler
	select_name = "disable"
	e_cost = LASER_SHOTS(20, STANDARD_CELL_CHARGE)
<<<<<<< HEAD
	fire_sound = 'monkestation/sound/weapons/gun/energy/Laser2.ogg'
=======
	fire_sound = 'sound/items/weapons/taser2.ogg'
>>>>>>> tg-pr-88929
	harmful = FALSE
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/blue

/obj/item/ammo_casing/energy/disabler/smg
	projectile_type = /obj/projectile/beam/disabler/weak
	e_cost = LASER_SHOTS(40, STANDARD_CELL_CHARGE)
	fire_sound = 'sound/items/weapons/taser3.ogg'

/obj/item/ammo_casing/energy/disabler/smg
	projectile_type = /obj/projectile/beam/disabler/weak
	e_cost = LASER_SHOTS(40, STANDARD_CELL_CHARGE)
	fire_sound = 'sound/weapons/taser3.ogg'

/obj/item/ammo_casing/energy/disabler/hos
<<<<<<< HEAD
	e_cost = LASER_SHOTS(30, STANDARD_CELL_CHARGE) // MONKE EDIT: 20 -> 30 shots
=======
	e_cost = LASER_SHOTS(20, STANDARD_CELL_CHARGE * 1.2)
>>>>>>> tg-pr-88929

/obj/item/ammo_casing/energy/disabler/smoothbore
	projectile_type = /obj/projectile/beam/disabler/smoothbore
	e_cost = LASER_SHOTS(1, STANDARD_CELL_CHARGE)

/obj/item/ammo_casing/energy/disabler/smoothbore/prime
	projectile_type = /obj/projectile/beam/disabler/smoothbore/prime
	e_cost = LASER_SHOTS(2, STANDARD_CELL_CHARGE)
