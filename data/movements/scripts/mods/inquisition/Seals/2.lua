function onStepIn(cid, item, pos, fromPosition)
newpos = {x=399, y=311, z=5}
seal1 = getPlayerStorageValue(cid,1601)


        if item.actionid == 1601 then
            if seal1 == 1 then
	    doTeleportThing(cid,newpos)
	    doCreatureSay(cid, "Entrando a Blood Halls ", TALKTYPE_ORANGE_1)
	
	else
		    doCreatureSay(cid, "Necesitas concluir el seal anterior ", TALKTYPE_ORANGE_1)	
doTeleportThing(cid, fromPosition)

end
end
end