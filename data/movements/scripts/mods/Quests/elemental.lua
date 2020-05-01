function onStepIn(cid, item, position, fromPosition)
local room = {x="582", y="1117", z="11"}
local out = {x="669", y="1021", z="10"}

	if item.actionid == 12329 then
		if 
		getPlayerStorageValue(cid,934152) == 1 and
		getPlayerStorageValue(cid,934153) == 1 and
		getPlayerStorageValue(cid,934154) == 1 and
		getPlayerStorageValue(cid,934155) == 1 then
		doTeleportThing(cid,room)
	elseif 		
	getPlayerStorageValue(cid,934152) == -1 or
		getPlayerStorageValue(cid,934153) == -1 or
		getPlayerStorageValue(cid,934154) == -1 or
		getPlayerStorageValue(cid,934155) == -1 then
	doTeleportThing(cid,out)		
	end
end
end
