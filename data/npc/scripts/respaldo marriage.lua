local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if(npcHandler.focus ~= cid) then
        return false
    end
local mstorage = 14000
local casado = getPlayerStorageValue(cid, mstorage)
local name = getPlayerName(cid) 
local rows = db.getResult("SELECT `proposer` FROM `marriage_prop` WHERE `propando` = " .. db.escapeString(name) .. ";")

talk_state = 0


	if msgcontains(msg, 'proponer') then
		if casado == -1 then
            selfSay('Ahh!, el gran dia. A quien le vas proponer matrimonio?')
            talk_state = 1
		else
		selfSay('Tu ya estas casado!, maldito enfermo.')
		end

	elseif msgcontains(msg, 'acepto') then
			if getPlayerStorageValue(cid, mstorage) >= 1 then
			selfSay('Menciona su nombre por ultima vez.')
			talk_state = 2
				else
				selfSay('Nisiquiera te han propuesto matrimonio.')
				end

	elseif msgcontains(msg, 'divorcio') then
			if getPlayerStorageValue(cid, mstorage) >= 1 then
			selfSay('Menciona su nombre por ultima vez.')
			talk_state = 3
				else
				selfSay('Nisiquiera estas casado, maldito fumado.')
				end
	



        elseif talk_state == 1 then 
		pname = msg
			proposito = getCreatureByName(pname)
			otrocasado = getPlayerStorageValue(proposito, mstorage)
			talk_state = 0
         			if otrocasado == -1 then	
				db.executeQuery("INSERT INTO `marriage_prop` (`proposer`, `propando`) VALUES (" .. db.escapeString(name) .. ", " .. db.escapeString(pname) .. ");")
				setPlayerStorageValue(cid, mstorage, 1)
				setPlayerStorageValue(proposito, mstorage, 1)
			selfSay('Le has propuesto matrimonio a ' .. pname .. '.')
                    end


        elseif talk_state == 2 then 
		pname = msg
			otrocasado = getPlayerStorageValue(proposito, mstorage)
	    		talk_state = 0	
				if otrocasado >= 1 and getPlayerStorageValue(cid, mstorage) >= 1 then
				db.executeQuery("INSERT INTO `marriage` (`proposer`, `propando`) VALUES (" .. db.escapeString(name) .. ", " .. db.escapeString(pname) .. ");")
				selfSay('Que la Gracia del God de Myrland Los bendiga a los dos, Salud!. VIVAN LOS NOVIOS!.')
                   	 end 

	elseif talk_state == 3 then
			proposito = getCreatureByName(pname)
			otrocasado = getPlayerStorageValue(proposito, mstorage)
		setPlayerStorageValue(cid, mstorage, 1)
            if otrocasado == -1 and casado == -1 then
	talk_state = 0
            selfSay('Esta, bien. Era de suponerse.')
		pname = msg
		db.executeQuery("DELETE FROM `marriage_prop` WHERE `proposer` = " .. db.escapeString(name) .. " ;")
		setPlayerStorageValue(cid, mstorage, -1)
		setPlayerStorageValue(pname, mstorage, -1)
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