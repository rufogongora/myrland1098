local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)		end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'wand of voodoo', 'voodoo'},				8922, 22000,		'wand of voodoo')
shopModule:addBuyableItem({'wand of inferno', 'inferno'},			2187, 15000,		'wand of inferno')
shopModule:addBuyableItem({'wand of decay', 'decay'},				2188, 5000,		'wand of decay')
shopModule:addBuyableItem({'wand of draconia', 'plague'}, 			8921, 7500,		'wand of draconia')
shopModule:addBuyableItem({'wand of starstorm', 'starstorm'},			8920, 18000,		'wand of starstorm')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic'},			2189, 10000,		'wand of cosmic energy')
shopModule:addBuyableItem({'wand of vortex', 'vortex'},				2190, 1,		'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragon'},			2191, 1000,		'wand of dragonbreath')


npcHandler:addModule(FocusModule:new())