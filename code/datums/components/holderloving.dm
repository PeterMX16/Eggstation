/** Holder Loving Component
 *
 * When you drop an object onto a turf it gets moved back into its parent holder
 *
 * Prevents you from force moving the object into any other location that isn't its parent holder
 */
/datum/component/holderloving
	/** Item that parent is bound to.
	 * We try to keep parent either directly in holder, or in holder's loc if loc is a mob,
	 * and warp parent into holder if they go anywhere else.
	 */
	var/atom/holder

/datum/component/holderloving/Initialize(holder)
	if(!isitem(parent) || !holder)
		return COMPONENT_INCOMPATIBLE
	src.holder = holder

/datum/component/holderloving/RegisterWithParent()
<<<<<<< HEAD
	RegisterSignal(holder, COMSIG_MOVABLE_MOVED, PROC_REF(check_my_loc))
	RegisterSignal(holder, COMSIG_QDELETING, PROC_REF(holder_deleting))
	RegisterSignals(parent, list(
		COMSIG_ITEM_DROPPED,
		COMSIG_ITEM_EQUIPPED,
		COMSIG_ATOM_ENTERED,
		COMSIG_ATOM_EXITED,
		COMSIG_ITEM_STORED,
	), PROC_REF(check_my_loc))

/datum/component/holderloving/UnregisterFromParent()
	UnregisterSignal(holder, list(COMSIG_MOVABLE_MOVED, COMSIG_QDELETING))
	UnregisterSignal(parent, list(
		COMSIG_ITEM_DROPPED,
		COMSIG_ITEM_EQUIPPED,
		COMSIG_ATOM_ENTERED,
		COMSIG_ATOM_EXITED,
		COMSIG_ITEM_STORED,
	))

/datum/component/holderloving/PostTransfer()
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE

/datum/component/holderloving/InheritComponent(datum/component/holderloving/friend, i_am_original, list/arguments)
	if(i_am_original)
		holder = friend.holder

/datum/component/holderloving/proc/check_valid_loc(atom/location)
	return (location == holder || ( location == holder.loc && ismob(holder.loc) ))
=======
	RegisterSignal(holder, COMSIG_QDELETING, PROC_REF(holder_deleting))
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(check_my_loc))
	RegisterSignal(parent, COMSIG_ITEM_PRE_UNEQUIP, PROC_REF(can_be_moved))

/datum/component/holderloving/UnregisterFromParent()
	UnregisterSignal(holder, list(COMSIG_QDELETING))
	UnregisterSignal(parent, list(COMSIG_ITEM_DROPPED, COMSIG_ITEM_PRE_UNEQUIP))
>>>>>>> tg-pr-88929

/datum/component/holderloving/proc/holder_deleting(datum/source, force)
	SIGNAL_HANDLER

	qdel(parent)

/datum/component/holderloving/proc/is_valid_location(atom/location)
	SHOULD_BE_PURE(TRUE)

	if(location == holder || ( location == holder.loc && ismob(holder.loc)))
		return TRUE

	return FALSE

/datum/component/holderloving/proc/check_my_loc(datum/source)
	SIGNAL_HANDLER

	var/obj/item/item_parent = parent
	if(!is_valid_location(item_parent.loc))
		item_parent.forceMove(holder)

/datum/component/holderloving/proc/can_be_moved(obj/item/I, force, atom/newloc, no_move, invdrop, silent)
	SIGNAL_HANDLER

	//allow the item to be dropped on the turf so it can be later moved back into the holder as a convinience tool
	if(isturf(newloc) || is_valid_location(newloc))
		return NONE

	//prevent this item from being moved anywhere else
	return COMPONENT_ITEM_BLOCK_UNEQUIP
