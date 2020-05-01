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

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'fire') or msgcontains(msg, 'botas')) then
		selfSay('quieres reparar tus botas por 20000 gps?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'si') or msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if(getPlayerItemCount(cid, 10022) >= 1) then
			if(doPlayerRemoveMoney(cid, 20000) == TRUE) then
				local item = getPlayerItemById(cid, TRUE, 10022)
				doTransformItem(item.uid, 9933)
				selfSay('Aqui tienes.', cid)
			else
				selfSay('No tienes suficiente dinero', cid)
			end
		else
			selfSay('Lo siento, no tienes unas botas asi.', cid)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
