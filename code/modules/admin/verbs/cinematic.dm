<<<<<<< HEAD
ADMIN_VERB(cinematic, R_FUN, FALSE, "Cinematic", "Show a cinematic to all players.", ADMIN_CATEGORY_FUN)
=======
ADMIN_VERB(cinematic, R_FUN, "Cinematic", "Show a cinematic to all players.", ADMIN_CATEGORY_FUN)
>>>>>>> tg-pr-88929
	var/datum/cinematic/choice = tgui_input_list(
		user,
		"Chose a cinematic to play to everyone in the server.",
		"Choose Cinematic",
		sort_list(subtypesof(/datum/cinematic), GLOBAL_PROC_REF(cmp_typepaths_asc)),
	)
	if(!choice || !ispath(choice, /datum/cinematic))
		return
	play_cinematic(choice, world)
