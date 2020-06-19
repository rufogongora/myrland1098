local dimensionalPortal = MoveEvent()
dimensionalPortal:type("stepin")




function CountdownSummon(params)
	if (params.i == 0) then
		params.player:say('Go!')
		Game.createMonster(params.bossName, params.pos)
		return
	end
	params.player:say(params.i);
	addEvent(CountdownSummon, 1000, {player=params.player, i = params.i-1, bossName=params.bossName, pos = params.pos})
end

function SummonArenaBoss(player, bossName, pos)
	addEvent(CountdownSummon, 0, {player=player, i = 3, bossName= bossName, pos =pos})
end

function CanEnterArena(player)
	local topX = ARENA_START_TOP.x;
    local topZ = ARENA_START_TOP.z;
    local bottomX = ARENA_END_BOTTOM.x;
	local bottomY = ARENA_END_BOTTOM.y;
	local monster = nil;

    while topX <= bottomX do
        local topY = ARENA_START_TOP.y;
        while topY <= bottomY do
            local tile = Tile({x = topX, y=topY, z = topZ});
            if (tile ~= nil) then
                local char = tile:getTopCreature()
				if (char ~= nil) then
					if (char:isPlayer()) then
						player:say('Someone is currently fighting the boss.')
						return false;
					end
				end
            end
            topY = topY+1;
        end
        topX = topX+1;
	end
	return true
end

function CleanArena()
	local topX = ARENA_START_TOP.x;
    local topZ = ARENA_START_TOP.z;
    local bottomX = ARENA_END_BOTTOM.x;
	local bottomY = ARENA_END_BOTTOM.y;
	local monster = nil;

    while topX <= bottomX do
        local topY = ARENA_START_TOP.y;
        while topY <= bottomY do
            local tile = Tile({x = topX, y=topY, z = topZ});
			local items = tile:getItems();
			for k,v in pairs(items) do
				v:remove();
			end
			local char = tile:getTopCreature()
				if (char ~= nil) then
					if (not char:isPlayer()) then
						char:remove()
						doSendMagicEffect({x=topX, y=topY, z=topZ}, 3);
					end
				end
            topY = topY+1;
        end
        topX = topX+1;
	end
	if (monster) then
		monster:remove();
	end
	return true
end

function dimensionalPortal.onStepIn(player, item, position, fromPosition)
	if not player or player:isInGhostMode() then
		return true
	end
	if (item.actionid == 11796) then
		-- item:getPosition():sendMagicEffect(CONST_ME_POFF)
		local st = player:getStorageValue(ANDICAS_ARENA_STORAGE)
		if (st < ARENA_MONSTERS_COUNT()) then
			player:setStorageValue(ANDICAS_ARENA_STORAGE, 0)
		elseif st >= ARENA_MONSTERS_COUNT() then
			player:teleportTo(fromPosition);
			player:say("You've already finished the arena.");
			return
		end
		if (CanEnterArena(player)) then
			CleanArena()
			player:teleportTo(ARENA_TP_POS);
			SummonArenaBoss(player, GET_ARENA_MONSTER(1), ARENA_ENEMY_POS);
			doSendMagicEffect(ARENA_TP_POS, 11);
		else
			player:teleportTo(fromPosition);
		end
	end
	return true
end

dimensionalPortal:id(11796)
dimensionalPortal:register()



local arenaFloor = MoveEvent()
arenaFloor:type("additem")

function arenaFloor.onAddItem(moveitem, tileitem, pos, cid)

	if (
		(pos.x >= ARENA_START_TOP.x and pos.x <= ARENA_END_BOTTOM.x) and
		(pos.y >= ARENA_START_TOP.y and pos.y <= ARENA_END_BOTTOM.y) and
		(pos.z == ARENA_START_TOP.z)
	   )
	then
		if (moveitem:getType():isMovable() or moveitem:getType():isCorpse()) then
			moveitem:remove()
			doSendMagicEffect(pos, 6);
		end
	end
end



arenaFloor:id(22906)
arenaFloor:register()


local arenaExit = MoveEvent()
arenaExit:type("stepin")

function arenaExit.onStepIn(player, item, position, fromPosition)
	if (item.actionid == 22907) then
		CleanArena()
	end
end

arenaExit:id(22907)
arenaExit:register()