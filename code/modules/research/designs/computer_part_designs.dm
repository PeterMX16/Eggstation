////////////////////////////////////////
///////////Computer Parts///////////////
////////////////////////////////////////
// Data disks
/datum/design/portabledrive/basic
	name = "Data Disk"
	id = "portadrive_basic"
<<<<<<< HEAD
	build_type = IMPRINTER | AWAY_IMPRINTER
	materials = list(/datum/material/glass = SMALL_MATERIAL_AMOUNT*8)
=======
	build_type = AUTOLATHE | PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass = SHEET_MATERIAL_AMOUNT)
>>>>>>> tg-pr-88929
	build_path = /obj/item/computer_disk
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_MODULAR_COMPUTERS + RND_SUBCATEGORY_MODULAR_COMPUTERS_PARTS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/portabledrive/advanced
	name = "Advanced Data Disk"
	id = "portadrive_advanced"
<<<<<<< HEAD
	build_type = IMPRINTER | AWAY_IMPRINTER
	materials = list(/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT*1.5)
=======
	build_type = AUTOLATHE | PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass = SHEET_MATERIAL_AMOUNT * 2)
>>>>>>> tg-pr-88929
	build_path = /obj/item/computer_disk/advanced
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_MODULAR_COMPUTERS + RND_SUBCATEGORY_MODULAR_COMPUTERS_PARTS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/portabledrive/super
	name = "Super Data Disk"
	id = "portadrive_super"
<<<<<<< HEAD
	build_type = IMPRINTER | AWAY_IMPRINTER
	materials = list(/datum/material/glass = SHEET_MATERIAL_AMOUNT*1.5)
=======
	build_type = AUTOLATHE | PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/glass = SHEET_MATERIAL_AMOUNT * 4)
>>>>>>> tg-pr-88929
	build_path = /obj/item/computer_disk/super
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_MODULAR_COMPUTERS + RND_SUBCATEGORY_MODULAR_COMPUTERS_PARTS
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_ENGINEERING
