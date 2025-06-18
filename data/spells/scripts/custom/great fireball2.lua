local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE) --type 
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA) --effect
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

--dano propio
local minDamage 
local maxDamage 
-------------------------------


function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 1.2) + 7
	local max = (level / 5) + (maglevel * 2.85) + 16

	minDamage = min/2
	maxDamage = max/2
	return -min, -max
end

function onTargetCreature(creature, target)
	if (target:isPlayer()) then 
		target:setNoMove(true)
	end 
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var, isHotkey)
	combat:execute(creature, var)
	creature:removeHealthFromSpell(COMBAT_FIREDAMAGE, minDamage, maxDamage, CONST_ME_FIREAREA)--dano propio

	return 
end
