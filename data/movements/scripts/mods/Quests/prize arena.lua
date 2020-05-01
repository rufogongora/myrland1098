

-- All credits to: Dark Mauri..

function onStepIn(cid, item, pos)
name = getPlayerName(cid)
prizegold = {x=634, y=177, z=7, stackpos=1}
prizesilver = {x=634, y=184, z=7, stackpos=1}
prizebronce = {x=634, y=191, z=7, stackpos=1}

    if isPlayer(cid) then
        if item.uid == 26782 then
            bronzetrophy = getPlayerStorageValue(cid,26782)
            if bronzetrophy == -1 then
            firsttrophy = doCreateItem(7371,1,prizebronce)
            doSetItemSpecialDescription(firsttrophy, "The Bronze Trophy of the greenhorn arena mode, "..name.." has been done.")
            setPlayerStorageValue(cid,26782,1)
            doSendMagicEffect(prizebronce,11)
            else
            doPlayerSendCancel(cid,"You already have this trophy.")
            end
         
        elseif item.uid == 26781 then
            silvertrophy = getPlayerStorageValue(cid,26781)
            if silvertrophy == -1 then
            secondtrophy = doCreateItem(7370,1,prizesilver)
            doSetItemSpecialDescription(secondtrophy, "The Silver Trophy of the scraper arena mode, "..name.." has been done.")
            setPlayerStorageValue(cid,26781,1)
            doSendMagicEffect(prizesilver,11)
            else
            doPlayerSendCancel(cid,"You already have this trophy.")
            end

        elseif item.uid == 26780 then
            goldentrophy = getPlayerStorageValue(cid,26780)
            if goldentrophy == -1 then
            thirdtrophy = doCreateItem(7369,1,prizegold)
            doSetItemSpecialDescription(thirdtrophy, "The Golden Trophy of the warlord arena mode, "..name.." has been done.")
            setPlayerStorageValue(cid,26780,1)
            doSendMagicEffect(prizegold,11)
            else
            doPlayerSendCancel(cid,"You already have this trophy.")
            end

        end

    end
end