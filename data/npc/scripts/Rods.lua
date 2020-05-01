local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)		end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'northwind rod', 'northwind'},			8911, 7500,		'northwind rod')
shopModule:addBuyableItem({'underworld rod', 'underworld'},			8910, 22000,		'underworld rod')
shopModule:addBuyableItem({'hailstorm rod', 'hailstorm rod'},			2183, 15000,		'hailstorm rod')
shopModule:addBuyableItem({'terra rod', 'terra'},				2181, 10000,		'terra rod')
shopModule:addBuyableItem({'snakebite rod', 'snakebite'},			2182, 1,		'snakebite rod')
shopModule:addBuyableItem({'necrotic rod', 'necrotic'},				2185, 5000,		'necrotic rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'},			2186, 1000,		'moonlight rod')
shopModule:addBuyableItem({'springsprout rod', 'springsprout'},			8912, 18000,		'springsprout rod')

npcHandler:addModule(FocusModule:new())