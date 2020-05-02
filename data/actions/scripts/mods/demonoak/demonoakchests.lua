function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.uid == 12901 then
		queststatus = getPlayerStorageValue(cid, 12900)
		if queststatus < 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Demon Legs.")
			doPlayerAddItem(cid, 2495, 1)
			setPlayerStorageValue(cid, 12900, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
		end
	elseif item.uid == 12902 then
		queststatus = getPlayerStorageValue(cid, 12901)
		if queststatus < 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Necromancer Shield.")
			doPlayerAddItem(cid, 6433, 1)
			setPlayerStorageValue(cid, 12901, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
		end
	elseif item.uid == 12903 then
		queststatus = getPlayerStorageValue(cid, 12902)
		if queststatus < 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Spellbook of Dark Mysteries.")
			doPlayerAddItem(cid, 8918, 1)
			setPlayerStorageValue(cid, 12902, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
		end
	elseif item.uid == 12904 then
		queststatus = getPlayerStorageValue(cid, 12903)
		if queststatus < 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Royal Crossbow.")
			doPlayerAddItem(cid, 8851, 1)
			setPlayerStorageValue(cid, 12903, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
		end
	end
	return true
end