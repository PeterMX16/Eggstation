/obj/item/seeds/seedling
<<<<<<< HEAD
	name = "pack of seedling seeds"
	desc = "These seeds grow into a floral assistant which can help look after other plants!"
	icon_state = "seed-seedling"
	growing_icon = 'icons/obj/service/hydroponics/growing_fruits.dmi'
	icon = 'icons/obj/service/hydroponics/seeds.dmi'
=======
	name = "seedling seed pack"
	desc = "These seeds grow into a floral assistant which can help look after other plants!"
	icon_state = "seed-seedling"
	growing_icon = 'icons/obj/service/hydroponics/growing_fruits.dmi'
>>>>>>> tg-pr-88929
	species = "seedling"
	plantname = "Seedling Plant"
	product = /mob/living/basic/seedling
	lifespan = 40
	endurance = 7
	maturation = 10
	production = 1
	growthstages = 2
<<<<<<< HEAD
	yield = 10
	potency = 30

/obj/item/seeds/seedling/harvest(mob/harvester)
	var/atom/movable/parent = loc
=======
	yield = 1
	instability = 15
	potency = 30

/obj/item/seeds/seedling/harvest(mob/harvester)
	var/obj/machinery/hydroponics/parent = loc
>>>>>>> tg-pr-88929
	var/list/grow_locations = get_adjacent_open_turfs(parent)
	var/turf/final_location = length(grow_locations) ? pick(grow_locations) : get_turf(parent)
	var/mob/living/basic/seedling/seed_pet = new product(final_location)
	seed_pet.befriend(harvester)
<<<<<<< HEAD
=======
	parent.update_tray(user = harvester, product_count = 1)
>>>>>>> tg-pr-88929

/obj/item/seeds/seedling/evil
	product = /mob/living/basic/seedling/meanie
	icon_state = "seed-seedling-evil"
