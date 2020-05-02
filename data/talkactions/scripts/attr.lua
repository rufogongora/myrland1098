
local invalidIds = {
	1, 2, 3, 4, 5, 6, 7, 10, 11, 13, 14, 15, 19, 21, 26, 27, 28, 35, 43
}

function onSay(player, words, param)

    if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
    end
    
    local split = param:splitTrimmed(",")

    local itemType = ItemType(split[1])
    local attributeType = split[2]
    local valueType = split[3]
    local valueConst = ITEM_ATTRIBUTE_ACTIONID;

	if itemType:getId() == 0 then
		itemType = ItemType(tonumber(split[1]))
		if not tonumber(split[1]) or itemType:getId() == 0 then
			player:sendCancelMessage("There is no item with that id or name.")
			return false
		end
    end
    
    if attributeType == 'action' or attributeType == 'actionid' then
        valueConst = ITEM_ATTRIBUTE_ACTIONID;
    else
        player:sendCancelMessage("Invalid Attribute.")
        return false
    end

	if table.contains(invalidIds, itemType:getId()) then
		return false
    end
    
    local result = player:addItem(itemType:getId(), count)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    result:setAttribute(valueConst, valueType)

    return false;

end