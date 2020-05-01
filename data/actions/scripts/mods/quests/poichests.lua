-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 15000 then
   		queststatus = getPlayerStorageValue(cid,8333)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Myrland Basher.")
   			doPlayerAddItem(cid,7422,1)
   			setPlayerStorageValue(cid,8333,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 15001 then
   		queststatus = getPlayerStorageValue(cid,8333)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Myrland Slayer.")
   			doPlayerAddItem(cid,7420,1)
   			setPlayerStorageValue(cid,8333,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 15002 then
   		queststatus = getPlayerStorageValue(cid,8333)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found an Arbalest.")
   			doPlayerAddItem(cid,5803,1)
   			setPlayerStorageValue(cid,8333,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end
