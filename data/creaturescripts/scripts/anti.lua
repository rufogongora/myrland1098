local config = {
seconds = 7,
onlyWithSameIP = "yes"}
--DONT MODIFY
config.onlyWithSameIP = getBooleanFromString(config.onlyWithSameIP)
local m_lastLogin, m_lastIP = 0, 0
function onLogin(cid)
local timeNow, playerIP = os.time(), getPlayerIp(cid)
if(m_lastLogin + config.seconds >= timeNow and
(config.onlyWithSameIP == FALSE or m_lastIP == playerIP)) then
return FALSE
end
m_lastIP = playerIP
m_lastLogin = timeNow
return TRUE
end