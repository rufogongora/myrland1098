function onAddItem(moveitem, tileitem, position, cid)

local dracolapos = {x=491, y=1168, z=7}
local globalstorage = getGlobalStorageValue(54697)
local demonbone = 2136

	if moveitem.itemid == demonbone then
		if globalstorage == -1 then
			doRemoveItem(moveitem.uid, 1)
				doSummonCreature("dracola", dracolapos)
				doSendMagicEffect(dracolapos,12)
				setGlobalStorageValue(54697, 1)
			end
end
	return TRUE
end