local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)		end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end


local node4 = keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Pues yo vendo los spells {soul storm}, {arrowa}, {extreme explosion}, {slash}.'})

local node5 = keywordHandler:addKeyword({'soul storm'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Te gustaria aprender soul storm por 35000 gp?'})
        node5:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'Soul Storm', vocation = 1, price = 35000, level = 40})
 	node5:addChildKeyword({'si'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'Soul Storm', vocation = 1, price = 35000, level = 40})
    	node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'No puedes con esta magia?', reset = true})
		
local node6 = keywordHandler:addKeyword({'arrowa'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Te gustaria arrowa por 35000 gp?'})
    	node6:addChildKeyword({'si'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'Arrowa', vocation = 3, price = 35000, level = 40})
        node6:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'Arrowa', vocation = 3, price = 35000, level = 40})
	node6:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'No puedes con esta magia?', reset = true})


local node7 = keywordHandler:addKeyword({'extreme explosion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Te gustaria extreme explosion por 35000 gp?'})
    	node7:addChildKeyword({'si'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'Extreme Explosion', vocation = 2, price = 35000, level = 75})
        node7:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName =  'Extreme Explosion', vocation = 2, price = 35000, level = 75})
	node7:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'No puedes con esta magia?', reset = true})

local node8 = keywordHandler:addKeyword({'slash'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Te gustaria slash por 35000 gp?'})
    	node8:addChildKeyword({'si'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName = 'Slash', vocation = 4, price = 35000, level = 120})
        node8:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = true, spellName =  'Slash', vocation = 4, price = 35000, level = 120})
	node8:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'No puedes con esta magia?', reset = true})




npcHandler:addModule(FocusModule:new())