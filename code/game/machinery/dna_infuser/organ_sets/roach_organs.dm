#define ROACH_ORGAN_COLOR "#7c4200"
// Yeah i'm lazy and we don't use any of the other color slots
#define ROACH_COLORS ROACH_ORGAN_COLOR + ROACH_ORGAN_COLOR + ROACH_ORGAN_COLOR

/datum/armor/roach_internal_armor
	bomb = 100
	bio = 90

/datum/status_effect/organ_set_bonus/roach
	id = "organ_set_bonus_roach"
	organs_needed = 4
	bonus_activate_text = span_notice("Roach DNA is deeply infused with you! \
		You feel increasingly resistant to explosives, radiation, and viral agents.")
	bonus_deactivate_text = span_notice("You are no longer majority roach, \
		and you feel much more vulnerable to nuclear apocalypses.")
	// - Immunity to nuke gibs
	// - Nukes come with radiation (not actually but yknow)
	bonus_traits = list(TRAIT_NUKEIMMUNE, TRAIT_RADIMMUNE, TRAIT_VIRUS_RESISTANCE)
<<<<<<< HEAD
	/// Armor type attached to the owner's physiology
	var/datum/armor/given_armor = /datum/armor/roach_internal_armor
	/// Storing biotypes pre-organ bonus applied so we don't remove bug from mobs which should have it.
	var/old_biotypes = NONE
=======
	bonus_biotype = MOB_BUG
	/// Armor type attached to the owner's physiology
	var/datum/armor/given_armor = /datum/armor/roach_internal_armor
>>>>>>> tg-pr-88929

/datum/status_effect/organ_set_bonus/roach/enable_bonus()
	. = ..()
	if(!ishuman(owner))
		return

	var/mob/living/carbon/human/human_owner = owner
	human_owner.physiology.armor = human_owner.physiology.armor.add_other_armor(given_armor)

<<<<<<< HEAD
	old_biotypes = human_owner.mob_biotypes
	human_owner.mob_biotypes |= MOB_BUG

=======
>>>>>>> tg-pr-88929
/datum/status_effect/organ_set_bonus/roach/disable_bonus()
	. = ..()
	if(!ishuman(owner) || QDELETED(owner))
		return

	var/mob/living/carbon/human/human_owner = owner
	human_owner.physiology.armor = human_owner.physiology.armor.subtract_other_armor(given_armor)

<<<<<<< HEAD
	if(!(old_biotypes & MOB_BUG)) // only remove bug if it wasn't there before
		human_owner.mob_biotypes &= ~MOB_BUG

/// Roach heart:
/// Reduces damage taken from brute attacks from behind,
/// but increases duration of knockdowns
/obj/item/organ/internal/heart/roach
=======
/// Roach heart:
/// Reduces damage taken from brute attacks from behind,
/// but increases duration of knockdowns
/obj/item/organ/heart/roach
>>>>>>> tg-pr-88929
	name = "mutated roach-heart"
	desc = "Roach DNA infused into what was once a normal heart."
	maxHealth = 2 * STANDARD_ORGAN_THRESHOLD

	icon = 'icons/obj/medical/organs/infuser_organs.dmi'
	icon_state = "heart"
	greyscale_config = /datum/greyscale_config/mutant_organ
	greyscale_colors = ROACH_COLORS

<<<<<<< HEAD
	/// Timer ID for resetting the damage resistance applied from attacks from behind
	var/defense_timerid
	/// Bodypart overlay applied to the chest the heart is in
	var/datum/bodypart_overlay/simple/roach_shell/roach_shell

/obj/item/organ/internal/heart/roach/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/noticable_organ, "has hardened, somewhat translucent skin.")
	AddElement(/datum/element/organ_set_bonus, /datum/status_effect/organ_set_bonus/roach)
	roach_shell = new()

/obj/item/organ/internal/heart/roach/Destroy()
	QDEL_NULL(roach_shell)
	return ..()

/obj/item/organ/internal/heart/roach/on_insert(mob/living/carbon/organ_owner, special)
=======
	/// Bodypart overlay applied to the chest the heart is in
	var/datum/bodypart_overlay/simple/roach_shell/roach_shell

	COOLDOWN_DECLARE(harden_effect_cd)

/obj/item/organ/heart/roach/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/noticable_organ, "%PRONOUN_They %PRONOUN_have hardened, somewhat translucent skin.")
	AddElement(/datum/element/organ_set_bonus, /datum/status_effect/organ_set_bonus/roach)
	AddElement(/datum/element/update_icon_blocker)
	roach_shell = new()

/obj/item/organ/heart/roach/Destroy()
	QDEL_NULL(roach_shell)
	return ..()

/obj/item/organ/heart/roach/on_mob_insert(mob/living/carbon/organ_owner, special, movement_flags)
>>>>>>> tg-pr-88929
	. = ..()
	if(!ishuman(organ_owner))
		return

	var/mob/living/carbon/human/human_owner = organ_owner

<<<<<<< HEAD
	RegisterSignal(human_owner, COMSIG_MOB_APPLY_DAMAGE, PROC_REF(modify_damage))
	human_owner.physiology.knockdown_mod *= 3

	var/obj/item/bodypart/chest/chest = human_owner.get_bodypart(BODY_ZONE_CHEST)
	chest.add_bodypart_overlay(roach_shell)
	human_owner.update_body_parts()

/obj/item/organ/internal/heart/roach/on_remove(mob/living/carbon/organ_owner, special)
=======
	RegisterSignal(human_owner, COMSIG_MOB_APPLY_DAMAGE_MODIFIERS, PROC_REF(modify_damage))
	RegisterSignal(human_owner, COMSIG_MOB_AFTER_APPLY_DAMAGE, PROC_REF(do_block_effect))
	human_owner.physiology.knockdown_mod *= 3

/obj/item/organ/heart/roach/on_bodypart_insert(obj/item/bodypart/limb)
	. = ..()
	limb.add_bodypart_overlay(roach_shell)

/obj/item/organ/heart/roach/on_mob_remove(mob/living/carbon/organ_owner, special, movement_flags)
>>>>>>> tg-pr-88929
	. = ..()
	if(!ishuman(organ_owner) || QDELETED(organ_owner))
		return

	var/mob/living/carbon/human/human_owner = organ_owner

<<<<<<< HEAD
	UnregisterSignal(human_owner, COMSIG_MOB_APPLY_DAMAGE)
	human_owner.physiology.knockdown_mod /= 3

	if(defense_timerid)
		reset_damage(human_owner)

	var/obj/item/bodypart/chest/chest = human_owner.get_bodypart(BODY_ZONE_CHEST)
	chest.remove_bodypart_overlay(roach_shell)
	human_owner.update_body_parts()

/**
 * Signal proc for [COMSIG_MOB_APPLY_DAMAGE]
 *
 * Being hit with brute damage in the back will impart a large damage resistance bonus for a very short period.
 */
/obj/item/organ/internal/heart/roach/proc/modify_damage(datum/source, damage, damagetype, def_zone, blocked, wound_bonus, bare_wound_bonus, sharpness, attack_direction, obj/item/attacking_item)
	SIGNAL_HANDLER

	if(!ishuman(owner) || !attack_direction || damagetype != BRUTE || owner.stat >= UNCONSCIOUS)
		return

	var/mob/living/carbon/human/human_owner = owner
	// No tactical spinning
	if(human_owner.flags_1 & IS_SPINNING_1)
		return

	// If we're lying down, or were attacked from the back, we get armor.
	var/should_armor_up = (human_owner.body_position == LYING_DOWN) || (human_owner.dir & attack_direction)
	if(!should_armor_up)
		return

	// Take 50% less damage from attack behind us
	if(!defense_timerid)
		human_owner.physiology.brute_mod /= 2
		human_owner.visible_message(span_warning("[human_owner]'s back hardens against the blow!"))
		playsound(human_owner, 'sound/effects/constructform.ogg', 25, vary = TRUE, extrarange = SHORT_RANGE_SOUND_EXTRARANGE)

	defense_timerid = addtimer(CALLBACK(src, PROC_REF(reset_damage), owner), 5 SECONDS, TIMER_UNIQUE|TIMER_OVERRIDE)

/obj/item/organ/internal/heart/roach/proc/reset_damage(mob/living/carbon/human/human_owner)
	defense_timerid = null
	if(!QDELETED(human_owner))
		human_owner.physiology.brute_mod *= 2
		human_owner.visible_message(span_warning("[human_owner]'s back softens again."))
=======
	UnregisterSignal(human_owner, list(COMSIG_MOB_APPLY_DAMAGE_MODIFIERS, COMSIG_MOB_AFTER_APPLY_DAMAGE))
	human_owner.physiology.knockdown_mod /= 3

/obj/item/organ/heart/roach/on_bodypart_remove(obj/item/bodypart/limb)
	. = ..()

	limb.remove_bodypart_overlay(roach_shell)

/**
 * Signal proc for [COMSIG_MOB_APPLY_DAMAGE_MODIFIERS]
 *
 * Adds a 0.5 modifier to attacks from the back
 */
/obj/item/organ/heart/roach/proc/modify_damage(mob/living/carbon/human/source, list/damage_mods, damage_amount, damagetype, def_zone, sharpness, attack_direction, obj/item/attacking_item)
	SIGNAL_HANDLER

	if(!is_blocking(source, damage_amount, damagetype, attack_direction))
		return

	damage_mods += 0.5

/**
 * Signal proc for [COMSIG_MOB_AFTER_APPLY_DAMAGE]
 *
 * Does a special effect if we blocked damage with our back
 */
/obj/item/organ/heart/roach/proc/do_block_effect(mob/living/carbon/human/source, damage_dealt, damagetype, def_zone, blocked, wound_bonus, bare_wound_bonus, sharpness, attack_direction, obj/item/attacking_item)
	SIGNAL_HANDLER

	if(!is_blocking(source, damage_dealt, damagetype, attack_direction))
		return

	if(COOLDOWN_FINISHED(src, harden_effect_cd))
		source.visible_message(span_warning("[source]'s back hardens against the blow!"))
		playsound(source, 'sound/effects/constructform.ogg', 25, vary = TRUE, extrarange = SHORT_RANGE_SOUND_EXTRARANGE)

	COOLDOWN_START(src, harden_effect_cd, 5 SECONDS) // Cooldown resets EVERY time we get hit

/// Checks if the passed mob is in a valid state to be blocking damage with the roach shell
/obj/item/organ/heart/roach/proc/is_blocking(mob/living/carbon/human/blocker, damage_amount, damagetype, attack_direction)
	if(damage_amount < 5 || damagetype != BRUTE || !attack_direction)
		return
	if(!ishuman(blocker) || blocker.stat >= UNCONSCIOUS)
		return FALSE
	// No tactical spinning
	if(HAS_TRAIT(blocker, TRAIT_SPINNING))
		return FALSE
	if(blocker.body_position == LYING_DOWN || (blocker.dir & attack_direction))
		return TRUE
	return FALSE
>>>>>>> tg-pr-88929

// Simple overlay so we can add a roach shell to guys with roach hearts
/datum/bodypart_overlay/simple/roach_shell
	icon_state = "roach_shell"
	layers = EXTERNAL_FRONT|EXTERNAL_BEHIND

/datum/bodypart_overlay/simple/roach_shell/get_image(image_layer, obj/item/bodypart/limb)
	return image(
		icon = icon,
		icon_state = "[icon_state]_[mutant_bodyparts_layertext(image_layer)]",
		layer = image_layer,
	)

/// Roach stomach:
/// Makes disgust a non-issue, very slightly worse at passing off reagents
/// Also makes you more hungry
<<<<<<< HEAD
/obj/item/organ/internal/stomach/roach
=======
/obj/item/organ/stomach/roach
>>>>>>> tg-pr-88929
	name = "mutated roach-stomach"
	desc = "Roach DNA infused into what was once a normal stomach."
	maxHealth = 2 * STANDARD_ORGAN_THRESHOLD
	disgust_metabolism = 32 // Demolishes any disgust we have
	metabolism_efficiency = 0.033 // Slightly worse at transferring reagents
<<<<<<< HEAD
//	hunger_modifier = 3 //monkestation temp removal
=======
	hunger_modifier = 3
>>>>>>> tg-pr-88929

	icon = 'icons/obj/medical/organs/infuser_organs.dmi'
	icon_state = "stomach"
	greyscale_config = /datum/greyscale_config/mutant_organ
	greyscale_colors = ROACH_COLORS

<<<<<<< HEAD
/obj/item/organ/internal/stomach/roach/Initialize(mapload)
=======
/obj/item/organ/stomach/roach/Initialize(mapload)
>>>>>>> tg-pr-88929
	. = ..()
	AddElement(/datum/element/organ_set_bonus, /datum/status_effect/organ_set_bonus/roach)

/// Roach liver:
/// Purges toxins at a higher threshold, but takes more damage from them if not purged
<<<<<<< HEAD
/obj/item/organ/internal/liver/roach
=======
/obj/item/organ/liver/roach
>>>>>>> tg-pr-88929
	name = "mutated roach-liver"
	desc = "Roach DNA infused into what was once a normal liver."
	maxHealth = 2 * STANDARD_ORGAN_THRESHOLD
	toxTolerance = 5 // More tolerance for toxins
	liver_resistance = 0.25 // But if they manage to get in you're screwed

	icon = 'icons/obj/medical/organs/infuser_organs.dmi'
	icon_state = "liver"
	greyscale_config = /datum/greyscale_config/mutant_organ
	greyscale_colors = ROACH_COLORS

<<<<<<< HEAD
/obj/item/organ/internal/liver/roach/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/organ_set_bonus, /datum/status_effect/organ_set_bonus/roach)

/obj/item/organ/internal/liver/roach/on_insert(mob/living/carbon/organ_owner, special)
=======
/obj/item/organ/liver/roach/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/organ_set_bonus, /datum/status_effect/organ_set_bonus/roach)

/obj/item/organ/liver/roach/on_mob_insert(mob/living/carbon/organ_owner, special, movement_flags)
>>>>>>> tg-pr-88929
	. = ..()
	if(!ishuman(organ_owner))
		return

	var/mob/living/carbon/human/human_owner = owner
	human_owner.physiology.tox_mod *= 2

<<<<<<< HEAD
/obj/item/organ/internal/liver/roach/on_remove(mob/living/carbon/organ_owner, special)
=======
/obj/item/organ/liver/roach/on_mob_remove(mob/living/carbon/organ_owner, special, movement_flags)
>>>>>>> tg-pr-88929
	. = ..()
	if(!ishuman(organ_owner) || QDELETED(organ_owner))
		return

	var/mob/living/carbon/human/human_owner = organ_owner
<<<<<<< HEAD
	human_owner.physiology.tox_mod /= 2

/// Roach appendix:
/// No appendicitus! weee!
/obj/item/organ/internal/appendix/roach
=======
	human_owner.physiology.tox_mod *= 0.5

/// Roach appendix:
/// No appendicitus! weee!
/obj/item/organ/appendix/roach
>>>>>>> tg-pr-88929
	name = "mutated roach-appendix"
	desc = "Roach DNA infused into what was once a normal appendix. It could get <i>worse</i>?"
	maxHealth = 2 * STANDARD_ORGAN_THRESHOLD

	icon = 'icons/obj/medical/organs/infuser_organs.dmi'
	icon_state = "appendix"
	greyscale_config = /datum/greyscale_config/mutant_organ
	greyscale_colors = ROACH_COLORS

<<<<<<< HEAD
/obj/item/organ/internal/appendix/roach/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/organ_set_bonus, /datum/status_effect/organ_set_bonus/roach)

/obj/item/organ/internal/appendix/roach/become_inflamed()
=======
/obj/item/organ/appendix/roach/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/organ_set_bonus, /datum/status_effect/organ_set_bonus/roach)

/obj/item/organ/appendix/roach/become_inflamed()
>>>>>>> tg-pr-88929
	return

#undef ROACH_ORGAN_COLOR
#undef ROACH_COLORS
