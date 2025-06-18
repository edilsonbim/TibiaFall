local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BUBBLES)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
function onGetFormulaValues1(player, level, maglevel)
    local min = maglevel/10
    local max = maglevel/10+15
    return -min, -max
end
setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat2:setParameter(COMBAT_PARAM_EFFECT, 26)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

function onTargetCreature2(creature, target)
        pushTarget(creature, target, 1, true)


    return true 
end 

combat2:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature2")


local arr2 = {
{0, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 0, 0, 0, 1, 1},
{1, 1, 0, 2, 0, 1, 1},
{1, 1, 0, 0, 0, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 0}
}

local area1 = createCombatArea(AREA_CIRCLE3X3)
local area2 = createCombatArea(arr2)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

local function onUse1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onUse2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid:getId(), var = var }
addEvent(onUse1, 1, parameters)
addEvent(onUse2, 100, parameters)
addEvent(onUse2, 200, parameters)
addEvent(onUse2, 300, parameters)
addEvent(onUse2, 400, parameters)
addEvent(onUse2, 500, parameters)
addEvent(onUse2, 600, parameters)
addEvent(onUse2, 700, parameters)
addEvent(onUse2, 800, parameters)
addEvent(onUse2, 900, parameters)
addEvent(onUse2, 1000, parameters)
addEvent(onUse2, 1100, parameters)
addEvent(onUse2, 1200, parameters)
addEvent(onUse1, 1300, parameters)
addEvent(onUse2, 1400, parameters)
addEvent(onUse2, 1500, parameters)
addEvent(onUse2, 1600, parameters)
addEvent(onUse2, 1700, parameters)
addEvent(onUse2, 1800, parameters)
addEvent(onUse2, 1900, parameters)
addEvent(onUse2, 2000, parameters)
addEvent(onUse2, 2100, parameters)
addEvent(onUse2, 2200, parameters)
addEvent(onUse2, 2300, parameters)
addEvent(onUse2, 2400, parameters)
addEvent(onUse1, 2500, parameters)
addEvent(onUse2, 2600, parameters)
addEvent(onUse2, 2700, parameters)
addEvent(onUse2, 2800, parameters)
addEvent(onUse2, 2900, parameters)
addEvent(onUse2, 3000, parameters)
addEvent(onUse2, 3100, parameters)
addEvent(onUse2, 3200, parameters)
addEvent(onUse2, 3300, parameters)
addEvent(onUse2, 3400, parameters)
addEvent(onUse2, 3500, parameters)
addEvent(onUse2, 3600, parameters)
addEvent(onUse1, 3700, parameters)
addEvent(onUse2, 3800, parameters)
addEvent(onUse2, 3900, parameters)
addEvent(onUse2, 4000, parameters)
addEvent(onUse2, 4100, parameters)
addEvent(onUse2, 4200, parameters)
addEvent(onUse2, 4300, parameters)
addEvent(onUse2, 4400, parameters)
addEvent(onUse2, 4500, parameters)
addEvent(onUse2, 4600, parameters)
addEvent(onUse2, 4700, parameters)
addEvent(onUse2, 4800, parameters)
addEvent(onUse1, 4900, parameters)
addEvent(onUse2, 5000, parameters)
addEvent(onUse2, 5100, parameters)
addEvent(onUse2, 5200, parameters)
addEvent(onUse2, 5300, parameters)
addEvent(onUse2, 5400, parameters)
addEvent(onUse2, 5500, parameters)

return true
end