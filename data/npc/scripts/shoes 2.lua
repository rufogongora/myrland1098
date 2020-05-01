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
	local destination = {x=1058 y=1056 z=7},
    if(npcHandler.focus ~= cid) then
        return false
    end

        if msgcontains(msg, 'specialised') then
            selfSay('Yes, my fathers was a great one blacksmith, it was a wise person , but when he decided to teach me he dies and i just learn about the lovely boots. So, did you bring me some boots? which one?')
        elseif msgcontains(msg, 'worn soft boots') or msgcontains(msg, 'worn soft boot') then
            selfSay('Did u like that i fix ur worn soft boots? it will cost 100 platinum coins')
            talk_state = 1
        

        elseif msgcontains(msg, 'yes') and talk_state == 1 then
            if getPlayerItemCount(cid,6530) >= 1 and getPlayerItemCount(cid,2152) >= 100 then
                if doPlayerTakeItem(cid,6530,1) and doPlayerTakeItem(cid,2152,100) == 0 then
                selfSay('Here you are.')
        	doTeleportThing(cid,destination)
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