local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local player = Player(cid)

    if player:getLevel() < 75 then
        blessprize = 1000*5
    elseif player:getLevel() >= 75 and player:getLevel() <= 150 then
        blessprize = (((player:getLevel()-30)*75)+1000)*5
    elseif player:getLevel() > 150 then
        blessprize = 15000*5
    end


    if(msgcontains(msg, "blessing") or msgcontains(msg, "bless")) then
            npcHandler:say("Do you want to receive all blessings for "..blessprize.." gold?", cid)
            npcHandler.topic[cid] = 1
    end
    if(msgcontains(msg, "yes")) then
        if(npcHandler.topic[cid] == 1) then
            if player:hasBlessing(1) or player:hasBlessing(2) or player:hasBlessing(3) or player:hasBlessing(4) or player:hasBlessing(5) then
                npcHandler:say("You already have been blessed!", cid)
            else
                if player:removeMoney(blessprize) then
                    npcHandler:say("You have been blessed by all of five gods!, " .. player:getName() .. ".", cid)
                    player:addBlessing(1)
                    player:addBlessing(2)
                    player:addBlessing(3)
                    player:addBlessing(4)
                    player:addBlessing(5)
                    player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
                    npcHandler.topic[cid] = 0
                else
                    npcHandler:say("Come back when you have enough money.", cid)
                    npcHandler.topic[cid] = 0
                end
            end
        end
    end
    if(msgcontains(msg, "no")) then
        if(npcHandler.topic[cid] > 0) then
            npcHandler:say("Then no.", cid)
            npcHandler.topic[cid] = 0
        end
    end
    return true
end

npcHandler:setMessage(MESSAGE_GREET, "Greetings, fellow {believer} |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Always be on guard, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "This ungraceful haste is most suspicious!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())