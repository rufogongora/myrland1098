function onStepIn(cid, item, pos, fromPosition)
newpos = {x=70, y=404, z=10}
seal1 = getPlayerStorageValue(cid,15934)
seal2 = getPlayerStorageValue(cid,15935)
seal3 = getPlayerStorageValue(cid,15936)
seal4 = getPlayerStorageValue(cid,15937)
seal5 = getPlayerStorageValue(cid,15938)
seal6 = getPlayerStorageValue(cid,15939)

        if item.uid == 15940 then
            if seal1 == 1 and seal2 == 1 and seal3 == 1 and seal4 == 1 and seal5 == 1 and seal6 == 1 then
            setPlayerStorageValue(cid,15934,1)
	    doCreatureSay(cid, "Haz concluido este seal, puedes continuar", TALKTYPE_ORANGE_1)	
	    doTeleportThing(cid,newpos)

	else 
if seal1 == -1 then
doTeleportThing(cid,fromPosition)
doCreatureSay(cid, "No has concluido el Seal of poison.", TALKTYPE_ORANGE_1)

	else 
if seal2 == -1 then
doTeleportThing(cid,fromPosition)
doCreatureSay(cid, "No has concluido el Seal of Fire.", TALKTYPE_ORANGE_1)

	else 
if seal3 == -1 then
doTeleportThing(cid,fromPosition)
doCreatureSay(cid, "No has concluido el Lost Souls.", TALKTYPE_ORANGE_1)

	else 
if seal4 == -1 then
doTeleportThing(cid,fromPosition)
doCreatureSay(cid, "No has concluido el Seal of Destruction.", TALKTYPE_ORANGE_1)

	else 
if seal5 == -1 then
doTeleportThing(cid,fromPosition)
doCreatureSay(cid, "No has concluido el Seal of Skeletons.", TALKTYPE_ORANGE_1)

	else 
if seal6 == -1 then
doTeleportThing(cid,fromPosition)
doCreatureSay(cid, "No has concluido el Divine Seal.", TALKTYPE_ORANGE_1)

end
end
end
end
end
end
end
end

end