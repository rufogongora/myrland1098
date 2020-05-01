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

        player_gold = getPlayerItemCount(cid,5022)  
        player_money = player_gold 


	if msgcontains(msg, 'tokens') then
        selfSay('Checa en http://www.myrland.org/info.php?act=puntos para saber la lista de premios.')      
-----------Division entre item
      elseif msgcontains(msg, 'aol') then
                     if getPlayerItemCount(cid,5022) >= 10 then 
			if doPlayerTakeItem(cid,5022,10) then
                    doPlayerAddItem(cid,2173,1)
                    selfSay('Here you are')
		end
			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
------------------------------------------------ addon  ------------------------------------------------ 
        elseif msgcontains(msg, 'vip') then 
            if getPlayerPremiumDays(cid) > 0 then 
                if getPlayerItemCount(cid,5022) >= 30 then 
                    selfSay('Me darias 50 donation token por ser un jugador VIP?') 
                    talk_state = 1 
                else 
                    selfSay('Necesito 30 donation tokens.') 
                    talk_state = 0 
                end 
            else 
                selfSay('necesitas ser premium para poder tener VIP') 
                talk_state = 0 
            end 
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') or msgcontains (msg, 'yes') and talk_state == 1 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5022) >= 30 then 
                addon = getPlayerStorageValue(cid,13540) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,5022,30) == 0 then 
                        selfSay('Acabas de convertirte en un jugador VIP!, ahora puedes accesar a las zonas privadas de Myrland!') 
                        setPlayerStorageValue(cid,13540,1) 
                    end 
                else 
                    selfSay('Ya eres un jugador VIP, no necesitas comprarlo de nuevo') 
                end 
            else 
                selfSay('No tienes suficientes tokens') 
            end 
-----------Division entre item
      elseif msgcontains(msg, 'backpack of holding') then
                     if getPlayerItemCount(cid,5022) >= 40 then 
			if doPlayerTakeItem(cid,5022,40) then
                    doPlayerAddItem(cid,2365,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'dragon scale mail') then
                     if getPlayerItemCount(cid,5022) >= 55 then 
			if doPlayerTakeItem(cid,5022,55) then
                    doPlayerAddItem(cid,2492,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'blue robe') then
                     if getPlayerItemCount(cid,5022) >= 30 then 
			if doPlayerTakeItem(cid,5022,30) then
                    doPlayerAddItem(cid,2656,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'blood herb') then
                     if getPlayerItemCount(cid,5022) >= 2 then 
			if doPlayerTakeItem(cid,5022,2) then
                    doPlayerAddItem(cid,2798,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'stuffed dragon') then
                     if getPlayerItemCount(cid,5022) >= 25 then 
			if doPlayerTakeItem(cid,5022,25) then
                    doPlayerAddItem(cid,5791,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'horned helmet') then
                     if getPlayerItemCount(cid,5022) >= 75 then 
			if doPlayerTakeItem(cid,5022,75) then
                    doPlayerAddItem(cid,2496,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'crystal coin') then
                     if getPlayerItemCount(cid,5022) >= 6 then 
			if doPlayerTakeItem(cid,5022,6) then
                    doPlayerAddItem(cid,2160,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'magic plate armor') then
                     if getPlayerItemCount(cid,5022) >= 80 then 
			if doPlayerTakeItem(cid,5022,80) then
                    doPlayerAddItem(cid,2472,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'golden legs') then
                     if getPlayerItemCount(cid,5022) >= 75 then 
			if doPlayerTakeItem(cid,5022,75) then
                    doPlayerAddItem(cid,2470,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'avenger') then
                     if getPlayerItemCount(cid,5022) >= 90 then 
			if doPlayerTakeItem(cid,5022,90) then
                    doPlayerAddItem(cid,6528,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'thunder hammer') then
                     if getPlayerItemCount(cid,5022) >= 90 then 
			if doPlayerTakeItem(cid,5022,90) then
                    doPlayerAddItem(cid,2421,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'arcane staff') then
                     if getPlayerItemCount(cid,2453) >= 90 then 
			if doPlayerTakeItem(cid,2453,90) then
                    doPlayerAddItem(cid,2472,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'soft boots') then
                     if getPlayerItemCount(cid,5022) >= 140 then 
			if doPlayerTakeItem(cid,5022,140) then
                    doPlayerAddItem(cid,6132,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'warlord sword') then
                     if getPlayerItemCount(cid,5022) >= 120 then 
			if doPlayerTakeItem(cid,5022,120) then
                    doPlayerAddItem(cid,2408,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'heavy mace') then
                     if getPlayerItemCount(cid,5022) >= 80 then 
			if doPlayerTakeItem(cid,5022,80) then
                    doPlayerAddItem(cid,2452,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'demon armor') then
                     if getPlayerItemCount(cid,5022) >= 80 then 
			if doPlayerTakeItem(cid,5022,80) then
                    doPlayerAddItem(cid,2494,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'magic sword') then
                     if getPlayerItemCount(cid,5022) >= 90 then 
			if doPlayerTakeItem(cid,5022,90) then
                    doPlayerAddItem(cid,2400,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'queen sceptre') then
                     if getPlayerItemCount(cid,5022) >= 90 then 
			if doPlayerTakeItem(cid,5022,90) then
                    doPlayerAddItem(cid,7410,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'lunar staff') then
                     if getPlayerItemCount(cid,5022) >= 90 then 
			if doPlayerTakeItem(cid,5022,90) then
                    doPlayerAddItem(cid,7424,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'assassin star') then
                     if getPlayerItemCount(cid,5022) >= 20 then 
			if doPlayerTakeItem(cid,5022,20) then
                    doPlayerAddItem(cid,7362,100)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'blue legs') then
                     if getPlayerItemCount(cid,5022) >= 30 then 
			if doPlayerTakeItem(cid,5022,30) then
                    doPlayerAddItem(cid,7730,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'terra mantle') then
                     if getPlayerItemCount(cid,5022) >= 40 then 
			if doPlayerTakeItem(cid,5022,40) then
                    doPlayerAddItem(cid,7884,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'terra legs') then
                     if getPlayerItemCount(cid,5022) >= 35 then 
			if doPlayerTakeItem(cid,5022,35) then
                    doPlayerAddItem(cid,7885,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'terra boots') then
                     if getPlayerItemCount(cid,5022) >= 20 then 
			if doPlayerTakeItem(cid,5022,20) then
                    doPlayerAddItem(cid,7886,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'magma legs') then
                     if getPlayerItemCount(cid,5022) >= 35 then 
			if doPlayerTakeItem(cid,5022,35) then
                    doPlayerAddItem(cid,7894,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'magma boots') then
                     if getPlayerItemCount(cid,5022) >= 20 then 
			if doPlayerTakeItem(cid,5022,20) then
                    doPlayerAddItem(cid,7891,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'castle shield') then
                     if getPlayerItemCount(cid,5022) >= 40 then 
			if doPlayerTakeItem(cid,5022,40) then
                    doPlayerAddItem(cid,2353,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'winged helmet') then
                     if getPlayerItemCount(cid,5022) >= 150 then 
			if doPlayerTakeItem(cid,5022,150) then
                    doPlayerAddItem(cid,2474,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'horned helmet') then
                     if getPlayerItemCount(cid,5022) >= 120 then 
			if doPlayerTakeItem(cid,5022,120) then
                    doPlayerAddItem(cid,2496,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'full helmet of the ancients') then
                     if getPlayerItemCount(cid,5022) >= 110 then 
			if doPlayerTakeItem(cid,5022,110) then
                    doPlayerAddItem(cid,2343,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'golden helmet') then
                     if getPlayerItemCount(cid,5022) >= 200 then 
			if doPlayerTakeItem(cid,5022,200) then
                    doPlayerAddItem(cid,2471,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'ripper lance') then
                     if getPlayerItemCount(cid,5022) >= 90 then 
			if doPlayerTakeItem(cid,5022,90) then
                    doPlayerAddItem(cid,3964,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end	
-----------ADDONS
      elseif msgcontains(msg, 'full demon hunter outfit') then
                     if getPlayerItemCount(cid,5022) >= 350 then 
			if doPlayerTakeItem(cid,5022,350) then
                        doPlayerAddOutfit(cid, 288, 3) 
                        doPlayerAddOutfit(cid, 289, 3) 
                        setPlayerStorageValue(cid,200002,1) 
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Separacion entre addons
      elseif msgcontains(msg, 'full hunter outfit') then
                     if getPlayerItemCount(cid,5022) >= 250 then 
			if doPlayerTakeItem(cid,5022,250) then
                        doPlayerAddOutfit(cid, 129, 3) 
                        doPlayerAddOutfit(cid, 137, 3) 
                        setPlayerStorageValue(cid,200002,1) 
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Separacion entre addons
      elseif msgcontains(msg, 'full barbarian outfit') then
                     if getPlayerItemCount(cid,5022) >= 350 then 
			if doPlayerTakeItem(cid,5022,350) then
                        doPlayerAddOutfit(cid, 143, 3) 
                        doPlayerAddOutfit(cid, 147, 3) 
                        setPlayerStorageValue(cid,200002,1) 
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Separacion entre addons
      elseif msgcontains(msg, 'full summoner outfit') then
                     if getPlayerItemCount(cid,5022) >= 250 then 
			if doPlayerTakeItem(cid,5022,250) then
                        doPlayerAddOutfit(cid, 133, 3) 
                        doPlayerAddOutfit(cid, 141, 3) 
                        setPlayerStorageValue(cid,200002,1) 
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Separacion entre addons
      elseif msgcontains(msg, 'full citizen outfit') then
                     if getPlayerItemCount(cid,5022) >= 80 then 
			if doPlayerTakeItem(cid,5022,80) then
                        doPlayerAddOutfit(cid, 136, 3) 
                        doPlayerAddOutfit(cid, 128, 3) 
                        setPlayerStorageValue(cid,200002,1) 
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Separacion entre addons
      elseif msgcontains(msg, 'full assassin outfit') then
                     if getPlayerItemCount(cid,5022) >= 380 then 
			if doPlayerTakeItem(cid,5022,380) then
                        doPlayerAddOutfit(cid, 156, 3) 
                        doPlayerAddOutfit(cid, 152, 3) 
                        setPlayerStorageValue(cid,200002,1) 
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Separacion entre addons
      elseif msgcontains(msg, 'full wizard outfit') then
                     if getPlayerItemCount(cid,5022) >= 250 then 
			if doPlayerTakeItem(cid,5022,250) then
                        doPlayerAddOutfit(cid, 149, 3) 
                        doPlayerAddOutfit(cid, 145, 3) 
                        setPlayerStorageValue(cid,200002,1) 
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Separacion entre addons
      elseif msgcontains(msg, 'full warrior outfit') then
                     if getPlayerItemCount(cid,5022) >= 250 then 
			if doPlayerTakeItem(cid,5022,250) then
                        doPlayerAddOutfit(cid, 142, 3) 
                        doPlayerAddOutfit(cid, 134, 3) 
                        setPlayerStorageValue(cid,200002,1) 
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
-----------Division entre item
      elseif msgcontains(msg, 'boots of haste') then
                     if getPlayerItemCount(cid,5022) >= 45 then 
			if doPlayerTakeItem(cid,5022,45) then
                    doPlayerAddItem(cid,2195,1)
                    selfSay('Here you are')
		end

			else
				selfSay('Sorry, you do not have enough donation tokens.')
			end
	
	end
	return true
	
end	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())