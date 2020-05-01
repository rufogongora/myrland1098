local waittime = 30 --Default (30 seconds)
local storage = 5560

function onSay(cid, words, param, channel)
			doPlayerSave(cid)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have successfully saved your character.")

	return true
end