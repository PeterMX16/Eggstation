/datum/asset/spritesheet_batched/rcd
	name = "rcd-tgui"

<<<<<<< HEAD
/datum/asset/spritesheet_batched/rcd/create_spritesheets()
	//We load airlock icons seperatly from other icons cause they need overlays

	//load all category essential icon_states. format is icon_file = list of icon states we need from that file
	var/list/essentials = list(
		'icons/obj/chairs.dmi' = list("bar"),
		'icons/obj/firealarm.dmi' = list("fire_bitem"),
		'icons/obj/lighting.dmi' = list("floodlight_c1"),
		'icons/obj/monitors.dmi' = list("alarm_bitem"),
		'icons/obj/wallframe.dmi' = list("apc"),
		'icons/obj/stock_parts.dmi' = list("box_1"),
		'icons/obj/objects.dmi' = list("bed"),
		'icons/obj/smooth_structures/catwalk.dmi' = list("catwalk-0"),
		'icons/hud/radial.dmi' = list("cnorth", "csouth", "ceast", "cwest", "chair", "secure_windoor", "stool", "wallfloor", "windowsize", "windowtype", "windoor"),
		'icons/obj/structures.dmi' = list("glass_table", "rack", "reflector_base", "table", "girder"),
		'monkestation/icons/obj/structures/window/window.dmi' = list("window-0"),
		'monkestation/icons/obj/structures/window/reinforced_window.dmi' = list("reinforced_window-0"),
		'monkestation/icons/obj/structures/window/window_sill.dmi' = list("window_sill-0"),
	)

	var/datum/universal_icon/icon
	for(var/icon_file in essentials)
		for(var/icon_state in essentials[icon_file])
			icon = uni_icon(icon_file, icon_state)
			if(icon_state == "window-0" || icon_state == "reinforced_window-0")
				icon.blend_color("#305a6d", ICON_MULTIPLY)
				icon.blend_icon(uni_icon('monkestation/icons/obj/structures/window/grille.dmi', "grille-0"), ICON_UNDERLAY)
			insert_icon(sanitize_css_class_name(icon_state), icon)

	//for each airlock type we create its overlayed version with the suffix Glass in the sprite name
	var/list/airlocks = list(
		"Standard" = 'icons/obj/doors/airlocks/station/public.dmi',
		"Public" = 'icons/obj/doors/airlocks/station2/glass.dmi',
		"Engineering" = 'icons/obj/doors/airlocks/station/engineering.dmi',
		"Atmospherics" = 'icons/obj/doors/airlocks/station/atmos.dmi',
		"Security" = 'icons/obj/doors/airlocks/station/security.dmi',
		"Command" = 'icons/obj/doors/airlocks/station/command.dmi',
		"Medical" = 'icons/obj/doors/airlocks/station/medical.dmi',
		"Research" = 'icons/obj/doors/airlocks/station/research.dmi',
		"Freezer" = 'icons/obj/doors/airlocks/station/freezer.dmi',
		"Pathology" = 'icons/obj/doors/airlocks/station/virology.dmi',
		"Mining" = 'icons/obj/doors/airlocks/station/mining.dmi',
		"Maintenance" = 'icons/obj/doors/airlocks/station/maintenance.dmi',
		"External" = 'icons/obj/doors/airlocks/external/external.dmi',
		"External Maintenance" = 'icons/obj/doors/airlocks/station/maintenanceexternal.dmi',
		"Airtight Hatch" = 'icons/obj/doors/airlocks/hatch/centcom.dmi',
		"Maintenance Hatch" = 'icons/obj/doors/airlocks/hatch/maintenance.dmi'
	)
	//these 3 types dont have glass doors
	var/list/exclusion = list("Freezer", "Airtight Hatch", "Maintenance Hatch")

	for(var/airlock_name in airlocks)
		//solid door with overlay
		icon = uni_icon(airlocks[airlock_name], "closed", SOUTH)
		if(icon_exists(airlocks[airlock_name], "fill_closed"))
			icon.blend_icon(uni_icon(airlocks[airlock_name], "fill_closed", SOUTH), ICON_OVERLAY)
		insert_icon(sanitize_css_class_name(airlock_name), icon)

		//exclude these glass types
		if(airlock_name in exclusion)
			continue

		//glass door no overlay
		icon = uni_icon(airlocks[airlock_name], "closed", SOUTH)
		insert_icon(sanitize_css_class_name("[airlock_name]Glass"), icon)
=======
/datum/asset/spritesheet/rcd/create_spritesheets()
	for(var/root_category in GLOB.rcd_designs)

		var/list/category_designs = GLOB.rcd_designs[root_category]
		if(!length(category_designs))
			continue

		for(var/category in category_designs)
			var/list/designs = category_designs[category]

			var/sprite_name
			var/icon/sprite_icon
			for(var/list/design as anything in designs)
				var/atom/movable/path = design[RCD_DESIGN_PATH]
				if(!ispath(path))
					continue
				sprite_name = initial(path.name)

				//icon for windows are blended with grills if required and loaded from radial menu
				if(ispath(path, /obj/structure/window))
					if(path == /obj/structure/window)
						sprite_icon = icon(icon = 'icons/hud/radial.dmi', icon_state = "windowsize")
					else if(path == /obj/structure/window/reinforced)
						sprite_icon = icon(icon = 'icons/hud/radial.dmi', icon_state = "windowtype")
					else if(path == /obj/structure/window/fulltile || path == /obj/structure/window/reinforced/fulltile)
						sprite_icon = icon(icon = initial(path.icon), icon_state = initial(path.icon_state))
						sprite_icon.Blend(icon(icon = 'icons/obj/structures.dmi', icon_state = "grille"), ICON_UNDERLAY)

				//icons for solid airlocks have an added solid overlay on top of their glass icons
				else if(ispath(path, /obj/machinery/door/airlock))
					var/obj/machinery/door/airlock/airlock_path = path
					var/airlock_icon = initial(airlock_path.icon)

					sprite_icon = icon(icon = airlock_icon, icon_state = "closed")
					if(!initial(airlock_path.glass))
						sprite_icon.Blend(icon(icon = airlock_icon, icon_state = "fill_closed"), ICON_OVERLAY)

				//for all other icons we load the paths default icon & icon state
				else
					sprite_icon = icon(icon = initial(path.icon), icon_state = initial(path.icon_state))

				Insert(sanitize_css_class_name(sprite_name), sprite_icon)
>>>>>>> tg-pr-88929
