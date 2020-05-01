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

        player_gold = getPlayerItemCount(cid,2148) 
        player_plat = getPlayerItemCount(cid,2152)*100 
        player_crys = getPlayerItemCount(cid,2160)*10000 
        player_money = player_gold + player_plat + player_crys
          

        if msgcontains(msg, 'juice') or msgcontains(msg, 'quest') then
		if getPlayerStorageValue(cid,13571) == 1 then
            selfSay('Did somebody sent me my juice squeezer??', cid)
            talk_state = 15
	else
	selfSay('I dont know where it is', cid)
	end

        elseif msgcontains(msg, 'yes') and talk_state == 15 then
		if doPlayerTakeItem(cid,5865,1) then
		if getPlayerStorageValue(cid,13569) == -1 then
                selfSay('Yeah, please give this item to the cyclop in the goblin mountain at the west!', cid)
                    doPlayerAddItem(cid,3983,1)
		setPlayerStorageValue(cid,13569,1)
	else
	selfSay('You dont have the juice squeezer', cid)
	end
	else
	selfSay('Ive already gave you this mission!', cid)
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