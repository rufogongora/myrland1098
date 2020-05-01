local savingEvent = 0

local function ServerSave()
	if configManager.getBoolean(configKeys.SERVER_SAVE_CLEAN_MAP) then
		cleanMap()
	end

	if configManager.getBoolean(configKeys.SERVER_SAVE_CLOSE) then
		Game.setGameState(GAME_STATE_CLOSED)
	end

	if configManager.getBoolean(configKeys.SERVER_SAVE_SHUTDOWN) then
		Game.setGameState(GAME_STATE_SHUTDOWN)
	end
end


function onSay(cid, words, param, channel)
    if not cid:getGroup():getAccess() then
		return true
	end

	if(isNumber(param)) then
		stopEvent(savingEvent)
		save(tonumber(param) * 60 * 1000)
	else
		addEvent(ServerSave, 0)
	end
	return true
end

function save(delay)
	addEvent(ServerSave, 0)
	if(delay > 0) then
		savingEvent = addEvent(save, delay, delay)
	end
end
