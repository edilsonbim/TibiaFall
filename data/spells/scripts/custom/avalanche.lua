dofile('data/lib/miscellaneous/warPrivate_lib.lua')
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 1.2) + 7
	local max = (level / 5) + (maglevel * 2.85) + 16
	return -min, -max
end

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 500)
condition:setFormula(-0.4, 0.4, -0.4, 0.4)
combat:addCondition(condition)


combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var, isHotkey)
	if creature:getStorageValue(warPrivate_RUNES) > 0 then
  		return false
 	else
  		return combat:execute(creature, var)
 	end
end
