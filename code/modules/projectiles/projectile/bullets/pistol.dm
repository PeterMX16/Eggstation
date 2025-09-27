// 9mm (Makarov and Stechkin APS)

/obj/projectile/bullet/c9mm
	name = "9mm bullet"
	damage = 30
	embed_type = /datum/embedding/bullet_c9mm

/datum/embedding/bullet_c9mm
	embed_chance = 15
	fall_chance = 3
	jostle_chance = 4
	ignore_throwspeed_threshold = TRUE
	pain_stam_pct = 0.4
	pain_mult = 5
	jostle_pain_mult = 6
	rip_time = 10

/obj/projectile/bullet/c9mm/ap
	name = "9mm armor-piercing bullet"
	damage = 27
<<<<<<< HEAD
	armour_penetration = 75
	embedding = null
=======
	armour_penetration = 40
	embed_type = null
>>>>>>> tg-pr-88929
	shrapnel_type = null

/obj/projectile/bullet/c9mm/hp
	name = "9mm hollow-point bullet"
	damage = 40
	weak_against_armour = TRUE

/obj/projectile/bullet/incendiary/c9mm
	name = "9mm incendiary bullet"
	damage = 15
	fire_stacks = 2


// 10mm

/obj/projectile/bullet/c10mm
	name = "10mm bullet"
	damage = 40

/obj/projectile/bullet/c10mm/ap
	name = "10mm armor-piercing bullet"
	damage = 35
	armour_penetration = 60

/obj/projectile/bullet/c10mm/hp
	name = "10mm hollow-point bullet"
	damage = 50
	weak_against_armour = TRUE

/obj/projectile/bullet/incendiary/c10mm
	name = "10mm incendiary bullet"
	damage = 20
	fire_stacks = 3

<<<<<<< HEAD

///.35 sol short, weak crew pistol/smg round

/obj/projectile/bullet/c35sol ///Yes yes, fits in both pistols and revolvers. I'm putting it here
	name = ".35 Sol Short bullet"
	damage = 15
	wound_bonus = -5 // Normal bullets are 20
	bare_wound_bonus = 5
	embed_falloff_tile = -4

/obj/projectile/bullet/c35sol/incapacitator // .35 Sol's equivalent to a rubber bullet
	name = ".35 Sol Short incapacitator bullet"
	damage = 5
	stamina = 30
	wound_bonus = -40
	bare_wound_bonus = -20
	weak_against_armour = TRUE

	// The stats of the ricochet are a nerfed version of detective revolver rubber ammo
	// This is due to the fact that there's a lot more rounds fired quickly from weapons that use this, over a revolver
	ricochet_auto_aim_angle = 30
	ricochet_auto_aim_range = 5
	ricochets_max = 4
	ricochet_incidence_leeway = 50
	ricochet_chance = 130
	ricochet_decay_damage = 0.8
	shrapnel_type = null
	sharpness = NONE
	embedding = null

/obj/projectile/bullet/c35sol/ripper // .35 Sol ripper, similar to the detective revolver's dumdum rounds, causes slash wounds and is weak to armor
	name = ".35 Sol ripper bullet"
	damage = 12
	weak_against_armour = TRUE
	sharpness = SHARP_EDGED
	wound_bonus = 20
	bare_wound_bonus = 20
	embedding = list(
		embed_chance = 75,
		fall_chance = 3,
		jostle_chance = 4,
		ignore_throwspeed_threshold = TRUE,
		pain_stam_pct = 0.4,
		pain_mult = 5,
		jostle_pain_mult = 6,
		rip_time = 1 SECONDS,
	)

	embed_falloff_tile = -15

/obj/projectile/bullet/c35sol/pierce // What it says on the tin, AP rounds
	name = ".35 Sol Short armor piercing bullet"
	damage = 13
	bare_wound_bonus = -30
	armour_penetration = 30


///.585 Trappiste, heavy crew pistol/smg round

/obj/projectile/bullet/c585trappiste
	name = ".585 Trappiste bullet"
	damage = 25
	wound_bonus = -10

/obj/projectile/bullet/c585trappiste/incapacitator
	name = ".585 Trappiste flathead bullet"
	damage = 9
	stamina = 35
	wound_bonus = -20
	weak_against_armour = TRUE
	shrapnel_type = null
	sharpness = NONE
	embedding = null

/obj/projectile/bullet/c585trappiste/hollowpoint
	name = ".585 Trappiste hollowhead bullet"
	damage = 25
	weak_against_armour = TRUE
	wound_bonus = 10
	bare_wound_bonus = 20


///.35 Auto, sec standard carry round

/obj/projectile/bullet/c35
	name = ".35 Auto bullet"
	damage = 20
	wound_bonus = -5

/obj/projectile/bullet/c35/rubber
	name = ".35 Auto rubber bullet"
	icon = 'monkestation/code/modules/security/icons/paco_ammo.dmi'
	icon_state = "rubber_bullet"
	damage = 4
	stamina = 50 // Turns out 35 stamina damage is not good enough.
	sharpness = NONE
	embedding = null
=======
/obj/projectile/bullet/c10mm/reaper
	name = "10mm reaper pellet"
	damage = 50
	armour_penetration = 40
	tracer_type = /obj/effect/projectile/tracer/sniper
	impact_type = /obj/effect/projectile/impact/sniper
	muzzle_type = /obj/effect/projectile/muzzle/sniper
	hitscan = TRUE
	impact_effect_type = null
	hitscan_light_intensity = 3
	hitscan_light_range = 0.75
	hitscan_light_color_override = LIGHT_COLOR_DIM_YELLOW
	muzzle_flash_intensity = 5
	muzzle_flash_range = 1
	muzzle_flash_color_override = LIGHT_COLOR_DIM_YELLOW
	impact_light_intensity = 5
	impact_light_range = 1
	impact_light_color_override = LIGHT_COLOR_DIM_YELLOW

// .160 Smart

/obj/projectile/bullet/c160smart
	name = ".160 smart bullet"
	icon_state = "smartgun"
	damage = 10
	embed_type = /datum/embedding/bullet_c160smart
	speed = 0.5
	homing_turn_speed = 5
	homing_inaccuracy_min = 4
	homing_inaccuracy_max = 10

/datum/embedding/bullet_c160smart
	embed_chance = 10
	fall_chance = 5
	jostle_chance = 3
	ignore_throwspeed_threshold = TRUE
	pain_stam_pct = 0.25
	pain_mult = 3
	jostle_pain_mult = 6
	rip_time = 5
>>>>>>> tg-pr-88929
