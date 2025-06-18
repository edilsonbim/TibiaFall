local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
function onGetFormulaValues(player, skill, attack, factor)
    local min = (((skill*attack)/110)*player:getEffectiveSkillLevel(SKILL_SHIELD))/90
    local max = (((skill*attack)/110)*player:getEffectiveSkillLevel(SKILL_SHIELD))/90+45
    return -min, -max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onTargetCreature(creature, target)
	local player = target:getPlayer()
	if not player then
		return doChallengeCreature(creature, target)
	end
	target:setNoMove(true, 2)
end
local disable = Condition(CONDITION_PACIFIED)
disable:setParameter(CONDITION_PARAM_TICKS, 3000)
combat:addCondition(disable)

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")
function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
