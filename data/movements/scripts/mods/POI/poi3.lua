function onStepIn(cid, item, pos, fromPosition)
salida = {x=183, y=636, z=10}
yalahizo = getPlayerStorageValue(cid,15936)

    if isPlayer(cid) then
        if item.uid == 15936 then
            if yalahizo == -1 then
            setPlayerStorageValue(cid,15936,1)
	    doCreatureSay(cid, "Haz concluido este seal, puedes continuar.", TALKTYPE_ORANGE_1)	
	    doTeleportThing(cid,fromPosition)
 else
	if item.uid == 15936 then
          if yalahizo == 1 then
	    doTeleportThing(cid,salida)
	    doCreatureSay(cid, "Seal concluido.", TALKTYPE_ORANGE_1)

end
end
end
end
end
end