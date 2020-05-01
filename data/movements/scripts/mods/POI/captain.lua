function onStepIn(cid, item, pos, fromPosition)
yalahizo = getPlayerStorageValue(cid,13588)

    if isPlayer(cid) then
        if item.actionid == 13588 then
            if yalahizo == -1 then
	    doCreatureSay(cid, "Solo el capitan de un equipo se puede parar aqui.", TALKTYPE_ORANGE_1)	
	    doTeleportThing(cid,fromPosition)
end
end
end