-- Annihilator script by Nicaw-- [complete rewrite based on GriZzm0/Tworn script]

-- Configuration
local required_level = 100
local quest_id = 19523
local switch_uid = 13225
local switch_id1 = 1946
local switch_id2 = 1945
local allow_reentry = false

local player1_source = {x=580, y=499, z=9}
local player2_source = {x=588, y=490, z=9}
local player3_source = {x=588, y=483, z=9}
local player4_source = {x=610, y=490, z=9}
local player5_source = {x=610, y=483, z=9}
local player6_source = {x=596, y=508, z=9}
local player7_source = {x=602, y=508, z=9}
local player8_source = {x=594, y=515, z=9}
local player9_source = {x=599, y=515, z=9}
local player10_source = {x=604, y=515, z=9}


local player1_destination = {x=599, y=514, z=10}
local player2_destination = {x=625, y=515, z=10}
local player3_destination = {x=654, y=516, z=10}
local player4_destination = {x=654, y=495, z=10}
local player5_destination = {x=625, y=495, z=10}
local player6_destination = {x=598, y=495, z=10}
local player7_destination = {x=596, y=474, z=10}
local player8_destination = {x=596, y=453, z=10}
local player9_destination = {x=625, y=474, z=10}
local player10_destination = {x=654, y=474, z=10}


local chamber_start = {x=590, y=507, z=10}
local chamber_end = {x=591, y=508, z=10}
-- Don't look any further; you are done
function onUse(cid, item, frompos, item2, topos)
    if item.uid == switch_uid then
        if item.itemid == switch_id1 then
            local player1 = getTopCreature(player1_source)
            local player2 = getTopCreature(player2_source)
            local player3 = getTopCreature(player3_source)
            local player4 = getTopCreature(player4_source)
            local player5 = getTopCreature(player5_source)
            local player6 = getTopCreature(player6_source)
            local player7 = getTopCreature(player7_source)
            local player8 = getTopCreature(player8_source)
            local player9 = getTopCreature(player9_source)
            local player10 = getTopCreature(player10_source)
            
            
            if isPlayer(player1.uid) == TRUE and isPlayer(player2.uid) == TRUE and isPlayer(player3.uid) == TRUE and isPlayer(player4.uid) == TRUE then
            
                if getPlayerLevel(player1.uid) >= required_level and getPlayerLevel(player2.uid) >= required_level and
                   getPlayerLevel(player3.uid) >= required_level and getPlayerLevel(player4.uid) >= required_level and
                   getPlayerLevel(player5.uid) >= required_level and getPlayerLevel(player6.uid) >= required_level and
                   getPlayerLevel(player7.uid) >= required_level and getPlayerLevel(player8.uid) >= required_level and
                   getPlayerLevel(player9.uid) >= required_level and getPlayerLevel(player10.uid) >= required_level  then
                   
                    if allow_reentry or 
                       getPlayerStorageValue(player1.uid,quest_id) <= 0 and getPlayerStorageValue(player2.uid,quest_id) <= 0 and
                       getPlayerStorageValue(player3.uid,quest_id) <= 0 and getPlayerStorageValue(player4.uid,quest_id) <= 0  and
                       getPlayerStorageValue(player5.uid,quest_id) <= 0 and getPlayerStorageValue(player6.uid,quest_id) <= 0 and
                       getPlayerStorageValue(player7.uid,quest_id) <= 0 and getPlayerStorageValue(player8.uid,quest_id) <= 0 and
                       getPlayerStorageValue(player9.uid,quest_id) <= 0 and getPlayerStorageValue(player10.uid,quest_id) <= 0 then
                       
            
                        doSendMagicEffect(player1_source,2)
                        doSendMagicEffect(player2_source,2)
                        doSendMagicEffect(player3_source,2)
                        doSendMagicEffect(player4_source,2)
                        doSendMagicEffect(player5_source,2)
                        doSendMagicEffect(player6_source,2)
                        doSendMagicEffect(player7_source,2)
                        doSendMagicEffect(player8_source,2)
                        doSendMagicEffect(player9_source,2)
                        doSendMagicEffect(player10_source,2)
                        
                        doTeleportThing(player1.uid,player1_destination)
                        doTeleportThing(player2.uid,player2_destination)
                        doTeleportThing(player3.uid,player3_destination)
                        doTeleportThing(player4.uid,player4_destination)
                        doTeleportThing(player5.uid,player5_destination)
                        doTeleportThing(player6.uid,player6_destination)
                        doTeleportThing(player7.uid,player7_destination)
                        doTeleportThing(player8.uid,player8_destination)
                        doTeleportThing(player9.uid,player9_destination)
                        doTeleportThing(player10.uid,player10_destination)
                        
                        doSendMagicEffect(player1_destination,10)
                        doSendMagicEffect(player2_destination,10)
                        doSendMagicEffect(player3_destination,10)
                        doSendMagicEffect(player4_destination,10)
                        doSendMagicEffect(player5_destination,10)
                        doSendMagicEffect(player6_destination,10)
                        doSendMagicEffect(player7_destination,10)
                        doSendMagicEffect(player8_destination,10)
                        doSendMagicEffect(player9_destination,10)
                        doSendMagicEffect(player10_destination,10)
                 
                        
                        doTransformItem(item.uid,switch_id2)
                    else
                        doPlayerSendCancel(cid,"Someone has already done this quest.")
                    end
                else
                    doPlayerSendCancel(cid,"Someone's level is too low.")
                end
            else
                doPlayerSendCancel(cid,"You need 10 players in your team.")
            end
        elseif item.itemid == switch_id2 then
            local monsters = {}
            local monsters_total = 0
            local pos = {x = chamber_start.x, y = chamber_start.y, z=chamber_start.z}
            local player_exists = false
            while pos.y <= chamber_end.y and not player_exists do
                pos.x = chamber_start.x
                while pos.x <= chamber_end.x and not player_exists do
                    local creature = getTopCreature(pos)
                    if isPlayer(creature.uid) == TRUE then
                        player_exists = true
                    elseif isCreature(creature.uid) == TRUE then
                        monsters[monsters_total] = creature.uid
                        monsters_total = monsters_total + 1
                    end
                    pos.x = pos.x + 1
                end
                pos.y = pos.y + 1
            end
            if player_exists then
                doPlayerSendCancel(cid,"Please wait until the room is clear.")
            else
                local i = 0
                while i < monsters_total do
                    doRemoveCreature(monsters[i])
                    i = i + 1
                end
                doTransformItem(item.uid,switch_id1)
            end
        end
    else
        local status = getPlayerStorageValue(cid, quest_id)
        if status <= 0 then
            if item.uid == 19525 then
                doPlayerSendTextMessage(cid,22,"You have found a Blessed Shield.")
                doPlayerAddItem(cid,2523,1)
                setPlayerStorageValue(cid,quest_id,1)
            elseif item.uid == 19526 then
                doPlayerSendTextMessage(cid,22,"You have found a magic sword.")
                doPlayerAddItem(cid,2400,1)
                setPlayerStorageValue(cid,quest_id,1)
            elseif item.uid == 19527 then
                doPlayerSendTextMessage(cid,22,"You have found a stonecutter axe.")
                doPlayerAddItem(cid,2431,1)
                setPlayerStorageValue(cid,quest_id,1)
            elseif item.uid == 19528 then
                doPlayerSendTextMessage(cid,22,"You have found a present.")
                doPlayerAddItem(cid,2326,1)
                setPlayerStorageValue(cid,quest_id,1)
            end
        else
            doPlayerSendTextMessage(cid,22,"It is empty.")
        end
    end
return TRUE
end