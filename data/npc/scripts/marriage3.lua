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
local mstorage = 14000
local casado = getPlayerStorageValue(cid, mstorage)
local name = getPlayerName(cid) 
local rows = db.getResult("SELECT `proposer` FROM `marriage_prop` WHERE `propando` = " .. db.escapeString(name) .. ";")


	if msgcontains(msg, 'proponer') then
		if casado == -1 then
            selfSay('Ahh!, el gran dia. A quien le vas proponer matrimonio?')
            talk_state = 1
		else
		selfSay('Tu ya estas casado!, maldito enfermo.')
	            talk_state = 0
		end

	elseif msgcontains(msg, 'acepto') then
			if getPlayerStorageValue(cid, mstorage) > 0 then
			selfSay('Menciona su nombre por ultima vez.')
			talk_state = 2
				else
				selfSay('Nisiquiera te han propuesto matrimonio.')
            talk_state = 0
				end

	elseif msgcontains(msg, 'divorcio') then
			if getPlayerStorageValue(cid, mstorage) > 0 then
			selfSay('estas seguro de que te quieres divorciar?.')
			talk_state = 3
				else
				selfSay('Nisiquiera estas casado, maldito fumado.')
		            talk_state = 0
				end
	


	elseif msgcontains(msg, 'remover') then
			if getPlayerStorageValue(cid, mstorage) > 0 then
			selfSay('Quieres remover tu storage value?.')
			talk_state = 4
				else
				selfSay('No tienes ese storage Value Usado, puedes casarte libremente.')
		            talk_state = 0
				end
	


        elseif talk_state == 1 then 
		pname = msg

	
			proposito = getPlayerGUID(pname)
			otrocasado = getPlayerStorageValue(proposito, mstorage)
			talk_state = 0
         			if otrocasado == -1 then	
				db.executeQuery("INSERT INTO `marriage_propi` (`proposer`, `propando`) VALUES (" .. getPlayerGUID(cid) .. ", " .. db.escapeString(proposito) .. ");")
				setPlayerStorageValue(cid, mstorage, 1)
				setPlayerStorageValue(pname, mstorage, 1)
			selfSay('Le has propuesto matrimonio a ' .. pname .. '.')
                    end
		


        elseif talk_state == 2 then 
		pname = msg
			otrocasado = getPlayerStorageValue(proposito, mstorage)
	    		talk_state = 0	
				if otrocasado >= 1 and getPlayerStorageValue(cid, mstorage) >= 1 then
				db.executeQuery("INSERT INTO `marriager` (`proposer`, `propando`) VALUES (" .. getPlayerGUID(cid) .. ", " .. db.escapeString(proposito) .. ");")
				selfSay('Que la Gracia del God de Myrland Los bendiga a los dos, Salud!. VIVAN LOS NOVIOS!.')
                   	 end 

	elseif talk_state == 3  and msgcontains (msg, 'yes') or msgcontains (msg, 'si') then
            if casado == -1 then
	talk_state = 0
            selfSay('Esta, bien. Era de suponerse.')
		pname = msg
		db.executeQuery("DELETE FROM `marriage_propi` WHERE `proposer` = " .. getPlayerGUID(cid) .. " ;")
		setPlayerStorageValue(cid, mstorage, -1)
		else
		selfSay('Pero si nisiquiera te has casado, o propuesto matrimonio a alguien.')
		end

	elseif talk_state == 4  and msgcontains (msg, 'yes')  or msgcontains (msg, 'si') then
            if casado == 1 then
	talk_state = 0
            selfSay('Listo.')
		pname = msg
		db.executeQuery("DELETE FROM `marriage_propi` WHERE `proposer` = " .. getPlayerGUID(cid) .. " ;")
		setPlayerStorageValue(cid, mstorage, -1)
		else
		selfSay('Pero si nisiquiera te has casado, o propuesto matrimonio a alguien.')
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