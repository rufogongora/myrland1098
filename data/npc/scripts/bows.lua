local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)                      npcHandler:onCreatureAppear(cid)                     end
function onCreatureDisappear(cid)                        npcHandler:onCreatureDisappear(cid)             end
function onCreatureSay(cid, type, msg)           npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                                                       npcHandler:onThink()                                            end
-- npcHandler:setMessage(MESSAGE_GREET, "Hey |PLAYERNAME|. Can you help me? If you help me, I'll reward you with some addons! Say {addons} or {help} if you don't know what to do.")
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







 
-- Afflicted (done)
local outfit_node = keywordHandler:addKeyword({'first hunter addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5875,1}}, outfit_female = 137, outfit_male = 129, addon = 2, storageID = 15551})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)
local outfit_node = keywordHandler:addKeyword({'second hunter addon'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5947,1}, {5889, 1}, {5887,1}, {5891, 5}, {5948, 100}, {5876, 100}}, outfit_female = 137, outfit_male = 129, addon = 1, storageID = 15552})
outfit_node:addChildKeywordNode(yesNode)
outfit_node:addChildKeywordNode(noNode)


keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can give you soil guardian , crystal warlord, entrepreneur, insectoid, afflicted, demon, deepling, wayfarer, elementalist.'})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To buy the first addon say \'first NAME addon\', for the second addon say \'second NAME addon\'.'})
 
npcHandler:addModule(FocusModule:new())