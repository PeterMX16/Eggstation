/datum/action/cooldown/spell/aoe/void_pull
	name = "Void Pull"
	desc = "Calls the void, damaging, knocking down, and stunning people nearby. \
		Distant foes are also pulled closer to you (but not damaged)."
	background_icon_state = "bg_heretic"
	overlay_icon_state = "bg_heretic_border"
	button_icon = 'icons/mob/actions/actions_ecult.dmi'
	button_icon_state = "voidpull"
	sound = 'sound/effects/magic/voidblink.ogg'

	school = SCHOOL_FORBIDDEN
<<<<<<< HEAD
	cooldown_time = 45 SECONDS
=======
	cooldown_time = 30 SECONDS
>>>>>>> tg-pr-88929

	invocation = "BR'NG F'RTH TH'M T' M'."
	invocation_type = INVOCATION_WHISPER
	spell_requirements = NONE

	aoe_radius = 5
	/// The radius of the actual damage circle done before cast
	var/damage_radius = 1
	/// The radius of the stun applied to nearby people on cast
	var/stun_radius = 2

/datum/action/cooldown/spell/aoe/void_pull/before_cast(atom/cast_on)
	. = ..()
	if(. & SPELL_CANCEL_CAST)
		return

	new /obj/effect/temp_visual/voidin(get_turf(cast_on))

<<<<<<< HEAD
/datum/action/cooldown/spell/aoe/void_pull/get_things_to_cast_on(atom/center)
=======
	// Before we cast the actual effects, deal AOE damage to anyone adjacent to us
	for(var/mob/living/nearby_living as anything in get_things_to_cast_on(cast_on, damage_radius))
		nearby_living.apply_damage(30, BRUTE, wound_bonus = CANT_WOUND)
		nearby_living.apply_status_effect(/datum/status_effect/void_chill, 1)

/datum/action/cooldown/spell/aoe/void_pull/get_things_to_cast_on(atom/center, radius_override = 1)
>>>>>>> tg-pr-88929
	var/list/things = list()
	for(var/mob/living/nearby_mob in view(aoe_radius, center))
		if(nearby_mob == owner || nearby_mob == center)
			continue
		// Don't grab people who are tucked away or something
		if(!isturf(nearby_mob.loc))
			continue
		if(IS_HERETIC_OR_MONSTER(nearby_mob))
			continue
		if(nearby_mob.can_block_magic(antimagic_flags))
			continue

		things += nearby_mob

	return things

/datum/action/cooldown/spell/aoe/void_pull/cast_on_thing_in_aoe(mob/living/victim, atom/caster)
	var/distance = get_dist(victim, caster)
	if(distance > stun_radius)
		for(var/i in 1 to 3)
			victim.forceMove(get_step_towards(victim, caster))
		return
	if(distance <= damage_radius)
		victim.apply_damage(30, BRUTE, wound_bonus = CANT_WOUND)
	victim.AdjustKnockdown(3 SECONDS)
