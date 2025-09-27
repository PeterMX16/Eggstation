/mob/living/Login()
	. = ..()
	if(!. || !client)
		return FALSE

	if(interview_safety(src, "client in living mob"))
		qdel(client)
		return FALSE

	//Mind updates
	sync_mind()

	update_damage_hud()
	update_health_hud()

	var/turf/T = get_turf(src)
	if (isturf(T))
		update_z(T.z)

	//Vents
	notify_ventcrawler_on_login()

	med_hud_set_status()

	update_fov_client()


	if(GLOB.sacrament_done)
		AddComponent(/datum/component/shadowlands)
