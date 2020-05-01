function onStepIn(cid, item, pos, fromPosition)



if isPlayer(cid) then

if item.actionid == 12581 then

if(isSilverVip(getPlayerAccount(cid))) == false then

doCreatureSay(cid, "No tienes permiso para entrar a esta zona", TALKTYPE_ORANGE_1)


doTeleportThing(cid,fromPosition)


else

end

end

end

end