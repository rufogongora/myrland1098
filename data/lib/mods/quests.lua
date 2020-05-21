FERUMBRAS_STORAGE_FIRSTSAGE = 17580;
FERUMBRAS_STORAGE_SECONDSTAGE = 17581;

FERUMBRAS_QUEST_CONFIG = {
        ['topPlayerPos'] = {x = 1244, y = 840, z = 9},
        ['bottomPlayerPos'] = {x = 1246, y = 844, z = 9},
        ['topRoomPos'] = {x = 1295, y = 833, z = 9},
        ['bottomRoomPos'] = {x = 1321, y = 853, z = 9},
        ['teleportTo'] = {x = 1295, y = 853, z = 9},
        ['bossPos'] = {x = 1308, y = 843, z = 9},
        ['rewardPos'] = {x = 1300, y = 843, z = 10},
        ['bossName'] = 'Ascending Ferumbras',
        ['mobs'] = {
            [1] = 'Destabilized Ferumbras',
            [2] = 'Ascending Ferumbras',
            [3] = 'Ferumbras Mortal Shell',
            [4] = 'Ferumbras Soul Splinter'
        }
}
function ResetFerumbrasQuest()
-- check if boss is there (that means previous team died or something)
    local ascending = Creature(FERUMBRAS_QUEST_CONFIG['bossName']);
    local destabilized = Creature('Destabilized Ferumbras');
    local mortalShell = Creature('Ferumbras Mortal Shell');
    if ascending then
        ascending:remove()
    end
    if destabilized then
        destabilized:remove()
    end
    if mortalShell then
        mortalShell:remove()
    end
    local item = getThingfromPos({x = FERUMBRAS_QUEST_CONFIG['bossPos'].x, y = FERUMBRAS_QUEST_CONFIG['bossPos'].y, z = FERUMBRAS_QUEST_CONFIG['bossPos'].z, stackPos = 1})
    if (item and item.itemid == 1387) then
        item:remove()
    end
    setGlobalStorageValue(FERUMBRAS_STORAGE_FIRSTSAGE, 0)
    setGlobalStorageValue(FERUMBRAS_STORAGE_SECONDSTAGE, 0)
end


function HandleRiftInvaderDeath(pos)
    local item = getThingfromPos(pos)
    -- transform the crystal to a red one
    if item.itemid == 17580 then
        doTransformItem(item.uid,17586)
        local val = getGlobalStorageValue(FERUMBRAS_STORAGE_FIRSTSAGE)
        if (val == 5) then
            -- setGlobalStorageValue(FERUMBRAS_STORAGE, 0)
            SummonSoulSplinters()
        else
            setGlobalStorageValue(FERUMBRAS_STORAGE_FIRSTSAGE, val + 1);
        end
    end
    -- update the global quest value  
end

function HandleSoulSplinterDeath()
    -- transform the crystal to a red one
    local val = getGlobalStorageValue(FERUMBRAS_STORAGE_SECONDSTAGE)
    if (val == 6) then
        -- setGlobalStorageValue(FERUMBRAS_STORAGE, 0)
        SummonFinalFerumbras()
    else
        setGlobalStorageValue(FERUMBRAS_STORAGE_SECONDSTAGE, val + 1);
    end
    -- update the global quest value  
end

function SummonFinalFerumbras()
    local destabilized = Creature('Destabilized Ferumbras');
    if destabilized then
        destabilized:remove()
    end

    doSummonCreature('Ferumbras Mortal Shell', FERUMBRAS_QUEST_CONFIG['bossPos'])

end

function SummonSoulSplinters()
    local positions = {
        [0] = {x = 1305, y = 839, z = 9},
        [1] = {x = 1313, y = 839, z = 9},
        [2] = {x = 1304, y = 844, z = 9},
        [3] = {x = 1313, y = 844, z = 9},
        [4] = {x = 1304, y = 849, z = 9},
        [5] = {x = 1313, y = 849, z = 9},
        [6] = {x = 1308, y = 835, z = 9}
    }

    local ascending = Creature(FERUMBRAS_QUEST_CONFIG['bossName']);
    if ascending then
        ascending:remove()
    end

    doSummonCreature('Destabilized Ferumbras', FERUMBRAS_QUEST_CONFIG['bossPos'])

    for k,v in pairs(positions) do
        doSummonCreature('Ferumbras Soul Splinter',v)
    end
end

function HandleFerumbrasDeath(player)
    local config = {
        message = "The mage has been slain!.",
        teleportId = 1387,
    }
    
    doCreateTeleport(config.teleportId,FERUMBRAS_QUEST_CONFIG['rewardPos'] , {x = FERUMBRAS_QUEST_CONFIG['bossPos'].x, y = FERUMBRAS_QUEST_CONFIG['bossPos'].y, z = FERUMBRAS_QUEST_CONFIG['bossPos'].z, stackPos = 1})
    doCreatureSay(player, config.message, TALKTYPE_ORANGE_1)

end