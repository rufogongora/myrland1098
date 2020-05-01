local timed = 120 -- Seconds
local monsters =
{
						----- Teleport Position ---------- New Player Position -----
	["Thalas"]   = {{x=3374, y=3337, z=14, stackpos=1}, {x=3374, y=3359, z=15}},  
	["Rahemos"]  = {{x=3356, y=3567, z=15, stackpos=1}, {x=3381, y=3574, z=15}},
	["Mahrdis"]  = {{x=3241, y=3509, z=15, stackpos=1}, {x=3220, y=3512, z=15}},
	["Omruc"]    = {{x=3468, y=3450, z=15, stackpos=1}, {x=3494, y=3453, z=15}}
}

local function removeTeleport()
local teleport = getTileItemById(pos[1], 1387)
	if teleport.uid > 0 then
		doRemoveItem(teleport.uid)
	end
end

function onKill(cid, target, lastHit)
for name, pos in pairs(monsters) do
	if name == getCreatureName(target) then
		doCreateTeleport(1387, pos[1], pos[2])
		doCreatureSay(target, "You have ".. timed .." seconds before the portal closes!", TALKTYPE_ORANGE_1)
		addEvent(removeTeleport, timed * 1000)
		end
	end
return true
end