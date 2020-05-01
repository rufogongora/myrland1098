function onStepIn(cid, item, position, fromPosition)
local SCARAB_COIN_ID = 2144 -- change to scarab coin itemid
local basinPosition = {x = 278, y = 738, z = 8} -- change to basins position
local newPosition = {x = 205, y = 703, z = 8} -- new player position
basinPosition.stackpos = 255
local thing = getThingfromPos(basinPosition)
if thing.itemid == SCARAB_COIN_ID then
doRemoveItem(thing.uid, 1)
doTeleportThing(cid, newPosition, TRUE)
doSendMagicEffect(newPosition,12)
else
doSendMagicEffect(position, CONST_ME_HITBYFIRE)
end
return TRUE
end


