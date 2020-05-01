function onStepIn(cid, item, position, fromPosition)
if getPlayerGroupId(cid) < 4 and getPlayerStorageValue(cid, 40045) == -1 then

local druid_dest = {x=726, y=487, z=8}
local sorc_dest = {x=726, y=487, z=9}
local pally_dest = {x=726, y=487, z=10}
local knight_dest = {x=724, y=487, z=11}

		if isSorcerer(cid) then
            doTeleportThing(cid,sorc_dest)
		doSendMagicEffect(sorc_dest,10)
		setPlayerStorageValue(cid, 40045, 1)

		elseif isDruid(cid) then
            doTeleportThing(cid,druid_dest)
doSendMagicEffect(druid_dest,10)
		setPlayerStorageValue(cid, 40045, 1)


		elseif isPaladin(cid) then
            doTeleportThing(cid,pally_dest)
doSendMagicEffect(pally_dest,10)
		setPlayerStorageValue(cid, 40045, 1)

		elseif isKnight(cid) then
            doTeleportThing(cid,knight_dest)
doSendMagicEffect(knight_dest,10)
		setPlayerStorageValue(cid, 40045, 1)
	end
	end
	return TRUE
end
