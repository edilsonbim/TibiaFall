local combat1 = createCombatObject()
local combat2 = createCombatObject()

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_STUN)
setCombatParam(combat1, COMBAT_PARAM_AGGRESSIVE, 1)
local condition1 = createConditionObject(CONDITION_PARALYZE)
addConditionParam(condition1, CONDITION_PARAM_TICKS, 100)
--addConditionParam(condition1, CONDITION_PARAM_SPEED, -500)
addConditionFormula(condition1, -0.5, 0.5, -0.5, 0.5)
setCombatCondition(combat1, condition1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_STUN)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, 1)
local condition2 = createConditionObject(CONDITION_ATTRIBUTES)
addConditionParam(condition2, CONDITION_PARAM_TICKS, 10000)
addConditionParam(condition2, CONDITION_PARAM_SKILL_SHIELD, -200)
addConditionParam(condition2, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat2, condition2)

local function onCastSpell1(parameters)
    doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local function onCastSpell2(parameters)
    doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var) 
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 1, parameters) 
addEvent(onCastSpell2, 1, parameters)
addEvent(onCastSpell1, 3000, parameters)
addEvent(onCastSpell1, 6000, parameters)
addEvent(onCastSpell1, 9000, parameters)
end