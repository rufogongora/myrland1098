function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

    local test = getItemName(2160);
	player:say(test, TALKTYPE_MONSTER_SAY);

	return false
end
