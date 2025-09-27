/// Logging for tool usage
<<<<<<< HEAD
/proc/log_tool(text, mob/initiator)
	logger.Log(LOG_CATEGORY_TOOL, text, initiator ? list("initiator" = initiator) : null)
=======
/proc/log_tool(text)
	logger.Log(LOG_CATEGORY_TOOL, text)
>>>>>>> tg-pr-88929
