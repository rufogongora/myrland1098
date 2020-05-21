local decayItems = {
	[23496] = 23500, [23500] = 23496
}

local positions = {
    [23470] = { -- first boss
            ['topPos'] = {x = 1133, y = 787, z = 9},
            ['bottomPos'] = {x = 1158, y = 807, z = 9},
            ['leftLeverPos'] = {x = 1143, y = 800, z = 8},
            ['bossPos'] = {x = 1145, y = 795, z = 9},
            ['bossName'] = 'Plagirath',
            ['teleportToPosLeft'] = {x = 1141, y = 802, z = 9},
            ['numberOfPlayers'] = 1
        },
    [23471] = { -- Zamulosh
        ['topPos'] = {x = 1173, y = 782, z = 9},
        ['bottomPos'] = {x = 1192, y = 798, z = 9},
        ['leftLeverPos'] = {x = 1187, y = 793, z = 8},
        ['bossPos'] = {x = 1182, y = 789, z = 9},
        ['bossName'] = 'Zamulosh',
        ['teleportToPosLeft'] = {x = 1173, y = 797, z = 9},
        ['numberOfPlayers'] = 1
    },
    [23472] = { -- Mazoran
        ['topPos'] = {x = 1198, y = 780, z = 9},
        ['bottomPos'] = {x = 1222, y = 800, z = 9},
        ['leftLeverPos'] = {x = 1168, y = 865, z = 8},
        ['bossPos'] = {x = 1209, y = 790, z = 9},
        ['bossName'] = 'Mazoran',
        ['teleportToPosLeft'] = {x = 1203, y = 796, z = 9},
        ['numberOfPlayers'] = 1
    },
    [23473] = { -- Razzagorn
        ['topPos'] = {x = 1244, y = 774, z = 9},
        ['bottomPos'] = {x = 1274, y = 805, z = 9},
        ['leftLeverPos'] = {x = 1113, y = 928, z = 8},
        ['bossPos'] = {x = 1258, y = 788, z = 9},
        ['bossName'] = 'Razzagorn',
        ['teleportToPosLeft'] = {x = 1250, y = 804, z = 9},
        ['numberOfPlayers'] = 1
    },
    [23474] = { -- Ragiaz
        ['topPos'] = {x = 1141, y = 742, z = 9},
        ['bottomPos'] = {x = 1169, y = 762, z = 9},
        ['leftLeverPos'] = {x = 1139, y = 936, z = 8},
        ['bossPos'] = {x = 1154, y = 751, z = 9},
        ['bossName'] = 'Ragiaz',
        ['teleportToPosLeft'] = {x = 1147, y = 760, z = 9},
        ['numberOfPlayers'] = 1
    },
    [23475] = { -- Tarbaz
        ['topPos'] = {x = 1195, y = 749, z = 9},
        ['bottomPos'] = {x = 1222, y = 769, z = 9},
        ['leftLeverPos'] = {x = 1255, y = 807, z = 8},
        ['bossPos'] = {x = 1208, y = 759, z = 9},
        ['bossName'] = 'Tarbaz',
        ['teleportToPosLeft'] = {x = 1204, y = 767, z = 9},
        ['numberOfPlayers'] = 1
    },
    [23476] = { -- Shulgrax
        ['topPos'] = {x = 1240, y = 717, z = 9},
        ['bottomPos'] = {x = 1270, y = 737, z = 9},
        ['leftLeverPos'] = {x = 1172, y = 904, z = 8},
        ['bossPos'] = {x = 1255, y = 726, z = 9},
        ['bossName'] = 'Shulgrax',
        ['teleportToPosLeft'] = {x = 1262, y = 735, z = 9},
        ['numberOfPlayers'] = 1
    },
}
function onUse(player, item, frompos, item2, topos)
    local bossConfig = positions[item.actionid]

    --return lever to normal
    if (item.itemid == 23500) then
        item:transform(decayItems[item.itemid])
	    item:decay()
        return
    end

    local players = {};

    --check for griefers
    local playerPos = player:getPosition();
    local levPos = bossConfig['leftLeverPos'];
    if playerPos.x ~= levPos.x or playerPos.y ~= levPos.y then
        return
    end

    -- check if players are ready
    local leftLeverPos = bossConfig['leftLeverPos'];
    local x = leftLeverPos.x;
    local i = 1;
    while x ~= (leftLeverPos.x + bossConfig['numberOfPlayers']) do
        local char = Tile({x = x, y = leftLeverPos.y, z = leftLeverPos.z}):getTopCreature()
        if (char == nil or not char:isPlayer()) then
            player:say("You don't have enough players");
            return true;
        else
            players[i] = char
        end
        x = x+1;
        i = i+1;
    end

    -- check the room
    local topX = bossConfig['topPos'].x;
    local topZ = bossConfig['topPos'].z;
    local bottomX = bossConfig['bottomPos'].x;
    local bottomY = bossConfig['bottomPos'].y;

    while topX ~= bottomX do
        local topY = bossConfig['topPos'].y;
        while topY ~= bottomY do
            local tile = Tile({x = topX, y=topY, z = topZ});
            if (tile ~= nil) then
                local char = tile:getTopCreature()
                if (char ~= nil and char:isPlayer()) then
                    player:say('Someone is currently fighting the boss.')
                    return
                end
            end
            topY = topY+1;
        end
        topX = topX+1;
    end

    -- check if boss is there (that means previous team died or something)
    local target = Creature(bossConfig['bossName'])
    if target then
		target:remove()
    end

    -- summon the boss
    doSummonCreature(bossConfig['bossName'], bossConfig['bossPos'])

    --teleport the players
    local teleportToPos = bossConfig['teleportToPosLeft'];
    i = teleportToPos.x
    for k,v in ipairs(players) do
        local tpPos = {x=i, y=teleportToPos.y, z=teleportToPos.z};
        doTeleportThing(v.uid, tpPos)
        doSendMagicEffect(tpPos,11)
        i = i+1;
    end


    item:transform(decayItems[item.itemid])
	item:decay()
end