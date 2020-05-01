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

	local rows = db.getResult("SELECT `captain` FROM `equipos` WHERE `captain` = " .. getPlayerGUID(cid) .. ";") 
	if(rows:getID() ~= -1) then
	local data = rows:getID(true)
	end

	local rows2 = db.getResult("SELECT `captain` FROM `equipos` WHERE `captain` = " .. getPlayerGUID(cid) .. ";") 
	if(rows2:getID() ~= -1) then
	local data2 = rows2:getID(true)
	end


capitan = getPlayerName(cid)


	if msgcontains(msg, 'equipo') then
		if isPlayer(cid) then
				selfSay('Como le quieres poner a tu equipo?.')
	           		 talk_state = 1
		elseif (rows:getID() ~= -1) then
		selfSay('Tu ya tienes un equipo!.')
	        talk_state = 0
		end

        elseif talk_state == 1 then 
		equipo = msg

	
	local rows3 = db.getResult("SELECT `name` FROM `equipos` WHERE `name` = " .. db.escapeString(equipo) .. ";") 
			if(rows3:getID() ~= -1) then
			local data3 = rows3:getID(true)
				end
			if (rows3:getID() ~= -1) then
					selfSay('Ese equipo ya existe.')
				talk_state = 0
 			else
			selfSay('y Quien quieres que sea tu delantero?.')
							talk_state = 2
                    end

elseif talk_state == 2 then 
		delantero = msg

	local delanteraso = db.getResult("SELECT `name` FROM `players` WHERE `name` = " .. db.escapeString(delantero) .. ";") 
			if(delanteraso:getID() ~= -1) then
			local delanterdata = delanteraso:getID(true)
				end
			if (delanteraso:getID() ~= -1) then
	
	local rows4 = db.getResult("SELECT `name` FROM `equipos` WHERE `captain` = " .. db.escapeString(delantero) .. ";") 
			if (rows4:getID() ~= -1) then
					selfSay('Este jugador es capitan de un equipo, no puede estar en otro equipo.')
				talk_state = 0

 			 			else
			selfSay('y Quien quieres que sea tu defensa?.')
							talk_state = 3
                    end
			else
			selfSay('Este jugador no existe.')
			talk_state = 0
			end




elseif talk_state == 3 then 
		defensa = msg

	local defensaso = db.getResult("SELECT `name` FROM `players` WHERE `name` = " .. db.escapeString(defensa) .. ";") 
			if(defensaso:getID() ~= -1) then
			local defensadata = delanteraso:getID(true)
				end
			if (defensaso:getID() ~= -1) then
	
		local rows5 = db.getResult("SELECT `name` FROM `equipos` WHERE `captain` = " .. db.escapeString(defensa) .. ";") 
			if(rows5:getID() ~= -1) then
			local data5 = rows5:getID(true)
				end
			if (rows5:getID() ~= -1) then
					selfSay('Este jugador es capitan de un equipo, no puede estar en otro equipo.')
				talk_state = 0
 			else
			selfSay('Estas seguro de que tu equipo se llamara '..equipo..', el capitan seras tu, el delantero '..delantero..' y la defensa '..defensa..'?.')
							talk_state = 4
                    end
			else
			selfSay('Este jugador no existe.')
			talk_state = 0
			end

	elseif msgcontains(msg, 'yes') and talk_state == 4 then
	db.executeQuery("INSERT INTO `equipos` (`name`, `captain`, `delantero`, `defensa`) VALUES (" .. db.escapeString(equipo) .. ", " ..db.escapeString(capitan)  .. ", " .. db.escapeString(delantero) .. ", " .. db.escapeString(defensa) .. ");")
		selfSay('El equipo '..equipo..', a sido creado!.')

        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
            selfSay('Ni modo!.')
            talk_state = 0
end

    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())