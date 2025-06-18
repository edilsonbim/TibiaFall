local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setArea(createCombatArea(AREA_CIRCLE1X1))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onGetFormulaValues(player, level, maglevel)
	local min = player:getEffectiveSkillLevel(SKILL_FISHING)*1.5
	local max = player:getEffectiveSkillLevel(SKILL_FISHING)*2.5
    return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
