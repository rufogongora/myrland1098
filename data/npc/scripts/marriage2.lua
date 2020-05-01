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

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local mstorage = 14000
local propstorage = 14001
local casado = getPlayerStorageValue(cid, mstorage)
local propuesto = getPlayerStorageValue(cid, propstorage)
local name = getPlayerName(cid) 
local sex = getPlayerSex(cid)

	--- Solo hombres
	if msgcontains(msg, 'proponer') then
	 if getPlayerSex(cid) == 1 then
		if casado or propuesto == -1 then
            selfSay('Ahh!, el gran dia. A quien le vas proponer matrimonio?', cid)
            talk_state = 1
		else
		selfSay('Tu ya estas casado!, o ya le propusiste matrimonio a alguien.', cid)
	            talk_state = 0
		end
			else
		selfSay('Solo los hombres pueden proponer matrimonio.', cid)
	end
		
		

		-- SOlo hombres
        elseif talk_state == 1 then 
		
                  pname = msg
				  planame = getPlayerByNameWildcard(msg)
					if playerExists(planame) then
						if getPlayerStorageValue(cid, 14001) == -1 then
							if getPlayerSex(cid) == (getPlayerSex(planame)) then
							selfSay('Largo de aqui homosexual.', cid)
						else
						selfSay('Le quieres proponer matrimonio a ' .. pname .. '?.', cid)
						talk_state = 2
						end
					else
						selfSay('Tu ya has propuesto matrimonio.', cid)
						talk_state = 0
						end
				else
				selfSay('Lo siento pero esa persona no existe.', cid)
				talk_state = 0
			end

			-- Solo hombres
			elseif msgcontains(msg, 'si') and talk_state == 2 then
				proposer = getPlayerName(cid)
				propando = getPlayerName(planame)
				if getPlayerStorageValue(planame, 14001) == -1 then
					if 	getDistanceBetween((getPlayerPosition(cid)), (getPlayerPosition(planame))) < 3 then
						if getPlayerStorageValue(cid, 14000) == -1 then
							if getPlayerStorageValue(planame, 14000) == -1 then
							selfSay('Ok.', cid)
								setPlayerStorageValue(cid, propstorage, 1)
								setPlayerStorageValue(planame, propstorage, 1)
							db.executeQuery("INSERT INTO `marriage_props` (`proposer`, `propando`) VALUES (" .. db.escapeString(proposer) .. ", " .. db.escapeString(propando) .. ");")
							talk_state = 0
							else
							selfSay('Tu pareja ya esta casada', cid)
							talk_state = 0
							end
							else
							selfSay('Tu ya estas casado', cid)
							talk_state = 0
							end
						else
						selfSay('Tienes que estar mas cerca de tu pareja', cid)
						talk_state = 0
						end
					else
					selfSay('Ese player no existe', cid)
					talk_state = 0
				end
				
				
				--- SOlo mujeres
				elseif msgcontains(msg, 'acepto') then
					if getPlayerSex(cid) == 0 then
						if getPlayerStorageValue(cid, propstorage) == -1 then
								selfSay('Linda dama, no le han propuesto matrimonio',cid)
								else

								selfSay('Te quieres casar con asdf .', cid)
								end
							else
							selfSay('Lo siento joven, pero usted no puede aceptar matrimonio',cid)
						end								
				end
				
				
				
				
				end
				
				
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

		