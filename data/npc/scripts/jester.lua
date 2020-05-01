local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if(npcHandler.focus ~= cid) then
        return false
    end

        if msgcontains(msg, 'hat') then
            selfSay('Quieres mi hat?, necesitas darme 10 Strong mana potions 5 Ape furs y 10 Minotaur Leather') then
	    talk_state = 1
        elseif msgcontains(msg, 'staff') then
            selfSay('Para que te de mi staff necesitas darme 5 holy orchids y 30 iron ores')
            talk_state = 2
        

        elseif msgcontains(msg, 'yes') and talk_state == 1 then
            if getPlayerItemCount(cid,7589) >= 10 and getPlayerItemCount(cid,5883) >= 5 and getPlayerItemCount(cid,5878) >= 10 then
                if doPlayerTakeItem(cid,7589,10) and doPlayerTakeItem(cid,5883,5) and doPlayerTakeItem(cid,5878,10) == 0 then
                selfSay('Toma mi dichoso sombrero, usalo con sabiduria.')
                    doPlayerAddItem(cid,7957,1)
                end

        elseif msgcontains(msg, 'yes') and talk_state == 2 then
            if getPlayerItemCount(cid,5922) >= 5 and getPlayerItemCount(cid,5880) >= 30 then
                if doPlayerTakeItem(cid,5922,5) and doPlayerTakeItem(cid,5880,30) == 0 then
                selfSay('Cuida mi Staff!.')
                    doPlayerAddItem(cid,7958,1)
                end
            else
                selfSay('Sorry, you don\'t have the item.')
            end
          

        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
            selfSay('Ok then.')
            talk_state = 0
        end
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())