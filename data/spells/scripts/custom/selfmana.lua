local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local condition = Condition(CONDITION_REGENERATION)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
condition:setParameter(CONDITION_PARAM_TICKS, 2 * 60 * 1000)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 1)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 2)
condition:setParameter(CONDITION_PARAM_MANAGAIN, 1)
condition:setParameter(CONDITION_PARAM_MANATICKS, 2)
combat:addCondition(condition)


function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
