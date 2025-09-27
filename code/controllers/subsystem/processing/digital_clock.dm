/// The subsystem used to tick digital clocks
PROCESSING_SUBSYSTEM_DEF(digital_clock)
<<<<<<< HEAD
	name = "Digital Clock Processing"
	flags = SS_NO_INIT | SS_BACKGROUND | SS_KEEP_TIMING | SS_HIBERNATE
	wait = 1 SECONDS
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
=======
	name = "Digital Clocks"
	flags = SS_NO_INIT|SS_BACKGROUND|SS_KEEP_TIMING
	wait = 1 SECONDS
>>>>>>> tg-pr-88929
