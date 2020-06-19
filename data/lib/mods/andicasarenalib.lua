ANDICAS_ARENA_STORAGE = 11796;

ANDICAS_ARENA_MONSTERS = {
    ['Arena Wolf'] = 1,
    ['Arena Bear'] = 2,
    ['Arena Warrior'] = 3,
    ['Arena Mino'] = 4,
    ['Arena Dragon'] = 5,
    ['Arena Ogre'] = 6,
    ['Arena Gnome'] = 7,
    ['Arena Fury'] = 8,
    ['Arena Lizard'] = 9,
    ['Arena Demon'] = 10,
}

ANDICAS_ARENA_REWARDS = {
    ['outfit']  = {level= 10, value=884},
    ['outfit1'] = {level=10, value=885},
    ['addon1'] = {level=15, value=1},
    ['addon2'] = {level=20, value=2},
    ['mount'] = {level=25, value=75},
    ['mount1'] = {level=30, value=76},
    ['mount2'] = {level=35, value=77},
}


ARENA_ENEMY_POS = { x = 999, y = 1030, z = 9};
ARENA_TP_POS = { x = 995, y = 1030, z = 9};

ARENA_START_TOP = {x = 994, y=1027, z=9};
ARENA_END_BOTTOM = {x=1000,y=1033,z=9};
ARENA_REWARD_EXIT = {x=998,y=1025,z=8};



function GET_ARENA_MONSTER(index)
    for k,v in pairs(ANDICAS_ARENA_MONSTERS) do
        if v == index then
            return k;
        end
    end
end

function ARENA_MONSTERS_COUNT()
    local count = 0
    for _ in pairs(ANDICAS_ARENA_MONSTERS) do count = count + 1 end
    return count
end

function GIVE_ARENA_REWARD(player)
    local st = getPlayerStorageValue(player.uid, ANDICAS_ARENA_STORAGE);
    local reward = false;
    local rewardtext = '';
    if (st >= ANDICAS_ARENA_REWARDS['outfit'].value and not player:hasOutfit(ANDICAS_ARENA_REWARDS['outfit'].value, 0)) then
        doPlayerAddOutfit(player, ANDICAS_ARENA_REWARDS['outfit'].value, 0)
        rewardtext = rewardtext..' Arena Champion Outfit';
        reward = true;
    end
    if (reward) then
        player:say("Congratulations your reward is: " .. rewardtext)
    end
end