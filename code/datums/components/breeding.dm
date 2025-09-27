/*
 * A component to allow us to breed
 */
/datum/component/breed
	/// additional mobs we can breed with
	var/list/can_breed_with
<<<<<<< HEAD
	///path of the baby
	var/baby_path
=======
	///weighted list of the possible baby types
	var/list/baby_paths
>>>>>>> tg-pr-88929
	///time to wait after breeding
	var/breed_timer
	///AI key we set when we're ready to breed
	var/breed_key = BB_BREED_READY
	///are we ready to breed?
	var/ready_to_breed = TRUE
	///callback after we give birth to the child
	var/datum/callback/post_birth
<<<<<<< HEAD
	///callback that overrides the birth ending
	var/datum/callback/override_baby

/datum/component/breed/Initialize(list/can_breed_with = list(), breed_timer = 40 SECONDS, baby_path, post_birth, override_baby)
=======

/datum/component/breed/Initialize(list/can_breed_with = list(), breed_timer = 40 SECONDS, baby_paths = list(), post_birth)
>>>>>>> tg-pr-88929
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE

	if(ishuman(parent)) //sin detected
		return COMPONENT_INCOMPATIBLE

<<<<<<< HEAD
	if(!ispath(baby_path) && !override_baby)
		stack_trace("attempted to add a breeding component with invalid baby path!")
=======
	if(!length(baby_paths))
		stack_trace("attempted to add a breeding component with invalid baby paths!")
>>>>>>> tg-pr-88929
		return

	src.can_breed_with = can_breed_with
	src.breed_timer = breed_timer
<<<<<<< HEAD
	src.baby_path = baby_path
	src.post_birth = post_birth
	src.override_baby = override_baby
=======
	src.baby_paths = baby_paths
	src.post_birth = post_birth
>>>>>>> tg-pr-88929

	ADD_TRAIT(parent, TRAIT_SUBTREE_REQUIRED_OPERATIONAL_DATUM, type)

/datum/component/breed/RegisterWithParent()
	RegisterSignal(parent, COMSIG_HOSTILE_PRE_ATTACKINGTARGET, PROC_REF(breed_with_partner))
	ADD_TRAIT(parent, TRAIT_MOB_BREEDER, REF(src))
	var/mob/living/parent_mob = parent
	parent_mob.ai_controller?.set_blackboard_key(breed_key, TRUE)

/datum/component/breed/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_HOSTILE_PRE_ATTACKINGTARGET)
	REMOVE_TRAIT(parent, TRAIT_MOB_BREEDER, REF(src))
	post_birth = null


/datum/component/breed/proc/breed_with_partner(mob/living/source, mob/living/target)
	SIGNAL_HANDLER

<<<<<<< HEAD
	if(source.istate & ISTATE_HARM)
=======
	if(source.combat_mode)
>>>>>>> tg-pr-88929
		return

	if(!is_type_in_typecache(target, can_breed_with))
		return

	if(!HAS_TRAIT(target, TRAIT_MOB_BREEDER) || target.gender == source.gender)
		return

	if(!ready_to_breed)
		source.balloon_alert(source, "not ready!")
		return COMPONENT_HOSTILE_NO_ATTACK
<<<<<<< HEAD
	var/turf/delivery_destination = get_turf(source)
	if(override_baby)
		new /obj/effect/temp_visual/heart(delivery_destination)
		override_baby.Invoke()
		return COMPONENT_HOSTILE_NO_ATTACK

	var/mob/living/baby = new baby_path(delivery_destination)
=======

	var/turf/delivery_destination = get_turf(source)
	var/chosen_baby_path = pick_weight(baby_paths)
	var/atom/baby = new chosen_baby_path(delivery_destination)
>>>>>>> tg-pr-88929
	new /obj/effect/temp_visual/heart(delivery_destination)
	toggle_status(source)

	addtimer(CALLBACK(src, PROC_REF(toggle_status), source), breed_timer)
	post_birth?.Invoke(baby, target)
	return COMPONENT_HOSTILE_NO_ATTACK

/datum/component/breed/proc/toggle_status(mob/living/source)
	ready_to_breed = !ready_to_breed
	source.ai_controller?.set_blackboard_key(BB_BREED_READY, ready_to_breed)

