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
        ciudad = {x="1429", y="563", z="6"} 
        ciudad2 = {x="582", y="466", z="6"} 
        ciudad3 = {x="1616", y="1324", z="6"} 
	vip = getPlayerStorageValue(cid, 13540)

        if msgcontains(msg, 'raftel') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if player_money >= 125 then 
                    selfSay('Quieres viajar a raftel?', cid) 
                    talk_state = 1 
                else 
                    selfSay('El viaje a test te cuesta 125 gps.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay('Para viajar a test necesitas ser premium', cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 1 then 
            talk_state = 0 
           if player_money >= 125 then
                    if doPlayerRemoveMoney(cid,125) then 
                        selfSay('Bon Voyage', cid) 
                        doTeleportThing(cid, ciudad) 
                    end 
            else 
                selfSay('No tienes suficiente dinero', cid) 
            end 
---------------------------------------------------------------
        elseif msgcontains(msg, 'island') then 
            if getPlayerPremiumDays(cid) > 0 then
                if getPlayerAccess(cid) > 0 then 
                    selfSay('Quieres viajar a tutor island?', cid) 
                    talk_state = 2 
                else 
                    selfSay('Necesitas ser minimo tutor para ir a tutor island.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay('Necesitas ser premium.', cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 2 then 
            talk_state = 0 
           if getPlayerAccess(cid) > 0 then
                        selfSay('Bon Voyage', cid) 
                        doTeleportThing(cid, ciudad2) 
                    end 
----------------------------------------------------------
        elseif msgcontains(msg, 'yalahar') then 
            if getPlayerPremiumDays(cid) > 0 then
               if(isSilverVip(getPlayerAccount(cid))) == true then
                    selfSay('Quieres viajar a yalahar?', cid) 
                    talk_state = 3 
                else 
                    selfSay('Necesitas ser minimo tutor para ir a yalahar.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay('Necesitas ser premium.', cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 3 then 
            talk_state = 0 
           if getPlayerAccess(cid) > 0 then
                        selfSay('Bon Voyage', cid) 
                        doTeleportThing(cid, ciudad3) 
                    end 

        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 34)  

then 
            selfSay('Ok than.', cid) 
            talk_state = 0 
        end 
    -- Place all your code in here. Remember that hi, bye and all that stuff is  

--already handled by the npcsystem, so you do not have to take care of that yourself. 
    return true 
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new()) 