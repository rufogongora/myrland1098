local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
-- OTServ event handling functions end
   
	if(npcHandler.focus ~= cid) then
		return false
	end


        player_money = 5022 

		if msgcontains(msg, 'promotion') or msgcontains(msg, 'promote') then
 			if getPlayerVocation(cid) > 8 then
 				selfSay('Sorry, you are already promoted.')
 				talk_state = 0
			elseif not isPremium(cid) then
				selfSay('Sorry, you must be premium to buy promotion.')
				talk_state = 0
			else
				selfSay('Do you want to buy promotion for 50 tokens?')
				talk_state = 1
			end

		elseif talk_state == 1 then
			if msgcontains(msg, 'yes') then		
			if getPlayerItemCount(cid,5022) >= 50 then
				if doPlayerTakeItem(cid,5022,50) then
					doPlayerSetVocation(cid, getPlayerVocation(cid)+4)
					selfSay('You are now promoted!')
				else
					selfSay('Sorry, you do not have enough money.')
				end
 		end
		talk_state = 0

	end
	return true
	
end	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())