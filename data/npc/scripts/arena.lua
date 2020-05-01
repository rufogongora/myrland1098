local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                             npcHandler:onThink()                        end

function enterArena(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local cost = 0
    local levelname = ''
    if getPlayerStorageValue(cid, 42355) < 1 then
        cost = 1000
        levelname = 'greenhorn'
        levelneeded = 30
    elseif getPlayerStorageValue(cid, 42355) == 1 then
        cost = 5000
        levelname = 'scrapper'
        levelneeded = 50
    elseif getPlayerStorageValue(cid, 42355) == 2 then
        cost = 10000
        levelname = 'warlord'
        levelneeded = 80
	elseif getPlayerStorageValue(cid, 42355) == 3 then
        cost = 10000
        levelname = 'navowil'
        levelneeded = 80
    end
    if string.lower(keywords[1]) == 'yes' or string.lower(keywords[1]) == 'si' and parameters.prepare ~= 1 then
  if getPlayerStorageValue(cid, 42351) ~= 1 then
        if(getPlayerLevel(cid) >= levelneeded) then
            if(getPlayerMoney(cid) >= cost) then
                npcHandler:say('You can now fight.', cid)
doPlayerRemoveMoney(cid, cost)
                setPlayerStorageValue(cid, 42351, 1)
            else
                npcHandler:say('You dont have{' .. cost .. ' gps}! Come back when you are ready!', cid)
            end
        else
            npcHandler:say('You are not {level ' .. levelneeded .. '} ! Come back when you are ready!', cid)
        end
else
 npcHandler:say('Tu ya pagaste!', cid)
end
        npcHandler:resetNpc()
    elseif string.lower(keywords[1]) == 'no' then
        npcHandler:say('Entonces vuelve despues!', cid)
        npcHandler:resetNpc()
    else
        if getPlayerStorageValue(cid, 42355) < 4 then
            npcHandler:say('You will fight on level {' .. levelname .. '} . If you want to enter you will need to pay {' .. cost .. '} gps and being level {' .. levelneeded .. '}. Do you wanna give a try?', cid)
        else
            npcHandler:say('You already finished the arena.',cid)
        end
    end
    return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Hello |PLAYERNAME|! Do you want to fight in my {arena}?')

local yesNode = KeywordNode:new({'si'}, enterArena, {})
local noNode = KeywordNode:new({'no'}, enterArena, {})

local node1 = keywordHandler:addKeyword({'arena'}, enterArena, {prepare=1})
    node1:addChildKeywordNode(yesNode)
    node1:addChildKeywordNode(noNode)
    
local node1 = keywordHandler:addKeyword({'fight'}, enterArena, {prepare=1})
    node1:addChildKeywordNode(yesNode)
    node1:addChildKeywordNode(noNode)
local node1 = keywordHandler:addKeyword({'yes'}, enterArena, {prepare=1})
    node1:addChildKeywordNode(yesNode)
    node1:addChildKeywordNode(noNode)
npcHandler:addModule(FocusModule:new())