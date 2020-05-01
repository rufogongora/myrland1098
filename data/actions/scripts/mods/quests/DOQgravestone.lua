--- Made by Mazen ---

function onUse(cid, item, fromPosition, itemEx, toPosition)
    
        newnPosition  = {x=1069, y=1352, z=8} --- Reward Room Position ---

    if getPlayerStorageValue(cid,21545) >= 1 then
        doTeleportThing(cid,newnPosition)
        doSendMagicEffect(newnPosition,10)
    else

		doCreatureSay(cid,"No has hecho la quest", TALKTYPE_ORANGE_1)
        return FALSE
    end
    return TRUE
end