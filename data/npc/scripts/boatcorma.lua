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

        addon_need_premium = 'Sorry, you need a premium account to get addons.' 
        addon_have_already = 'Sorry, you already have this addon.'
        addon_have_not_items = 'Sorry, you dont have these items.' 
        addon_give = 'Here you are.' 
        player_gold = getPlayerItemCount(cid,2148) 
        player_plat = getPlayerItemCount(cid,2152)*100 
        player_crys = getPlayerItemCount(cid,2160)*10000 
        player_money = player_gold + player_plat + player_crys 

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
          


        if msgcontains(msg, 'cyclop') or msgcontains(msg, 'quest') or msgcontains(msg, 'cajita') or msgcontains(msg, 'box') then
		if getPlayerStorageValue(cid,13573) == -1 then
                if getPlayerItemCount(cid,8261) >= 1 then 
            selfSay('Te regreso el cyclop mi cajita??', cid)
            talk_state = 2
	else
	selfSay('Espero que el cyclop deperdido me regrese mi cajita', cid)
	end
            else 
                selfSay('tu ya tienes la quest hecha', cid) 
                talk_state = 0 
            end 

        elseif  msgcontains(msg, 'yes') or msgcontains(msg, 'si') and talk_state == 2 then
		talk_state = 0
                if getPlayerItemCount(cid,8261) >= 1 then 
		if getPlayerStorageValue(cid,13573) == -1 then
		if doPlayerTakeItem(cid,8261,1) then
                selfSay('Gracias!, ahora puedes usar los mailboxes privados! .', cid)
		setPlayerStorageValue(cid,13573,1)
	else
	selfSay('Ya eres libre de usar los mailboxes privados', cid)
	end
	else
	selfSay('No tienes mi cajita', cid)
	end
	else
	selfSay('Ya hiciste esta quest', cid)
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