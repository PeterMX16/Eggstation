/datum/asset/spritesheet/pipes
	name = "pipes"

/datum/asset/spritesheet/pipes/create_spritesheets()
<<<<<<< HEAD
	for (var/each in list('icons/obj/atmospherics/pipes/pipe_item.dmi', 'monkestation/icons/obj/atmospherics/pipes/disposal.dmi', 'icons/obj/atmospherics/pipes/transit_tube.dmi', 'icons/obj/plumbing/fluid_ducts.dmi'))
=======
	for (var/each in list('icons/obj/pipes_n_cables/pipe_item.dmi', 'icons/obj/pipes_n_cables/disposal.dmi', 'icons/obj/pipes_n_cables/transit_tube.dmi', 'icons/obj/pipes_n_cables/hydrochem/fluid_ducts.dmi'))
>>>>>>> tg-pr-88929
		InsertAll("", each, GLOB.alldirs)
