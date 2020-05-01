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

        player_gold = getPlayerItemCount(cid,2148) 
        player_plat = getPlayerItemCount(cid,2152)*100 
        player_crys = getPlayerItemCount(cid,2160)*10000 
        player_money = player_gold + player_plat + player_crys

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

        if (msgcontains(msg, 'help')) then 
            selfSay('Para pelear en la arena solo tienes que elegir el nivel de dificultad, y te dare un item, despues de que te lo entregue solo tienes que ir hacia el cuarto siguiente y poner el item dado en el cuadro junto a la palanca y halar.', cid)  
		talkState[talkUser] = 0


------------------------------------------------ Greenhorn  ------------------------------------------------ 
        elseif msgcontains(msg, 'greenhorn') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if player_money >= 5000 then 
                    selfSay('Pagarias 5k por entrar a la arena greenhorn?', cid) 
                    talk_state = 1 
                else 
                    selfSay('Necesito 5k para que puedas entrar a la greenhorn arena', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay('necesitas premium para entrar', cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 1 then 
            talk_state = 0 
            if player_money >= 5000 then 
                addon = getPlayerStorageValue(cid,85317) 
                if addon == -1 then 
                    if doPlayerRemoveMoney(cid,5000) then 
                        selfSay('Suerte en el nivel Greenhorn!, para entrar camina hacia el teleport a la derecha.', cid) 
                        setPlayerStorageValue(cid,85317,1) 
                    end 
                else 
                    selfSay('Te equivocaste de arena?, si quieres entrar a otra, logea y vuelve a comprar tu boleto para la deseada', cid) 
                end 
            else 
                selfSay('no traes feria carnal', cid) 
            end 
		
------------------------------------------------ Scrapper  ------------------------------------------------ 
        elseif msgcontains(msg, 'scrapper') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if player_money >= 10000 then 
                    selfSay('Pagarias 10k por entrar a la arena scrapper?', cid) 
                    talk_state = 2 
                else 
                    selfSay('Necesito 10k para que puedas entrar a la scrapper arena', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay('necesitas premium para entrar', cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 2 then 
            talk_state = 0 
            if player_money >= 10000 then 
                addon = getPlayerStorageValue(cid,85317) 
                if addon == -1 then 
                    if doPlayerRemoveMoney(cid,10000) then 
                        selfSay('Suerte en el nivel Scrapper!, para entrar camina hacia el teleport a la derecha.', cid) 
                        setPlayerStorageValue(cid,85317,2) 
                    end 
                else 
                    selfSay('Te equivocaste de arena?, si quieres entrar a otra, logea y vuelve a comprar tu boleto para la deseada', cid) 
                end 
            else 
                selfSay('no traes feria carnal', cid) 
            end 
			

------------------------------------------------ Warlord  ------------------------------------------------ 
        elseif msgcontains(msg, 'warlord') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if player_money >= 15000 then 
                    selfSay('Pagarias 15k por entrar a la arena warlord?', cid) 
                    talk_state = 3 
                else 
                    selfSay('Necesito 15k para que puedas entrar a la warlord arena', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay('necesitas premium para entrar', cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 3 then 
            talk_state = 0 
            if player_money >= 15000 then 
                addon = getPlayerStorageValue(cid,85317) 
                if addon == -1 then 
                    if doPlayerRemoveMoney(cid,15000) then 
                        selfSay('Suerte en el nivel Warlord!, para entrar camina hacia el teleport a la derecha.', cid) 
                        setPlayerStorageValue(cid,85317,3) 
                    end 
                else 
                     selfSay('Te equivocaste de arena?, si quieres entrar a otra, logea y vuelve a comprar tu boleto para la deseada', cid)
                end 
            else 
                selfSay('no traes feria carnal') 
            end 
------------------------------------------------ Navowil ------------------------------------------------ 
        elseif msgcontains(msg, 'navowil') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if player_money >= 50000 then 
                    selfSay('Pagarias 50k por entrar a la arena navowil?', cid) 
                    talk_state = 4 
                else 
                    selfSay('Necesito 50k para que puedas entrar a la navowil', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay('necesitas premium para entrar') 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 4 then 
            talk_state = 0 
            if player_money >= 50000 then 
                addon = getPlayerStorageValue(cid,85317) 
                if addon == -1 then 
                    if doPlayerRemoveMoney(cid,50000) then 
                        selfSay('Suerte en la arena navowil', cid) 

                        setPlayerStorageValue(cid,85317,4) 
                    end 
                else 
                     selfSay('Te equivocaste de arena?, si quieres entrar a otra, logea y vuelve a comprar tu boleto para la deseada', cid)
                end 
            else 
                selfSay('no traes feria carnal', cid) 
            end 

	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new()) 