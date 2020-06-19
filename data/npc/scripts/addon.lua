--------------------------------------------------------------------------------------------
------------------------------------ Advanced Addon NP
---------Script made by teh_pwnage (Revamped for The Forgotten Server by Rynwar)
--------------- Special thanks to: mokerhamer, Xidaozu and Jiddo, deaths'life --------------
---------  Tambien a Rufo por los addons de jester Brotherhood y nightmare------------------
------------------------------ NPC based on Evolutions V0.7.7 ------------------------------
--------------------------------------------------------------------------------------------

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
	local posicion = getCreaturePosition(cid)

         
        if msgcontains(msg, 'addons') then 
            selfSay('I can give you Citizen, Hunter, Knight, Mage, Nobleman,  Summoner, Warrior, Barbarian, Druid, Wizard, Oriental,Pirate, Assassin, Beggar, Jester, Norseman y  Shaman addons.', cid) 
        elseif msgcontains(msg, 'help') then 
            selfSay('To get first addon say {first NAME addon}, for second addon {second NAME addon}.', cid) 
			   elseif msgcontains(msg, 'second hunter addon') then 
            selfSay('Solo mi primo {Roger} vende ese addon, esta arriba de la torre de npc en {Andicas}.', cid) 
						   elseif msgcontains(msg, 'first hunter addon') then 
            selfSay('Solo mi primo {Roger} vende ese addon, esta arriba de la torre de npc en {Andicas}.', cid) 
			 elseif msgcontains(msg, 'knight') then 
            selfSay('Ese addon solo mi compadre {Drake} te lo puede dar, se encuentra al noroeste del depot de {Andicas}.', cid) 

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
			doSendMagicEffect(posicion,12)			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
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
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
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
        elseif msgcontains(msg, 'first mage addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerSex(cid) == 0 then 
                    if getPlayerItemCount(cid,5958) >= 1 then 
                        selfSay('Did you bring me a winning  lotery ticket?', cid) 
                        talk_state = 7 
                    else 
                        selfSay('I need a winning lotery ticket,  to give you the first mage addon. Come back when you have it.', cid) 
                        talk_state = 0 
                    end 
                elseif getPlayerSex(cid) == 1 then 
                    if getPlayerItemCount(cid,2181) >= 1 and  

getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and  

getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and  

getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and  

getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and  

getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and  

getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then 
                        selfSay('Did you bring me all the wands  and rods, 10 magic sulphurs, 20 ankhs and a soul stone?', cid) 
                        talk_state = 7 
                    else 
                        selfSay('I need all kind of wands and  rods, 10 magic sulphurs, 20 ankhs and a soul stone, to give you the first mage addon.  Come back when you have it.', cid) 
                        talk_state = 0 
                    end 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes  ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 7 then 
            talk_state = 0 
            if getPlayerSex(cid) == 0 then 
                if getPlayerItemCount(cid,5958) >= 1 then 
                    addon = getPlayerStorageValue(cid,40001) 
                    if addon == -1 then 
                        if doPlayerTakeItem(cid,5958,1) == true then 
    			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                            doPlayerAddOutfit(cid, 141, 1) 
                             

setPlayerStorageValue(cid,40001,1) 
                        end 
                    else 
                        selfSay(addon_have_already, cid) 
                    end 
                else 
                    selfSay(addon_have_not_items, cid) 
                end 
            elseif getPlayerSex(cid) == 1 then 
                if getPlayerItemCount(cid,2181) >= 1 and  

getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and  

getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and  

getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and  

getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and  

getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and  

getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then 
                    addon = getPlayerStorageValue(cid,40001) 
                    if addon == -1 then 
                        if doPlayerTakeItem(cid,2181,1) == true and  

doPlayerTakeItem(cid,2182,1) == true and doPlayerTakeItem(cid,2183,1) == true and  

doPlayerTakeItem(cid,2185,1) == true and doPlayerTakeItem(cid,2186,1) == true and  

doPlayerTakeItem(cid,2187,1) == true and doPlayerTakeItem(cid,2188,1) == true and  

doPlayerTakeItem(cid,2189,1) == true and doPlayerTakeItem(cid,2190,1) == true and  

doPlayerTakeItem(cid,2191,1) == true and doPlayerTakeItem(cid,5904,10) == true and  

doPlayerTakeItem(cid,2193,20) == true and doPlayerTakeItem(cid,5809,1) == true then 
    			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                            doPlayerAddOutfit(cid, 130, 1) 
                             

setPlayerStorageValue(cid,40001,1) 
                        end 
                    else 
                        selfSay(addon_have_already, cid) 
                    end 
                else 
                    selfSay(addon_have_not_items, cid) 
                end 
            end 
------------------------------------------------ addon  ------------------------------------------------ 
        elseif msgcontains(msg, 'second mage addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerSex(cid) == 0 then 
                    if getPlayerItemCount(cid,5894) >= 70 and  

getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and  

getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and  

getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and  

getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then 
                        selfSay('Did you bring me 70 bat wings,  20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60  lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts?', cid) 
                        talk_state = 8 
                    else 
                        selfSay('I need 70 bat wings, 20 red  pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard  scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts, to give you the  second mage addon. Come back when you have it.', cid) 
                        talk_state = 0 
                    end 
                elseif getPlayerSex(cid) == 1 then 
                    if getPlayerItemCount(cid,5903) >= 1 then 
                        selfSay('Did you bring me the  Ferumbrass\' hat?', cid) 
                        talk_state = 8 
                    else 
                        selfSay('I need the famous Ferumbrass\'  hat, to give you the second mage addon. Come back when you have it.', cid) 
                        talk_state = 0 
                    end 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 8 then 
            talk_state = 0 
            if getPlayerSex(cid) == 0 then 
                if getPlayerItemCount(cid,5894) >= 70 and  

getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and  

getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and  

getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and  

getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then 
                    addon = getPlayerStorageValue(cid,40002) 
                    if addon == -1 then 
                        if doPlayerTakeItem(cid,5894,70) and  

doPlayerTakeItem(cid,5911,20) and doPlayerTakeItem(cid,5883,40) and  

doPlayerTakeItem(cid,5922,35) and doPlayerTakeItem(cid,5886,10) and  

doPlayerTakeItem(cid,5881,60) and doPlayerTakeItem(cid,5882,40) and  

doPlayerTakeItem(cid,5904,15) and doPlayerTakeItem(cid,5905,30) then 
    			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                            doPlayerAddOutfit(cid, 141, 2) 
                             

setPlayerStorageValue(cid,40002,1) 
                        end 
                    else 
                        selfSay(addon_have_already, cid) 
                    end 
                else 
                    selfSay(addon_have_not_items, cid) 
                end 
            elseif getPlayerSex(cid) == 1 then 
                if getPlayerItemCount(cid,5903) >= 1 then 
                    addon = getPlayerStorageValue(cid,40002) 
                    if addon == -1 then 
                        if doPlayerTakeItem(cid,5903,1) == true then 
    			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                            doPlayerAddOutfit(cid, 130, 2) 
                             

setPlayerStorageValue(cid,40002,1) 
                        end 
                    else 
                        selfSay(addon_have_already, cid) 
                    end 
                else 
                    selfSay(addon_have_not_items, cid) 
                end 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first summoner addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerSex(cid) == 1 then 
                    if getPlayerItemCount(cid,5958) >= 1 then 
                        selfSay('Did you bring me a winning  lotery ticket?', cid) 
                        talk_state = 9 
                    else 
                        selfSay('I need a winning lotery ticket,  to give you the first summoner addon. Come back when you have it.', cid) 
                        talk_state = 0 
                    end 
                elseif getPlayerSex(cid) == 0 then 
                    if getPlayerItemCount(cid,2181) >= 1 and  

getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and  

getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and  

getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and  

getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and  

getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and  

getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then 
                        selfSay('Did you bring me all the wands  and rods, 10 magic sulphors, 20 ankhs and a soul stone?', cid) 
                        talk_state = 9 
                    else 
                        selfSay('I need all kind of wands and  rods, 10 magic sulphurs, 20 ankhs and a soul stone, to give you the first summoner addon.  Come back when you have it.', cid) 
                        talk_state = 0 
                    end 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 9 then 
            talk_state = 0 
            if getPlayerSex(cid) == 1 then 
                if getPlayerItemCount(cid,5958) >= 1 then 
                    addon = getPlayerStorageValue(cid,50001) 
                    if addon == -1 then 
                        if doPlayerTakeItem(cid,5958,1) == true then 
    			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                            doPlayerAddOutfit(cid, 133, 1) 
                             

setPlayerStorageValue(cid,50001,1) 
                        end 
                    else 
                        selfSay(addon_have_already, cid) 
                    end 
                else 
                    selfSay(addon_have_not_items, cid) 
                end 
            elseif getPlayerSex(cid) == 0 then 
                if getPlayerItemCount(cid,2181) >= 1 and  

getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and  

getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and  

getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and  

getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and  

getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and  

getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then 
                    addon = getPlayerStorageValue(cid,50001) 
                    if addon == -1 then 
                        if doPlayerTakeItem(cid,2181,1) == true and  

doPlayerTakeItem(cid,2182,1) == true and doPlayerTakeItem(cid,2183,1) == true and  

doPlayerTakeItem(cid,2185,1) == true and doPlayerTakeItem(cid,2186,1) == true and  

doPlayerTakeItem(cid,2187,1) == true and doPlayerTakeItem(cid,2188,1) == true and  

doPlayerTakeItem(cid,2189,1) == true and doPlayerTakeItem(cid,2190,1) == true and  

doPlayerTakeItem(cid,2191,1) == true and doPlayerTakeItem(cid,5904,10) == true and  

doPlayerTakeItem(cid,2193,20) == true and doPlayerTakeItem(cid,5809,1) == true then 
    			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                            doPlayerAddOutfit(cid, 138, 1) 
                             

setPlayerStorageValue(cid,50001,1) 
                        end 
                    else 
                        selfSay(addon_have_already, cid) 
                    end 
                else 
                    selfSay(addon_have_not_items, cid) 
                end 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second summoner addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerSex(cid) == 1 then 
                    if getPlayerItemCount(cid,5894) >= 70 and  

getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and  

getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and  

getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and  

getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then 
                        selfSay('Did you bring me 70 bat wings,  20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60  lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts?', cid) 
                        talk_state = 10 
                    else 
                        selfSay('I need 70 bat wings, 20 red  pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard  scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts, to give you the  second summoner addon. Come back when you have it.', cid) 
                        talk_state = 0 
                    end 
                elseif getPlayerSex(cid) == 0 then 
                    if getPlayerItemCount(cid,5903) >= 1 then 
                        selfSay('Did you bring me the  Ferumbrass\' hat?', cid) 
                        talk_state = 10 
                    else 
                        selfSay('I need the famous Ferumbrass\'  hat, to give you the second summoner addon. Come back when you have it.', cid) 
                        talk_state = 0 
                    end 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 10 then 
            talk_state = 0 
            if getPlayerSex(cid) == 1 then 
                if getPlayerItemCount(cid,5894) >= 70 and  

getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and  

getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and  

getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and  

getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then 
                    addon = getPlayerStorageValue(cid,50002) 
                    if addon == -1 then 
                        if doPlayerTakeItem(cid,5894,70) and  

doPlayerTakeItem(cid,5911,20) and doPlayerTakeItem(cid,5883,40) and  

doPlayerTakeItem(cid,5922,35) and doPlayerTakeItem(cid,5886,10) and  

doPlayerTakeItem(cid,5881,60) and doPlayerTakeItem(cid,5882,40) and  

doPlayerTakeItem(cid,5904,15) and doPlayerTakeItem(cid,5905,30) then 
    			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                            doPlayerAddOutfit(cid, 133, 2) 
                             

setPlayerStorageValue(cid,50002,1) 
                        end 
                    else 
                        selfSay(addon_have_already, cid) 
                    end 
                else 
                    selfSay(addon_have_not_items, cid) 
                end 
            elseif getPlayerSex(cid) == 0 then 
                if getPlayerItemCount(cid,5903) >= 1 then 
                    addon = getPlayerStorageValue(cid,50002) 
                    if addon == -1 then 
                        if doPlayerTakeItem(cid,5903,1) == true then 
    			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                            doPlayerAddOutfit(cid, 138, 2) 
                             

setPlayerStorageValue(cid,50002,1) 
                        end 
                    else 
                        selfSay(addon_have_already, cid) 
                    end 
                else 
                    selfSay(addon_have_not_items, cid) 
                end 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first barbarian addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5884) >= 1 and  

getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5911) >= 50 and  

getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5886) >= 10 then 
                    selfSay('Did you bring me the fighting spirit,  the warrior\'s sweat, 50 red pieces of cloth, 50 green pieces of cloth and 10 spider silk  yarns?', cid) 
                    talk_state = 11 
                else 
                    selfSay('I need fighting spirit, warrior\'s  sweat, 50 red pieces of cloth, 50 green pieces of cloth and 10 spider silk yarns, to give  you the first barbarian addon. Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 11 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5884) >= 1 and  

getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5911) >= 50 and  

getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5886) >= 10 then 
                addon = getPlayerStorageValue(cid,60001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5884,1) == true and  

doPlayerTakeItem(cid,5885,1) == true and doPlayerTakeItem(cid,5911,50) == true and  

doPlayerTakeItem(cid,5910,50) == true and doPlayerTakeItem(cid,5886,10) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 143, 2) 
                        doPlayerAddOutfit(cid, 147, 2) 
                        setPlayerStorageValue(cid,60001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second barbarian addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5880) >= 100 and  

getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5893) >= 50 and  

getPlayerItemCount(cid,5876) >= 50 then 
                    selfSay('Did you bring me 100 iron ore, 1 chunk  of crude iron, 50 behemoth fangs and 50 lizard leathers?', cid) 
                    talk_state = 12 
                else 
                    selfSay('I need 100 iron ore, 1 chunk of crude  iron, 50 behemoth fangs and 50 lizard leathers, to give you the second barbarian addon.  Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 12 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5880) >= 100 and  

getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5893) >= 50 and  

getPlayerItemCount(cid,5876) >= 50 then 
                addon = getPlayerStorageValue(cid,60002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5880,100) == true and  

doPlayerTakeItem(cid,5892,1) == true and doPlayerTakeItem(cid,5893,50) == true and  

doPlayerTakeItem(cid,5876,50) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 143, 1) 
                        doPlayerAddOutfit(cid, 147, 1) 
                        setPlayerStorageValue(cid,60002,1) 
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
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
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
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second druid addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5937) >= 1 and  

getPlayerItemCount(cid,5938) >= 1 and getPlayerItemCount(cid,5906) >= 100 and  

getPlayerItemCount(cid,5942) >= 1 and getPlayerItemCount(cid,5940) >= 1 then 
                    selfSay('Did you bring me a Botanist container, Water horse, 100 demon dusts, a blessed wooden stake and Ceiron\'s  wolf tooth chain?', cid) 
                    talk_state = 14 
                else 
                    selfSay('I need a Botanist container,  water horse, 100 demon dusts, a blessed wooden stake and Ceiron\'s wolf  tooth chain, to give you the second druid addon. Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 14 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5937) >= 1 and  

getPlayerItemCount(cid,5938) >= 1 and getPlayerItemCount(cid,5906) >= 100 and  

getPlayerItemCount(cid,5942) >= 1 and getPlayerItemCount(cid,5940) >= 1 then 
                addon = getPlayerStorageValue(cid,70002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5937,1) == true and  

doPlayerTakeItem(cid,5938,1) == true and doPlayerTakeItem(cid,5906,100) == true and  

doPlayerTakeItem(cid,5942,1) == true and doPlayerTakeItem(cid,5940,1) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 144, 2) 
                        doPlayerAddOutfit(cid, 148, 2) 
                        setPlayerStorageValue(cid,70002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first nobleman addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if player_money >= 150000 then 
                    selfSay('Did you bring me 150000 gold coins?', cid) 
                    talk_state = 15 
                else 
                    selfSay('I need 150000 gold coins, to give you  the first nobleman addon. Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 15 then 
            talk_state = 0 
            if player_money >= 150000 then 
                addon = getPlayerStorageValue(cid,80001) 
                if addon == -1 then 
                    if doPlayerRemoveMoney(cid,150000) then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 132, 1) 
                        doPlayerAddOutfit(cid, 140, 1) 
                        setPlayerStorageValue(cid,80001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second nobleman addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if player_money >= 150000 then 
                    selfSay('Did you bring me 150000 gold coins?', cid) 
                    talk_state = 16 
                else 
                    selfSay('I need 150000 gold coins, to give you  the second nobleman addon. Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 16 then 
            talk_state = 0 
            if player_money >= 150000 then 
                addon = getPlayerStorageValue(cid,80002) 
                if addon == -1 then 
                    if doPlayerRemoveMoney(cid,150000) then
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 132, 2) 
                        doPlayerAddOutfit(cid, 140, 2) 
                        setPlayerStorageValue(cid,80002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first oriental addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5945) >= 1 then 
                    selfSay('Did you bring me the mermaid comb?', cid) 
                    talk_state = 17 
                else 
                    selfSay('I need a mermaid comb, to give you the  first oriental addon. Come back when you have it.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 17 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5945) >= 1 then 
                addon = getPlayerStorageValue(cid,90001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5945,1) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 146, 1) 
                        doPlayerAddOutfit(cid, 150, 1) 
                        setPlayerStorageValue(cid,90001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second oriental addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5883) >= 100 and  

getPlayerItemCount(cid,5895) >= 100 and getPlayerItemCount(cid,5891) >= 2 and  

getPlayerItemCount(cid,5912) >= 100 then 
                    selfSay('Did you bring me 100 ape furs, 100 fish  fins, 2 enchanted chicken wings and 100 blue pieces of cloth?', cid) 
                    talk_state = 18 
                else 
                    selfSay('I need 100 ape furs, 100 fish fins, 2  enchanted chicken wings and 100 blue pieces of cloth, to give you the second oriental  addon. Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 18 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5883) >= 100 and  

getPlayerItemCount(cid,5895) >= 100 and getPlayerItemCount(cid,5891) >= 2 and  

getPlayerItemCount(cid,5912) >= 100 then 
                addon = getPlayerStorageValue(cid,90002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5883,100) == true and  

doPlayerTakeItem(cid,5895,100) == true and doPlayerTakeItem(cid,5891,2) == true and  

doPlayerTakeItem(cid,5912,100) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 146, 2) 
                        doPlayerAddOutfit(cid, 150, 2) 
                        setPlayerStorageValue(cid,90002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first warrior addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5925) >= 100 and  

getPlayerItemCount(cid,5899) >= 100 and getPlayerItemCount(cid,5884) >= 1 and  

getPlayerItemCount(cid,5919) >= 1 then 
                    selfSay('Did you bring me 100 hardened bones, 100  turtle shells, fighting spirit and a dragon claw?', cid) 
                    talk_state = 19 
                else 
                    selfSay('I need 100 hardened bones, 100 turtle  shells, fighting spirit and a dragon claw, to give you the first warrior addon. Come back  when you have it.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 19 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5925) >= 100 and  

getPlayerItemCount(cid,5899) >= 100 and getPlayerItemCount(cid,5884) >= 1 and  

getPlayerItemCount(cid,5919) >= 1 then 
                addon = getPlayerStorageValue(cid,100001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5925,100) == true and  

doPlayerTakeItem(cid,5899,100) == true and doPlayerTakeItem(cid,5884,1) == true and  

doPlayerTakeItem(cid,5919,1) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 134, 1) 
                        doPlayerAddOutfit(cid, 142, 1) 
                        setPlayerStorageValue(cid,100001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second warrior addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5887) >= 1 and  

getPlayerItemCount(cid,5880) >= 100 then 
                    selfSay('Did you bring me 100 iron ores and royal  steel?', cid) 
                    talk_state = 20 
                else 
                    selfSay('I need 100 iron ores and royal steel, to  give you the second warrior addon. Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 20 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5887) >= 1 and  

getPlayerItemCount(cid,5880) >= 100 then 
                addon = getPlayerStorageValue(cid,100002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5887,1) == true and  

doPlayerTakeItem(cid,5880,100) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 134, 2) 
                        doPlayerAddOutfit(cid, 142, 2) 
                        setPlayerStorageValue(cid,100002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first wizard addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,2488) >= 1 and  

getPlayerItemCount(cid,2123) >= 1 and getPlayerItemCount(cid,2492) >= 1 and  

getPlayerItemCount(cid,2536) >= 1 then 
                    selfSay('Did you bring me a medusa shield, a  dragon scale mail, a ring of the sky and crown legs?', cid) 
                    talk_state = 21 
                else 
                    selfSay('I need a medusa shield, a dragon scale  mail, a ring od the sky and crown legs, to give you the first wizard addon. Come back  when you have it.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 21 then 
            talk_state = 0 
            if getPlayerItemCount(cid,2488) >= 1 and  

getPlayerItemCount(cid,2123) >= 1 and getPlayerItemCount(cid,2492) >= 1 and  

getPlayerItemCount(cid,2536) >= 1 then 
                addon = getPlayerStorageValue(cid,110001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,2488,1) == true and  

doPlayerTakeItem(cid,2123,1) == true and doPlayerTakeItem(cid,2492,1) == true and  

doPlayerTakeItem(cid,2536,1) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 145, 2) 
                        doPlayerAddOutfit(cid, 149, 2) 
                        setPlayerStorageValue(cid,110001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second wizard addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5922) >= 50 and  

getPlayerStorageValue(cid,110001) then 
                    selfSay('Did you bring me 50 holy orchids?', cid) 
                    talk_state = 22 
                else 
                    selfSay('I need 50 holy orchids to give you the second wizard addon. Come back when you  have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 22 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5922) >= 50 then 
                addon = getPlayerStorageValue(cid,110002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5922,50) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 145, 1) 
                        doPlayerAddOutfit(cid, 149, 1) 
                        setPlayerStorageValue(cid,110002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first assassin addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5898) >= 30 and  

getPlayerItemCount(cid,5882) >= 10 and getPlayerItemCount(cid,5881) >= 30 and  

getPlayerItemCount(cid,5895) >= 20 and getPlayerItemCount(cid,5905) >= 20 and  

getPlayerItemCount(cid,5906) >= 10 and getPlayerItemCount(cid,5885) >= 1 then 
                    selfSay('Did you bring me 30 beholder eyes, 10  red dragon scales, 30 lizard scales, 20 fish fins, 20 vampire dusts, 10 demon dusts and  Warrior\'s sweat?', cid) 
                    talk_state = 23 
                else 
                    selfSay('I need 30 beholder eyes, 10 red dragon  scales, 30 lizard scales, 20 fish fins, 20 vampire dusts, 10 demon dusts and Warrior\'s  sweat, to give you the first assassin addon. Come back when you have it.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 23 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5898) >= 30 and  

getPlayerItemCount(cid,5882) >= 10 and getPlayerItemCount(cid,5881) >= 30 and  

getPlayerItemCount(cid,5895) >= 20 and getPlayerItemCount(cid,5905) >= 20 and  

getPlayerItemCount(cid,5906) >= 10 and getPlayerItemCount(cid,5885) >= 1 then 
                addon = getPlayerStorageValue(cid,120001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5898,30) == true and  

doPlayerTakeItem(cid,5882,10) == true and doPlayerTakeItem(cid,5881,30) == true and  

doPlayerTakeItem(cid,5895,20) == true and doPlayerTakeItem(cid,5905,20) == true and  

doPlayerTakeItem(cid,5906,10) == true and doPlayerTakeItem(cid,5885,1) then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 152, 1) 
                        doPlayerAddOutfit(cid, 156, 1) 
                        setPlayerStorageValue(cid,120001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second assassin addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5909) >= 50 and  

getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5911) >= 50 and  

getPlayerItemCount(cid,5912) >= 50 and getPlayerItemCount(cid,5913) >= 50 and  

getPlayerItemCount(cid,5914) >= 50 and getPlayerItemCount(cid,5886) >= 10 then 
                    selfSay('Did you bring me 50 blue piece of cloth,  50 green piece of cloth, 50 red piece of cloth, 50 brown piece of cloth, 50 yellow piece  of cloth, 50 white piece of cloth and 10 spider silk yarns?', cid) 
                    talk_state = 24 
                else 
                    selfSay('I need 50 blue piece of cloth, 50 green  piece of cloth, 50 red piece of cloth, 50 brown piece of cloth, 50 yellow piece of cloth,  50 white piece of cloth and 10 spider silk yarns, to give you the second assassin addon.  Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 24 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5909) >= 50 and  

getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5911) >= 50 and  

getPlayerItemCount(cid,5912) >= 50 and getPlayerItemCount(cid,5913) >= 50 and  

getPlayerItemCount(cid,5914) >= 50 and getPlayerItemCount(cid,5886) >= 10 then 
                addon = getPlayerStorageValue(cid,120002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5909,50) == true and  

doPlayerTakeItem(cid,5910,50) == true and doPlayerTakeItem(cid,5911,50) == true and  

doPlayerTakeItem(cid,5912,50) == true and doPlayerTakeItem(cid,5913,50) == true and  

doPlayerTakeItem(cid,5914,50) == true and doPlayerTakeItem(cid,5886,10) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 152, 2) 
                        doPlayerAddOutfit(cid, 156, 2) 
                        setPlayerStorageValue(cid,120002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first beggar addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5883) >= 100 and player_money  

>= 20000 then 
                    selfSay('Did you bring me 100 ape furs and 20000  gold coins?', cid) 
                    talk_state = 25 
                else 
                    selfSay('I need 100 ape furs and 20000 gold  coins, to give you the first beggar addon. Come back when you have it.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 25 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5883) >= 100 and player_money >= 20000  

then 
                addon = getPlayerStorageValue(cid,130001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5883,100) == true and  

pay(cid,20000) then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 153, 1) 
                        doPlayerAddOutfit(cid, 157, 1) 
                        setPlayerStorageValue(cid,130001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second beggar addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,6107) >= 1 then 
                    selfSay('Did you bring me Simon\'s favourite  staff?', cid) 
                    talk_state = 26 
                else 
                    selfSay('I need Simon\'s favourite staff, to give  you the second beggar addon. Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 26 then 
            talk_state = 0 
            if getPlayerItemCount(cid,6107) >= 1 then 
                addon = getPlayerStorageValue(cid,130002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,6107,1) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 153, 2) 
                        doPlayerAddOutfit(cid, 157, 2) 
                        setPlayerStorageValue(cid,130002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first pirate addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,6126) >= 100 and  

getPlayerItemCount(cid,6097) >= 100 and getPlayerItemCount(cid,6098) >= 100 then 
                    selfSay('Did you bring me 100 eye patches, 100  peg legs and 100 hooks?', cid) 
                    talk_state = 27 
                else 
                    selfSay('I need 100 eye patches, 100 peg legs and  100 hooks, to give you the first pirate addon. Come back when you have it.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 27 then 
            talk_state = 0 
            if getPlayerItemCount(cid,6126) >= 100 and  

getPlayerItemCount(cid,6097) >= 100 and getPlayerItemCount(cid,6098) >= 100 then 
                addon = getPlayerStorageValue(cid,140001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,6126,100) == true and  

doPlayerTakeItem(cid,6097,100) == true and doPlayerTakeItem(cid,6098,100) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 151, 1) 
                        doPlayerAddOutfit(cid, 155, 1) 
                        setPlayerStorageValue(cid,140001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second pirate addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,6099) >= 1 and  

getPlayerItemCount(cid,6100) >= 1 and getPlayerItemCount(cid,6101) >= 1 and  

getPlayerItemCount(cid,6102) >= 1 then 
                    selfSay('Did you bring me Ron the Ripper\'s  sabre, Deadeye Devious\' eye patch, Lethal Lissy\'s shirt, Brutus Bloodbeard\'s hat?', cid) 
                    talk_state = 28 
                else 
                    selfSay('I need Ron the Ripper\'s sabre, Deadeye  Devious\' eye patch, Lethal Lissy\'s shirt, Brutus Bloodbeard\'s hat, to give you the  second pirate addon. Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 28 then 
            talk_state = 0 
            if getPlayerItemCount(cid,6099) >= 1 and  

getPlayerItemCount(cid,6100) >= 1 and getPlayerItemCount(cid,6101) >= 1 and  

getPlayerItemCount(cid,6102) >= 1 then 
                addon = getPlayerStorageValue(cid,140002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,6099,1) == true and  

doPlayerTakeItem(cid,6100,1) == true and doPlayerTakeItem(cid,6101,1) == true and  

doPlayerTakeItem(cid,6102,1) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 151, 2) 
                        doPlayerAddOutfit(cid, 155, 2) 
                        setPlayerStorageValue(cid,140002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first shaman addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,3955) >= 5 and  

getPlayerItemCount(cid,5015) >= 1 then 
                    selfSay('Did you bring me 5 dworc vodoo dolls and  a mandrake?', cid) 
                    talk_state = 29 
                else 
                    selfSay('I need 5 dworc vodoo dolls and a  mandrake, to give you the first shaman addon. Come back when you have it.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 29 then 
            talk_state = 0 
            if getPlayerItemCount(cid,3955) >= 5 and  

getPlayerItemCount(cid,5015) >= 1 then 
                addon = getPlayerStorageValue(cid,150001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,3955,5) == true and  

doPlayerTakeItem(cid,5015,1) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 154, 1) 
                        doPlayerAddOutfit(cid, 158, 1) 
                        setPlayerStorageValue(cid,150001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second shaman addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,3966) >= 5 and  

getPlayerItemCount(cid,3967) >= 5 then 
                    selfSay('Did you bring me 5 banana staffs and 5  tribal masks?', cid) 
                    talk_state = 30 
                else 
                    selfSay('I need 5 banana staffs and 5 tribal  masks, to give you the second shaman addon. Come back when you have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 30 then 
            talk_state = 0 
            if getPlayerItemCount(cid,3966) >= 5 and  

getPlayerItemCount(cid,3967) >= 5 then 
                addon = getPlayerStorageValue(cid,150002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,3966,5) == true and  

doPlayerTakeItem(cid,3967,5) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 154, 2) 
                        doPlayerAddOutfit(cid, 158, 2) 
                        setPlayerStorageValue(cid,150002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first norseman addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,7290) >= 5  then 

                    selfSay('Did you bring me the 5 shards?', cid) 
                    talk_state = 31 
                else 
                    selfSay('I need 5 shards for the first norseman addon.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 31 then 
            talk_state = 0 
            if getPlayerItemCount(cid,7290) >= 5 then  

                addon = getPlayerStorageValue(cid,160001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,7290,5) == true then 

			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 252, 1) 
                        doPlayerAddOutfit(cid, 251, 1) 
                        setPlayerStorageValue(cid,160001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second norseman addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,7290) >= 10  then 

                    selfSay('Did you bring me the 10 shards?', cid) 
                    talk_state = 32 
                else 
                    selfSay('I need 10 shards for the first norseman addon.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 32 then 
            talk_state = 0 
            if getPlayerItemCount(cid,7290) >= 10 then  

                addon = getPlayerStorageValue(cid,160002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,7290,10) == true then 

			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 252, 2) 
                        doPlayerAddOutfit(cid, 251, 2) 
                        setPlayerStorageValue(cid,160002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first jester addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,7958) >= 10 then 

                    selfSay('Did you bring me 10 jester staff', cid) 
                    talk_state = 33 
                else 
                    selfSay('I need 10 jesters staff for this addon.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 33 then 
            talk_state = 0 
            if getPlayerItemCount(cid,7958) >= 10 then  

                addon = getPlayerStorageValue(cid,170001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,7958,10) == true then 

			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 270, 1) 
                        doPlayerAddOutfit(cid, 273, 1) 
                        setPlayerStorageValue(cid,170001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second jester addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,7957) >= 10 then 

                    selfSay('Did you bring me 10 jester Hats?', cid) 
                    talk_state = 34 
                else 
                    selfSay('I need 10 jesters Hats for this addon.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 34 then 
            talk_state = 0 
            if getPlayerItemCount(cid,7957) >= 10 then  

                addon = getPlayerStorageValue(cid,170002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,7957,10) == true then 

			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 270, 2) 
                        doPlayerAddOutfit(cid, 273, 2) 
                        setPlayerStorageValue(cid,170002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first nightmare addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,2496) >= 1 then 

                    selfSay('Did you bring me the Horned helmet?', cid) 
                    talk_state = 35 
                else 
                    selfSay('I need a Horned Helmet for this addon.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 35 then 
            talk_state = 0 
            if getPlayerItemCount(cid,2496) >= 1 then  

                addon = getPlayerStorageValue(cid,180001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,2496,1) == true then 

			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 269, 1) 
                        doPlayerAddOutfit(cid, 268, 1) 
                        setPlayerStorageValue(cid,180001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second nightmare addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,6391) >= 1 and getPlayerItemCount(cid,2414) >= 1 then 

                    selfSay('Did you bring me the Nightmare Shield and Dragon Lance?', cid) 
                    talk_state = 36 
                else 
                    selfSay('I need a Nightmare Shield and a Dragon Lance for this addon.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 36 then 
            talk_state = 0 
            if getPlayerItemCount(cid,6391) >=1 and getPlayerItemCount(cid,2414) >= 1 then  

                addon = getPlayerStorageValue(cid,180002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,6391,1) and doPlayerTakeItem(cid,2414,1) == true then 

			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 269, 2) 
                        doPlayerAddOutfit(cid, 268, 2) 
                        setPlayerStorageValue(cid,180002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 
------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first brotherhood addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,2351) >= 1 then 

                    selfSay('Did you bring me the cobrafang dagger?', cid) 
                    talk_state = 37 
                else 
                    selfSay('I need a Cobrafang dagger for this addon.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 37 then 
            talk_state = 0 
            if getPlayerItemCount(cid,2351) >= 1 then  

                addon = getPlayerStorageValue(cid,190001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,2351,1) == true then 

			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 278, 1) 
                        doPlayerAddOutfit(cid, 279, 1) 
                        setPlayerStorageValue(cid,190001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 


------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second brotherhood addon') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,6500) >= 1000 then 

                    selfSay('Do you bring me 1000 demonic essences?', cid) 
                    talk_state = 41 
                else 
                    selfSay('I need 1000 demonic essences for this addon.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 41 then 
            talk_state = 0 
            if getPlayerItemCount(cid,6500) >= 1000 then  

                addon = getPlayerStorageValue(cid,240001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,6500,1000) == true then 

			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 278, 2) 
                        doPlayerAddOutfit(cid, 279, 2) 
                        setPlayerStorageValue(cid,240001,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 

------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'second demon hunter') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,2128) >= 1 then

                    selfSay('Did you bring me the crown', cid) 
                    talk_state = 39
                else 
                    selfSay('I need a crown.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 39 then 
            talk_state = 0 
            if getPlayerItemCount(cid,2128) >= 1 then  

                addon = getPlayerStorageValue(cid,210002) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,2128,1) == true then 

			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 288, 2) 
                        doPlayerAddOutfit(cid, 289, 2) 
                        setPlayerStorageValue(cid,210002,1) 
                    end 
                else 
                    selfSay(addon_have_already, cid) 
                end 
            else 
                selfSay(addon_have_not_items, cid) 
            end 

------------------------------------------------ addon ------------------------------------------------ 
        elseif msgcontains(msg, 'first demon hunter') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5886) >= 10 and  

getPlayerItemCount(cid,2656) >= 1 then 
                    selfSay('Did you bring me 10 spool of yarn and a blue robe?', cid) 
                    talk_state = 40 
                else 
                    selfSay('I need 10 spool of yarn and 1 blue robe. Come back when you  have them.', cid) 
                    talk_state = 0 
                end 
            else 
                selfSay(addon_need_premium, cid) 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 40 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5886) >= 10 and  

getPlayerItemCount(cid,2656) >= 1 then 
                addon = getPlayerStorageValue(cid,210001) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,2656,1) == true and doPlayerTakeItem(cid,5886,10) == true then 
			doSendMagicEffect(posicion,12)                        selfSay(addon_give, cid) 
                        doPlayerAddOutfit(cid, 288, 1) 
                        doPlayerAddOutfit(cid, 289, 1) 
                        setPlayerStorageValue(cid,210001,1) 
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