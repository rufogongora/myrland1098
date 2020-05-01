 
local focus = 0
local talk_start = 0
local talk_state = 0
local costPerLevel = 300
 
dofile("./petConfig.lua")
 
 
 
function onThingMove(creature, thing, oldpos, oldstackpos)
 
end
 
 
function onCreatureAppear(creature)
 
end
 
 
 function onCreatureDisappear(cid, pos)
 	if focus == cid then
         selfSay('How rude!.')
         focus = 0
         talk_start = 0
 	end
 end
 
 
function onCreatureTurn(creature)
 
end
 
 
function msgcontains(txt, str)
  	return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end
 
 
function onCreatureSay(cid, type, msg)
  	msg = string.lower(msg)
	if getDistanceToCreature(cid) < 4 then
	  	if (msgcontains(msg, 'hi') and (focus == 0)) then
	  		selfSay('Hello ' .. creatureGetName(cid) .. '! I can take you to the train!')
				focus = cid
				talk_start = os.clock()
 
	  	elseif msgcontains(msg, 'hi') and (focus ~= cid) then
	  		selfSay('Sorry, ' .. creatureGetName(cid) .. '! I talk to you in a minute.')
		end
 
		if msgcontains(msg, 'revive') and focus == cid then
			if  isCreature(getPlayerStorageValue(cid, storages.petUid)) == 0 then
				if getPlayerStorageValue(cid, storages.petIsOnline) == 2 then
					selfSay('YOUR PET DIED?!, YOU\'R A BAD OWNER, THIS WILL COST YOU ' .. getPlayerLevel(cid)*costPerLevel .. ' GOLD COINS!, AGREE?!')
					talk_state = 1
				else
					selfSay('Your pet is alive.')
				end
			else
				selfSay('Your pet is standing next to you.')
			end
		talk_start = os.clock()
		end
		if msgcontains(msg, 'yes') and focus == cid and talk_state == 1 then
			if doPlayerRemoveMoney(cid, getPlayerLevel(cid)*costPerLevel) == 1 then
				setPlayerStorageValue(cid, storages.petIsOnline, 1)
				selfSay('You can now summon again your pet.')
			else
				selfSay('You don\'t have enought money.')
			end
		talk_state = 0
		talk_start = os.clock()
		end				
 
		if msgcontains(msg, 'bye') then
			selfSay('Good bye, ' .. creatureGetName(cid) .. '!')
			focus = 0
			talk_start = 0
			talk_state = 0
		end
	end
end
 
 
function onCreatureChangeOutfit(creature)
 
end
 
 
function onThink()
 
	doNpcSetCreatureFocus(focus)
  	if (os.clock() - talk_start) > 30 then
  		if focus > 0 then
  			selfSay('Next Please...')
  		end
  			focus = 0
                        talk_state = 0
  	end
	if focus ~= 0 then
 		if getDistanceToCreature(focus) > 5 then
                        talk_state = 0
 			selfSay('Good bye then.')
                        talk_state =  0
 			focus = 0
 		end
 	end
end
 