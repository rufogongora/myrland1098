local addons = { 
    { storage = 10001, outfit1 = 128, addon1 = 1, outfit2 = 136, addon2 = 1  }, -- first citizen
    { storage = 10002, outfit1 = 128, addon1 = 2, outfit2 = 136, addon2 = 2  }, -- second citizen
    { storage = 40001, outfit1 = 141, addon1 = 2, outfit2 = 130, addon2 = 1  }, -- first mage
    { storage = 40002, outfit1 = 142, addon1 = 2, outfit2 = 130, addon2 = 2 }, --second mage
    { storage = 50001, outfit1 = 133, addon1 = 1, outfit2 = 141, addon2 = 1 }, --first summoner
    { storage = 50002, outfit1 = 133, addon1 = 2, outfit2 = 141, addon2 = 2 }, --second summoner
    { storage = 60001, outfit1 = 143, addon1 = 2, outfit2 = 147, addon2 = 2 }, --first barbarian
    { storage = 60001, outfit1 = 143, addon1 = 1, outfit2 = 147, addon2 = 1 }, --second barbarian
    { storage = 70001, outfit1 = 144, addon1 = 1, outfit2 = 148, addon2 = 1 }, --first druid
    { storage = 70002, outfit1 = 144, addon1 = 2, outfit2 = 148, addon2 = 2 }, --second druid
    { storage = 80001, outfit1 = 132, addon1 = 1, outfit2 = 140, addon2 = 1 }, --first nobleman
    { storage = 90001, outfit1 = 146, addon1 = 1, outfit2 = 150, addon2 = 1 }, --first oriental
    { storage = 90002, outfit1 = 146, addon1 = 2, outfit2 = 150, addon2 = 2 }, --second oriental
    { storage = 100001, outfit1 = 134, addon1 = 1, outfit2 = 142, addon2 = 1 }, --first warrior
    { storage = 100002, outfit1 = 134, addon1 = 2, outfit2 = 142, addon2 = 2 }, --second warrior
    { storage = 110001, outfit1 = 145, addon1 = 2, outfit2 = 149, addon2 = 2 }, --first wizard
    { storage = 110002, outfit1 = 145, addon1 = 1, outfit2 = 149, addon2 = 1 }, --second wizard
    { storage = 120001, outfit1 = 152, addon1 = 1, outfit2 = 156, addon2 = 1 }, --first assassin
    { storage = 120002, outfit1 = 152, addon1 = 2, outfit2 = 156, addon2 = 2 }, --second assassin
    { storage = 130001, outfit1 = 153, addon1 = 1, outfit2 = 157, addon2 = 1 }, --first beggar
    { storage = 140001, outfit1 = 151, addon1 = 1, outfit2 = 155, addon2 = 1 }, --first pirate
    { storage = 140002, outfit1 = 151, addon1 = 2, outfit2 = 155, addon2 = 2 }, --second pirate
    { storage = 150001, outfit1 = 154, addon1 = 2, outfit2 = 158, addon2 = 2 }, --first shaman
    { storage = 150002, outfit1 = 154, addon1 = 2, outfit2 = 158, addon2 = 2 }, --second shaman
    { storage = 160001, outfit1 = 252, addon1 = 1, outfit2 = 251, addon2 = 1 }, --first norseman
    { storage = 160002, outfit1 = 252, addon1 = 2, outfit2 = 251, addon2 = 2 }, --second norseman
    { storage = 170001, outfit1 = 270, addon1 = 1, outfit2 = 273, addon2 = 1 }, --first jester
    { storage = 170002, outfit1 = 270, addon1 = 2, outfit2 = 273, addon2 = 2 }, --second jester
    { storage = 180001, outfit1 = 269, addon1 = 1, outfit2 = 268, addon2 = 1 }, --first nightmare
    { storage = 180002, outfit1 = 269, addon1 = 2, outfit2 = 268, addon2 = 2 }, --second nightmare
    { storage = 190001, outfit1 = 278, addon1 = 1, outfit2 = 279, addon2 = 1 }, --first brotherhood
    { storage = 190002, outfit1 = 278, addon1 = 2, outfit2 = 279, addon2 = 2 }, --second brotherhood
    { storage = 210001, outfit1 = 288, addon1 = 1, outfit2 = 289, addon2 = 1 }, --first demon hunter
    { storage = 210002, outfit1 = 288, addon1 = 2, outfit2 = 289, addon2 = 2 }, --second demon hunter
    { storage = 10005, outfit1 = 139, addon1 = 1, outfit2 = 131, addon2 = 1 }, --first knight hunter
    { storage = 10006, outfit1 = 139, addon1 = 2, outfit2 = 131, addon2 = 2 }, --second knight hunter
    { storage = 10003, outfit1 = 137, addon1 = 1, outfit2 = 129, addon2 = 1 }, --first hunter hunter
    { storage = 10004, outfit1 = 137, addon1 = 2, outfit2 = 129, addon2 = 2 }, --second hunter hunter
    { storage = 10051, outfit1 = 335, addon1 = 1, outfit2 = 336, addon2 = 1},
    { storage = 10052, outfit1 = 335, addon1 = 2, outfit2 = 336, addon2 = 2},

    
}


function onLogin(player)
    for k,addon in ipairs(addons) do
        if player:getStorageValue(addon.storage) > 0 then -- this means the user has the addon
            if (not player:hasOutfit(addon.outfit1, addon.addon1)) then-- check if the user has the addon on the new system
                doPlayerAddOutfit(player, addon.outfit1, addon.addon1)
            end
            if (not player:hasOutfit(addon.outfit2, addon.addon1)) then-- check if the user has the addon on the new system
                doPlayerAddOutfit(player, addon.outfit2, addon.addon1)
            end
            if (not player:hasOutfit(addon.outfit1, addon.addon2)) then-- check if the user has the addon on the new system
                doPlayerAddOutfit(player, addon.outfit1, addon.addon2)
            end
            if (not player:hasOutfit(addon.outfit2, addon.addon2)) then-- check if the user has the addon on the new system
                doPlayerAddOutfit(player, addon.outfit2, addon.addon2)
            end
        end
    end
    return true
end
