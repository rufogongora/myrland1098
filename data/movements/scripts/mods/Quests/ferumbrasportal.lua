function onStepIn(player, item, position, fromPosition)
    local config = {
        firstPiece = 24830,
        lastPiece = 24836
    }

    local i = config.firstPiece;
    local questDone = true;
    while (i <= config.lastPiece) do
        if (player:getStorageValue(i) ~= 1) then
            questDone = false;
            break;
        end
        i = i+1;
    end

    if (questDone == false) then
        player:teleportTo(fromPosition)
        player:say("Your teleportation rod is not strong enough.")
        return;
    end

    player:teleportTo({x = 1245, y = 846, z = 9});
    doSendMagicEffect({x = 1245, y = 846, z = 9}, 11);
    doSendMagicEffect({x = 1245, y = 846, z = 9}, 73);
end