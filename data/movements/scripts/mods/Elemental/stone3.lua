function onAddItem(moveitem, tileitem, position, cid)

local piedrapos = {x=754, y=1052, z=13, stackpos=1}
local piedra = getThingfromPos(piedrapos)
local piedraid = 1355

	if moveitem.itemid == 8933 then
		if piedra.itemid == piedraid then
				doRemoveItem(moveitem.uid, 1)
				doRemoveItem(piedra.uid,1)
				doSendMagicEffect(piedrapos,12)
			end
end
	return TRUE
end