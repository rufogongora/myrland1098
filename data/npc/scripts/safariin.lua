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




local zone = {x=752, y=1181, z=6} --- Change it to the Entry of Your safari Zone.
local storage = 20000 ---The Storage That you Check the Steps, The same Storage That The Npc, The Movement and Te Talkation Would Have.
local steps = 2000 ---the number of steps that the player have to be in safari zone.
local cost = 15  ---Prize for Each Step.
---------------------------------------End Config--------------------------------------
local pay = cost * steps ---Do Not Edit This
local focus = 0 -- Do Not Edit This
local talk_start = 0 -- Do Not Edit This
local target = 0 -- Do Not Edit This
local following = false -- Do Not Edit This
local attacking = false --Do Not Edit This

function getPlayerMoney(cid)
gold = getPlayerItemCount(cid,2148)
plat = getPlayerItemCount(cid,2152)*100
crys = getPlayerItemCount(cid,2160)*10000
money = gold + plat + crys
return money
end


		if msgcontains(msg, 'safari') then
			selfSay('Do you want buy ' .. steps ..' Steps in the safari zone for ' .. pay ..' gold coins?')
			talk_state = 1

		
		elseif talk_state == 1 then
			if msgcontains(msg, 'yes') then
				if getPlayerMoney(cid) >= pay then
					setPlayerStorageValue(cid,storage,0)
					doTeleportThing(cid, zone)
					doSendMagicEffect(zone,10)
					doPlayerRemoveMoney(cid,pay) 

				else
					selfSay('Sorry, you don\'t have enough money.')
				end
 			end
			talk_state = 0
		end

    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())