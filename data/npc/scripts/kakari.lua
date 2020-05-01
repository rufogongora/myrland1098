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

local posicion = getCreaturePosition(cid)
         
        if msgcontains(msg, 'quest') and getPlayerStorageValue(cid,46750) == -1 then 
		selfSay('Buscame la primera parte de mi casco, creo que la perdi en venoria.', cid)
		setPlayerStorageValue(cid,46750,1) 	
		doSendMagicEffect(posicion,12)
        elseif msgcontains(msg, 'quest') and getPlayerStorageValue(cid,46751) == -1 and getPlayerStorageValue(cid,46750) == 1 and getPlayerItemCount(cid,2339) == 0 then
	    selfSay('Ve a buscar mi casco ahora!.', cid)
------------------------------------------------ quest  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerStorageValue(cid,46751) == -1 and getPlayerStorageValue(cid,46750) == 1 and getPlayerItemCount(cid,2339) > 0 then
		selfSay('Has traido la parte de mi casco?', cid) 
		talk_state = 1
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'si') and talk_state == 1 then 
            talk_state = 0
                     doPlayerTakeItem(cid,2339,1)  
                        selfSay('Gracias, pero aun necesito mas pide otra {quest}', cid) 
                        setPlayerStorageValue(cid,46751,1) 
				doSendMagicEffect(posicion,12)
------------------------------------------------ mensaje  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerItemCount(cid,2337) < 1  and getPlayerStorageValue(cid,46752) == -1 and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('La segunda parte de mi casco se encuentra en las {minas del oeste} de snowground.', cid)
------------------------------------------------ quest  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerItemCount(cid,2337) > 0 and getPlayerStorageValue(cid,46752) == -1 and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('Has traido la parte de mi casco?', cid) 
		talk_state = 2
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'si') and talk_state == 2 then 
            talk_state = 0
                     doPlayerTakeItem(cid,2337,1)  
                        selfSay('Gracias, pero aun necesito mas pide otra {quest}', cid) 
                        setPlayerStorageValue(cid,46752,1) 
				doSendMagicEffect(posicion,12)
------------------------------------------------ mensaje  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerItemCount(cid,2338) < 1  and getPlayerStorageValue(cid,46754) == -1  and getPlayerStorageValue(cid,46752) == 1 and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('La tercera parte de mi casco se encuentra en la {montana desierta} de al oeste de aqui.', cid)
                        setPlayerStorageValue(cid,46753,1) 
------------------------------------------------ quest  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerItemCount(cid,2338) > 0 and getPlayerStorageValue(cid,46754) == -1 and getPlayerStorageValue(cid,46752) == 1  and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('Has traido la parte de mi casco?', cid) 
		talk_state = 3
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'si') and talk_state == 3 then 
            talk_state = 0
                     doPlayerTakeItem(cid,2338,1)  
                        selfSay('Gracias, pero aun necesito mas pide otra {quest}', cid) 
                        setPlayerStorageValue(cid,46754,1) 
				doSendMagicEffect(posicion,12)
------------------------------------------------ mensaje  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerItemCount(cid,2340) < 1 and getPlayerStorageValue(cid,46755) == -1  and getPlayerStorageValue(cid,46754) == 1  and getPlayerStorageValue(cid,46752) == 1 and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('La cuarta parte de mi casco se encuentra en la {montana de cyclops} cerca de merania.', cid)
                        setPlayerStorageValue(cid,46756,1) 
------------------------------------------------ quest  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerItemCount(cid,2340) > 0 and getPlayerStorageValue(cid,46755) == -1 and getPlayerStorageValue(cid,46754) == 1 and getPlayerStorageValue(cid,46752) == 1  and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('Has traido la parte de mi casco?', cid) 
		talk_state = 4
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'si') and talk_state == 4 then 
            talk_state = 0
                     doPlayerTakeItem(cid,2340,1)  
                        selfSay('Gracias, pero aun necesito mas pide otra {quest}', cid) 
                        setPlayerStorageValue(cid,46755,1) 
				doSendMagicEffect(posicion,12)
------------------------------------------------ mensaje  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerItemCount(cid,2341) < 1 and getPlayerStorageValue(cid,46760) == -1 and getPlayerStorageValue(cid,46755) == 1 and getPlayerStorageValue(cid,46755) == 1  and getPlayerStorageValue(cid,46754) == 1  and getPlayerStorageValue(cid,46752) == 1 and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('La quinta parte de mi casco se encuentra en {una montana de hydras en jungelar}.', cid)
                        setPlayerStorageValue(cid,46759,1) 
------------------------------------------------ quest  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerItemCount(cid,2341) > 0 and getPlayerStorageValue(cid,46760) == -1 and getPlayerStorageValue(cid,46755) == 1 and getPlayerStorageValue(cid,46755) == 1 and getPlayerStorageValue(cid,46754) == 1 and getPlayerStorageValue(cid,46752) == 1  and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('Has traido la parte de mi casco?', cid) 
		talk_state = 5
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'si') and talk_state == 5 then 
            talk_state = 0
                     doPlayerTakeItem(cid,2341,1)  
                        selfSay('Gracias, pero aun necesito mas pide otra {quest}', cid) 
                        setPlayerStorageValue(cid,46760,1) 
				doSendMagicEffect(posicion,12)
------------------------------------------------ mensaje  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerItemCount(cid,2335) < 1 and getPlayerStorageValue(cid,46762) == -1 and getPlayerStorageValue(cid,46755) == 1 and getPlayerStorageValue(cid,46755) == 1  and getPlayerStorageValue(cid,46754) == 1  and getPlayerStorageValue(cid,46752) == 1 and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('La sexta parte de mi casco se encuentra en {la isla llena de maquinas}.', cid)
                        setPlayerStorageValue(cid,46761,1) 
------------------------------------------------ quest  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerItemCount(cid,2335) > 0 and getPlayerStorageValue(cid,46762) == -1 and getPlayerStorageValue(cid,46755) == 1 and getPlayerStorageValue(cid,46754) == 1 and getPlayerStorageValue(cid,46752) == 1  and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('Has traido la parte de mi casco?', cid) 
		talk_state = 6
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'si') and talk_state == 6 then 
            talk_state = 0
                     doPlayerTakeItem(cid,2335,1)  
                        selfSay('Gracias, pero aun necesito mas pide otra {quest}', cid) 
                        setPlayerStorageValue(cid,46762,1) 
				doSendMagicEffect(posicion,12)
------------------------------------------------ mensaje  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerItemCount(cid,2336) < 1 and getPlayerStorageValue(cid,46764) == -1 and getPlayerStorageValue(cid,46762) == 1 and getPlayerStorageValue(cid,46755) == 1 and getPlayerStorageValue(cid,46755) == 1  and getPlayerStorageValue(cid,46754) == 1  and getPlayerStorageValue(cid,46752) == 1 and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('La utlima parte de mi casco se encuentra en {la zona mas remota de las minas del este de snowground}.', cid)
                        setPlayerStorageValue(cid,46763,1) 
------------------------------------------------ quest  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerItemCount(cid,2336) > 0 and getPlayerStorageValue(cid,46764) == -1 and getPlayerStorageValue(cid,46762) == 1 and getPlayerStorageValue(cid,46755) == 1 and getPlayerStorageValue(cid,46754) == 1 and getPlayerStorageValue(cid,46752) == 1  and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('Has traido la parte de mi casco?', cid) 
		talk_state = 7
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'si') and talk_state == 7 then 
            talk_state = 0
                     doPlayerTakeItem(cid,2336,1)  
                        selfSay('Gracias, de regalo te dare mi {casco secreto}, y podras entrar a la aldea {kakariko}', cid) 
                        setPlayerStorageValue(cid,46764,1) 
                        setPlayerStorageValue(cid,1256,1) 
				doSendMagicEffect(posicion,12)
				doPlayerAddItem(cid, 2342, 1)
------------------------------------------------ mensaje  ------------------------------------------------ 
        elseif msgcontains(msg, 'quest') and getPlayerStorageValue(cid,46764) == 1 and getPlayerStorageValue(cid,46762) == 1 and getPlayerStorageValue(cid,46755) == 1 and getPlayerStorageValue(cid,46755) == 1  and getPlayerStorageValue(cid,46754) == 1  and getPlayerStorageValue(cid,46752) == 1 and getPlayerStorageValue(cid,46751) == 1 and getPlayerStorageValue(cid,46750) == 1 then
		selfSay('Gracias pero no necesito mas tu ayuda.', cid)
------------------------------------------------ confirm no ------------------------------------------------ 
        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 34)  

then 
            selfSay('Ok vuelve cuando estes listo.', cid) 
            talk_state = 0
        end 
    -- Place all your code in here. Remember that hi, bye and all that stuff is  

--already handled by the npcsystem, so you do not have to take care of that yourself. 
    return true 
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new()) 