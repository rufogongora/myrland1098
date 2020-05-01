function onStepIn(cid, item, pos, fromPosition)
local seal = 1602


	if getPlayerStorageValue(cid,seal) == -1 then
	 setPlayerStorageValue(cid,seal,1)
end

end