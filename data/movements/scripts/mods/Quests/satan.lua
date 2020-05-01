function onStepIn(cid, item, position, fromPosition)
if getPlayerStorageValue(cid, 8333) == 1 then

local mage_dest = {x=1699, y=663, z=7}
local kina_dest = {x=1557, y=1030, z=7}


		if isSorcerer(cid) then
            doTeleportThing(cid,mage_dest)
		doSendMagicEffect(mage_dest,10)

		elseif isDruid(cid) then
            doTeleportThing(cid,mage_dest)
doSendMagicEffect(mage_dest,10)

		elseif isPaladin(cid) then
            doTeleportThing(cid,kina_dest)
doSendMagicEffect(kina_dest,10)

		elseif isKnight(cid) then
            doTeleportThing(cid,kina_dest)
doSendMagicEffect(kina_dest,10)

	end
	else
doCreatureSay(cid, "No has abierto las puertas del Infierno", TALKTYPE_ORANGE_1)
doTeleportThing(cid,fromPosition)

	end
	return TRUE
end
