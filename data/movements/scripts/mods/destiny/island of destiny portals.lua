function onStepIn(cid, item, position, fromPosition)

local temple = getPlayerMasterPos(cid)
local sorc = {x="724", y="488", z="9"}
local kina = {x="724", y="488", z="11"}
local druid = {x="724", y="489", z="8"}
local pally = {x="724", y="488", z="10"}


	if item.actionid == 13001 then
		if getPlayerVocation(cid) == 4 then
		doTeleportThing(cid, kina)
	else
		doCreatureSay(cid, "Este portal es solo para Knights", TALKTYPE_ORANGE_1)
		doMoveCreature(cid, newdir)
		doSendMagicEffect(kina,10)
	end
	elseif item.actionid == 13002 then
		if getPlayerVocation(cid) == 3 then
		doTeleportThing(cid, pally)
		doSendMagicEffect(pally,10)
	else
		doCreatureSay(cid, "Este portal es solo para Paladines", TALKTYPE_ORANGE_1)
		doMoveCreature(cid, newdir)
	end
	elseif item.actionid == 13003 then
		if getPlayerVocation(cid) == 2 then
		doTeleportThing(cid, druid)
		doSendMagicEffect(druid, 10)
	else
		doCreatureSay(cid, "Este portal es solo para Druids", TALKTYPE_ORANGE_1)
		doMoveCreature(cid, newdir)
	end
	elseif item.actionid == 13004 then
		if getPlayerVocation(cid) == 1 then
		doTeleportThing(cid, sorc)
		doSendMagicEffect(sorc,10)
	else
		doCreatureSay(cid, "Este portal es solo para sorcerers", TALKTYPE_ORANGE_1)
		doMoveCreature(cid, newdir)
	end
	end
	return TRUE
end