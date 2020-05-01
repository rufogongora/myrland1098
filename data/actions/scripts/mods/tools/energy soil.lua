local holes = {7514, 7512, 7513, 7515}
local storage = 934153
local newitem = 8306
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(holes, itemEx.itemid) == TRUE then
		if getPlayerStorageValue(cid,storage) == -1 then
		doTransformItem(item.uid, newitem)
		doCreatureSay(cid, "Has absorbido el espiritu de energia", TALKTYPE_ORANGE_1)
		setPlayerStorageValue(cid,storage,1) 
	else
		doCreatureSay(cid, "El espiritu de energia ya ha sido absorbido por ti", TALKTYPE_ORANGE_1)
	
	end
	return TRUE
end
end