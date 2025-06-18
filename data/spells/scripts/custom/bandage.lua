local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onGetFormulaValues(player, level, maglevel)
	local min = ((player:getEffectiveSkillLevel(SKILL_SHIELD)*2)+player:getEffectiveSkillLevel(SKILL_FISHING))+195
	local max = ((player:getEffectiveSkillLevel(SKILL_SHIELD)*2)+player:getEffectiveSkillLevel(SKILL_FISHING))+295
	return min, max
end

combat1:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var }
addEvent(onCastSpell1, 1500, parameters)
return true
end