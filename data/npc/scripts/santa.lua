local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)             npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                    npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so 

you do not have to take care of that yourself.
    if(npcHandler.focus ~= cid) then
        return false
    end

    local present = getPlayerStorageValue(cid, 67875)
    local random = math.random(1, 14)
    local level = getPlayerLevel(cid)

    if msgcontains(msg, 'present') then
    if doPlayerTakeItem(cid, 6497, 50) == 1 then
    if present == -1 then

    if (random >= 1 and random <= 6) then
    doPlayerAddPremiumDays(cid, 5)
    setPlayerStorageValue(cid, 67875, 1)
    doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_GREEN)
    selfSay('Merry Christmas! Ho Ho Ho!')

    elseif (random >= 7 and random <= 14) then
    doSetItemText(doPlayerAddItem(cid, 2598, 1), 'It is said that you can trade one for a house not bigger than 100 sqm.\nCall a Gm.')
    setPlayerStorageValue(cid, 67875, 1)
    selfSay('Merry Christmas! Ho Ho Ho!')
end

    else
    selfSay('You already have your present, ho ho ho!')
    end
    else
    selfSay('Bring me 50 surprise bags to get present.')
    end
end
return 1
end    

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  