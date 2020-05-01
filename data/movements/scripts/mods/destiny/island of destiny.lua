function onStepIn(cid, item, pos)

local temple = getPlayerMasterPos(cid)

if getPlayerLookDir(cid) == 0 then
newdir = 2
elseif getPlayerLookDir(cid) == 1 then
newdir = 3
elseif getPlayerLookDir(cid) == 2 then
newdir = 0
else
newdir = 1
end

if item.actionid == 13000 then
	doTeleportThing(cid,temple)
		doSendMagicEffect(temple,10)
end

end