local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onGetFormulaValues(player, level, maglevel)
    local min = maglevel*3
    local max = maglevel*4
    return -min, -max
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
function onTargetCreature(creature, target)
	if (creature ~= target) then 
		pushTarget(creature, target)
	end 

	return true 
end 
combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")
local function onCastSpell1(parameters)
doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid:getId(), var = var }
addEvent(onCastSpell1, 1000, parameters)
return true
end