	local combat = Combat()
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
	combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

	local condition = Condition(CONDITION_PARALYZE)
	condition:setParameter(CONDITION_PARAM_TICKS, 20000)
	condition:setFormula(-0.8, 0, -0.9, 0)
	combat:setCondition(condition)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
