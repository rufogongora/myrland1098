local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}


function onCreatureAppear(cid)		

		doCreatureSay(getNpcCid(), "Hola, necesitas ayuda?", TALKTYPE_SAY) 
		
		npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)	

		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()
local talk = math.random(1,1000)
	if talk == 1 then
		doCreatureSay(getNpcCid(), "Alguien necesita ayuda?!", TALKTYPE_YELL) 
elseif talk == 50 then
		doCreatureSay(getNpcCid(), "Hola eres nuevo?!", TALKTYPE_YELL)
elseif talk == 35 then
		doCreatureSay(getNpcCid(), "Si tienes alguna pregunta buscame a mi", TALKTYPE_YELL)
elseif talk == 75 then
		doCreatureSay(getNpcCid(), "Bienvenidos a Myrland!", TALKTYPE_YELL)
		
		
	end
npcHandler:onThink()
end


function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end


	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid

        if msgcontains(msg, 'desorientado') then
            selfSay('Si, es tipico aqui en {myrland}, buscas algunos lugares para {cazar}?, o alguna {informacion} en especial?, yo te puedo ayudar.', cid)


        elseif msgcontains(msg, 'ayuda') then
            selfSay('Todos necesitamos ayuda, sin embargo puedes encontrat {tutores} para que te guien.', cid)

        elseif msgcontains(msg, 'cazar') then
            selfSay('Pues al norte del {depot} encontraras unas zonas con algunos monstruos debiles para cazar..', cid)
       
	    elseif msgcontains(msg, 'quest') then
            selfSay('Escuche a {frodo} decir que en la pagina web se encuentran unas guias de quests', cid)
      
	  elseif msgcontains(msg, 'frodo') or msgcontains(msg, 'npc')  then
            selfSay('Los npcs se encuentran cerca de aqui, al oeste', cid)
             
	   
        elseif msgcontains(msg, 'tutores') or msgcontains(msg, 'informacion') then
            selfSay('Si deseas saber mas, visita la pagina del {myrland}, http://myrland.rgongora.com', cid)

        elseif msgcontains(msg, 'myrland') then
            selfSay('Myrland es el lugar donde encuentras, creado por un dios y tu destino es derrotar a su archienemigo.. {zathroth}.', cid)

        elseif msgcontains(msg, 'zathroth') then
            selfSay('Realmente no quisiera hablar de eso.', cid)

        elseif msgcontains(msg, 'rufo') then
            selfSay('Ahh!, el es nuestro creador!, junto a su amigo {martin}.', cid)

        elseif msgcontains(msg, 'martin') then
            selfSay('Ese pelado es un genio para la informatica!, preguntale al {rufo}.', cid)
			
		elseif msgcontains(msg, 'depot') then
            selfSay('Aqui al {norte} se encuentra el depot.', cid)
			
	    elseif msgcontains(msg, 'trainers') then
            selfSay('Los trainers se encuentran bajo el {mercado}, hay 2 zonas aqui en Andicas.', cid)
			
	        elseif msgcontains(msg, 'teleports') then
            selfSay('Aqui no usamos esas {mamadas}.', cid)
			
			        elseif msgcontains(msg, 'mamadas') then
            selfSay('Me das verguenza.', cid)
			
			        elseif msgcontains(msg, 'mercado') then
            selfSay('Es el lugar donde los NPCs se encuentran, esta aproximadamente al {suroeste} de aqui..', cid)
			
			        elseif msgcontains(msg, 'quest') then
            selfSay('Por el momento no tengo misiones para ti.', cid)
			
						        elseif msgcontains(msg, 'verga') then
            selfSay('Sientate bien no te vayas a cansar.', cid)
			
						        elseif msgcontains(msg, 'culo') then
            selfSay('Me das mucha lastima.', cid)
			
						        elseif msgcontains(msg, 'pedo') then
            selfSay('Saco la conclusion de que estas confundido.', cid)
			
						        elseif msgcontains(msg, 'informacion') then
            selfSay('Recuerda siempre visitar la web para saber acerca de eso, pero tambien puedes preguntarme a mi sobre algo.', cid)

        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
            selfSay('Ok then.')
            talk_state = 0
        end
		


    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())