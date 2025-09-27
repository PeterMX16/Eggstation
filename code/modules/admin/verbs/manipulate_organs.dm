ADMIN_VERB_VISIBILITY(manipulate_organs, ADMIN_VERB_VISIBLITY_FLAG_MAPPING_DEBUG)
<<<<<<< HEAD
ADMIN_VERB(manipulate_organs, R_DEBUG, FALSE, "Manipulate Organs", "Manipulate the organs of a living carbon.", ADMIN_CATEGORY_DEBUG, mob/living/carbon/carbon_victim in world)
=======
ADMIN_VERB(manipulate_organs, R_DEBUG, "Manipulate Organs", "Manipulate the organs of a living carbon.", ADMIN_CATEGORY_DEBUG, mob/living/carbon/carbon_victim in world)
>>>>>>> tg-pr-88929
	var/operation = tgui_input_list(user, "Select organ operation", "Organ Manipulation", list("add organ", "add implant", "drop organ/implant", "remove organ/implant"))
	if (isnull(operation))
		return

	var/list/organs = list()
	switch(operation)
		if("add organ")
			for(var/path in subtypesof(/obj/item/organ))
				var/dat = replacetext("[path]", "/obj/item/organ/", ":")
				organs[dat] = path

<<<<<<< HEAD
			var/obj/item/organ/organ = tgui_input_list(user, "Select organ type", "Organ Manipulation", organs)
			if(isnull(organ))
=======
			var/obj/item/organ/organ_to_grant = tgui_input_list(user, "Select organ type", "Organ Manipulation", organs)
			if(isnull(organ_to_grant))
>>>>>>> tg-pr-88929
				return
			if(isnull(organs[organ_to_grant]))
				return
<<<<<<< HEAD
			organ = organs[organ]
			organ = new organ
			organ.Insert(carbon_victim)
			log_admin("[key_name(user)] has added organ [organ.type] to [key_name(carbon_victim)]")
			message_admins("[key_name_admin(user)] has added organ [organ.type] to [ADMIN_LOOKUPFLW(carbon_victim)]")
=======
			organ_to_grant = organs[organ_to_grant]
			organ_to_grant = new organ_to_grant
			organ_to_grant.Insert(carbon_victim)
			log_admin("[key_name(user)] has added organ [organ_to_grant.type] to [key_name(carbon_victim)]")
			message_admins("[key_name_admin(user)] has added organ [organ_to_grant.type] to [ADMIN_LOOKUPFLW(carbon_victim)]")
>>>>>>> tg-pr-88929

		if("add implant")
			for(var/path in subtypesof(/obj/item/implant))
				var/dat = replacetext("[path]", "/obj/item/implant/", ":")
				organs[dat] = path

<<<<<<< HEAD
			var/obj/item/implant/organ = tgui_input_list(user, "Select implant type", "Organ Manipulation", organs)
			if(isnull(organ))
=======
			var/obj/item/implant/implant_to_grant = tgui_input_list(user, "Select implant type", "Organ Manipulation", organs)
			if(isnull(implant_to_grant))
>>>>>>> tg-pr-88929
				return
			if(isnull(organs[implant_to_grant]))
				return
<<<<<<< HEAD
			organ = organs[organ]
			organ = new organ
			organ.implant(carbon_victim)
			log_admin("[key_name(user)] has added implant [organ.type] to [key_name(carbon_victim)]")
			message_admins("[key_name_admin(user)] has added implant [organ.type] to [ADMIN_LOOKUPFLW(carbon_victim)]")
=======
			implant_to_grant = organs[implant_to_grant]
			implant_to_grant = new implant_to_grant
			if(!implant_to_grant.implant(carbon_victim))
				to_chat(user, span_notice("[carbon_victim] is unable to hold this implant!"))
				qdel(implant_to_grant)
				return
			log_admin("[key_name(user)] has added implant [implant_to_grant.type] to [key_name(carbon_victim)]")
			message_admins("[key_name_admin(user)] has added implant [implant_to_grant.type] to [ADMIN_LOOKUPFLW(carbon_victim)]")
>>>>>>> tg-pr-88929

		if("drop organ/implant", "remove organ/implant")
			for(var/obj/item/organ/user_organs as anything in carbon_victim.organs)
				organs["[user_organs.name] ([user_organs.type])"] = user_organs

			for(var/obj/item/implant/user_implants as anything in carbon_victim.implants)
				organs["[user_implants.name] ([user_implants.type])"] = user_implants

<<<<<<< HEAD
			var/obj/item/organ = tgui_input_list(user, "Select organ/implant", "Organ Manipulation", organs)
			if(isnull(organ))
=======
			var/obj/item/organ_to_modify = tgui_input_list(user, "Select organ/implant", "Organ Manipulation", organs)
			if(isnull(organ_to_modify))
>>>>>>> tg-pr-88929
				return
			if(isnull(organs[organ_to_modify]))
				return
			organ_to_modify = organs[organ_to_modify]

<<<<<<< HEAD
			log_admin("[key_name(user)] has removed [organ.type] from [key_name(carbon_victim)]")
			message_admins("[key_name_admin(user)] has removed [organ.type] from [ADMIN_LOOKUPFLW(carbon_victim)]")

			if(isorgan(organ))
				O = organ
				O.Remove(carbon_victim)
			else
				I = organ
				I.removed(carbon_victim)

			organ.forceMove(get_turf(carbon_victim))

			if(operation == "remove organ/implant")
				qdel(organ)
			else if(I) // Put the implant in case.
				var/obj/item/implantcase/case = new(get_turf(carbon_victim))
				case.imp = I
				I.forceMove(case)
=======
			log_admin("[key_name(user)] has removed [organ_to_modify.type] from [key_name(carbon_victim)]")
			message_admins("[key_name_admin(user)] has removed [organ_to_modify.type] from [ADMIN_LOOKUPFLW(carbon_victim)]")

			var/obj/item/organ/organ_holder
			var/obj/item/implant/implant_holder

			if(isorgan(organ_to_modify))
				organ_holder = organ_to_modify
				organ_holder.Remove(carbon_victim)
			else
				implant_holder = organ_to_modify
				implant_holder.removed(carbon_victim, special = TRUE)

			organ_to_modify.forceMove(get_turf(carbon_victim))

			if(operation == "remove organ/implant")
				qdel(organ_to_modify)
			else if(implant_holder) // Put the implant in case.
				var/obj/item/implantcase/case = new(get_turf(carbon_victim))
				case.imp = implant_holder
				implant_holder.forceMove(case)
>>>>>>> tg-pr-88929
				case.update_appearance()
