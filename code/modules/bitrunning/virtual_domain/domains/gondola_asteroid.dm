/datum/lazy_template/virtual_domain/gondola_asteroid
	name = "Gondola Asteroid"
	desc = "An asteroid home to a bountiful forest of gondolas. Peaceful."
<<<<<<< HEAD
	map_name = "gondola_asteroid"
=======
>>>>>>> tg-pr-88929
	help_text = "What a lovely forest. There's a loot crate here in the middle of the map. \
	Hmm... It doesn't budge. The gondolas don't seem to have any trouble moving it, though. \
	I bet there's a way to move it myself."
	key = "gondola_asteroid"
	map_name = "gondola_asteroid"
<<<<<<< HEAD
	safehouse_path = /datum/map_template/safehouse/shuttle_space
=======
>>>>>>> tg-pr-88929

/// Very pushy gondolas, great for moving loot crates.
/obj/structure/closet/crate/secure/bitrunning/encrypted/gondola
	move_resist = MOVE_FORCE_STRONG

<<<<<<< HEAD
/mob/living/simple_animal/pet/gondola/virtual_domain
	health = 50
	loot = list(/obj/effect/decal/cleanable/blood/gibs, /obj/item/stack/sheet/animalhide/gondola = 1, /obj/item/food/meat/slab/gondola/virtual_domain = 1)
=======
/mob/living/basic/pet/gondola/virtual_domain
	health = 50
	loot = list(
		/obj/effect/decal/cleanable/blood/gibs = 1,
		/obj/item/stack/sheet/animalhide/gondola = 1,
		/obj/item/food/meat/slab/gondola/virtual_domain = 1,
	)
>>>>>>> tg-pr-88929
	maxHealth = 50
	move_force = MOVE_FORCE_VERY_STRONG
	move_resist = MOVE_FORCE_STRONG

/obj/item/food/meat/slab/gondola/virtual_domain
	food_reagents = list(
		/datum/reagent/consumable/nutriment/protein = 4,
		/datum/reagent/gondola_mutation_toxin/virtual_domain = 5,
	)

/datum/reagent/gondola_mutation_toxin/virtual_domain
	name = "Advanced Tranquility"
<<<<<<< HEAD
	disease_cat = DISEASE_GONDOLA_DIGITAL
=======
	gondola_disease = /datum/disease/transformation/gondola/virtual_domain

/datum/disease/transformation/gondola/virtual_domain
	stage_prob = 9
	new_form = /mob/living/basic/pet/gondola/virtual_domain
>>>>>>> tg-pr-88929
