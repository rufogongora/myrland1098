local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onTargetCreature(creature, target)
	print( 'creature: '.. creature .. ' target:' ..target)
	return doChallengeCreature(creature, target)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(creature, variant)
	local pos = creature:getPosition()
	local x = pos.x;
	local y = pos.y;
	local z = pos.z;
	for i=x-1,x+1 do
		for j=y-1,y+1 do
			local newPos = { x = i, y = j, z = z }
			local enemy = getTopCreature(newPos)
			if isMonster(enemy.uid) then
				doChallengeCreature(creature, enemy.uid)
			end
		end
	end
	
	return combat:execute(creature, variant)
end
