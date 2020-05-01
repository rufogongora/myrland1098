local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)                      npcHandler:onCreatureAppear(cid)                     end
function onCreatureDisappear(cid)                        npcHandler:onCreatureDisappear(cid)             end
function onCreatureSay(cid, type, msg)           npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                                                       npcHandler:onThink()                                            end
npcHandler:setMessage(MESSAGE_GREET, "Hey |PLAYERNAME|. Can you help me? If you help me, I'll reward you with some addons! Say {addons} or {help} if you don't know what to do.")
function playerBuyAddonNPC(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
            return false
    end
    if (parameters.confirm ~= true) and (parameters.decline ~= true) then
            if(getPlayerPremiumDays(cid) == 0) and (parameters.premium == true) then
                    npcHandler:say('Sorry, this addon is just for Premium Players!', cid)
                    npcHandler:resetNpc()
                    return true
            end
            if (getPlayerStorageValue(cid, parameters.storageID) ~= -1) then
                    npcHandler:say('You already have that!', cid)
                    npcHandler:resetNpc()
                    return true
            end
            local itemsTable = parameters.items
            local items_list = ''
            if table.maxn(itemsTable) > 0 then
                    for i = 1, table.maxn(itemsTable) do
                            local item = itemsTable[i]
                            items_list = items_list .. item[2] .. ' ' .. getItemName(item[1])
                            if i ~= table.maxn(itemsTable) then
                                    items_list = items_list .. ', '
                            end
                    end
            end
            local text = ''
            if (parameters.cost > 0) and table.maxn(parameters.items) then
                    text = items_list .. ' and ' .. parameters.cost .. ' gp'
            elseif (parameters.cost > 0) then
                    text = parameters.cost .. ' gp'
            elseif table.maxn(parameters.items) then
                    text = items_list
            end
            npcHandler:say('Did you bring me ' .. text .. ' for ' .. keywords[1] .. '?', cid)
            return true
    elseif (parameters.confirm == true) then
            local addonNode = node:getParent()
            local addoninfo = addonNode:getParameters()
            local items_number = 0
            if table.maxn(addoninfo.items) > 0 then
                    for i = 1, table.maxn(addoninfo.items) do
                            local item = addoninfo.items[i]
                            if (getPlayerItemCount(cid,item[1]) >= item[2]) then
                                    items_number = items_number + 1
                            end
                    end
            end
            if(getPlayerMoney(cid) >= addoninfo.cost) and (items_number == table.maxn(addoninfo.items)) then
                    doPlayerRemoveMoney(cid, addoninfo.cost)
                    if table.maxn(addoninfo.items) > 0 then
                            for i = 1, table.maxn(addoninfo.items) do
                                    local item = addoninfo.items[i]
                                    doPlayerRemoveItem(cid,item[1],item[2])
                            end
                    end
                    doPlayerAddOutfit(cid, addoninfo.outfit_male, addoninfo.addon)
                    doPlayerAddOutfit(cid, addoninfo.outfit_female, addoninfo.addon)
                    setPlayerStorageValue(cid,addoninfo.storageID,1)
                    npcHandler:say('Here you are.', cid)
            else
                    npcHandler:say('You dont have the required items or money!', cid)
            end
            npcHandler:resetNpc()
            return true
    elseif (parameters.decline == true) then
            npcHandler:say('Not interested? Maybe other addon?', cid)
            npcHandler:resetNpc()
            return true
    end
    return false
end
local noNode = KeywordNode:new({'no'}, playerBuyAddonNPC, {decline = true})
local yesNode = KeywordNode:new({'yes'}, playerBuyAddonNPC, {confirm = true})








-- Wayfarer (done)
local outfit_node = keywordHandler:addKeyword({'first wayfarer addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{12657,1}}, outfit_female = 366, outfit_male = 367, addon = 1, storageID = 10049})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second wayfarer addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{12656,1}}, outfit_female = 366, outfit_male = 367, addon = 2, storageID = 10050})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
 
-- Afflicted (done)
local outfit_node = keywordHandler:addKeyword({'first afflicted addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{13545,1}, {13543,1}, {13541,1}, {13540,1}, {13542,1}, {13544,1}}, outfit_female = 431, outfit_male = 430, addon = 1, storageID = 10051})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second afflicted addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{13926,1}}, outfit_female = 431, outfit_male = 430, addon = 2, storageID = 10052})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
 
-- Deepling (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first deepling addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{15434,1}}, outfit_female = 464, outfit_male = 463, addon = 1, storageID = 10053})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second deepling addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{15432,1}}, outfit_female = 464, outfit_male = 463, addon = 2, storageID = 10054})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
 
-- Insectoid (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first insectoid addon'}, playerBuyAddonNPC, {premium = false, cost = 1500000, items = {{2144,10}, {2143,10}}, outfit_female = 466, outfit_male = 465, addon = 1, storageID = 10055})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second insectoid addon'}, playerBuyAddonNPC, {premium = false, cost = 2000000, items = {{2144,10}, {2143,10}}, outfit_female = 466, outfit_male = 465, addon = 2, storageID = 10056})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
-- Entrepreneur (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first entrepreneur addon'}, playerBuyAddonNPC, {premium = false, cost = 100000, items = {{5912,6}, {5910,6}, {5911,6}, {5913,6}, {5914,6}, {5909,6}}, outfit_female = 471, outfit_male = 471, addon = 1, storageID = 100557})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second entrepreneur addon'}, playerBuyAddonNPC, {premium = false, cost = 200000, items = {{5890,10}, {2323,1}}, outfit_female = 471, outfit_male = 472, addon = 2, storageID = 10058})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
 
-- Crystal Warlord (done)
local outfit_node = keywordHandler:addKeyword({'first crystal warlord addon'}, playerBuyAddonNPC, {premium = false, cost = 1000000, items = {{2146,20}, {2149,20}, {2147,20}, {2150,20}, {9970,1}, {2145,20}}, outfit_female = 513, outfit_male = 512, addon = 1, storageID = 10037})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second crystal warlord addon'}, playerBuyAddonNPC, {premium = false, cost = 1000000, items = {{2146,40}, {2149,40}, {2147,40}, {2150,40}, {9970,2}, {2145,10}}, outfit_female = 513, outfit_male = 512, addon = 2, storageID = 10038})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
 
-- Soil Guardian (done)
local outfit_node = keywordHandler:addKeyword({'first soil guardian addon'}, playerBuyAddonNPC, {premium = false, cost = 1000000, items = {{5893,15}, {5910,5}, {5883,10}, {5880,10}, {5899,10}, {5905,10}}, outfit_female = 514, outfit_male = 516, addon = 1, storageID = 10037})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second soil guardian addon'}, playerBuyAddonNPC, {premium = false, cost = 1000000, items = {{5894,1}, {5895,2}, {5902,5}, {5922,5}, {5879,5}, {5930,10}}, outfit_female = 514, outfit_male = 516, addon = 2, storageID = 10038})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
 
-- Elementalist (done)
local outfit_node = keywordHandler:addKeyword({'first elementalist addon'}, playerBuyAddonNPC, {premium = false, cost = 100000, items = {}, outfit_female = 433, outfit_male = 432, addon = 1, storageID = 10037})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second elementalist addon'}, playerBuyAddonNPC, {premium = false, cost = 100000, items = {}, outfit_female = 433, outfit_male = 432, addon = 2, storageID = 10038})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
 


        -- demon (done)(custom)
local outfit_node = keywordHandler:addKeyword({'first demon addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2520,666}}, outfit_female = 542, outfit_male = 541, addon = 1, storageID = 10060})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second demon addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{6550,6666}}, outfit_female = 542, outfit_male = 541, addon = 2, storageID = 10061})
    outfit_node:addChildKeywordNode(yesNode)
    outfit_node:addChildKeywordNode(noNode)
 

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can give you soil guardian , crystal warlord, entrepreneur, insectoid, afflicted, demonhunter, demon, deepling, wayfarer, warmaster, elementalist.'})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To buy the first addon say \'first NAME addon\', for the second addon say \'second NAME addon\'.'})
 
npcHandler:addModule(FocusModule:new())