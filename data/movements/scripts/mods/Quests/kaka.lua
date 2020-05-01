function onStepIn(cid, item, pos, fromPosition)



if isPlayer(cid) then

if item.actionid == 1256 then

vip = getPlayerStorageValue(cid,1256)
if vip == -1 then
doCreatureSay(cid, "No tienes permiso para entrar a kakariko village", TALKTYPE_ORANGE_1)


doTeleportThing(cid,fromPosition)


else

end

end

end

end