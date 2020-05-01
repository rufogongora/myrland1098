-- Umby

local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false

-- masterpos is the location that the player will first be teleported to. It is TWO squares south of the MIDDLE of the FIRST room (see screen shot)
local masterpos = {x=325, y=98, z=7, stackpos=1} -- this must match the position in the movement script
local timeLimit = 600 -- this is the time limit in seconds (600 = 10 minutes) this has to match the timeLimit in the Svargrond.lua script aswell.
local arenaCost = {1000, 5000, 10000} -- this is the ammount of gp it costs to start the arena (first, second, third.)
-- you shouldnt need to edit any more of the script.


local stone1pos = {x = masterpos.x-5, y = masterpos.y-2, z = masterpos.z, stackpos = 1}
local stone2pos = {x = masterpos.x-19, y = masterpos.y-2, z = masterpos.z, stackpos = 1}
local stone3pos = {x = masterpos.x-33, y = masterpos.y-2, z = masterpos.z, stackpos = 1}
local stone4pos = {x = masterpos.x-47, y = masterpos.y-2, z = masterpos.z, stackpos = 1}
local stone5pos = {x = masterpos.x-41, y = masterpos.y-15, z = masterpos.z, stackpos = 1}
local stone6pos = {x = masterpos.x-27, y = masterpos.y-15, z = masterpos.z, stackpos = 1}
local stone7pos = {x = masterpos.x-13, y = masterpos.y-15, z = masterpos.z, stackpos = 1}
local stone8pos = {x = masterpos.x-21, y = masterpos.y-28, z = masterpos.z, stackpos = 1}
local stone9pos = {x = masterpos.x-35, y = masterpos.y-28, z = masterpos.z, stackpos = 1}
local stone10pos = {x = masterpos.x-29, y = masterpos.y-41, z = masterpos.z, stackpos = 1}
local npcpos = {x = masterpos.x+21, y = masterpos.y-2, z = masterpos.z}
local playerID = getGlobalStorageValue(9000)

function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end
function onThingMove(creature, thing, oldpos, oldstackpos)
end
function onCreatureAppear(creature)
end
function onCreatureTurn(creature)
end
local function arenaOver(cid) -- if the player leaves, dies, logs out, wins, or is teleported out:
setGlobalStorageValue(3000,-1) -- if the arena is in use or not
setGlobalStorageValue(9000,-1) -- if the arena is in use or not
arenaStatus = 0
arenaStatus1 = 0
setPlayerStorageValue(cid,5029,-1) -- reset the player arena status (hard med easy)
setPlayerStorageValue(cid,3002,-1) -- if the player is still in the arena or not
setPlayerStorageValue(cid,9000,-1) -- reset the player ID
focus = 0
talk_start = 0
end
local function arenaStartFirstLvl(cid)
setGlobalStorageValue(3000,1) -- if the arena is in use or not
setPlayerStorageValue(cid,5029,1) -- set the player arena status (hard med easy)
setPlayerStorageValue(cid,3002,1) -- if the player is still in the arena or not
doTeleportThing(cid, {x=masterpos.x+24,y=masterpos.y-1,z=masterpos.z})
arenaStatus = arenaStatus1
end
local function arenaStartSecondLvl(cid)
setGlobalStorageValue(3000,1) -- if the arena is in use or not
setPlayerStorageValue(cid,5029,2) -- set the player arena status (hard med easy)
setPlayerStorageValue(cid,3002,1) -- if the player is still in the arena or not
doTeleportThing(cid, {x = masterpos.x+24, y = masterpos.y-1, z = masterpos.z})
arenaStatus = arenaStatus1
end
local function arenaStartThirdLvl(cid)
setGlobalStorageValue(3000,1) -- if the arena is in use or not
setPlayerStorageValue(cid,5029,3) -- set the player arena status (hard med easy)
setPlayerStorageValue(cid,3002,1) -- if the player is still in the arena or not
doTeleportThing(cid, {x = masterpos.x+24, y = masterpos.y-1, z = masterpos.z})
arenaStatus = arenaStatus1
end
local function doCheckStone(stonepos)
local stone = getThingfromPos(stonepos)
if stone.itemid ~= 1354 then
doCreateItem(1354,1,stonepos)
end
if stone.actionid == 6000 then
doSetItemActionId(stone.uid,5999)
end
end
function onCreatureDisappear(cid, pos)
if getGlobalStorageValue(3000) ~= 1 then
arenaStatus = 0
arenaStatus1 = 0
setPlayerStorageValue(cid,5029,-1) -- reset the player arena status (hard med easy)
setPlayerStorageValue(cid,3002,-1) -- if the player is still in the arena or not
focus = 0
end
end
function onCreatureSay(cid, type, msg)

msg = string.lower(msg)
cname = getCreatureName(cid)

if (msgcontains(msg, 'hi') and (focus == 0) and getDistanceToCreature(cid) < 4 and getGlobalStorageValue(3000) ~= 1) then
selfSay('Hello competitor! Do you want to fight in the arena or shall I explain the rules first?')
talk_state = 0
arenaStatus = 0
focus = cid
talk_start = os.clock()
setGlobalStorageValue(3000,-1)
setPlayerStorageValue(cid,5030,-1)
setPlayerStorageValue(cid,5029,-1) -- reset the player arena status (hard med easy)
setPlayerStorageValue(cid,3002,-1) -- if the player is still in the arena or not
setPlayerStorageValue(cid,2998,-1) -- resets so that the time limit will start
setPlayerStorageValue(cid,9000,-1) -- playerID reset so no one has the same one when they start (unless you win the lottery often)
setPlayerStorageValue(cid,2999,-1) -- this makes sure the player isnt tped into the arena twice by being an idiot and stepping on the start teleport more then once in 0.5 seconds (might sound confusing)
elseif (msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 and getGlobalStorageValue(3000) == 1 and getPlayerStorageValue(cid,5029) == 1 and getPlayerStorageValue(cid,3002) > 0) then
setPlayerStorageValue(cid,5029,-1) -- reset the player arena status (hard med easy)
setPlayerStorageValue(cid,3002,-1) -- if the player is still in the arena or not
selfSay('Someone is currently participating in the arena. Please wait your turn.')
elseif (msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 and getGlobalStorageValue(3000) == 1) then
selfSay('Someone is currently participating in the arena. Please wait your turn.')
elseif (focus == cid and getPlayerStorageValue(cid,3002) < 0) then
talk_start = os.clock()
if msgcontains(msg, 'rules') or msgcontains(msg, 'rule') or msgcontains(msg, 'first') then
selfSay('What do you want to know? Something about the three different difficulties, the general rules or the prices? Maybe you also want to know what happens when you die?')
elseif msgcontains(msg, 'die') or msgcontains(msg, 'death') then
selfSay('It would be better not to die! In every pit there is an emergency exit to the south. If you die in a pit... well... your corpse and backpack are gone, so enter at your own risk.')
elseif msgcontains(msg, 'different') or msgcontains(msg, 'difficulties') or msgcontains(msg, 'level') or msgcontains(msg, 'lvl') then
selfSay('There are three difficulties: Greenhorn, Scrapper and Warlord. On each challenge you will be confronted with ten monsters increasing in strength.')
elseif talk_state == 0 and (msgcontains(msg, 'greenhorn') or msgcontains(msg, 'green') or msgcontains(msg, 'horn')) then
selfSay('That is the easiest way in our arena. The fee is 1000 gold. We were setting this up for of our children to challenge some easy monsters and train them for the future.')
elseif talk_state == 0 and (msgcontains(msg, 'scrapper') or msgcontains(msg, 'scrap')) then
selfSay('The most common difficulty for us. The fee is 5000 gold. So if you are experienced in fighting middle class monsters this is your challenge!')
elseif talk_state == 0 and (msgcontains(msg, 'warlord') or msgcontains(msg, 'war') or msgcontains(msg, 'lord')) then
selfSay('Only the strongest among us will take this challenge. The fee is 10000 gold. If you pass that I promise you the respect of all citizens here. You will be a hero!')
elseif msgcontains(msg, 'price') or msgcontains(msg, 'prices') or msgcontains(msg, 'cost') or msgcontains(msg, 'offer') then
selfSay('The fee is 1,000/5,000/10,000 gold for one try. Remember that if you die, it is YOUR problem and you won\'t be able to get back to your corpse and your backpack.')
elseif msgcontains(msg, 'general') then
selfSay('Basically you pay me a fee, and you are sent into an arena with 10 different stages. If you succeed you will be rewarded accordingly.')
elseif talk_state == 1 and (msgcontains(msg, 'greenhorn') or msgcontains(msg, 'green') or msgcontains(msg, 'horn')) then
if getPlayerStorageValue(cid,3001) < 2 then
selfSay('The fee is 1,000 gold for one try. Remember that if you die, it is YOUR problem and you won\'t be able to get back to your corpse and your backpack. Do you really want to participate in the arena in the low difficulty?')
arenaStatus1 = 1
doCheckStone(stone1pos)
doCheckStone(stone2pos)
doCheckStone(stone3pos)
doCheckStone(stone4pos)
doCheckStone(stone5pos)
doCheckStone(stone6pos)
doCheckStone(stone7pos)
doCheckStone(stone8pos)
doCheckStone(stone9pos)
doCheckStone(stone10pos)
elseif getPlayerStorageValue(cid,3001) == 2 or getPlayerStorageValue(cid,3001) == 3 then
selfSay('You have already completed the arena on this difficulty.')
elseif getPlayerStorageValue(cid,3001) == 4 then
selfSay('You may not enter the arena after finishing it.')
end
elseif talk_state == 1 and (msgcontains(msg, 'scrapper') or msgcontains(msg, 'scrap')) then
if getPlayerStorageValue(cid,3001) == -1 then
selfSay('You have to complete the \'Greenhorn\' difficulty before you may attempt the \'Scrapper\' difficulty.')
elseif getPlayerStorageValue(cid,3001) == 3 then
selfSay('You have already completed the arena on this difficulty.')
elseif getPlayerStorageValue(cid,3001) == 4 then
selfSay('You may not enter the arena after finishing it.')
elseif getPlayerStorageValue(cid,3001) == 2 then
selfSay('The fee is 5,000 gold for one try. Remember that if you die, it is YOUR problem and you won\'t be able to get back to your corpse and your backpack. Do you really want to participate in the arena in the medium difficulty?')
arenaStatus1 = 2
doCheckStone(stone1pos)
doCheckStone(stone2pos)
doCheckStone(stone3pos)
doCheckStone(stone4pos)
doCheckStone(stone5pos)
doCheckStone(stone6pos)
doCheckStone(stone7pos)
doCheckStone(stone8pos)
doCheckStone(stone9pos)
doCheckStone(stone10pos)
end
elseif talk_state == 1 and (msgcontains(msg, 'warlord') or msgcontains(msg, 'war') or msgcontains(msg, 'lord')) then
if getPlayerStorageValue(cid,3001) == -1 then
selfSay('You have to complete the \'Greenhorn\' difficulty before you may attempt the \'Warlord\' difficulty.')
elseif getPlayerStorageValue(cid,3001) == 2 then
selfSay('You have to complete the \'Scrapper\' difficulty before you may attempt the \'Warlord\' difficulty.')
elseif getPlayerStorageValue(cid,3001) == 4 then
selfSay('You may not enter the arena after finishing it.')
elseif getPlayerStorageValue(cid,3001) == 3 then
selfSay('The fee is 10,000 gold for one try. Remember that if you die, it is YOUR problem and you won\'t be able to get back to your corpse and your backpack. Do you really want to participate in the arena in the high difficulty?')
arenaStatus1 = 3
doCheckStone(stone1pos)
doCheckStone(stone2pos)
doCheckStone(stone3pos)
doCheckStone(stone4pos)
doCheckStone(stone5pos)
doCheckStone(stone6pos)
doCheckStone(stone7pos)
doCheckStone(stone8pos)
doCheckStone(stone9pos)
doCheckStone(stone10pos)
end
elseif msgcontains(msg, 'fight') or msgcontains(msg, 'start') or msgcontains(msg, 'begin') then
selfSay('So you agree to the rules and want to participate in the challenge? Which difficulty do you choose, Greenhorn, Scrapper or Warlord?')
talk_state = 1
elseif msgcontains(msg, 'no') then
selfSay('Well get back to me when you\'d like to attempt the arena.')
talk_state = 0
elseif msgcontains(msg, 'bye') then
selfSay('See ya next time.')
focus = 0
talk_state = 0
talk_start = 0
elseif talk_state == 1 and msgcontains(msg, 'yes') then
if arenaStatus1 == 1 then --first
if (doPlayerRemoveMoney(focus, arenaCost[1]) == TRUE) then
selfSay('As you wish!')
talk_state = 0
arenaStartFirstLvl(focus)
setGlobalStorageValue(3001,-1) -- this will turn to 1 and make the NPC tp the player in when they step on the entrance TP
local rand = math.random(1, 15000) -- this will make the player unique hopefully
setGlobalStorageValue(9000,rand)
setPlayerStorageValue(cid,9000,(getGlobalStorageValue(9000))) -- i cant believe it was so easy and i wasted 3 days
else
selfSay('You dont have enough gold to attempt this difficulty.')
talk_state = 0
end
elseif arenaStatus1 == 2 then --second
if (doPlayerRemoveMoney(focus, arenaCost[2]) == TRUE) then
selfSay('As you wish!')
talk_state = 0
arenaStartSecondLvl(focus)
setGlobalStorageValue(3001,-1) -- this will turn to 1 and make the NPC tp the player in when they step on the entrance TP
local rand = math.random(1, 15000) -- this will make the player unique hopefully
setGlobalStorageValue(9000,rand)
setPlayerStorageValue(cid,9000,(getGlobalStorageValue(9000))) -- i cant believe it was so easy and i wasted 3 days
else
selfSay('You dont have enough gold to attempt this difficulty.')
talk_state = 0
end
elseif arenaStatus1 == 3 then --third
if (doPlayerRemoveMoney(focus, arenaCost[3]) == TRUE) then
selfSay('As you wish!')
talk_state = 0
arenaStartThirdLvl(focus)
setGlobalStorageValue(3001,-1) -- this will turn to 1 and make the NPC tp the player in when they step on the entrance TP
local rand = math.random(1, 15000) -- this will make the player unique hopefully
setGlobalStorageValue(9000,rand)
setPlayerStorageValue(cid,9000,(getGlobalStorageValue(9000))) -- i cant believe it was so easy and i wasted 3 days
else
selfSay('You dont have enough gold to attempt this difficulty.')
talk_state = 0
end
end
end
end
end
function onThink()
doNpcSetCreatureFocus(focus)
if focus > 0 then
if (getGlobalStorageValue(3001) == 1 and getPlayerStorageValue(focus,5030) == 1) then -- this is going to be what teleports the player into the arena to make sure that no one gets in without the NPC's focus also makes sure the player stepped on the teleport and not someone else
doTeleportThing(focus, {x = masterpos.x, y = masterpos.y, z = masterpos.z})
doSendMagicEffect({x = masterpos.x, y = masterpos.y, z = masterpos.z},10)
setGlobalStorageValue(3001,-1)
setPlayerStorageValue(focus,5030,-1)

elseif (getPlayerStorageValue(focus,3002) == 1 and (os.clock() - talk_start) > timeLimit) then -- player ran out of time while in the arena
doTeleportThing(focus, {x = masterpos.x+21, y = masterpos.y-2, z = masterpos.z})
doSendMagicEffect({x = masterpos.x+21, y = masterpos.y-2, z = masterpos.z},10)
doCheckStone(stone1pos)
doCheckStone(stone2pos)
doCheckStone(stone3pos)
doCheckStone(stone4pos)
doCheckStone(stone5pos)
doCheckStone(stone6pos)
doCheckStone(stone7pos)
doCheckStone(stone8pos)
doCheckStone(stone9pos)
doCheckStone(stone10pos)
doPlayerSendTextMessage(focus, 22, "Time is up! Sorry, you took too long. Thanks and Good luck next time!")
arenaOver(focus)
elseif (getGlobalStorageValue(3000) ~= 1 and arenaStatus ~= nil and arenaStatus > 0) then -- this is a backup and will make sure to set the focus to 0 after the player completes the arena.
doCheckStone(stone1pos)
doCheckStone(stone2pos)
doCheckStone(stone3pos)
doCheckStone(stone4pos)
doCheckStone(stone5pos)
doCheckStone(stone6pos)
doCheckStone(stone7pos)
doCheckStone(stone8pos)
doCheckStone(stone9pos)
doCheckStone(stone10pos)
arenaOver(focus)
elseif (getGlobalStorageValue(3000) == 1 and getPlayerByName(getPlayerName(focus)) == 0) then -- player must have logged out while in the arena
doCheckStone(stone1pos)
doCheckStone(stone2pos)
doCheckStone(stone3pos)
doCheckStone(stone4pos)
doCheckStone(stone5pos)
doCheckStone(stone6pos)
doCheckStone(stone7pos)
doCheckStone(stone8pos)
doCheckStone(stone9pos)
doCheckStone(stone10pos)
setGlobalStorageValue(3000,-1) -- if the arena is in use or not
arenaStatus = 0
arenaStatus1 = 0
focus = 0
elseif (arenaStatus > 0 and getPlayerStorageValue(focus, 3002) == -1) then -- this is a backup
doCheckStone(stone1pos)
doCheckStone(stone2pos)
doCheckStone(stone3pos)
doCheckStone(stone4pos)
doCheckStone(stone5pos)
doCheckStone(stone6pos)
doCheckStone(stone7pos)
doCheckStone(stone8pos)
doCheckStone(stone9pos)
doCheckStone(stone10pos)
arenaOver(focus)
elseif (getGlobalStorageValue(3000) == 1 and (((npcpos.x-getPlayerPosition(focus).x) > 85) or ((npcpos.x-getPlayerPosition(focus).x) < -30) or ((npcpos.y-getPlayerPosition(focus).y) > 50) or ((npcpos.y-getPlayerPosition(focus).y) < -13) or (getPlayerPosition(focus).z ~= npcpos.z))) then -- player must have been teleported out ( will not remove the monster if u tp the player out so dont)
doCheckStone(stone1pos)
doCheckStone(stone2pos)
doCheckStone(stone3pos)
doCheckStone(stone4pos)
doCheckStone(stone5pos)
doCheckStone(stone6pos)
doCheckStone(stone7pos)
doCheckStone(stone8pos)
doCheckStone(stone9pos)
doCheckStone(stone10pos)
end
end
end