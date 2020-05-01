local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)		end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addBuyableItem({'black'}, 		2144, 200, 1, 		'black pearl')
shopModule:addBuyableItem({'emerald'}, 		2149, 200, 1,		'emerald')
shopModule:addBuyableItem({'ruby'}, 		2147, 230, 1,		'ruby')
shopModule:addBuyableItem({'sapphire'}, 	2146, 215, 1,		'sapphire')
shopModule:addBuyableItem({'diamond'}, 		2145, 320, 1,		'diamond')
shopModule:addBuyableItem({'amethyst'},		2150, 190, 1,	 	'amethyst')
shopModule:addBuyableItem({'dragon'}, 		5791, 80000, 1,  	'stuffed dragon')
shopModule:addBuyableItem({'bear'}, 		3954, 70000, 1, 	'special bear')
shopModule:addBuyableItem({'santa'}, 		6512, 100000, 1,		'santa doll')

npcHandler:addModule(FocusModule:new())