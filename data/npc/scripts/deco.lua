local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)		end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addBuyableItem({'black'}, 		2144, 400, 1, 		'black pearl')
shopModule:addBuyableItem({'emerald'}, 		2149, 400, 1,		'emerald')
shopModule:addBuyableItem({'ruby'}, 		2147, 430, 1,		'ruby')
shopModule:addBuyableItem({'sapphire'}, 	2146, 415, 1,		'sapphire')
shopModule:addBuyableItem({'diamond'}, 		2145, 420, 1,		'diamond')
shopModule:addBuyableItem({'amethyst'},		2150, 490, 1,	 	'amethyst')
shopModule:addBuyableItem({'dragon'}, 		5791, 80000, 1,  	'stuffed dragon')
shopModule:addBuyableItem({'bear'}, 		3954, 70000, 1, 	'special bear')
shopModule:addBuyableItem({'santa'}, 		6512, 100000, 1,		'santa doll')

shopModule:addSellableItem({'white'}, 2143, 160, 1,'white pearl')
shopModule:addSellableItem({'black'}, 2144, 160, 1,'black pearl')
shopModule:addSellableItem({'diamond'}, 2145, 300, 1,'small diamond')
shopModule:addSellableItem({'sapphire'}, 2146, 250, 1,'small sapphire')
shopModule:addSellableItem({'ruby'}, 2147, 250, 1,'small ruby')
shopModule:addSellableItem({'emerald'}, 2147, 250, 1,'small emerald')
shopModule:addSellableItem({'amethyst'}, 2149, 200, 1,'small amethyst')
shopModule:addSellableItem({'topaz'}, 2147, 200, 1,'small topaz')
shopModule:addSellableItem({'talon'}, 2151, 200, 1,'talon')
shopModule:addSellableItem({'violet'}, 2153, 10000, 1,'violet gem')
shopModule:addSellableItem({'yellow'}, 2154, 1000, 1,'yellow gem')
shopModule:addSellableItem({'green'}, 2155, 5000, 1,'green gem')
shopModule:addSellableItem({'red'}, 2156, 1000, 1,'red gem')
shopModule:addSellableItem({'blue'}, 2158, 5000, 1,'blue gem')


npcHandler:addModule(FocusModule:new())