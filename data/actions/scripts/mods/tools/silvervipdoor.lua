  function onUse(cid, item, fromPosition, itemEx, toPosition)



accountName = getPlayerAccount(cid)
        if(isSilverVip(accountName) or isGoldVip(accountName))then

if getCreaturePosition(cid).y < toPosition.y then
doTeleportThing(cid, {x=toPosition.x,y=toPosition.y+1,z=toPosition.z}, TRUE)
else
doTeleportThing(cid, {x=toPosition.x,y=toPosition.y-1,z=toPosition.z}, TRUE)
end

if(isSilverVip(accountName))then
doCreatureSay(cid, "Welcome Silver VIP Player!", TALKTYPE_ORANGE_1)
doSendMagicEffect(getCreaturePosition(cid), 10)
 
         else
            doCreatureSay(cid, "Welcome Gold VIP Player!", TALKTYPE_ORANGE_1)
            doSendMagicEffect(getCreaturePosition(cid), 10)
          end

         else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sorry, but only VIP Players can pass here. Buy VIP on the WEB.")
          end

return TRUE
end