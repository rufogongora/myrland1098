	local combat = Combat()
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
	combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

	local condition = Condition(CONDITION_PARALYZE)
	condition:setParameter(CONDITION_PARAM_TICKS, 15000)
	condition:setFormula(-0.55, 0, -0.7, 0)
	combat:setCondition(condition)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
