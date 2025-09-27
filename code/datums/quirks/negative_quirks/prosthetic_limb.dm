/datum/quirk/prosthetic_limb
	name = "Prosthetic Limb"
	desc = "An accident caused you to lose one of your limbs. Because of this, you now have a surplus prosthetic!"
	icon = "tg-prosthetic-leg"
<<<<<<< HEAD
	value = QUIRK_COST_PROSTHETIC_LIMB
	hardcore_value = QUIRK_HARDCORE_PROSTHETIC_LIMB
	quirk_flags = QUIRK_HUMAN_ONLY | QUIRK_CHANGES_APPEARANCE | QUIRK_DONT_CLONE
	mail_goodies = list(/obj/item/weldingtool/mini, /obj/item/stack/cable_coil/five)
	/// The slot to replace, in string form
	var/slot_string = "limb"
	/// The slot to replace, in GLOB.limb_zones (both arms and both legs)
	var/limb_zone
	species_blacklist = list(SPECIES_OOZELING)

/datum/quirk/prosthetic_limb/add_unique(client/client_source)
	var/body_zone = GLOB.limb_choice[client_source?.prefs?.read_preference(/datum/preference/choiced/limb/prosthetic)]
	if (isnull(body_zone))  //Client gone or they chose a random limb
		body_zone = GLOB.limb_choice[pick(GLOB.limb_choice)]
	slot_string = body_zone_as_plaintext(body_zone)

	var/obj/item/bodypart/surplus
	switch (body_zone)
		if (BODY_ZONE_L_ARM)
			surplus = new /obj/item/bodypart/arm/left/robot/surplus()
		if (BODY_ZONE_R_ARM)
			surplus = new /obj/item/bodypart/arm/right/robot/surplus()
		if (BODY_ZONE_L_LEG)
			surplus = new /obj/item/bodypart/leg/left/robot/surplus()
		if (BODY_ZONE_R_LEG)
			surplus = new /obj/item/bodypart/leg/right/robot/surplus()
	medical_record_text = "Patient uses a low-budget prosthetic on the [slot_string]."
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.del_and_replace_bodypart(surplus, special = TRUE)
=======
	value = -3
	hardcore_value = 3
	quirk_flags = QUIRK_HUMAN_ONLY | QUIRK_CHANGES_APPEARANCE
	mail_goodies = list(/obj/item/weldingtool/mini, /obj/item/stack/cable_coil/five)
	/// The slot to replace, in string form
	var/slot_string = "limb"
	/// the original limb from before the prosthetic was applied
	var/obj/item/bodypart/old_limb

/datum/quirk_constant_data/prosthetic_limb
	associated_typepath = /datum/quirk/prosthetic_limb
	customization_options = list(/datum/preference/choiced/prosthetic)

/datum/quirk/prosthetic_limb/add_unique(client/client_source)
	var/limb_type = GLOB.prosthetic_limb_choice[client_source?.prefs?.read_preference(/datum/preference/choiced/prosthetic)]
	if(isnull(limb_type))  //Client gone or they chose a random prosthetic
		limb_type = GLOB.prosthetic_limb_choice[pick(GLOB.prosthetic_limb_choice)]

	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/bodypart/surplus = new limb_type()
	slot_string = "[surplus.plaintext_zone]"

	medical_record_text = "Patient uses a low-budget prosthetic on the [slot_string]."
	old_limb = human_holder.return_and_replace_bodypart(surplus, special = TRUE)
>>>>>>> tg-pr-88929

/datum/quirk/prosthetic_limb/post_add()
	to_chat(quirk_holder, span_bolddanger("Your [slot_string] has been replaced with a surplus prosthetic. It has almost no muscle force, and makes you unhealthier by just having it. Additionally, \
	you need to use a welding tool and cables to repair it, instead of sutures and regenerative meshes."))

/datum/quirk/prosthetic_limb/remove()
<<<<<<< HEAD
	if(QDELETED(quirk_holder))
		return
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.reset_to_original_bodypart(limb_zone)
=======
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.del_and_replace_bodypart(old_limb, special = TRUE)
	old_limb = null
>>>>>>> tg-pr-88929
