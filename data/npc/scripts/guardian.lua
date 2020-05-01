---------------config----------
local level = 10
local maglevel = 10  ----- change this to make the NPC to hit more or less 

local min_multiplier = 2.1  ----- Change that to make NPC got lower minimal dmg
local max_multiplier = 4.2  ----- Change that to make NPC got higher max dmg
--------- dmg formula is dmg = (level * 2 + maglevel * 3) * max/min_multiplier


local check_interval = 5  ----- change this to the time between checks for a creature (the less time the more it will probably lag :S)  
local radiusx = 7  ----- default 7 so he checks 7 squares left and right(the hole screen)  
local radiusy = 5  ----- default 5 so he checks 5 squares up and down(the hole screen)  


local Attack_message = "An Invader, ATTACK!!!"  ----- npc says that when he sees a monster
local town_name = "CITYNAME"  ----- the name of the town, npc says when you say "hi"  hi dont work sometimes 
local Attack_monsters = TRUE  ----- NPC atack monsters? TRUE-yes FALSE-no 
local Attack_swearers = TRUE  ----- NPC atack swearers? TRUE-yes FALSE-no 
local Attack_pkers = TRUE  -----NPC atack guys with white or red skull?? TRUE-yes FALSE-no 
local health_left = 10  ----- set to the amount of health the npc will leave a player with if they swear at him 
local swear_message = "dont swear!"  ----- change this to what NPC says when he attacke a swearer  
local swear_words = {"shit", "fuck", "dick", "cunt"}  ----- if "Attack_swearers" is TRUE then npc will attack anyone who says a word that you will write here.  
local hit_effect = CONST_ME_MORTAREA  ----- hit effect 
local shoot_effect = CONST_ANI_SUDDENDEATH  ----- magic effect of npc atack 
local damage_colour = TEXTCOLOR_RED  ----- dmg color 




 ------------------end of config------------------ 
 local check_clock = os.clock()  ----- leave this 
 local focus = 0  ----- leave this  
 
 function msgcontains(txt, str)  
  return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))  
 end  
 
function onCreatureSay(cid, type, msg)  
msg = string.lower(msg) 
health = getCreatureHealth(cid) - health_left 
if ((string.find(msg, '(%a*)hi(%a*)'))) and getDistanceToCreature(cid) < 4 then  
selfSay('Hello ' .. creatureGetName(cid) .. '! I am a defender of '..town_name..'.')  
doNpcSetCreatureFocus(cid)  
focus = 0 
end 
 
if msgcontains(msg, 'time') then
selfSay('The time is ' .. getWorldTime() .. '.')
end
 
if messageIsInArray(swear_words, msg) then 
if Attack_swearers == TRUE then 
selfSay('' .. swear_message ..' ')  
doCreatureAddHealth(cid,-health) 
doSendMagicEffect(getThingPos(cid),17)  
doSendAnimatedText(getThingPos(cid),health,180) 
doNpcSetCreatureFocus(cid)  
focus = 0  
end 
end 
end  

function getMonstersfromArea(pos, radiusx, radiusy, stack) 
local monsters = { }  
local starting = {x = (pos.x - radiusx), y = (pos.y - radiusy), z = pos.z, stackpos = stack}  
local ending = {x = (pos.x + radiusx), y = (pos.y + radiusy), z = pos.z, stackpos = stack}  
local checking = {x = starting.x, y = starting.y, z = starting.z, stackpos = starting.stackpos}  
repeat  
creature = getThingfromPos(checking)  
if creature.itemid > 0 then  
if isCreature(creature.uid) == TRUE then 
if isPlayer(creature.uid) == FALSE then
if Attack_monsters == TRUE then							
table.insert (monsters, creature.uid)  
check_clock = os.clock() 						
end
elseif isPlayer(creature.uid) == TRUE then  
if Attack_pkers == TRUE then 
if getPlayerSkullType(creature.uid) > 0 then 
table.insert (monsters, creature.uid)  
check_clock = os.clock()      
end 
end 
end  
end  
end  
if checking.x == pos.x-1 and checking.y == pos.y then  
checking.x = checking.x+2  
else   
checking.x = checking.x+1  
end  
if checking.x > ending.x then  
checking.x = starting.x  
checking.y = checking.y+1  
end  
until checking.y > ending.y  
return monsters  
end  
 
function onThink()  
if (Attack_monsters == TRUE and Attack_pkers == TRUE) or (Attack_monsters == TRUE and Attack_pkers == FALSE) or (Attack_monsters == FALSE and Attack_pkers == TRUE) then 
if (os.clock() - check_clock) > check_interval then      
monster_table = getMonstersfromArea(getCreaturePosition(getNpcCid(  )), radiusx, radiusy, 253)  
if #monster_table >= 1 then 
selfSay('' .. Attack_message ..' ')  
for i = 1, #monster_table do  
doNpcSetCreatureFocus(monster_table[i])  
local damage_min = (level * 2 + maglevel * 3) * min_multiplier  
local damage_max = (level * 2 + maglevel * 3) * max_multiplier  
local damage_formula = math.random(damage_min,damage_max)
doSendDistanceShoot(getCreaturePosition(getNpcCid(  )), getThingPos(monster_table[i]), shoot_effect)
doSendMagicEffect(getThingPos(monster_table[i]),hit_effect)  
					doSendAnimatedText(getThingPos(monster_table[i]),damage_formula,damage_colour)  
doCreatureAddHealth(monster_table[i],-damage_formula)  
check_clock = os.clock()  
focus = 0  
end  
elseif table.getn(monster_table) < 1 then  
focus = 0  
check_clock = os.clock()  
end    
end 
end 
focus = 0 
end