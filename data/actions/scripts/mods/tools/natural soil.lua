local holes = {7518, 7519, 7517, 7516}
local storage = 934155
local newitem = 8305
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(holes, itemEx.itemid) == TRUE then
		if getPlayerStorageValue(cid,storage) == -1 then
		doTransformItem(item.uid, newitem)
		doCreatureSay(cid, "Has absorbido el espiritu de tierra", TALKTYPE_ORANGE_1)
		setPlayerStorageValue(cid,storage,1) 
	else
		doCreatureSay(cid, "El espiritu de tierra ya ha sido absorbido por ti", TALKTYPE_ORANGE_1)
	
	end
	return TRUE
end
end