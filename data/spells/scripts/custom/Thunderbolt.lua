local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setArea(createCombatArea(AREA_CROSS1X1))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onGetFormulaValues(player, level, maglevel)
	local min = (maglevel * 2.6) + 9
	local max = (maglevel * 3.2) + 19
	return -min, -max
end

function onTargetCreature(creature, target)
	if (creature ~= target) then 
		pushTarget(creature, target)
	end 

	return true 
end 

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end
