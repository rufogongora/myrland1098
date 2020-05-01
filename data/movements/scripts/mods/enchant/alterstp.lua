function onStepIn(cid, item, pos)

local ice = {x=878, y=347, z=7}
local fire = {x=787, y=906, z=12}
local energy = {x=1021, y=761, z=8}
local earth = {x=881, y=994, z=10}

if getPlayerLookDir(cid) == 0 then
newdir = 2
elseif getPlayerLookDir(cid) == 1 then
newdir = 3
elseif getPlayerLookDir(cid) == 2 then
newdir = 0
else
newdir = 1
end

if item.actionid == 7801 then
if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
doTeleportThing(cid,ice)
doSendMagicEffect(ice,10)
else
doCreatureSay(cid, "Only Premium Druids of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7802 then
if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
doTeleportThing(cid,earth)
doSendMagicEffect(earth,10)
else
doCreatureSay(cid, "Only Premium Druids of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7803 then
if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
doTeleportThing(cid,fire)
doSendMagicEffect(fire,10)
else
doCreatureSay(cid, "Only Premium Sorcerers of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
doMoveCreature(cid, newdir)
end
elseif item.actionid == 7804 then
if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
doTeleportThing(cid,energy)
doSendMagicEffect(energy,10)
else
doCreatureSay(cid, "Only Premium Sorcerers of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
doMoveCreature(cid, newdir)
end
end
end