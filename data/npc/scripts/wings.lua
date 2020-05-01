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

        if msgcontains(msg, 'botas') then
            selfSay('Pues si, necesito unas boh para poder correr fuerte, acaso tienes unas?', cid)
        elseif msgcontains(msg, 'boh') or msgcontains(msg, 'boots of haste') then
            selfSay('Acaso me cambiarias tus botas por estas alitas magicas?', cid)
            talk_state = 1
        

        elseif msgcontains(msg, 'yes') or msgcontains(msg, 'si') and talk_state == 1 then
            if getPlayerItemCount(cid,2195) >= 1 then
                if doPlayerTakeItem(cid,2195,1) then
                selfSay('Aqui tienes!, que bien ya podre correr mas rapido!.', cid)
                    doPlayerAddItem(cid,5891,1)
                end
            else
                selfSay('Lo siento, no tienes unas boh.', cid)
            end
          

        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
            selfSay('Ok.', cid)
            talk_state = 0
        end
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())