function onUse(cid, item, frompos, item2, topos) 
    if(item.itemid == 1945 or item.itemid == 1946) then 
        match = football_positions_uids[item.actionid-23300] 
        if(getGlobalStorageValue(match[1]) < 1) then 
            fromPoss = {match[4], match[5]} 
            toPoss = {match[6], match[7]} 
            players_number = 0 
            for i = 1, 2 do 
                teamPoss = fromPoss[i] 
                for p = 1, #teamPoss do 
                    if(isPlayer(getTopCreature(getThingPos(teamPoss[p])).uid) == TRUE) then 
                        players_number = players_number + 1 
                    end 
                end 
            end 
            if(players_number ~= #fromPoss[1] + #fromPoss[2]) then 
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, #fromPoss[1] + #fromPoss[2] .. " players needed. Only " .. players_number .. " on start positions.") 
                return false 
            end 
            setGlobalStorageValue(match[1], os.time() + match[11] * 60) 
            ballPos = getThingPos(match[2]) 
            doTeleportThing(footballGetBall(getThingPos(match[2]), match[13]), ballPos, TRUE) 
            addEvent(doSendAnimatedText, 4000, ballPos, "0!", TEXTCOLOR_TEAL) 
            addEvent(doSendAnimatedText, 3000, ballPos, "1", TEXTCOLOR_TEAL) 
            addEvent(doSendAnimatedText, 2000, ballPos, "2", TEXTCOLOR_TEAL) 
            addEvent(doSendAnimatedText, 1000, ballPos, "3", TEXTCOLOR_TEAL) 
            teamOutfit = {} 
            for i = 1, 2 do 
                teamFromPoss = fromPoss[i] 
                teamToPoss = toPoss[i] 
                teamOutfit[i] = getCreatureOutfit(getTopCreature(getThingPos(teamFromPoss[1])).uid) 
                for p = 1, #teamFromPoss do 
                    player = getTopCreature(getThingPos(teamFromPoss[p])).uid 
                    setGlobalStorageValue(teamToPoss[p], player) 
                    doCreatureSetNoMove(player, 1) 
                    addEvent(doCreatureSetNoMove, 4000, player, 0) 
                    outfit = getCreatureOutfit(player) 
                    outfit.lookHead = teamOutfit[i].lookHead 
                    outfit.lookBody = teamOutfit[i].lookBody 
                    outfit.lookLegs = teamOutfit[i].lookLegs 
                    outfit.lookFeet = teamOutfit[i].lookFeet 
                    doSetCreatureOutfit(player, outfit, match[11] * 60 * 1000 + 2500) 
                    doTeleportThing(player, getThingPos(teamToPoss[p]), TRUE) 
                    doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_ORANGE, "Match start. You are in Team " .. i .. " on field " .. item.actionid-23300 .. ". You have " .. match[11] .. " minutes.") 
                end 
            end 
        else 
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Football field in use. Please wait.") 
            return false 
        end 
        return true 
    end 
    return false 
end 