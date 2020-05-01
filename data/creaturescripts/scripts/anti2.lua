local function gtfoMC(p)
if #getPlayersByIp(getPlayerIp(p.pid)) >= p.max then
doRemoveCreature(p.pid)
end
return TRUE
end
function onLogin(cid)
addEvent(gtfoMC, 1000, {pid = cid, max = 1})
return TRUE
end