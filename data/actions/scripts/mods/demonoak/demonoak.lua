function onUse(cid, item, fromPosition, itemEx, toPosition)

local onePerQuest = true
local level = 120
local positions =
{
	kick = { x = 1090, y = 1361, z = 7 },
	summon =
	{
		{x=1070, y=1357, z=7},
		{x=1068, y=1366, z=7},
		{x=1082, y=1368, z=7},
		{x=1084, y=1360, z=7}
	}
}

local summons =
{
	[1] = {"Demon", "Grim Reaper", "Elder Beholder", "Demon Skeleton"},
	[2] = {"Dark Torturer", "Banshee", "Betrayed Wraith", "Blightwalker"},
	[3] = {"Bonebeast", "Braindeath", "Diabolic Imp", "Giant Spider"},
	[4] = {"Hand of Cursed Fate", "Lich", "Undead Dragon", "Vampire"},
	[5] = {"braindeath", "Demon", "Bonebeast", "Diabolic Imp"},
	[6] = {"Demon Skeleton", "Banshee", "Elder Beholder", "Bonebeast"},
	[7] = {"Dark Torturer", "Undead Dragon", "Demon", "Demon"},
	[8] = {"Elder Beholder", "Betrayed Wraith", "Demon Skeleton", "Giant Spider"},
	[9] = {"Demon", "Banshee", "Blightwalker", "Demon Skeleton"},
	[10] = {"Grim Reaper", "Demon", "Diabolic Imp", "Braindeath"},
	[11] = {"Banshee", "Grim Reaper", "Hand of Cursed fate", "Demon"}
}

local areaPosition =
{
	{x=1068, y=1358, z=7, stackpos = 255},
	{x=1086, y=1370, z=7, stackpos = 255}
}

local demonOak = {8288, 8289, 8290, 8291}

local storages =
{
	done = 35700,
	cutTree = 36901
}

local blockingTree =
{
	[2709] = {32193, 3669}
}

	if blockingTree[itemEx.itemid] and itemEx.uid == blockingTree[itemEx.itemid][1] then

		local tree = toPosition
		if tree:isInRange(areaPosition[1], areaPosition[2]) then
			print("[Warning - Error::Demon Oak] Dead tree position is inside the quest area positions.\nDead tree position (x: " .. tree.x .. ", y: " .. tree.y .. ", z: " .. tree.z .. ")\nNorth-West area position (x: " .. areaPosition[1].x .. ", y: " .. areaPosition[1].y .. ", z: " .. areaPosition[1].z .. ")\nSouth-West area position (x: " .. areaPosition[2].x .. ", y: " .. areaPosition[2].y .. ", z: " .. areaPosition[2].z .. ")\nScript will not work correctly, please fix it.")
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Something is wrong, please contact a gamemaster.")
			return false
		end

		if getPlayerLevel(cid) < level then
			doPlayerSendCancel(cid, "You need level " .. level .. " or more to enter this quest.")
			return true
		end

		if getPlayerStorageValue(cid, storages.done) > 0 then
			doPlayerSendCancel(cid, "You already done this quest.")
			return true
		end

		if getPlayerStorageValue(cid, storages.cutTree) > 0 then
			return false
		end

		if onePerQuest then
		local players = Game.getPlayers()
			for _, pid in ipairs(players) do
			if getCreaturePosition(pid):isInRange(areaPosition[1], areaPosition[2]) then
				doPlayerSendCancel(cid, "Wait until " .. getCreatureName(pid) .. " finish the quest.")
				return true
			end
			end
		end

		doTransformItem(itemEx.uid, blockingTree[itemEx.itemid][2])
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		doMoveCreature(cid, SOUTH)
		cid:setStorageValue(storages.cutTree, 1)
		return true

	elseif isInArray(demonOak, itemEx.itemid) then

		local get = getPlayerStorageValue(cid, itemEx.itemid)
		if get == -1 then
			cid:setStorageValue(itemEx.itemid, 1)
		end

		if(getPlayerStorageValue(cid, 8288) == 12 and getPlayerStorageValue(cid, 8289) == 12 and getPlayerStorageValue(cid, 8290) == 12 and getPlayerStorageValue(cid, 8291) == 12) then
			doTeleportThing(cid, positions.kick)
			cid:setStorageValue(storages.done, 1)
			return true
		end

		if getPlayerStorageValue(cid, itemEx.itemid) > 11 then
			doSendMagicEffect(toPosition, CONST_ME_POFF)
			return true
		end

		if(math.random(100) <= 1) then
			cid:setStorageValue(itemEx.itemid, 12)
			return true
		end


		if summons[get] then
		for i = 1, #summons[get] do
			Game.createMonster(summons[get][i], positions.summon[i])
		end
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			cid:setStorageValue(itemEx.itemid, get + 1)
			if math.random(100) >= 50 then
				doTargetCombatHealth(0, cid, COMBAT_EARTHDAMAGE, -270, -310, CONST_ME_BIGPLANTS)
			end
		end
	return false
	end
end