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

        if msgcontains(msg, 'casa') then
		if getPlayerStorageValue(cid, 48618) == -1 then
		local rows = db.getResult("SELECT `owner` FROM `houses` WHERE `owner` = " .. getPlayerGUID(cid) .. ";") 
		if(rows:getID() ~= -1) then
            selfSay('Ahh tu eres de los que perdieron su casa?', cid)
            talk_state = 1
		else
            selfSay('Tu no tienes casa', cid)
		else
            selfSay('ya te di tu recompensa', cid)
	end

        

        elseif msgcontains(msg, 'yes') or msgcontains(msg, 'si') and talk_state == 1 then
 		setPlayerStorageValue(cid, 48618, 1)
                selfSay('Toma tu recompensa.', cid)
                    doPlayerAddItem(cid,2160,100)
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