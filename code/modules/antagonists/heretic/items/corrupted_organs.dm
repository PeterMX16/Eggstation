/// Renders you unable to see people who were heretics at the time that this organ is gained
<<<<<<< HEAD
/obj/item/organ/internal/eyes/corrupt
=======
/obj/item/organ/eyes/corrupt
>>>>>>> tg-pr-88929
	name = "corrupt orbs"
	desc = "These eyes have seen something they shouldn't have."
	organ_flags = parent_type::organ_flags | ORGAN_HAZARDOUS
	/// The override images we are applying
	var/list/hallucinations

<<<<<<< HEAD
/obj/item/organ/internal/eyes/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)
	AddElement(/datum/element/noticable_organ, "eyes have wide dilated pupils, and no iris. Something is moving in the darkness.", BODY_ZONE_PRECISE_EYES)

/obj/item/organ/internal/eyes/corrupt/Insert(mob/living/carbon/organ_owner, special, drop_if_replaced)
=======
/obj/item/organ/eyes/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)
	AddElement(/datum/element/noticable_organ, "%PRONOUN_Their eyes have wide dilated pupils, and no iris. Something is moving in the darkness.", BODY_ZONE_PRECISE_EYES)

/obj/item/organ/eyes/corrupt/on_mob_insert(mob/living/carbon/organ_owner, special, movement_flags)
>>>>>>> tg-pr-88929
	. = ..()
	if (!organ_owner.client)
		return

	var/list/human_mobs = GLOB.human_list.Copy()
	human_mobs -= organ_owner
	for (var/mob/living/carbon/human/check_human as anything in human_mobs)
		if (!IS_HERETIC(check_human) && !prob(5)) // Throw in some false positives
			continue
		var/image/invisible_man = image('icons/blanks/32x32.dmi', check_human, "nothing")
		invisible_man.override = TRUE
		LAZYADD(hallucinations, invisible_man)

	if (LAZYLEN(hallucinations))
		organ_owner.client.images |= hallucinations

<<<<<<< HEAD
/obj/item/organ/internal/eyes/corrupt/Remove(mob/living/carbon/organ_owner, special)
=======
/obj/item/organ/eyes/corrupt/on_mob_remove(mob/living/carbon/organ_owner, special, movement_flags)
>>>>>>> tg-pr-88929
	. = ..()
	if (!LAZYLEN(hallucinations))
		return
	organ_owner.client?.images -= hallucinations
	QDEL_NULL(hallucinations)


/// Sometimes speak in incomprehensible tongues
<<<<<<< HEAD
/obj/item/organ/internal/tongue/corrupt
=======
/obj/item/organ/tongue/corrupt
>>>>>>> tg-pr-88929
	name = "corrupt tongue"
	desc = "This one tells only lies."
	organ_flags = parent_type::organ_flags | ORGAN_HAZARDOUS

<<<<<<< HEAD
/obj/item/organ/internal/tongue/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)
	AddElement(/datum/element/noticable_organ, "mouth is full of stars.", BODY_ZONE_PRECISE_MOUTH)

/obj/item/organ/internal/tongue/corrupt/Insert(mob/living/carbon/organ_owner, special, drop_if_replaced)
	. = ..()
	RegisterSignal(organ_owner, COMSIG_MOB_SAY, PROC_REF(on_spoken))

/obj/item/organ/internal/tongue/corrupt/Remove(mob/living/carbon/organ_owner, special)
=======
/obj/item/organ/tongue/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)
	AddElement(/datum/element/noticable_organ, "The inside of %PRONOUN_Their mouth is full of stars.", BODY_ZONE_PRECISE_MOUTH)

/obj/item/organ/tongue/corrupt/on_mob_insert(mob/living/carbon/organ_owner, special, movement_flags)
	. = ..()
	RegisterSignal(organ_owner, COMSIG_MOB_SAY, PROC_REF(on_spoken))

/obj/item/organ/tongue/corrupt/on_mob_remove(mob/living/carbon/organ_owner, special, movement_flags)
>>>>>>> tg-pr-88929
	. = ..()
	UnregisterSignal(organ_owner, COMSIG_MOB_SAY)

/// When the mob speaks, sometimes put it in a different language
<<<<<<< HEAD
/obj/item/organ/internal/tongue/corrupt/proc/on_spoken(mob/living/organ_owner, list/speech_args)
=======
/obj/item/organ/tongue/corrupt/proc/on_spoken(mob/living/organ_owner, list/speech_args)
>>>>>>> tg-pr-88929
	SIGNAL_HANDLER
	if (organ_owner.has_reagent(/datum/reagent/water/holywater) || prob(60))
		return
	speech_args[SPEECH_LANGUAGE] = /datum/language/shadowtongue


/// Randomly secretes alcohol or hallucinogens when you're drinking something
<<<<<<< HEAD
/obj/item/organ/internal/liver/corrupt
=======
/obj/item/organ/liver/corrupt
>>>>>>> tg-pr-88929
	name = "corrupt liver"
	desc = "After what you've seen you could really go for a drink."
	organ_flags = parent_type::organ_flags | ORGAN_HAZARDOUS
	/// How much extra ingredients to add?
	var/amount_added = 5
	/// What extra ingredients can we add?
	var/list/extra_ingredients = list(
		/datum/reagent/consumable/ethanol/pina_olivada,
		/datum/reagent/consumable/ethanol/rum,
		/datum/reagent/consumable/ethanol/thirteenloko,
		/datum/reagent/consumable/ethanol/vodka,
		/datum/reagent/consumable/superlaughter,
		/datum/reagent/drug/bath_salts,
		/datum/reagent/drug/blastoff,
		/datum/reagent/drug/happiness,
		/datum/reagent/drug/mushroomhallucinogen,
	)

<<<<<<< HEAD
/obj/item/organ/internal/liver/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)

/obj/item/organ/internal/liver/corrupt/Insert(mob/living/carbon/organ_owner, special, drop_if_replaced)
	. = ..()
	RegisterSignal(organ_owner, COMSIG_ATOM_EXPOSE_REAGENTS, PROC_REF(on_drank))

/obj/item/organ/internal/liver/corrupt/Remove(mob/living/carbon/organ_owner, special)
=======
/obj/item/organ/liver/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)

/obj/item/organ/liver/corrupt/on_mob_insert(mob/living/carbon/organ_owner, special, movement_flags)
	. = ..()
	RegisterSignal(organ_owner, COMSIG_ATOM_EXPOSE_REAGENTS, PROC_REF(on_drank))

/obj/item/organ/liver/corrupt/on_mob_remove(mob/living/carbon/organ_owner, special, movement_flags)
>>>>>>> tg-pr-88929
	. = ..()
	UnregisterSignal(organ_owner, COMSIG_ATOM_EXPOSE_REAGENTS)

/// If we drank something, add a little extra
<<<<<<< HEAD
/obj/item/organ/internal/liver/corrupt/proc/on_drank(atom/source, list/reagents, datum/reagents/source_reagents, methods)
=======
/obj/item/organ/liver/corrupt/proc/on_drank(atom/source, list/reagents, datum/reagents/source_reagents, methods)
>>>>>>> tg-pr-88929
	SIGNAL_HANDLER
	if (!(methods & INGEST))
		return
	var/datum/reagents/extra_reagents = new()
	extra_reagents.add_reagent(pick(extra_ingredients), amount_added)
<<<<<<< HEAD
	extra_reagents.trans_to(source, amount_added, methods = INJECT)
=======
	extra_reagents.trans_to(source, amount_added, transferred_by = src, methods = INJECT)
>>>>>>> tg-pr-88929
	if (prob(20))
		to_chat(source, span_warning("As you take a sip, you feel something bubbling in your stomach..."))


/// Rapidly become hungry if you are not digesting blood
<<<<<<< HEAD
/obj/item/organ/internal/stomach/corrupt
=======
/obj/item/organ/stomach/corrupt
>>>>>>> tg-pr-88929
	name = "corrupt stomach"
	desc = "This parasite demands an unwholesome diet in order to be satisfied."
	organ_flags = parent_type::organ_flags | ORGAN_HAZARDOUS
	/// Do we have an unholy thirst?
	var/thirst_satiated = FALSE
	/// Timer for when we get thirsty again
	var/thirst_timer
	/// How long until we prompt the player to drink blood again?
	COOLDOWN_DECLARE(message_cooldown)

<<<<<<< HEAD
/obj/item/organ/internal/stomach/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)
	AddElement(/datum/element/noticable_organ, "appear%PRONOUN_S to have an unhealthy pallor.")

/obj/item/organ/internal/stomach/corrupt/Insert(mob/living/carbon/organ_owner, special, drop_if_replaced)
	. = ..()
	RegisterSignal(organ_owner, COMSIG_ATOM_EXPOSE_REAGENTS, PROC_REF(on_drank))

/obj/item/organ/internal/stomach/corrupt/Remove(mob/living/carbon/organ_owner, special)
=======
/obj/item/organ/stomach/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)
	AddElement(/datum/element/noticable_organ, "%PRONOUN_They %PRONOUN_have an unhealthy pallor.")

/obj/item/organ/stomach/corrupt/on_mob_insert(mob/living/carbon/organ_owner, special, movement_flags)
	. = ..()
	RegisterSignal(organ_owner, COMSIG_ATOM_EXPOSE_REAGENTS, PROC_REF(on_drank))

/obj/item/organ/stomach/corrupt/on_mob_remove(mob/living/carbon/organ_owner, special, movement_flags)
>>>>>>> tg-pr-88929
	. = ..()
	UnregisterSignal(organ_owner, COMSIG_ATOM_EXPOSE_REAGENTS)

/// Check if we drank a little blood
<<<<<<< HEAD
/obj/item/organ/internal/stomach/corrupt/proc/on_drank(atom/source, list/reagents, datum/reagents/source_reagents, methods)
=======
/obj/item/organ/stomach/corrupt/proc/on_drank(atom/source, list/reagents, datum/reagents/source_reagents, methods)
>>>>>>> tg-pr-88929
	SIGNAL_HANDLER
	if (!(methods & INGEST))
		return

	var/contains_blood = locate(/datum/reagent/blood) in reagents
	if (!contains_blood)
		return

	if (!thirst_satiated)
<<<<<<< HEAD
		to_chat(source, span_cultitalic("The thirst is satisfied... for now."))
=======
		to_chat(source, span_cult_italic("The thirst is satisfied... for now."))
>>>>>>> tg-pr-88929
	thirst_satiated = TRUE
	deltimer(thirst_timer)
	thirst_timer = addtimer(VARSET_CALLBACK(src, thirst_satiated, FALSE), 3 MINUTES, TIMER_STOPPABLE | TIMER_DELETE_ME)

<<<<<<< HEAD
/obj/item/organ/internal/stomach/corrupt/handle_hunger(mob/living/carbon/human/human, seconds_per_tick, times_fired)
=======
/obj/item/organ/stomach/corrupt/handle_hunger(mob/living/carbon/human/human, seconds_per_tick, times_fired)
>>>>>>> tg-pr-88929
	if (thirst_satiated || human.has_reagent(/datum/reagent/water/holywater))
		return ..()

	human.adjust_nutrition(-1 * seconds_per_tick)

	if (!COOLDOWN_FINISHED(src, message_cooldown))
		return ..()
	COOLDOWN_START(src, message_cooldown, 30 SECONDS)

	var/static/list/blood_messages = list(
		"Blood...",
		"Everyone suddenly looks so tasty.",
		"The blood...",
		"There's an emptiness in you that only blood can fill.",
		"You could really go for some blood right now.",
		"You feel the blood rushing through your veins.",
		"You think about biting someone's throat.",
		"Your stomach growls and you feel a metallic taste in your mouth.",
	)
<<<<<<< HEAD
	to_chat(human, span_cultitalic(pick(blood_messages)))
=======
	to_chat(human, span_cult_italic(pick(blood_messages)))
>>>>>>> tg-pr-88929

	return ..()


/// Occasionally bombards you with spooky hands and lets everyone hear your pulse.
<<<<<<< HEAD
/obj/item/organ/internal/heart/corrupt
=======
/obj/item/organ/heart/corrupt
>>>>>>> tg-pr-88929
	name = "corrupt heart"
	desc = "What corruption is this spreading along with the blood?"
	organ_flags = parent_type::organ_flags | ORGAN_HAZARDOUS
	/// How long until the next heart?
	COOLDOWN_DECLARE(hand_cooldown)

<<<<<<< HEAD
/obj/item/organ/internal/heart/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)

/obj/item/organ/internal/heart/corrupt/on_life(seconds_per_tick, times_fired)
	. = ..()
	var/obj/item/organ/internal/heart/heart = owner.get_organ_slot(ORGAN_SLOT_HEART)
	if (!COOLDOWN_FINISHED(src, hand_cooldown) || IS_IN_MANSUS(owner) || !owner.needs_heart() || !heart.beating || owner.has_reagent(/datum/reagent/water/holywater))
=======
/obj/item/organ/heart/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)

/obj/item/organ/heart/corrupt/on_life(seconds_per_tick, times_fired)
	. = ..()
	if (!COOLDOWN_FINISHED(src, hand_cooldown) || IS_IN_MANSUS(owner) || !owner.needs_heart() || !is_beating() || owner.has_reagent(/datum/reagent/water/holywater))
>>>>>>> tg-pr-88929
		return
	fire_curse_hand(owner)
	COOLDOWN_START(src, hand_cooldown, rand(6 SECONDS, 45 SECONDS)) // Wide variance to put you off guard


/// Sometimes cough out some kind of dangerous gas
<<<<<<< HEAD
/obj/item/organ/internal/lungs/corrupt
=======
/obj/item/organ/lungs/corrupt
>>>>>>> tg-pr-88929
	name = "corrupt lungs"
	desc = "Some things SHOULD be drowned in tar."
	organ_flags = parent_type::organ_flags | ORGAN_HAZARDOUS
	/// How likely are we not to cough every time we take a breath?
	var/cough_chance = 15
	/// How much gas to emit?
	var/gas_amount = 30
	/// What can we cough up?
	var/list/gas_types = list(
		/datum/gas/bz = 30,
		/datum/gas/miasma = 50,
		/datum/gas/plasma = 20,
	)
<<<<<<< HEAD
	/// Cooldown between corrupted effects (monkestation addition)
	COOLDOWN_DECLARE(effect_cooldown)

/obj/item/organ/internal/lungs/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)

/obj/item/organ/internal/lungs/corrupt/check_breath(datum/gas_mixture/breath, mob/living/carbon/human/breather)
	. = ..()
	if (!. || IS_IN_MANSUS(owner) || breather.has_reagent(/datum/reagent/water/holywater) || !prob(cough_chance))
		return
	// monkestation start: add cooldown
	if(!COOLDOWN_FINISHED(src, effect_cooldown))
		return
	COOLDOWN_START(src, effect_cooldown, rand(25 SECONDS, 90 SECONDS))
	// monkestation end
=======

/obj/item/organ/lungs/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)

/obj/item/organ/lungs/corrupt/check_breath(datum/gas_mixture/breath, mob/living/carbon/human/breather)
	. = ..()
	if (!. || IS_IN_MANSUS(owner) || breather.has_reagent(/datum/reagent/water/holywater) || !prob(cough_chance))
		return
>>>>>>> tg-pr-88929
	breather.emote("cough");
	var/chosen_gas = pick_weight(gas_types)
	var/datum/gas_mixture/mix_to_spawn = new()
	mix_to_spawn.add_gas(pick(chosen_gas))
	mix_to_spawn.gases[chosen_gas][MOLES] = gas_amount
	mix_to_spawn.temperature = breather.bodytemperature
	log_atmos("[owner] coughed some gas into the air due to their corrupted lungs.", mix_to_spawn)
	var/turf/open/our_turf = get_turf(breather)
	our_turf.assume_air(mix_to_spawn)


/// It's full of worms
<<<<<<< HEAD
/obj/item/organ/internal/appendix/corrupt
=======
/obj/item/organ/appendix/corrupt
>>>>>>> tg-pr-88929
	name = "corrupt appendix"
	desc = "What kind of dark, cosmic force is even going to bother to corrupt an appendix?"
	organ_flags = parent_type::organ_flags | ORGAN_HAZARDOUS
	/// How likely are we to spawn worms?
	var/worm_chance = 2
<<<<<<< HEAD
	/// Cooldown between corrupted effects (monkestation addition)
	COOLDOWN_DECLARE(effect_cooldown)

/obj/item/organ/internal/appendix/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)
	AddElement(/datum/element/noticable_organ, "abdomen is distended... and wiggling.", BODY_ZONE_PRECISE_GROIN)

/obj/item/organ/internal/appendix/corrupt/on_life(seconds_per_tick, times_fired)
	. = ..()
	if (owner.stat != CONSCIOUS || owner.has_reagent(/datum/reagent/water/holywater) || IS_IN_MANSUS(owner) || !SPT_PROB(worm_chance, seconds_per_tick))
		return
	// monkestation start: add cooldown
	if(!COOLDOWN_FINISHED(src, effect_cooldown))
		return
	COOLDOWN_START(src, effect_cooldown, rand(25 SECONDS, 90 SECONDS))
	// monkestation end
	owner.vomit(vomit_type = /obj/effect/decal/cleanable/vomit/nebula/worms, distance = 0)
=======

/obj/item/organ/appendix/corrupt/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/corrupted_organ)
	AddElement(/datum/element/noticable_organ, "%PRONOUN_Their abdomen is distended... and wiggling.", BODY_ZONE_PRECISE_GROIN)

/obj/item/organ/appendix/corrupt/on_life(seconds_per_tick, times_fired)
	. = ..()
	if (owner.stat != CONSCIOUS || owner.has_reagent(/datum/reagent/water/holywater) || IS_IN_MANSUS(owner) || !SPT_PROB(worm_chance, seconds_per_tick))
		return
	owner.vomit(MOB_VOMIT_MESSAGE | MOB_VOMIT_HARM, vomit_type = /obj/effect/decal/cleanable/vomit/nebula/worms, distance = 0)
>>>>>>> tg-pr-88929
	owner.Knockdown(0.5 SECONDS)
