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

local player1pos = {x="1121", y="991", z="7"}
local player2pos = {x="1121", y="992", z="7"}
local player3pos = {x="1121", y="993", z="7"}
local player4pos = {x="1121", y="996", z="7"}
local player5pos = {x="1121", y="997", z="7"}
local player6pos = {x="1121", y="998", z="7"}

local player1newpos = {x="1133", y="991", z="7"}
local player2newpos = {x="1133", y="992", z="7"}
local player3newpos = {x="1133", y="993", z="7"}
local player4newpos = {x="1133", y="996", z="7"}
local player5newpos = {x="1133", y="997", z="7"}
local player6newpos = {x="1133", y="998", z="7"}

            local player1 = getTopCreature(player1pos)
            local player2 = getTopCreature(player2pos)
            local player3 = getTopCreature(player3pos)
            local player4 = getTopCreature(player4pos)
            local player5 = getTopCreature(player5pos)
            local player6 = getTopCreature(player6pos)

local juegostorage = 13587
local captainstorage = 13588

	local rows = db.getResult("SELECT `captain` FROM `equipos` WHERE `captain` = " .. getPlayerGUID(cid) .. ";") 
	if(rows:getID() ~= -1) then
	local data = rows:getID(true)
	end

	local rows2 = db.getResult("SELECT `captain` FROM `equipos` WHERE `captain` = " .. getPlayerGUID(player4.uid) .. ";") 
	if(rows2:getID() ~= -1) then
	local data2 = rows2:getID(true)
	end





	if msgcontains(msg, 'equipo') then
		if isPlayer(player1.uid) == TRUE and isPlayer(player2.uid) == TRUE and isPlayer(player3.uid) then
				selfSay('Como le quieres poner a tu equipo?.')
	           		 talk_state = 1
		else
		selfSay('No hay suficientes jugadores para crear tu equpo!.')
	        talk_state = 0
		end

	elseif msgcontains(msg, 'partido') then
			if isPlayer(player1.uid) == TRUE and isPlayer(player2.uid) == TRUE and isPlayer(player3.uid) and isPlayer(player4.uid) and isPlayer(player5.uid) and isPlayer(player6.uid) then
			selfSay('Desean jugar un partido?.')
			talk_state = 2
				else
				selfSay('No hay suficiente gente para jugar un partido, o tal vez no estan inscritos en un equipo.')
            talk_state = 0
				end	


        elseif talk_state == 1 then 
		equipo = msg

	
			captainid = getPlayerGUID(cid)
			delanteroid = getPlayerGUID(player2.uid)
			defensaid = getPlayerGUID(player3.uid)
			numeraso = 1
			if (rows:getID() ~= -1) then
					selfSay('Tu ya tienes un equipo.')
				talk_state = 0
 			else
				db.executeQuery("INSERT INTO `equipos` (`name`, `captain`, `delantero`, `defensa`) VALUES (" .. db.escapeString(equipo) .. ", " .. db.escapeString(captainid) .. ", " .. db.escapeString(delanteroid) .. ", " .. db.escapeString(defensaid) .. ");")
			selfSay('El  equipo ' .. equipo .. ' ah sido creado, a jugar!!.')
							talk_state = 0
                    end
		



elseif talk_state == 2 and msgcontains (msg, 'yes') or msgcontains (msg, 'si') then
			if isPlayer(player1.uid) == TRUE and isPlayer(player2.uid) == TRUE and isPlayer(player3.uid) and isPlayer(player4.uid) and isPlayer(player5.uid) and isPlayer(player6.uid) then
	talk_state = 0
            selfSay('Que comienze el partido!.')
		doTeleportThing(player1.uid, player1newpos)
		doTeleportThing(player2.uid, player2newpos)
		doTeleportThing(player3.uid, player3newpos)
		doTeleportThing(player4.uid, player4newpos)
		doTeleportThing(player5.uid, player5newpos)
		doTeleportThing(player6.uid, player6newpos)
else
	selfSay('no hay suficientes chavos')
end



          
        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
            selfSay('Ni modo!.')
            talk_state = 0
end
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())