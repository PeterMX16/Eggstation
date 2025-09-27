///Icons for containers printed in ChemMaster
<<<<<<< HEAD
/datum/asset/spritesheet_batched/chemmaster
	name = "chemmaster"

/datum/asset/spritesheet_batched/chemmaster/create_spritesheets()
	var/list/ids = list()
	for(var/category in GLOB.chem_master_containers)
		for(var/obj/item/reagent_containers/container as anything in GLOB.chem_master_containers[category])
=======
/datum/asset/spritesheet/chemmaster
	name = "chemmaster"

/datum/asset/spritesheet/chemmaster/create_spritesheets()
	var/list/ids = list()
	for(var/category in GLOB.reagent_containers)
		for(var/obj/item/reagent_containers/container as anything in GLOB.reagent_containers[category])
>>>>>>> tg-pr-88929
			var/icon_file = initial(container.icon)
			var/icon_state = initial(container.icon_state)
			var/id = sanitize_css_class_name("[container]")
			if(id in ids) // exclude duplicate containers
				continue
			ids += id
<<<<<<< HEAD
			insert_icon(id, uni_icon(icon_file, icon_state))
=======
			Insert(id, icon_file, icon_state)
>>>>>>> tg-pr-88929
