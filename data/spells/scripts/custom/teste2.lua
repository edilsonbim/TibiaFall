local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)

local skill = Condition(CONDITION_ATTRIBUTES)
skill:setParameter(CONDITION_PARAM_SUBID, 6)
skill:setParameter(CONDITION_PARAM_TICKS, 10000)
skill:setParameter(CONDITION_PARAM_SKILL_FIST, 50)
skill:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
skill:setParameter(CONDITION_PARAM_MAXHITPOINTS, 500)
skill:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(skill)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_SUBID, 3)
condition:setParameter(CONDITION_PARAM_TICKS, 10000)
condition:setFormula(1.5, 1.5, 1.5, 1.5)
combat:addCondition(condition)
local function onCastSpell1(parameters)
    doCombat(parameters.cid, combat, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 0, parameters)

return true
end  