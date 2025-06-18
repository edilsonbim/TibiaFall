local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
function onGetFormulaValues1(player, skill, attack, factor)
    local min = (skill*attack)/16+player:getEffectiveSkillLevel(SKILL_SHIELD)
    local max = (skill*attack)/16+45+player:getEffectiveSkillLevel(SKILL_SHIELD)
    return -min, -max
end
setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
function onGetFormulaValues2(player, skill, attack, factor)
    local min = (skill*attack)/16+player:getEffectiveSkillLevel(SKILL_SHIELD)
    local max = (skill*attack)/16+75+player:getEffectiveSkillLevel(SKILL_SHIELD)
    return -min, -max
end
setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid:getId(), var = var }
addEvent(onCastSpell1, 700, parameters)
addEvent(onCastSpell2, 701, parameters)

return true
end