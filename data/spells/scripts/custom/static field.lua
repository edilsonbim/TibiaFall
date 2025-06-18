local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
function onGetFormulaValues1(player, level, maglevel)
    local min = maglevel
    local max = maglevel+35
    return -min, -max
end
combat1:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
function onGetFormulaValues2(player, level, maglevel)
    local min = maglevel
    local max = maglevel+35
    return -min, -max
end
combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
function onGetFormulaValues3(player, level, maglevel)
    local min = maglevel
    local max = maglevel+35
    return -min, -max
end
combat3:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues3")

arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 1, 3, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 3, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)

local function onCastSpell1(parameters)
    doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    doCombat(parameters.cid, combat2, parameters.var)
end
 
local function onCastSpell3(parameters)
    doCombat(parameters.cid, combat3, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid:getId(), var = var}
addEvent(onCastSpell1, 5, parameters)
addEvent(onCastSpell2, 500, parameters)
addEvent(onCastSpell3, 1000, parameters)
addEvent(onCastSpell1, 1500, parameters)
addEvent(onCastSpell2, 2000, parameters)
addEvent(onCastSpell3, 2500, parameters)
addEvent(onCastSpell1, 3000, parameters)
addEvent(onCastSpell2, 3500, parameters)
addEvent(onCastSpell3, 4000, parameters)
addEvent(onCastSpell1, 4500, parameters)
addEvent(onCastSpell2, 5000, parameters)
addEvent(onCastSpell3, 5500, parameters)
addEvent(onCastSpell1, 6000, parameters)
addEvent(onCastSpell2, 6500, parameters)
addEvent(onCastSpell3, 7000, parameters)
addEvent(onCastSpell1, 7500, parameters)
addEvent(onCastSpell2, 8000, parameters)
addEvent(onCastSpell3, 8500, parameters)
addEvent(onCastSpell1, 9000, parameters)
addEvent(onCastSpell2, 9500, parameters)
addEvent(onCastSpell3, 10000, parameters)
addEvent(onCastSpell1, 10500, parameters)
addEvent(onCastSpell2, 11000, parameters)
addEvent(onCastSpell3, 11500, parameters)
addEvent(onCastSpell1, 12000, parameters)
    return true
end
