-- Annihilator script by Nicaw
-- [complete rewrite based on GriZzm0/Tworn script]

-- Configuration
local required_level = 150
local quest_id = 9444
local switch_uid = 1596
local switch_id1 = 1946
local switch_id2 = 1945
local allow_reentry = true

local player1_source = {x=640, y=982, z=8}
local player2_source = {x=639, y=982, z=8}
local player3_source = {x=638, y=982, z=8}
local player4_source = {x=637, y=982, z=8}

local player1_destination = {x=537, y=889, z=10}
local player2_destination = {x=537, y=888, z=10}
local player3_destination = {x=537, y=887, z=10}
local player4_destination = {x=537, y=886, z=10}

local demon1_position = {x=535, y=886, z=10}
local demon2_position = {x=535, y=888, z=10}
local demon3_position = {x=539, y=887, z=10}
local demon4_position = {x=539, y=889, z=10}
local demon5_position = {x=537, y=890, z=10}
local demon6_position = {x=537, y=891, z=10}

local chamber_start = {x=757, y=947, z=12}
local chamber_end = {x=764, y=953, z=12}
-- Don't look any further; you are done
function onUse(cid, item, frompos, item2, topos)
    if item.uid == switch_uid then
        if item.itemid == switch_id1 then
            local player1 = Tile(player1_source):getTopCreature()
		local player2 = Tile(player2_source):getTopCreature()
		local player3 = Tile(player3_source):getTopCreature()
		local player4 = Tile(player4_source):getTopCreature()

	   

		if (player1 and player1:isPlayer()) and (player2 and player2:isPlayer()) and (player3 and player3:isPlayer()) and (player4 and player4:isPlayer()) then
		
                if getPlayerLevel(player1.uid) >= required_level and getPlayerLevel(player2.uid) >= required_level and
                   getPlayerLevel(player3.uid) >= required_level and getPlayerLevel(player4.uid) >= required_level then
                   
                    if allow_reentry or 
                       getPlayerStorageValue(player1.uid,quest_id) <= 0 and getPlayerStorageValue(player2.uid,quest_id) <= 0 and
                       getPlayerStorageValue(player3.uid,quest_id) <= 0 and getPlayerStorageValue(player4.uid,quest_id) <= 0 then
                       
                        doSummonCreature("Guardian del infierno", demon1_position)
                        doSummonCreature("Guardian del infierno", demon2_position)
                        doSummonCreature("Guardian del infierno", demon3_position)
                        doSummonCreature("Guardian del infierno", demon4_position)
                        doSummonCreature("Guardian del infierno", demon5_position)
                        doSummonCreature("Guardian del infierno", demon6_position)
                        
                        doSendMagicEffect(player1_source,2)
                        doSendMagicEffect(player2_source,2)
                        doSendMagicEffect(player3_source,2)
                        doSendMagicEffect(player4_source,2)
                        
                        doTeleportThing(player1.uid,player1_destination)
                        doTeleportThing(player2.uid,player2_destination)
                        doTeleportThing(player3.uid,player3_destination)
                        doTeleportThing(player4.uid,player4_destination)
                        
                        doSendMagicEffect(player1_destination,10)
                        doSendMagicEffect(player2_destination,10)
                        doSendMagicEffect(player3_destination,10)
                        doSendMagicEffect(player4_destination,10)
                        
                        doTransformItem(item.uid,switch_id2)
                    else
                        doPlayerSendCancel(cid,"Someone has already done this quest.")
                    end
                else
                    doPlayerSendCancel(cid,"Someone's level is too low.")
                end
            else
                doPlayerSendCancel(cid,"You need 4 players in your team.")
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
            if item.uid == 9444 then
                doPlayerSendTextMessage(cid,22,"You have found a Underworld Smithammer.")
                doPlayerAddItem(cid,7423,1)
                setPlayerStorageValue(cid,quest_id,1)
            elseif item.uid == 9443 then
                doPlayerSendTextMessage(cid,22,"You have found a Ra Sword.")
                doPlayerAddItem(cid,7417,1)
                setPlayerStorageValue(cid,quest_id,1)
            elseif item.uid == 9442 then
                doPlayerSendTextMessage(cid,22,"You have found a Herald Axe.")
                doPlayerAddItem(cid,7454,1)
                setPlayerStorageValue(cid,quest_id,1)
            elseif item.uid == 9441 then
                doPlayerSendTextMessage(cid,22,"You have found a Dragon Scale Legs.")
                doPlayerAddItem(cid,2469,1)
                setPlayerStorageValue(cid,quest_id,1)
            end
        else
            doPlayerSendTextMessage(cid,22,"It is empty.")
        end
    end
return TRUE
end