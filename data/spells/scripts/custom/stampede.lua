local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setArea(createCombatArea(AREA_SQUARE1X1))
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, skill, attack, factor)
    local min = ((skill*attack)/100+player:getEffectiveSkillLevel(SKILL_SHIELD))
    local max = ((skill*attack)/100+45+player:getEffectiveSkillLevel(SKILL_SHIELD))
    return -min, -max
end

combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_SUBID, 1)
condition:setParameter(CONDITION_PARAM_TICKS, 1000)
condition:setFormula(1.1, -1.1, 1.1, -1.1)
combat1:addCondition(condition)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var }
addEvent(onCastSpell1, 10, parameters)
addEvent(onCastSpell2, 10, parameters)
addEvent(onCastSpell1, 1010, parameters)
addEvent(onCastSpell2, 1010, parameters)
addEvent(onCastSpell1, 2010, parameters)
addEvent(onCastSpell2, 2010, parameters)
addEvent(onCastSpell1, 3010, parameters)
addEvent(onCastSpell2, 3010, parameters)
addEvent(onCastSpell1, 4010, parameters)
addEvent(onCastSpell2, 4010, parameters)
addEvent(onCastSpell1, 5010, parameters)
addEvent(onCastSpell2, 5010, parameters)
addEvent(onCastSpell1, 6010, parameters)
addEvent(onCastSpell2, 6010, parameters)
	return true
end
