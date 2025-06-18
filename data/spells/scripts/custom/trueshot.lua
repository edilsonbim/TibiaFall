local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)
function onGetFormulaValues1(player, skill, attack, factor)
    local min = (((player:getEffectiveSkillLevel(SKILL_FIST)/2)+player:getEffectiveSkillLevel(SKILL_DISTANCE))*attack)/10
    local max = (((player:getEffectiveSkillLevel(SKILL_FIST)/2)+player:getEffectiveSkillLevel(SKILL_DISTANCE))*attack)/10+95
    return -min, -max
end
setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
function onGetFormulaValues2(player, skill, attack, factor)
    local min = (((player:getEffectiveSkillLevel(SKILL_FIST)/2)+player:getEffectiveSkillLevel(SKILL_DISTANCE))*attack)/10+85
    local max = (((player:getEffectiveSkillLevel(SKILL_FIST)/2)+player:getEffectiveSkillLevel(SKILL_DISTANCE))*attack)/10+195
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
local parameters = { cid = cid, var = var }
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 101, parameters)

return true
end