dofile('data/lib/miscellaneous/warPrivate_lib.lua')
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STONES)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 1) + 6
	local max = (level / 5) + (maglevel * 2.6) + 16
	return -min, -max
end
function onTargetCreature(creature, target)
	if (target:isPlayer()) then 
		target:setNoMove(true, 1)
	end 
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var, isHotkey)
	if creature:getStorageValue(warPrivate_RUNES) > 0 then
  		return false
 	else
  		return combat:execute(creature, var)
 	end
end
