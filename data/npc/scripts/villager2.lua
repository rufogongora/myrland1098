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

        if msgcontains(msg, 'seal') or msgcontains(msg, 'potion') then
            selfSay('Did somone gave you the potion for my seal?', cid)
            talk_state = 1

        elseif msgcontains(msg, 'yes') or msgcontains(msg, 'si') and talk_state == 1 then
		if getPlayerStorageValue(cid,13571) == -1 then
                selfSay('Omg thank you, please give this fire bug to captain myrland in order to thank you! .', cid)
                    doPlayerAddItem(cid,5468,1)
		doPlayerTakeItem(cid,8704,1)
		setPlayerStorageValue(cid,13571,1)
	else
	selfSay('I already gave you that mission', cid)
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