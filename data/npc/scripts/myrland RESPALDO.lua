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

        if msgcontains(msg, 'quest') or msgcontains(msg, 'mission') then
            selfSay('Would you like doing me some favors?', cid)
            talk_state = 15

        elseif msgcontains(msg, 'yes') and talk_state == 15 then
	talk_state = 0
		if getPlayerStorageValue(cid,13570) == -1 then
                selfSay('Give this item to Tania, she needs to heal his poor seal, she is on snowground.', cid)
                    doPlayerAddItem(cid,8704,1)
		setPlayerStorageValue(cid,13570,1)
            talk_state = 0
	else
	selfSay('I Already Gave you that mission!', cid)
            talk_state = 0
	end

        elseif msgcontains(msg, 'bug') then
            selfSay('Did Tania sent the firebug for me??', cid)
            talk_state = 28

        elseif msgcontains(msg, 'yes') and talk_state == 28 then
		talk_state = 0
		if getPlayerStorageValue(cid,13572) == -1 then
                selfSay('Thank you, finally killed those god damn rats, could you please bring this to yovanna at the depot?.', cid)
                    doPlayerAddItem(cid,5865,1)
		doPlayerTakeItem(cid,5468,1)
		setPlayerStorageValue(cid,13572,1)
	else
	selfSay('I already gave you that mission!', cid)
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