/datum/asset/spritesheet_batched/supplypods
	name = "supplypods"

<<<<<<< HEAD
/datum/asset/spritesheet_batched/supplypods/create_spritesheets()
	for (var/style in 1 to length(GLOB.podstyles))
		if (style == STYLE_SEETHROUGH)
			insert_icon("pod_asset[style]", uni_icon('icons/obj/supplypods.dmi' , "seethrough-icon"))
=======
/datum/asset/spritesheet/supplypods/create_spritesheets()
	for (var/datum/pod_style/style as anything in typesof(/datum/pod_style))
		if (ispath(style, /datum/pod_style/seethrough))
			Insert("pod_asset[style::id]", icon('icons/obj/supplypods.dmi' , "seethrough-icon"))
>>>>>>> tg-pr-88929
			continue
		var/base = style::icon_state
		if (!base)
<<<<<<< HEAD
			insert_icon("pod_asset[style]", uni_icon('icons/obj/supplypods.dmi', "invisible-icon"))
			continue
		var/datum/universal_icon/podIcon = uni_icon('icons/obj/supplypods.dmi', base)
		var/door = GLOB.podstyles[style][POD_DOOR]
		if (door)
			door = "[base]_door"
			podIcon.blend_icon(uni_icon('icons/obj/supplypods.dmi', door), ICON_OVERLAY)
		var/shape = GLOB.podstyles[style][POD_SHAPE]
		if (shape == POD_SHAPE_NORML)
			var/decal = GLOB.podstyles[style][POD_DECAL]
			if (decal)
				podIcon.blend_icon(uni_icon('icons/obj/supplypods.dmi', decal), ICON_OVERLAY)
			var/glow = GLOB.podstyles[style][POD_GLOW]
			if (glow)
				glow = "pod_glow_[glow]"
				podIcon.blend_icon(uni_icon('icons/obj/supplypods.dmi', glow), ICON_OVERLAY)
		insert_icon("pod_asset[style]", podIcon)
=======
			Insert("pod_asset[style::id]", icon('icons/obj/supplypods.dmi', "invisible-icon"))
			continue
		var/icon/podIcon = icon('icons/obj/supplypods.dmi', base)
		var/door = style::has_door
		if (door)
			door = "[base]_door"
			podIcon.Blend(icon('icons/obj/supplypods.dmi', door), ICON_OVERLAY)
		var/shape = style::shape
		if (shape == POD_SHAPE_NORMAL)
			var/decal = style::decal_icon
			if (decal)
				podIcon.Blend(icon('icons/obj/supplypods.dmi', decal), ICON_OVERLAY)
			var/glow = style::glow_color
			if (glow)
				glow = "pod_glow_[glow]"
				podIcon.Blend(icon('icons/obj/supplypods.dmi', glow), ICON_OVERLAY)
		Insert("pod_asset[style::id]", podIcon)
>>>>>>> tg-pr-88929
