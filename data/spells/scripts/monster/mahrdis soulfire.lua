local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)

local condition = Condition(CONDITION_FIRE)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(50, 9000, -10)

local area = createCombatArea({
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0}
})
combat:setArea(area)
combat:setCondition(condition)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end