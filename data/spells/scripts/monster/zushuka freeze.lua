local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SHIVERARROW)

local condition = Condition(CONDITION_FREEZING)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(30, 8000, -8)
combat:setCondition(condition)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
