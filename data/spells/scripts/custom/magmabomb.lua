local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE) --type 
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA) --effect
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onGetFormulaValues(player, level, maglevel)
    local min = maglevel
    local max = maglevel
    return -min, -max
end
----------------------------------PUSH
function onTargetCreature(creature, target)
	if (target:isPlayer()) then 
		local steps = 1 --os sqm
		local doIt = true
		if (steps > 0 ) then 
			testPositions(target, target:getPosition(), target:getDirection(), steps)
			--if (not testPositions(target, target:getPosition(), target:getDirection(), steps)) then

			--end 
		else 
			pushTarget(creature, target, steps, true)
		end 
	
	end 

	return true 
end 

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")
---------------------------------------------------
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var, isHotkey)
	combat:execute(creature, var)
	return true
end
