local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
local stan = 0
local stan_two = 0
local player_pattern = '^[a-zA-Z0-9 -]+$'
local number_pattern = '%d'
local target_cid = 0
local number_pattern_two = '%d+'
local b, e = 0
local count = 0
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return FALSE
end

if getPlayerStorageValue(cid,8996) <= 0 then
setPlayerStorageValue(cid,8996,0)
end

if msgcontains(msg, 'deposit') or msgcontains(msg, 'wplac') then
if string.find(msg, number_pattern) then
b, e = string.find(msg, number_pattern_two)
count = tonumber(string.sub(msg, b, e))
if pay(cid,count) then
stan = getPlayerStorageValue(cid,8996) + count
setPlayerStorageValue(cid,8996,stan)
npcHandler:say('Money was deposited!', cid)
talk_state = 0
else
npcHandler:say('You dont have anought money!', cid)
talk_state = 0
end
else
npcHandler:say('How much money you want deposit?', cid)
talk_state = 1
end
elseif msgcontains(msg, 'withdraw') or msgcontains(msg, 'wyplac') then
if string.find(msg, number_pattern) then
b, e = string.find(msg, number_pattern_two)
count = tonumber(string.sub(msg, b, e))
if getPlayerStorageValue(cid,8996) - count >= 0 then
stan = getPlayerStorageValue(cid,8996) - count
setPlayerStorageValue(cid,8996,stan)
doPlayerAddMoney(cid,count)
npcHandler:say('Money was withdrawed!', cid)
talk_state = 0
else
npcHandler:say('You do not have anought money on account!', cid)
talk_state = 0
end
else
npcHandler:say('How much money you want withdraw?', cid)
talk_state = 2
end
elseif msgcontains(msg, 'transfer') or msgcontains(msg, 'transferuj') then
npcHandler:say('Want you for who transfer money?', cid)
talk_state = 3
elseif msgcontains(msg, 'balance') or msgcontains(msg, 'stan') then
npcHandler:say('Your account have ' .. getPlayerStorageValue(cid,8996) .. 'gp.', cid)
talk_state = 4 
elseif talk_state == 1 then
if string.find(msg, number_pattern) then
if pay(cid, msg) then
stan = getPlayerStorageValue(cid,8996) + msg
setPlayerStorageValue(cid,8996,stan)
doPlayerRemoveMoney(cid,msg)
npcHandler:say('Money was deposited!', cid)
talk_state = 0
else
npcHandler:say('You dont have anought money!', cid)
talk_state = 0
end
else
npcHandler:say('There is not number!', cid)
talk_state = 0
end
elseif talk_state == 2 then
stan = getPlayerStorageValue(cid,8996)
if string.find(msg, number_pattern) then
if getPlayerStorageValue(cid,8996) - msg >= 0 then
stan = getPlayerStorageValue(cid,8996) - msg
setPlayerStorageValue(cid,8996,stan)
doPlayerAddMoney(cid,msg)
npcHandler:say('Money was withdrawed!', cid)
talk_state = 0
else
npcHandler:say('You do not have anought money on account!', cid)
talk_state = 0
end
else
npcHandler:say('There is not number!', cid)
talk_state = 0
end
elseif talk_state == 3 then
if string.find(msg, player_pattern) then
target_cid = getPlayerByName(msg)
if isPlayer(target_cid) == 1 then 
talk_state = 4
npcHandler:say('How much i must transfer?', cid)
else
talk_state = 0
npcHandler:say('Player is not online or this player dont exists.', cid) 
end
else
npcHandler:say('It isnt nick!', cid)
talk_state = 0
end
elseif talk_state == 4 then
stan = getPlayerStorageValue(cid,8996)
if string.find(msg, number_pattern) then
if stan - msg >= 0 then
stan_two = getPlayerStorageValue(target_cid,8996) + msg
stan = getPlayerStorageValue(cid,8996) - msg
setPlayerStorageValue(target_cid,8996,stan_two)
setPlayerStorageValue(cid,8996,stan)
doPlayerRemoveMoney(cid,msg)
talk_state = 0
npcHandler:say('Money transfered.', cid)
else
npcHandler:say('You do not have anought money on account!', cid)
talk_state = 0
end
else
npcHandler:say('There is not number!', cid)
talk_state = 0
end
elseif talk_state == 5 then 
end

return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
