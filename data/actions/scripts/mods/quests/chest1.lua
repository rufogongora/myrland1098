function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 31745 then
   		queststatus = getPlayerStorageValue(cid,31747)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a key.")
   			local key = doPlayerAddItem(cid,2088,1)
			doSetItemActionId(key, 31747)
   			setPlayerStorageValue(cid,31747,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	elseif item.uid == 31746 then
   		queststatus = getPlayerStorageValue(cid,31748)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a key.")
   			local key = doPlayerAddItem(cid,2088,1)
			doSetItemActionId(key, 31748)
   			setPlayerStorageValue(cid,31748,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end