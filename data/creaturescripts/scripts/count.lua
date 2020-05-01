--[[ Script by slawkens, modified by Zonet]]--

local monsters = {
        ["dragon"] = 9547,
        ["dragon lord"] = 9542,
        ["frost dragon"] = 9543,
        ["wyrm"] = 9544,
        ["cave rat"] = 3002,
        ["demon"] = 9545,
        ["rat"] = 9546,
        ["troll"] = 3003,
}

function onKill(cid, target)
        if(isPlayer(target) ~= true and isPlayer(cid)) then
                local name = getCreatureName(target)
                local monster = monsters[string.lower(name)]
                if(monster) then
                        local killedMonsters = getPlayerStorageValue(cid, monster)
                        if(killedMonsters < 0) then
                                killedMonsters = 1
                        end
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You killed " .. killedMonsters .. " " .. name .. "'s.")
                        setPlayerStorageValue(cid, monster, killedMonsters + 1)
                end
        end
        return true
end