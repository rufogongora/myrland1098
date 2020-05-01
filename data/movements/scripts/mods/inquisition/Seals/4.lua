function onStepIn(cid, item, pos, fromPosition)
newpos = {x=464, y=383, z=6}
seal1 = getPlayerStorageValue(cid,1603)


        if item.actionid == 1603 then
            if seal1 == 1 then
	    doTeleportThing(cid,newpos)
	    doCreatureSay(cid, "Entrando a The Arcanum ", TALKTYPE_ORANGE_1)
	
	else
		    doCreatureSay(cid, "Necesitas concluir el seal anterior ", TALKTYPE_ORANGE_1)	
doTeleportThing(cid, fromPosition)

end
end
end