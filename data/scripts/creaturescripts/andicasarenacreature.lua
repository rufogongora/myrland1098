local creatureevent = CreatureEvent("AndicasArena")

function creatureevent.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    local index = ANDICAS_ARENA_MONSTERS[creature:getName()]
    setPlayerStorageValue(lasthitkiller.uid,ANDICAS_ARENA_STORAGE,index)
    GIVE_ARENA_REWARD(lasthitkiller)
    if (index < ARENA_MONSTERS_COUNT()) then
        SummonArenaBoss(lasthitkiller, GET_ARENA_MONSTER(index+1), ARENA_ENEMY_POS);
    else
       lasthitkiller:teleportTo(ARENA_REWARD_EXIT);
       doSendMagicEffect(ARENA_REWARD_EXIT, 28);
    end
end


creatureevent:register()
