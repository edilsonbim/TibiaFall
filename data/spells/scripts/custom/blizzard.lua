local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, 42)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
function onGetFormulaValues1(player, level, maglevel)
    local min = maglevel/2
    local max = maglevel/2+35
    return -min, -max
end

setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 200)
condition:setFormula(-0.55, 0.55, -0.55, 0.55)
combat2:addCondition(condition)

local arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr2)
local area2 = createCombatArea(arr2)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

local function onUse1(parameters)
doCombat(parameters.creature, combat1, parameters.var)
end

local function onUse2(parameters)
doCombat(parameters.creature, combat2, parameters.var)
end

function onCastSpell(creature, var)
local parameters = { creature = creature:getId(), var = var }
addEvent(onUse1, 1, parameters)
addEvent(onUse2, 100, parameters)
addEvent(onUse2, 300, parameters)
addEvent(onUse2, 500, parameters)
addEvent(onUse2, 700, parameters)
addEvent(onUse2, 900, parameters)
addEvent(onUse2, 1100, parameters)
addEvent(onUse1, 1100, parameters)
addEvent(onUse2, 1300, parameters)
addEvent(onUse2, 1500, parameters)
addEvent(onUse2, 1700, parameters)
addEvent(onUse2, 1900, parameters)
addEvent(onUse2, 2100, parameters)
addEvent(onUse1, 2100, parameters)
addEvent(onUse2, 2300, parameters)
addEvent(onUse2, 2500, parameters)
addEvent(onUse2, 2700, parameters)
addEvent(onUse2, 2900, parameters)
addEvent(onUse2, 3100, parameters)
addEvent(onUse1, 3100, parameters)
addEvent(onUse2, 3300, parameters)
addEvent(onUse2, 3500, parameters)
addEvent(onUse2, 3700, parameters)
addEvent(onUse2, 3900, parameters)
addEvent(onUse2, 4100, parameters)
addEvent(onUse1, 4100, parameters)
addEvent(onUse2, 4300, parameters)
addEvent(onUse2, 4500, parameters)
addEvent(onUse2, 4700, parameters)
addEvent(onUse2, 4900, parameters)
addEvent(onUse1, 5100, parameters)
addEvent(onUse2, 5100, parameters)
addEvent(onUse2, 5300, parameters)
addEvent(onUse2, 5500, parameters)
addEvent(onUse2, 5700, parameters)
addEvent(onUse2, 5900, parameters)
addEvent(onUse2, 6100, parameters)
addEvent(onUse1, 6100, parameters)
addEvent(onUse2, 6300, parameters)
addEvent(onUse2, 6500, parameters)
addEvent(onUse2, 6700, parameters)
addEvent(onUse2, 6900, parameters)
addEvent(onUse1, 7100, parameters)
addEvent(onUse2, 7100, parameters)
addEvent(onUse2, 7300, parameters)
addEvent(onUse2, 7500, parameters)
addEvent(onUse2, 7700, parameters)
addEvent(onUse2, 7900, parameters)
addEvent(onUse2, 8100, parameters)
addEvent(onUse1, 8100, parameters)
addEvent(onUse2, 8300, parameters)
addEvent(onUse2, 8500, parameters)
addEvent(onUse2, 8700, parameters)
addEvent(onUse2, 8900, parameters)
addEvent(onUse2, 9100, parameters)
addEvent(onUse1, 9100, parameters)
addEvent(onUse2, 9300, parameters)
addEvent(onUse2, 9500, parameters)
addEvent(onUse2, 9700, parameters)
addEvent(onUse2, 9900, parameters)
addEvent(onUse1, 10100, parameters)

return true
end