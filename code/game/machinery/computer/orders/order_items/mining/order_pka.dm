/datum/orderable_item/accelerator //self explanitory, only PKA's go here, NO wastepin locked weapons.
	category_index = CATEGORY_PKA

/datum/orderable_item/accelerator/gun
	purchase_path = /obj/item/gun/energy/recharge/kinetic_accelerator
	cost_per_order = 600

/datum/orderable_item/accelerator/gun/repeater //monke edit
	item_path = /obj/item/gun/energy/recharge/kinetic_accelerator/repeater
	cost_per_order = 1250

/datum/orderable_item/accelerator/gun/shockwave //monke edit
	item_path = /obj/item/storage/box/shockwave
	cost_per_order = 1250

/datum/orderable_item/accelerator/gun/glock //monke edit
	item_path = /obj/item/gun/energy/recharge/kinetic_accelerator/glock
	cost_per_order = 1250

/datum/orderable_item/accelerator/range
	purchase_path = /obj/item/borg/upgrade/modkit/range
	cost_per_order = 675

/datum/orderable_item/accelerator/damage
	purchase_path = /obj/item/borg/upgrade/modkit/damage
	cost_per_order = 675

/datum/orderable_item/accelerator/cooldown
	purchase_path = /obj/item/borg/upgrade/modkit/cooldown
	cost_per_order = 675

/datum/orderable_item/accelerator/aoe_mobs
	item_path = /obj/item/borg/upgrade/modkit/aoe/mobs
	cost_per_order = 2000

/datum/orderable_item/accelerator/minebot_passthrough
	item_path = /obj/item/borg/upgrade/modkit/minebot_passthrough
	cost_per_order = 1000

/datum/orderable_item/accelerator/chasis
	purchase_path = /obj/item/borg/upgrade/modkit/chassis_mod
	cost_per_order = 250

/datum/orderable_item/accelerator/chasis_orange
	purchase_path = /obj/item/borg/upgrade/modkit/chassis_mod/orange
	cost_per_order = 300

/datum/orderable_item/accelerator/tracer
	purchase_path = /obj/item/borg/upgrade/modkit/tracer
	cost_per_order = 100

/datum/orderable_item/accelerator/adjustable_tracer
	purchase_path = /obj/item/borg/upgrade/modkit/tracer/adjustable
	cost_per_order = 150
<<<<<<< HEAD
=======

/datum/orderable_item/accelerator/aoe_mobs
	purchase_path = /obj/item/borg/upgrade/modkit/aoe/mobs
	cost_per_order = 1500

/datum/orderable_item/accelerator/minebot_passthrough
	purchase_path = /obj/item/borg/upgrade/modkit/minebot_passthrough
	cost_per_order = 800

/datum/orderable_item/accelerator/friendly_fire
	purchase_path = /obj/item/borg/upgrade/modkit/human_passthrough
	cost_per_order = 750
>>>>>>> tg-pr-88929
