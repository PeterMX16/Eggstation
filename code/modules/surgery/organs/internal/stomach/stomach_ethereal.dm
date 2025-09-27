/obj/item/organ/stomach/ethereal
	name = "biological battery"
	icon_state = "stomach-p" //Welp. At least it's more unique in functionaliy.
	desc = "A crystal-like organ that stores the electric charge of ethereals."
<<<<<<< HEAD:code/modules/surgery/organs/stomach/stomach_ethereal.dm
	hunger_modifier = 0 //they do different hunger shit
	//organ_traits = list(TRAIT_NOHUNGER) // We have our own hunger mechanic. //Monkestation Removal, we have our OWN hunger mechanic.
	///basically satiety but electrical
	var/crystal_charge = ETHEREAL_CHARGE_FULL
=======
	organ_traits = list(TRAIT_NOHUNGER) // We have our own hunger mechanic.
	/// Where the energy of the stomach is stored.
	var/obj/item/stock_parts/power_store/cell
>>>>>>> tg-pr-88929:code/modules/surgery/organs/internal/stomach/stomach_ethereal.dm
	///used to keep ethereals from spam draining power sources
	var/drain_time = 0

/obj/item/organ/stomach/ethereal/Initialize(mapload)
	. = ..()
<<<<<<< HEAD:code/modules/surgery/organs/stomach/stomach_ethereal.dm
	adjust_charge(-ETHEREAL_CHARGE_FACTOR * seconds_per_tick * 0.5)
	handle_charge(owner, seconds_per_tick, times_fired)


/obj/item/organ/internal/stomach/ethereal/on_insert(mob/living/carbon/stomach_owner)
=======
	cell = new /obj/item/stock_parts/power_store/cell/ethereal(src)

/obj/item/organ/stomach/ethereal/Destroy()
	QDEL_NULL(cell)
	return ..()

/obj/item/organ/stomach/ethereal/on_life(seconds_per_tick, times_fired)
	. = ..()
	adjust_charge(-ETHEREAL_DISCHARGE_RATE * seconds_per_tick)
	handle_charge(owner, seconds_per_tick, times_fired)

/obj/item/organ/stomach/ethereal/on_mob_insert(mob/living/carbon/stomach_owner)
>>>>>>> tg-pr-88929:code/modules/surgery/organs/internal/stomach/stomach_ethereal.dm
	. = ..()
	RegisterSignal(stomach_owner, COMSIG_PROCESS_BORGCHARGER_OCCUPANT, PROC_REF(charge))
	RegisterSignal(stomach_owner, COMSIG_LIVING_ELECTROCUTE_ACT, PROC_REF(on_electrocute))
	RegisterSignal(stomach_owner, COMSIG_LIVING_HOMEOSTASIS, PROC_REF(handle_temp))
	RegisterSignal(stomach_owner, COMSIG_HUMAN_ON_HANDLE_BLOOD, PROC_REF(blood))

/obj/item/organ/stomach/ethereal/on_mob_remove(mob/living/carbon/stomach_owner)
	. = ..()
	UnregisterSignal(stomach_owner, COMSIG_PROCESS_BORGCHARGER_OCCUPANT)
	UnregisterSignal(stomach_owner, COMSIG_LIVING_ELECTROCUTE_ACT)
	UnregisterSignal(stomach_owner, COMSIG_LIVING_HOMEOSTASIS)
	UnregisterSignal(stomach_owner, COMSIG_HUMAN_ON_HANDLE_BLOOD)
	stomach_owner.clear_mood_event("charge")
	stomach_owner.clear_alert(ALERT_ETHEREAL_CHARGE)
	stomach_owner.clear_alert(ALERT_ETHEREAL_OVERCHARGE)

/obj/item/organ/stomach/ethereal/handle_hunger_slowdown(mob/living/carbon/human/human)
	human.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/hunger, multiplicative_slowdown = (1.5 * (1 - cell.charge() / 100)))

<<<<<<< HEAD:code/modules/surgery/organs/stomach/stomach_ethereal.dm

/obj/item/organ/internal/stomach/ethereal/proc/handle_temp(mob/living/carbon/human/human, natural_change, seconds_per_tick)
	SIGNAL_HANDLER

	adjust_charge(-0.5 * ETHEREAL_CHARGE_FACTOR * abs(natural_change * 0.1) * seconds_per_tick * 0.01)
	return HOMEOSTASIS_NO_HUNGER

/obj/item/organ/internal/stomach/ethereal/proc/blood(mob/living/carbon/human/ethereal, seconds_per_tick, times_fired)
	SIGNAL_HANDLER

	if(ethereal.stat == DEAD)
		return NONE

	. = HANDLE_BLOOD_NO_NUTRITION_DRAIN|HANDLE_BLOOD_NO_EFFECTS

	INVOKE_ASYNC(src, PROC_REF(adjust_charge),-ETHEREAL_BLOOD_CHARGE_FACTOR * seconds_per_tick * 0.1, TRUE)
	INVOKE_ASYNC(src, PROC_REF(handle_charge), ethereal, seconds_per_tick, times_fired)

	return .

/obj/item/organ/internal/stomach/ethereal/proc/charge(datum/source, amount, repairs)
	SIGNAL_HANDLER
	if(!ishuman(owner))
		return
	var/mob/living/carbon/human/human = owner
	if(!repairs)
		adjust_charge(amount / 3.5)
		return
	if(owner.blood_volume < BLOOD_VOLUME_NORMAL - amount / 3.5)
		adjust_charge(amount / 3.5)
		return
	if(owner.blood_volume > 700) //prevents reduction of charge of overcharged ethereals
		return
	adjust_charge(BLOOD_VOLUME_NORMAL - human.blood_volume) //perfectly tops off an ethereal if the amount of power that would be applied would go into overcharge
=======
/obj/item/organ/stomach/ethereal/proc/charge(datum/source, datum/callback/charge_cell, seconds_per_tick)
	SIGNAL_HANDLER
>>>>>>> tg-pr-88929:code/modules/surgery/organs/internal/stomach/stomach_ethereal.dm

	charge_cell.Invoke(cell, seconds_per_tick / 3.5) // Ethereals don't have NT designed charging ports, so they charge slower.

/obj/item/organ/stomach/ethereal/proc/on_electrocute(datum/source, shock_damage, shock_source, siemens_coeff = 1, flags = NONE)
	SIGNAL_HANDLER
	if(flags & SHOCK_ILLUSION)
		return
	adjust_charge(shock_damage * siemens_coeff * 2)
	to_chat(owner, span_notice("You absorb some of the shock into your body!"))

<<<<<<< HEAD:code/modules/surgery/organs/stomach/stomach_ethereal.dm
/obj/item/organ/internal/stomach/ethereal/proc/adjust_charge(amount, passive = FALSE)
	//crystal_charge = clamp(crystal_charge + amount, ETHEREAL_CHARGE_NONE, ETHEREAL_CHARGE_DANGEROUS) Monkestation Removal
	if(ishuman(owner))
		var/mob/living/carbon/human/ethereal = owner
		var/amount_adjusted = (BLOOD_VOLUME_NORMAL * amount)/ETHEREAL_CHARGE_FULL
		if(passive)
			if(ethereal.blood_volume < ETHEREAL_BLOOD_CHARGE_LOWEST_PASSIVE) //Do not apply the clamp if its below the passive reduction level(no infinite blood sorry)
				return
			if(ethereal.blood_volume + amount_adjusted < ETHEREAL_BLOOD_CHARGE_LOWEST_PASSIVE+1)
				ethereal.blood_volume = ETHEREAL_BLOOD_CHARGE_LOWEST_PASSIVE+1 //bottom them off here if the end result would be less than the stopping point.
			ethereal.blood_volume = clamp(ethereal.blood_volume + amount_adjusted, ETHEREAL_BLOOD_CHARGE_LOWEST_PASSIVE+1, ETHEREAL_BLOOD_CHARGE_DANGEROUS)
			return
		ethereal.blood_volume = clamp(ethereal.blood_volume + amount, ETHEREAL_BLOOD_CHARGE_NONE, ETHEREAL_BLOOD_CHARGE_DANGEROUS)

/obj/item/organ/internal/stomach/ethereal/proc/handle_charge(mob/living/carbon/ethereal, seconds_per_tick, times_fired)
	var/datum/species/species = ethereal.dna.species
	species.brutemod = 1.15
	var/word = pick("like you can't breathe","your lungs locking up","extremely lethargic")
	var/blood_volume = ethereal.blood_volume
	if(HAS_TRAIT(ethereal, TRAIT_ETHEREAL_NO_OVERCHARGE))
		blood_volume = ETHEREAL_BLOOD_CHARGE_ALMOSTFULL
	switch(blood_volume)
		if(-INFINITY to ETHEREAL_BLOOD_CHARGE_LOWEST_PASSIVE)
			ethereal.add_mood_event("charge", /datum/mood_event/decharged)
			ethereal.clear_alert("ethereal_overcharge")
			ethereal.throw_alert(ALERT_ETHEREAL_CHARGE, /atom/movable/screen/alert/emptycell/ethereal)
			species.brutemod = 2
			if(SPT_PROB(7.5, seconds_per_tick))
				to_chat(src, span_warning("You feel [word]."))
			ethereal.adjustOxyLoss(round(0.01 * (ETHEREAL_BLOOD_CHARGE_LOW - ethereal.blood_volume) * seconds_per_tick, 1))
		if(ETHEREAL_BLOOD_CHARGE_LOWEST_PASSIVE to ETHEREAL_BLOOD_CHARGE_LOW)
			ethereal.clear_alert("ethereal_overcharge")
			ethereal.add_mood_event("charge", /datum/mood_event/decharged)
			ethereal.throw_alert(ALERT_ETHEREAL_CHARGE, /atom/movable/screen/alert/lowcell/ethereal, 3)
			species.brutemod = 1.5
			if(ethereal.health > 10.5)
				ethereal.apply_damage(0.155 * seconds_per_tick, TOX, null, null, ethereal)
		if(ETHEREAL_BLOOD_CHARGE_LOW to ETHEREAL_BLOOD_CHARGE_NORMAL)
			ethereal.clear_alert("ethereal_overcharge")
			ethereal.add_mood_event("charge", /datum/mood_event/lowpower)
			ethereal.throw_alert(ALERT_ETHEREAL_CHARGE, /atom/movable/screen/alert/lowcell/ethereal, 2)
			species.brutemod = 1.25
		if(ETHEREAL_BLOOD_CHARGE_ALMOSTFULL to ETHEREAL_BLOOD_CHARGE_FULL)
			ethereal.clear_alert("ethereal_overcharge")
			ethereal.clear_alert("ethereal_charge")
			ethereal.add_mood_event("charge", /datum/mood_event/charged)
			species.brutemod = 1
		if(ETHEREAL_BLOOD_CHARGE_FULL to ETHEREAL_BLOOD_CHARGE_OVERLOAD)
			ethereal.clear_alert("ethereal_charge")
			ethereal.add_mood_event("charge", /datum/mood_event/overcharged)
			ethereal.throw_alert(ALERT_ETHEREAL_OVERCHARGE, /atom/movable/screen/alert/ethereal_overcharge, 1)
			species.brutemod = 1.25
		if(ETHEREAL_BLOOD_CHARGE_OVERLOAD to ETHEREAL_BLOOD_CHARGE_DANGEROUS)
			ethereal.clear_alert("ethereal_charge")
			ethereal.add_mood_event("charge", /datum/mood_event/supercharged)
			ethereal.throw_alert(ALERT_ETHEREAL_OVERCHARGE, /atom/movable/screen/alert/ethereal_overcharge, 2)
			ethereal.apply_damage(0.2 * seconds_per_tick, TOX, null, null, ethereal)
			species.brutemod = 1.5
=======
/**Changes the energy of the crystal stomach.
* Args:
* - amount: The change of the energy, in joules.
* Returns: The amount of energy that actually got changed in joules.
**/
/obj/item/organ/stomach/ethereal/proc/adjust_charge(amount)
	var/amount_changed = clamp(amount, ETHEREAL_CHARGE_NONE - cell.charge(), ETHEREAL_CHARGE_DANGEROUS - cell.charge())
	return cell.change(amount_changed)

/obj/item/organ/stomach/ethereal/proc/handle_charge(mob/living/carbon/carbon, seconds_per_tick, times_fired)
	switch(cell.charge())
		if(-INFINITY to ETHEREAL_CHARGE_NONE)
			carbon.add_mood_event("charge", /datum/mood_event/decharged)
			carbon.throw_alert(ALERT_ETHEREAL_CHARGE, /atom/movable/screen/alert/emptycell/ethereal)
			if(carbon.health > 10.5)
				carbon.apply_damage(0.65, TOX, null, null, carbon)
		if(ETHEREAL_CHARGE_NONE to ETHEREAL_CHARGE_LOWPOWER)
			carbon.add_mood_event("charge", /datum/mood_event/decharged)
			carbon.throw_alert(ALERT_ETHEREAL_CHARGE, /atom/movable/screen/alert/lowcell/ethereal, 3)
			if(carbon.health > 10.5)
				carbon.apply_damage(0.325 * seconds_per_tick, TOX, null, null, carbon)
		if(ETHEREAL_CHARGE_LOWPOWER to ETHEREAL_CHARGE_NORMAL)
			carbon.add_mood_event("charge", /datum/mood_event/lowpower)
			carbon.throw_alert(ALERT_ETHEREAL_CHARGE, /atom/movable/screen/alert/lowcell/ethereal, 2)
		if(ETHEREAL_CHARGE_ALMOSTFULL to ETHEREAL_CHARGE_FULL)
			carbon.add_mood_event("charge", /datum/mood_event/charged)
		if(ETHEREAL_CHARGE_FULL to ETHEREAL_CHARGE_OVERLOAD)
			carbon.add_mood_event("charge", /datum/mood_event/overcharged)
			carbon.throw_alert(ALERT_ETHEREAL_OVERCHARGE, /atom/movable/screen/alert/ethereal_overcharge, 1)
			carbon.apply_damage(0.2, TOX, null, null, carbon)
		if(ETHEREAL_CHARGE_OVERLOAD to ETHEREAL_CHARGE_DANGEROUS)
			carbon.add_mood_event("charge", /datum/mood_event/supercharged)
			carbon.throw_alert(ALERT_ETHEREAL_OVERCHARGE, /atom/movable/screen/alert/ethereal_overcharge, 2)
			carbon.apply_damage(0.325 * seconds_per_tick, TOX, null, null, carbon)
>>>>>>> tg-pr-88929:code/modules/surgery/organs/internal/stomach/stomach_ethereal.dm
			if(SPT_PROB(5, seconds_per_tick)) // 5% each seacond for ethereals to explosively release excess energy if it reaches dangerous levels
				discharge_process(ethereal)
		else
			ethereal.clear_mood_event("charge")
			ethereal.clear_alert(ALERT_ETHEREAL_CHARGE)
			ethereal.clear_alert(ALERT_ETHEREAL_OVERCHARGE)

<<<<<<< HEAD:code/modules/surgery/organs/stomach/stomach_ethereal.dm
/obj/item/organ/internal/stomach/ethereal/proc/discharge_process(mob/living/carbon/ethereal)
	to_chat(ethereal, span_warning("You begin to lose control over your charge!"))
	ethereal.visible_message(span_danger("[ethereal] begins to spark violently!"))
=======
/obj/item/organ/stomach/ethereal/proc/discharge_process(mob/living/carbon/carbon)
	to_chat(carbon, span_warning("You begin to lose control over your charge!"))
	carbon.visible_message(span_danger("[carbon] begins to spark violently!"))
>>>>>>> tg-pr-88929:code/modules/surgery/organs/internal/stomach/stomach_ethereal.dm

	var/static/mutable_appearance/overcharge //shameless copycode from lightning spell
	overcharge = overcharge || mutable_appearance('icons/effects/effects.dmi', "electricity", EFFECTS_LAYER)
	ethereal.add_overlay(overcharge)

	if(do_after(ethereal, 5 SECONDS, timed_action_flags = (IGNORE_USER_LOC_CHANGE|IGNORE_HELD_ITEM|IGNORE_INCAPACITATED)))
		var/datum/color_palette/generic_colors/located = ethereal.dna.color_palettes[/datum/color_palette/generic_colors]
		ethereal.flash_lighting_fx(5, 7, ethereal.dna.species.fixed_mut_color ? ethereal.dna.species.fixed_mut_color : located.return_color(MUTANT_COLOR))

<<<<<<< HEAD:code/modules/surgery/organs/stomach/stomach_ethereal.dm
		playsound(ethereal, 'sound/magic/lightningshock.ogg', 100, TRUE, extrarange = 5)
		ethereal.cut_overlay(overcharge)
		tesla_zap(ethereal, 2, ethereal.blood_volume*9, ZAP_OBJ_DAMAGE | ZAP_GENERATES_POWER | ZAP_ALLOW_DUPLICATES)
		adjust_charge(ETHEREAL_BLOOD_CHARGE_FULL - ethereal.blood_volume)
		ethereal.visible_message(span_danger("[ethereal] violently discharges energy!"), span_warning("You violently discharge energy!"))
=======
		playsound(carbon, 'sound/effects/magic/lightningshock.ogg', 100, TRUE, extrarange = 5)
		carbon.cut_overlay(overcharge)
		// Only a small amount of the energy gets discharged as the zap. The rest dissipates as heat. Keeps the damage and energy from the zap the same regardless of what STANDARD_CELL_CHARGE is.
		var/discharged_energy = -adjust_charge(ETHEREAL_CHARGE_FULL - cell.charge()) * min(7500 / STANDARD_CELL_CHARGE, 1)
		tesla_zap(source = carbon, zap_range = 2, power = discharged_energy, cutoff = 1 KILO JOULES, zap_flags = ZAP_OBJ_DAMAGE | ZAP_LOW_POWER_GEN | ZAP_ALLOW_DUPLICATES)
		carbon.visible_message(span_danger("[carbon] violently discharges energy!"), span_warning("You violently discharge energy!"))
>>>>>>> tg-pr-88929:code/modules/surgery/organs/internal/stomach/stomach_ethereal.dm

		ethereal.Paralyze(100)
