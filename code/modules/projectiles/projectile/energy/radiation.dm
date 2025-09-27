/obj/projectile/energy/radiation
	name = "radiation beam"
	icon_state = "declone"
	damage = 20
	damage_type = TOX
	impact_effect_type = /obj/effect/temp_visual/impact_effect/green_laser

	/// The chance to be irradiated on hit
	var/radiation_chance = 30

<<<<<<< HEAD:code/modules/projectiles/projectile/energy/decloner.dm
/obj/projectile/energy/declone/on_hit(atom/target, blocked, pierce_hit)
	. = ..()
	if (ishuman(target) && prob(radiation_chance))
		radiation_pulse(target, max_range = 0, threshold = RAD_FULL_INSULATION)

/obj/projectile/energy/declone/weak
=======
/obj/projectile/energy/radiation/on_hit(atom/target, blocked, pierce_hit)
	if (ishuman(target) && prob(radiation_chance))
		radiation_pulse(target, max_range = 0, threshold = RAD_FULL_INSULATION)

	..()

/obj/projectile/energy/radiation/weak
>>>>>>> tg-pr-88929:code/modules/projectiles/projectile/energy/radiation.dm
	damage = 9
	radiation_chance = 10
