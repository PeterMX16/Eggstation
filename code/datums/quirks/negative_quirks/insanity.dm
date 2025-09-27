/datum/quirk/insanity
	name = "Reality Dissociation Syndrome"
<<<<<<< HEAD
	desc = "You suffer from a severe disorder that causes very vivid hallucinations. \
=======
	desc = "You suffer from a severe disorder that causes very vivid hallucinations and trouble expressing your ideas. \
>>>>>>> tg-pr-88929
		Mindbreaker toxin can suppress its effects, and you are immune to mindbreaker's hallucinogenic properties. \
		THIS IS NOT A LICENSE TO GRIEF."
	icon = FA_ICON_GRIN_TONGUE_WINK
	value = -8
	gain_text = span_userdanger("...")
	lose_text = span_notice("You feel in tune with the world again.")
<<<<<<< HEAD
	medical_record_text = "Patient suffers from acute Reality Dissociation Syndrome and experiences vivid hallucinations."
=======
	medical_record_text = "Patient suffers from acute Reality Dissociation Syndrome and experiences vivid hallucinations, and may have trouble speaking."
>>>>>>> tg-pr-88929
	hardcore_value = 6
	mail_goodies = list(/obj/item/storage/pill_bottle/lsdpsych)
	/// Weakref to the trauma we give out
	var/datum/weakref/added_trama_ref
<<<<<<< HEAD
	species_blacklist = list(SPECIES_IPC)
=======
>>>>>>> tg-pr-88929

/datum/quirk/insanity/add(client/client_source)
	if(!iscarbon(quirk_holder))
		return
	var/mob/living/carbon/carbon_quirk_holder = quirk_holder
<<<<<<< HEAD

=======
	
>>>>>>> tg-pr-88929
	// Setup our special RDS mild hallucination.
	// Not a unique subtype so not to plague subtypesof,
	// also as we inherit the names and values from our quirk.
	var/datum/brain_trauma/mild/hallucinations/added_trauma = new()
	added_trauma.resilience = TRAUMA_RESILIENCE_ABSOLUTE
	added_trauma.name = name
	added_trauma.desc = medical_record_text
<<<<<<< HEAD
	added_trauma.scan_desc = lowertext(name)
=======
	added_trauma.scan_desc = LOWER_TEXT(name)
>>>>>>> tg-pr-88929
	added_trauma.gain_text = null
	added_trauma.lose_text = null

	carbon_quirk_holder.gain_trauma(added_trauma)
	added_trama_ref = WEAKREF(added_trauma)

/datum/quirk/insanity/post_add()
<<<<<<< HEAD
	var/rds_policy = get_policy("[type]") || "Please note that your [lowertext(name)] does NOT give you any additional right to attack people or cause chaos."
=======
	var/rds_policy = get_policy("[type]") || "Please note that your [LOWER_TEXT(name)] does NOT give you any additional right to attack people or cause chaos."
>>>>>>> tg-pr-88929
	// I don't /think/ we'll need this, but for newbies who think "roleplay as insane" = "license to kill", it's probably a good thing to have.
	to_chat(quirk_holder, span_big(span_info(rds_policy)))

/datum/quirk/insanity/remove()
	QDEL_NULL(added_trama_ref)
