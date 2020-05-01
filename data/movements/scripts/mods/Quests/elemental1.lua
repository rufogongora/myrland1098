function onStepIn(cid, item, position, fromPosition)
local out = {x="542", y="1153", z="11"}

	if item.actionid == 12330 then
		if getPlayerStorageValue(cid,12523) == 1 then
	doTeleportThing(cid,out)
	else	
	doCreatureSay(cid, "No has vencido al lord elemental", TALKTYPE_ORANGE_1)
	doTeleportThing(cid,fromPosition)
	end
end
end
