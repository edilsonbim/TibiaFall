
local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)
function onGetFormulaValues1(player, level, maglevel)
    return -20, -40
end
setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
function onGetFormulaValues2(player, level, maglevel)
    return -20, -40
end
setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onUseWeapon(cid, var)
local parameters = { cid = cid, var = var }
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 101, parameters)

return true
end