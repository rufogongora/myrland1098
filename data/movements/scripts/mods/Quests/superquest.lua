function onStepIn(cid, item, position, fromPosition)
local SCARAB_COIN_ID = 8870 -- change to scarab coin itemid
local basinPosition = {x = 694, y = 1118, z = 8} -- change to basins position
local newPosition = {x = 694, y = 1118, z = 9} -- new player position
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


