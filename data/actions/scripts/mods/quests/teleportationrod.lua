function onUse(player, item, frompos, target, topos)
    local config = {
        firstPiece = 24830,
        lastPiece = 24836
    }
    if (target.itemid >= config.firstPiece and target.itemid <= config.lastPiece) then
        if (player:getStorageValue(target.itemid) ~= 1) then
                player:say("You've gathered power from the relic")
                player:setStorageValue(target.itemid, 1)
                return true
            else
                player:say("You've already gathered power from this relic")
        end
        return false
    end
end