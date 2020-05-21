local talk = TalkAction("/pos")

function talk.onSay(player, words, param)
	if player:getGroup():getAccess() and param ~= "" then
		local split = param:split(",")
		local x = split[1]:gsub("%D+", "")
		local y = split[2]:gsub("%D+", "")
		local z = split[3]:gsub("%D+", "")
		player:teleportTo(Position(x, y, z))
	else
		local position = player:getPosition()
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your current position is: " .. position.x .. ", " .. position.y .. ", " .. position.z .. ".")
	end
	return false
end

talk:separator(" ")
talk:register()
