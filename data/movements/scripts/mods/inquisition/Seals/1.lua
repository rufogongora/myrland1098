function onStepIn(cid, item, pos, fromPosition)
newpos = {x=443, y=298, z=5}
seal1 = getPlayerStorageValue(cid,1600)


        if item.actionid == 1600 then
            if seal1 == 1 then
	    doTeleportThing(cid,newpos)
	    doCreatureSay(cid, "Entrando a Crystal Caves ", TALKTYPE_ORANGE_1)
	
	else
		    doCreatureSay(cid, "Necesitas concluir el seal anterior ", TALKTYPE_ORANGE_1)	
		doTeleportThing(cid, fromPosition)

end
end
end