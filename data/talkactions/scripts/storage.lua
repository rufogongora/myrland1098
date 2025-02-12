function onSay(cid, words, param)

	if not cid:getGroup():getAccess() then
		return true
	end

	local t = param:splitTrimmed(",")
	if(not t[2]) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid param specified.")
		return true
	end

	-- local tid = getPlayerByNameWildcard(t[1])
	local tid = Player(t[1])
	if(not tid or (isPlayerGhost(tid) and getPlayerGhostAccess(tid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
		return true
	end

	if(not t[3]) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, " [" .. t[1] .. " - " .. t[2] .. "] = " .. getPlayerStorageValue(tid, t[2]))
	else
		setPlayerStorageValue(tid, t[2], t[3])
	end

	return true
end
