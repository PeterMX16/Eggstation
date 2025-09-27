/obj/item/clothing/mask/balaclava
	name = "balaclava"
	desc = "LOADSAMONEY"
	icon_state = "balaclava"
	inhand_icon_state = "balaclava"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDESNOUT
	alternate_worn_layer = LOW_FACEMASK_LAYER //This lets it layer below glasses and headsets; yes, that's below hair, but it already has HIDEHAIR
	w_class = WEIGHT_CLASS_SMALL
	actions_types = list(/datum/action/item_action/adjust)
	alternate_worn_layer = UNDER_SUIT_LAYER //monkestation edit

/obj/item/clothing/mask/balaclava/attack_self(mob/user)
	adjust_visor(user)

/obj/item/clothing/mask/floortilebalaclava
	name = "floortile balaclava"
	desc = "The newest floortile camouflage balaclava used for hallway warfare. \
		The best breathability, flexibility and comfort. Designed by Camo-J's."
	icon_state = "floortile_balaclava"
	inhand_icon_state = "balaclava"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDESNOUT
	alternate_worn_layer = LOW_FACEMASK_LAYER
	w_class = WEIGHT_CLASS_SMALL
	actions_types = list(/datum/action/item_action/adjust)

/obj/item/clothing/mask/floortilebalaclava/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/adjust_fishing_difficulty, -5) //tacticool

/obj/item/clothing/mask/floortilebalaclava/attack_self(mob/user)
	adjust_visor(user)

/obj/item/clothing/mask/luchador
	name = "Luchador Mask"
	desc = "Worn by robust fighters, flying high to defeat their foes!"
	icon_state = "luchag"
	inhand_icon_state = null
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	w_class = WEIGHT_CLASS_SMALL

<<<<<<< HEAD
/obj/item/clothing/head/frenchberet/Initialize(mapload)
=======
/obj/item/clothing/mask/luchador/Initialize(mapload)
>>>>>>> tg-pr-88929
	. = ..()
	AddComponent(/datum/component/speechmod, replacements = strings("luchador_replacement.json", "luchador"), end_string = " OLE!", end_string_chance = 25, uppercase = TRUE, slots = ITEM_SLOT_MASK)

/obj/item/clothing/mask/luchador/tecnicos
	name = "Tecnicos Mask"
	desc = "Worn by robust fighters who uphold justice and fight honorably."
	icon_state = "luchador"

/obj/item/clothing/mask/luchador/rudos
	name = "Rudos Mask"
	desc = "Worn by robust fighters who are willing to do anything to win."
	icon_state = "luchar"

/obj/item/clothing/mask/russian_balaclava
	name = "thermal balaclava" //monkestation edit
	desc = "Protects your face from the cold." //monkestation edit
	icon_state = "rus_balaclava"
	inhand_icon_state = "balaclava"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDESNOUT
	alternate_worn_layer = LOW_FACEMASK_LAYER //This lets it layer below glasses and headsets; yes, that's below hair, but it already has HIDEHAIR
	w_class = WEIGHT_CLASS_SMALL
	alternate_worn_layer = UNDER_SUIT_LAYER //monkestation edit
	min_cold_protection_temperature = HELMET_MIN_TEMP_PROTECT  //monkestation edit
