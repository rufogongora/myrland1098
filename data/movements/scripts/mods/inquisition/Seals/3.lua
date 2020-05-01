function onStepIn(cid, item, pos, fromPosition)
newpos = {x=315, y=366, z=6}
seal1 = getPlayerStorageValue(cid,1602)


        if item.actionid == 1602 then
            if seal1 == 1 then
	    doTeleportThing(cid,newpos)
	    doCreatureSay(cid, "Entrando a The Vats ", TALKTYPE_ORANGE_1)
	
	else
		    doCreatureSay(cid, "Necesitas concluir el seal anterior ", TALKTYPE_ORANGE_1)
doTeleportThing(cid, fromPosition)	

end
end
end