function onAddItem(moveitem, tileitem, position, cid)

local piedrapos = {x=718, y=1000, z=13, stackpos=1}
local piedra = getThingfromPos(piedrapos)
local piedraid = 1355

	if moveitem.itemid == 8966 then
		if piedra.itemid == piedraid then
				doRemoveItem(moveitem.uid, 1)
				doRemoveItem(piedra.uid,1)
				doSendMagicEffect(piedrapos,12)
			end
end
	return TRUE
end