function onAddItem(moveitem, tileitem, position, cid)

local piedrapos = {x=682, y=1122, z=13, stackpos=1}
local piedra = getThingfromPos(piedrapos)
local piedraid = 1355

	if moveitem.itemid == 8965 then
		if piedra.itemid == piedraid then
				doRemoveItem(moveitem.uid, 1)
				doRemoveItem(piedra.uid,1)
				doSendMagicEffect(piedrapos,12)
			end
end
	return TRUE
end