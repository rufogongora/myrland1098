local holes = {7507, 7506, 7504, 7505}
local storage = 934152
local newitem = 8304
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(holes, itemEx.itemid) == TRUE then
		if getPlayerStorageValue(cid,storage) == -1 then
		doTransformItem(item.uid, newitem)
		doCreatureSay(cid, "Has absorbido el espiritu de fuego", TALKTYPE_ORANGE_1)
		setPlayerStorageValue(cid,storage,1) 
	else
		doCreatureSay(cid, "El espiritu de fuego ya a sido absorbido por ti", TALKTYPE_ORANGE_1)
	
	end
	return TRUE
end
end