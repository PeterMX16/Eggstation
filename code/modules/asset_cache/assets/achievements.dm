<<<<<<< HEAD
/datum/asset/spritesheet_batched/achievements
	name = "achievements"

/datum/asset/spritesheet_batched/achievements/create_spritesheets()
	for(var/icon_state_name in icon_states(ACHIEVEMENTS_SET))
		insert_icon("achievement-[icon_state_name]", uni_icon(ACHIEVEMENTS_SET, icon_state_name))
	// catch achievements which are pulling icons from another file
	for(var/datum/award/other_award as anything in subtypesof(/datum/award))
		var/icon = initial(other_award.icon)
		if (icon == ACHIEVEMENTS_SET)
			continue
		var/icon_state_name = initial(other_award.icon_state)
		insert_icon("achievement-[icon_state_name]", uni_icon(icon, icon_state_name))
=======
/datum/asset/spritesheet/simple/achievements
	name = "achievements"

/datum/asset/spritesheet/simple/achievements/create_spritesheets()
	InsertAll("achievement", ACHIEVEMENTS_SET)
	// catch achievements which are pulling icons from another file
	for(var/datum/award/other_award as anything in subtypesof(/datum/award))
		var/icon = initial(other_award.icon)
		if (icon != ACHIEVEMENTS_SET)
			var/icon_state = initial(other_award.icon_state)
			Insert("achievement-[icon_state]", icon, icon_state=icon_state)
>>>>>>> tg-pr-88929
