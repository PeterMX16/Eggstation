/obj/projectile/temp
	name = "freeze beam"
	icon_state = "ice_2"
	damage = 0
	damage_type = BURN
	armor_flag = ENERGY
	/// What temp to trend the target towards
	var/temperature = HYPOTHERMIA - 50 CELCIUS
	/// How much temp per shot to apply
	var/temperature_mod_per_shot = 0.5

/obj/projectile/temp/is_hostile_projectile()
	return BODYTEMP_NORMAL - temperature != 0 // our damage is done by cooling or heating (casting to boolean here)

/obj/projectile/temp/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(isliving(target))
		var/mob/living/M = target
		M.adjust_bodytemperature(temperature_mod_per_shot * ((100-blocked) / 100) * (temperature - M.bodytemperature), temperature, BODYTEMP_NORMAL, use_insulation = TRUE)

	if(isobj(target))
		var/obj/objectification = target

		if(objectification.reagents)
			var/datum/reagents/reagents = objectification.reagents
			reagents?.expose_temperature(temperature)

/obj/projectile/temp/hot
	name = "heat beam"
<<<<<<< HEAD
	temperature = HYPERTHERMIA + 25 CELCIUS
=======
	icon_state = "lava"
	temperature = 100 // Raise the body temp by 100 points
>>>>>>> tg-pr-88929

/obj/projectile/temp/hot/on_hit(atom/target, blocked = FALSE, pierce_hit)
	. = ..()

	if(isliving(target))
		var/mob/living/living_target = target
		living_target.adjust_wet_stacks(-10)

/obj/projectile/temp/cryo
	name = "cryo beam"
<<<<<<< HEAD
	range = 3
	temperature = HYPOTHERMIA - 75 CELCIUS
	temperature_mod_per_shot = 2.5 // get this guy really chilly really fast

/obj/projectile/temp/cryo/on_hit(atom/target, blocked, pierce_hit)
	. = ..()
	if(isopenturf(target))
		var/turf/open/T = target
		T.freeze_turf()
=======
	range = 9
	temperature = -350 // Single slow shot reduces temp greatly

/obj/projectile/temp/cryo/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()

	if(isliving(target))
		var/mob/living/living_target = target
		living_target.apply_status_effect(/datum/status_effect/freezing_blast)
>>>>>>> tg-pr-88929

/obj/projectile/temp/cryo/on_range()
	var/turf/T = get_turf(src)
	if(isopenturf(T))
		var/turf/open/O = T
		O.freeze_turf()
	return ..()

/obj/projectile/temp/pyro
	name = "hot beam"
	icon_state = "firebeam" // sets on fire, diff sprite!
	range = 9
<<<<<<< HEAD
	temperature = 240
=======
	temperature = 350
>>>>>>> tg-pr-88929

/obj/projectile/temp/pyro/on_hit(atom/target, blocked, pierce_hit)
	. = ..()
	if(!.)
		return
<<<<<<< HEAD
	var/mob/living/living_target = target
	if(!istype(living_target))
		return
	living_target.adjust_fire_stacks(2)
	living_target.ignite_mob()
=======

	if(isobj(target))
		var/obj/objectification = target

		if(objectification.resistance_flags & ON_FIRE) //Don't burn something already on fire
			return

		objectification.fire_act(temperature)

		return

	if(isliving(target))
		var/mob/living/living_target = target
		living_target.adjust_fire_stacks(2)
		living_target.ignite_mob()
>>>>>>> tg-pr-88929

/obj/projectile/temp/pyro/on_range()
	var/turf/location = get_turf(src)
	new /obj/effect/hotspot(location)
	location.hotspot_expose(700, 50, 1)
<<<<<<< HEAD
=======
	return ..()
>>>>>>> tg-pr-88929
