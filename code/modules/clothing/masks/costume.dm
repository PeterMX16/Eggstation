/obj/item/clothing/mask/joy
	name = "emotion mask"
	desc = "Express your happiness or hide your sorrows with this cultured cutout."
	icon_state = "joy"
	clothing_flags = MASKINTERNALS
	flags_inv = HIDESNOUT
<<<<<<< HEAD
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION
=======
	obj_flags = parent_type::obj_flags | INFINITE_RESKIN
>>>>>>> tg-pr-88929
	unique_reskin = list(
			"Joy" = "joy",
			"Flushed" = "flushed",
			"Pensive" = "pensive",
			"Angry" = "angry",
			"Pleading" = "pleading",
			"Epic" = "epicface",
			"Smile" = "smile"
	)


/obj/item/clothing/mask/joy/reskin_obj(mob/user)
	. = ..()
	user.update_worn_mask()

/obj/item/clothing/mask/mummy
	name = "mummy mask"
	desc = "Ancient bandages."
	icon_state = "mummy_mask"
	inhand_icon_state = null
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT

/obj/item/clothing/mask/scarecrow
	name = "sack mask"
	desc = "A burlap sack with eyeholes."
	icon_state = "scarecrow_sack"
	inhand_icon_state = null
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT

/obj/item/clothing/mask/kitsune
	name = "kitsune mask"
	desc = "Porcelain mask made in the style of the Sol-3 region. It is painted to look like a kitsune."
	icon_state = "kitsune"
	inhand_icon_state = null
	w_class = WEIGHT_CLASS_SMALL
	adjusted_flags = ITEM_SLOT_HEAD
	flags_inv = HIDEFACE|HIDEFACIALHAIR
<<<<<<< HEAD
	flags_cover = MASKCOVERSMOUTH
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR
	visor_flags_cover = MASKCOVERSMOUTH
=======
>>>>>>> tg-pr-88929
	custom_price = PAYCHECK_CREW
	greyscale_colors = "#EEEEEE#AA0000"
	greyscale_config = /datum/greyscale_config/kitsune
	greyscale_config_worn = /datum/greyscale_config/kitsune/worn
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/clothing/mask/kitsune/examine(mob/user)
	. = ..()
	if(up)
		. += "Use in-hand to wear as a mask!"
		return
	else
<<<<<<< HEAD
		. += "Use in-hand to tie it up to wear as a hat!"

/obj/item/clothing/mask/kitsune/attack_self(mob/user)
	weldingvisortoggle(user)
	alternate_worn_layer = up ? ABOVE_BODY_FRONT_HEAD_LAYER : null

/obj/item/clothing/mask/kitsune/AltClick(mob/user)
	. = ..()
	weldingvisortoggle(user)
	return TRUE

/obj/item/clothing/mask/joy/manhunt
	name = "smiley mask"
	desc = "A happy mask! Doesn't seem like there is anything wrong with it...right?"
	icon_state = "happy"
	unique_reskin = list(
			"Happy" = "happy",
			"Bloodied" = "bloodied",
			"Stop me" = "stop_me",
			"Cracked bloodied" = "cracked_bloodied",
			"Cracked" = "cracked",
	)
=======
		. += "Use in-hand to wear as a hat!"

/obj/item/clothing/mask/kitsune/attack_self(mob/user)
	adjust_visor(user)
	alternate_worn_layer = up ? ABOVE_BODY_FRONT_HEAD_LAYER : null

/obj/item/clothing/mask/rebellion
	name = "rebellion mask"
	desc = "Mask that is usually used during rebellions by insurgents. It covers the entire face and makes you unrecognizable."
	icon_state = "rebellion_mask"
	inhand_icon_state = null
	w_class = WEIGHT_CLASS_SMALL
	flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDESNOUT
	custom_price = PAYCHECK_CREW
	greyscale_colors = COLOR_VERY_LIGHT_GRAY
	greyscale_config = /datum/greyscale_config/rebellion_mask
	greyscale_config_worn = /datum/greyscale_config/rebellion_mask/worn
	flags_1 = IS_PLAYER_COLORABLE_1
>>>>>>> tg-pr-88929
