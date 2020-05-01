function onStepIn(cid, item, pos, fromPosition)
newpos = {x=515, y=458, z=5}
seal1 = getPlayerStorageValue(cid,1604)


        if item.actionid == 1604 then
            if seal1 == 1 then
	    doTeleportThing(cid,newpos)
	    doCreatureSay(cid, "Entrando a The Hive ", TALKTYPE_ORANGE_1)
	
	else
		    doCreatureSay(cid, "Necesitas concluir el seal anterior ", TALKTYPE_ORANGE_1)
doTeleportThing(cid, fromPosition)	

end
end
end