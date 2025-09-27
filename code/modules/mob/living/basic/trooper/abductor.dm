/// Abductor troopers
/mob/living/basic/trooper/abductor
	name = "Abductor Agent"
	desc = "Mezaflorp?"
	faction = list(ROLE_SYNDICATE)
<<<<<<< HEAD
	mob_spawner = /obj/effect/mob_spawn/corpse/human/abductor
	loot = /obj/effect/mob_spawn/corpse/human/abductor
=======
	loot = list(/obj/effect/mob_spawn/corpse/human/abductor)
	mob_spawner = /obj/effect/mob_spawn/corpse/human/abductor
>>>>>>> tg-pr-88929

/mob/living/basic/trooper/abductor/melee
	melee_damage_lower = 15
	melee_damage_upper = 15
<<<<<<< HEAD
	loot = /obj/effect/gibspawner/human
	attack_verb_continuous = "beats"
	attack_verb_simple = "beat"
	attack_sound = 'sound/weapons/egloves.ogg'
=======
	loot = list(/obj/effect/gibspawner/human)
	attack_verb_continuous = "beats"
	attack_verb_simple = "beat"
	attack_sound = 'sound/items/weapons/egloves.ogg'
>>>>>>> tg-pr-88929
	attack_vis_effect = ATTACK_EFFECT_SLASH
	r_hand = /obj/item/melee/baton/abductor
	var/projectile_deflect_chance = 0

/mob/living/basic/trooper/abductor/ranged
<<<<<<< HEAD
	loot = /obj/effect/gibspawner/human
=======
	loot = list(/obj/effect/gibspawner/human)
>>>>>>> tg-pr-88929
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged
	r_hand = /obj/item/gun/energy/alien
	/// Type of bullet we use
	var/casingtype = /obj/item/ammo_casing/energy/lasergun
	/// Sound to play when firing weapon
<<<<<<< HEAD
	var/projectilesound = 'sound/weapons/laser2.ogg'
=======
	var/projectilesound = 'sound/items/weapons/laser2.ogg'
>>>>>>> tg-pr-88929
	/// number of burst shots
	var/burst_shots = 1
	/// Time between taking shots
	var/ranged_cooldown = 5 SECONDS

/mob/living/basic/trooper/abductor/ranged/Initialize(mapload)
	. = ..()
	AddComponent(\
		/datum/component/ranged_attacks,\
		casing_type = casingtype,\
		projectile_sound = projectilesound,\
		cooldown_time = ranged_cooldown,\
		burst_shots = burst_shots,\
	)
