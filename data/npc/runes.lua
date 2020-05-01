local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)		end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 		2006, 55, 	7, 	'mana fluid')
shopModule:addBuyableItem({'heavy magic missile', 'hmm'}, 	2311, 125, 	10,	'heavy magic missile rune')
shopModule:addBuyableItem({'blank rune', 'rune'}, 		2260, 10, 	1,	'Blank rune')
shopModule:addBuyableItem({'great fireball', 'gfb'}, 		2304, 180, 	5, 	'great fireball rune')
shopModule:addBuyableItem({'explo', 'xpl'}, 			2313, 250, 	6, 	'explosion rune')
shopModule:addBuyableItem({'ultimate healing', 'uh'}, 		2273, 175, 	10, 	'ultimate healing rune')
shopModule:addBuyableItem({'sudden death', 'sd'}, 		2268, 325, 	5, 	'sudden death rune')
shopModule:addBuyableItem({'mana potion', 'mp'}, 		7620, 100,		'mana potion')
shopModule:addBuyableItem({'health potion', 'hp'}, 		7618, 100,		'health potion')
shopModule:addBuyableItem({'strong potion', 'sp'}, 		7588, 160,		'strong health potion')
shopModule:addBuyableItem({'strong mana', 'sm'}, 		7589, 160,		'strong mana potion')
shopModule:addBuyableItem({'great health', 'gh'}, 		7591, 250,		'great health potion')
shopModule:addBuyableItem({'great mana', 'gm'}, 		7590, 250,		'great mana potion')
shopModule:addBuyableItem({'strong mana', 'sm'}, 		7589, 160,		'strong mana potion')
shopModule:addBuyableItem({'great spirit', 'gs'}, 		8376, 190,		'great spirit potion')
shopModule:addBuyableItem({'ultimate health', 'uhp'}, 		8377, 190,		'ultimate health potion')
shopModule:addBuyableItem({'book', 'ellbook'}, 		 	2175, 500,		'spellbook')

npcHandler:addModule(FocusModule:new())