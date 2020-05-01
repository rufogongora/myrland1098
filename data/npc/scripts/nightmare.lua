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

        if msgcontains(msg, 'nightmare') then
            selfSay('Cambiarias tus 500 Demonic Essences Por el Nightmare Shield?', cid)
            talk_state = 1
        

        elseif msgcontains(msg, 'yes') and talk_state == 1 then
            if getPlayerItemCount(cid,6500) >= 500 then
                if doPlayerTakeItem(cid,6500,500) == true then
                selfSay('Toma esto.')
                    doPlayerAddItem(cid,6391,1)
                end
            else
                selfSay('Lo siento, no tienes suficientes demonic essences.', cid)
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