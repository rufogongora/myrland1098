local holes = {7510, 7508, 7511, 7509}
local storage = 934154
local newitem = 8300
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(holes, itemEx.itemid) == TRUE then
		if getPlayerStorageValue(cid,storage) == -1 then
		doTransformItem(item.uid, newitem)
		doCreatureSay(cid, "Has absorbido el espiritu de hielo", TALKTYPE_ORANGE_1)
		setPlayerStorageValue(cid,storage,1) 
	else
		doCreatureSay(cid, "El espiritu de hielo ya ha sido absorbido por ti", TALKTYPE_ORANGE_1)
	
	end
	return TRUE
end
end