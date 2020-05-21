function onUse(player, item, frompos, item2, topos)
    local config = FERUMBRAS_QUEST_CONFIG

    local players = {}
    local topX = config['topPlayerPos'].x;
    local topZ = config['topPlayerPos'].z;
    local bottomX = config['bottomPlayerPos'].x;
    local bottomY = config['bottomPlayerPos'].y;

    -- get the list of players to tp
    local i = 0;
    while topX ~= bottomX do
        local topY = config['topPlayerPos'].y;
        while topY ~= bottomY do
            local char = Tile({x = topX, y=topY, z = topZ}):getTopCreature()
            if (char and char:isPlayer()) then
                players[i] = char;
                i = i+1;
            end
            topY = topY+1;
        end
        topX = topX+1;
    end

    -- check area to see if people are there
    topX = config['topRoomPos'].x;
    topZ = config['topRoomPos'].z;
    bottomX = config['bottomRoomPos'].x;
    bottomY = config['bottomRoomPos'].y;
    while topX ~= bottomX do
        local topY = config['topRoomPos'].y;
        while topY ~= bottomY do
            local char = Tile({x = topX, y=topY, z = topZ}):getTopCreature()
            local anItem = getThingfromPos({x = topX, y=topY, z = topZ, stackpos = 1})
            if (char and char:isPlayer()) then
                player:say("People are still fighting the mage.")
                return false;
            end
            if (anItem.itemid == 17586) then
                doTransformItem(anItem.uid, 17580)
            end
            topY = topY+1;
        end
        topX = topX+1;
    end

    ResetFerumbrasQuest()
    -- summon the boss
    doSummonCreature(config['bossName'], config['bossPos'])
  


    for k,p in pairs(players) do
        doTeleportThing(p.uid, config.teleportTo)
    end
    doSendMagicEffect(config.teleportTo, 11)
    
    return false;
end