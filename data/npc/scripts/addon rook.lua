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
         
        if msgcontains(msg, 'addons') then 
            selfSay('I can give you Citizen and Druid  addons.') 
        elseif msgcontains(msg, 'help') then 
            selfSay('To buy the first addon say {first NAME addon}, for the  second addon say {second NAME addon}.') 
------------------------------------------------ addon  ------------------------------------------------ 
        elseif msgcontains(msg, 'first citizen addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5878) >= 100 then 
                    selfSay('Did you bring me 100 minotaur  leathers?', cid) 
                    talk_state = 1 
                else 
                    selfSay('I need 100 minotaur leather, to give you  the first citizen addon. Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 1 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5878) >= 100 then 
                addon = getPlayerStorageValue(cid,10001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5878,100) == true then 
                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 128, 1) 
                        doPlayerAddOutfit(cid, 136, 1) 
                        setPlayerStorageValue(cid,10001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second citizen addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5890) >= 100 and  

getPlayerItemCount(cid,5902) >= 50 and getPlayerItemCount(cid,2480) >= 1 then 
                    selfSay('Did you bring me 100 chicken feathers,  50 honeycombs and the legion helmet?', cid) 
                    talk_state = 2 
                else 
                    selfSay('I need 100 chicken feathers, 50  honeycombs and a legion helmet, to give you the second citizen addon. Come back when you  have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 2 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5890) >= 100 and  

getPlayerItemCount(cid,5902) >= 50 and getPlayerItemCount(cid,2480) >= 1 then 
                addon = getPlayerStorageValue(cid,10002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5890,100) == true and  

doPlayerTakeItem(cid,5902,50) == true and doPlayerTakeItem(cid,2480,1) == true then 
                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 128, 2) 
                        doPlayerAddOutfit(cid, 136, 2) 
                        setPlayerStorageValue(cid,10002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 

------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first druid addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5897) >= 50 and  

getPlayerItemCount(cid,5896) >= 50 then 
                    selfSay('Did you bring me 50 wolf paws and 50  bear paws?', cid) 
                    talk_state = 13 
                else 
                    selfSay('I need 50 wolf paws and 50 bear paws, to  give you the first druid addon. Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 13 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5897) >= 50 and  

getPlayerItemCount(cid,5896) >= 50 then 
                addon = getPlayerStorageValue(cid,70001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5897,50) == true and  

doPlayerTakeItem(cid,5896,50) == true then 
                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 144, 1) 
                        doPlayerAddOutfit(cid, 148, 1) 
                        setPlayerStorageValue(cid,70001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 

------------------------------------------------ confirm no ------------------------------------------------ 
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