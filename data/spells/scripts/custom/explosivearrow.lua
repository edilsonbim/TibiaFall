local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_SQUARE1X1))
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onGetFormulaValues(player, skill, attack, factor)
    local min = (((player:getEffectiveSkillLevel(SKILL_FIST)*0.3)+player:getEffectiveSkillLevel(SKILL_DISTANCE)*0.7)*attack)/10
    local max = (((player:getEffectiveSkillLevel(SKILL_FIST)*0.3)+player:getEffectiveSkillLevel(SKILL_DISTANCE)*0.7)*attack)/10+35
    return -min, -max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
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
local parameters = { cid = cid, var = var }
addEvent(onCastSpell1, 400, parameters)
return true
end