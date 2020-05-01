function onUse(cid, item, pos)
name = getPlayerName(cid)
llavepos = {x=1193, y=1266, z=6, stackpos=1}

	if isPlayer(cid) then
	if item.uid == 15004 then
		llave = getPlayerStorageValue(cid,15009)
		if llave == -1 then
		lallave = doPlayerAddItem(cid,2089,1)
		doSetItemActionId(lallave, 5925)
		setPlayerStorageValue(cid,15009,1)
	doCreatureSay(cid, "Has encontrado una llave", TALKTYPE_ORANGE_1)
		else
			doPlayerSendCancel(cid,"Theres nothing here.")
		end
		end
	end
end