local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

        if msgcontains(msg, 'sulphur') or msgcontains(msg, 'fire') then
            selfSay('Cambiarias tu Fire sword por un magic sulphur??', cid)
            talk_state = 1
        

        elseif msgcontains(msg, 'yes') and talk_state == 1 then
            if getPlayerItemCount(cid,2392) >= 1 then
               if doPlayerTakeItem(cid,2392,1) == true then
                selfSay('Toma esto.', cid)
                    doPlayerAddItem(cid, 5904, 1)
end
            else
                selfSay('Lo siento, no tienes tu fire sword.', cid)
            end
          

        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
            selfSay('Ok then.', cid)
            talk_state = 0
        end
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())