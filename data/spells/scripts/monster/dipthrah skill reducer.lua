local combat = {}

for i = 45, 65 do
	combat[i] = Combat()
	combat[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)

	local condition = Condition(CONDITION_ATTRIBUTES)
	condition:setParameter(CONDITION_PARAM_TICKS, 80000)
	condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, i)
	condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, i)
	condition:setParameter(CONDITION_PARAM_SKILL_FISTPERCENT, i)

	local area = createCombatArea(AREA_CIRCLE3X3)
	combat[i]:setArea(area)
	combat[i]:setCondition(condition)
end

function onCastSpell(creature, var)
	return combat[math.random(45, 65)]:execute(creature, var)
end
