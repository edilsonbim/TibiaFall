local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues1(player, level, maglevel)
    local min = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)/2.5)+30
    local max = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)/2.5)+35
    return -min, -max
end
setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues2(player, level, maglevel)
    local min = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)*1.5)+30
    local max = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)*1.5)+35
    return -min, -max
end
setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local combat3 = createCombatObject()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat3:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues3(player, level, maglevel)
    local min = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)/2.2)+30
    local max = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)/2.2)+35
    return -min, -max
end
setCombatCallback(combat3, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")

local combat4 = createCombatObject()
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat4:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues4(player, level, maglevel)
    local min = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)*1.8)+30
    local max = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)*1.8)+35
    return -min, -max
end
setCombatCallback(combat4, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues4")

local combat5 = createCombatObject()
combat5:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat5:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues5(player, level, maglevel)
    local min = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)/2)+30
    local max = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)/2)+35
    return -min, -max
end
setCombatCallback(combat5, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues5")

local combat6 = createCombatObject()
combat6:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat6:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues6(player, level, maglevel)
    local min = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)*2)+30
    local max = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)*2)+35
    return -min, -max
end
setCombatCallback(combat6, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues6")

local combat7 = createCombatObject()
combat7:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat7:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues7(player, level, maglevel)
    local min = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)/1.5)+30
    local max = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)/1.5)+35
    return -min, -max
end
setCombatCallback(combat7, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues7")

local combat8 = createCombatObject()
combat8:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat8:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues8(player, level, maglevel)
    local min = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)*3)+30
    local max = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)*3)+35
     return -min, -max
end
setCombatCallback(combat8, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues8")

local combat9 = createCombatObject()
combat9:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat9:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues9(player, level, maglevel)
    local min = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)/1.4)+30
    local max = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)/1.4)+35
    return -min, -max
end
setCombatCallback(combat9, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues9")

local combat10 = createCombatObject()
combat10:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat10:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)
combat10:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
function onGetFormulaValues10(player, level, maglevel)
    local min = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)*3.1)+30
    local max = ((player:getEffectiveSkillLevel(SKILL_FIST)/8)+player:getEffectiveSkillLevel(SKILL_DISTANCE)*3.1)+35
    return -min, -max
end
setCombatCallback(combat10, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues10")

local arr1 = {
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 1, 0},
{0, 2, 0},
{0, 0, 0},
}

local arr2 = {
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 1, 0},
{0, 2, 0},
{0, 0, 0},
}

local arr3 = {
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 1, 0},
{0, 0, 0},
{0, 2, 0},
{0, 0, 0},
}

local arr4 = {
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 1, 0},
{0, 0, 0},
{0, 2, 0},
{0, 0, 0},
}

local arr5 = {
{0, 0, 0},
{0, 0, 0},
{0, 1, 0},
{0, 0, 0},
{0, 0, 0},
{0, 2, 0},
{0, 0, 0},
}

local arr6 = {
{0, 0, 0},
{0, 0, 0},
{0, 1, 0},
{0, 0, 0},
{0, 0, 0},
{0, 2, 0},
{0, 0, 0},
}

local arr7 = {
{0, 0, 0},
{0, 1, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 2, 0},
{0, 0, 0},
}

local arr8 = {
{0, 0, 0},
{0, 1, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 2, 0},
{0, 0, 0},
}

local arr9 = {
{0, 0, 0},
{0, 1, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 2, 0},
{0, 0, 0},
}

local arr10 = {
{0, 0, 0},
{0, 1, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 2, 0},
{0, 0, 0},
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
local area6 = createCombatArea(arr6)
local area7 = createCombatArea(arr7)
local area8 = createCombatArea(arr8)
local area9 = createCombatArea(arr9)
local area10 = createCombatArea(arr10)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat5, area5)
setCombatArea(combat6, area6)
setCombatArea(combat7, area7)
setCombatArea(combat8, area8)
setCombatArea(combat9, area9)
setCombatArea(combat10, area10)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
doCombat(parameters.cid, combat4, parameters.var)
end

local function onCastSpell5(parameters)
doCombat(parameters.cid, combat5, parameters.var)
end

local function onCastSpell6(parameters)
doCombat(parameters.cid, combat6, parameters.var)
end

local function onCastSpell7(parameters)
doCombat(parameters.cid, combat7, parameters.var)
end

local function onCastSpell8(parameters)
doCombat(parameters.cid, combat8, parameters.var)
end
local function onCastSpell9(parameters)
doCombat(parameters.cid, combat9, parameters.var)
end

local function onCastSpell10(parameters)
doCombat(parameters.cid, combat10, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var }
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 101, parameters)
addEvent(onCastSpell3, 150, parameters)
addEvent(onCastSpell4, 151, parameters)
addEvent(onCastSpell5, 200, parameters)
addEvent(onCastSpell6, 251, parameters)
addEvent(onCastSpell7, 300, parameters)
addEvent(onCastSpell8, 351, parameters)
addEvent(onCastSpell9, 400, parameters)
addEvent(onCastSpell10, 451, parameters)

return true
end