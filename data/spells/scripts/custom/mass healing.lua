local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SLEEP)
combat1:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local disable = Condition(CONDITION_PACIFIED)
disable:setParameter(CONDITION_PARAM_TICKS, 10000)
combat1:addCondition(disable)

function onTargetCreature(creature, target)
	target:setNoMove(true, 11)
end

combat1:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function onCastSpell1(parameters)
    doCombat(parameters.cid, combat1, parameters.var)
end

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat2:setArea(createCombatArea(AREA_CIRCLE3X3))
function onGetFormulaValues2(player, level, maglevel)
    local min = player:getEffectiveSkillLevel(SKILL_FISHING)/2
    local max = player:getEffectiveSkillLevel(SKILL_FISHING)+5
    return min, max
end
setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local combat3 = createCombatObject()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
combat3:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat3:setArea(createCombatArea(AREA_CIRCLE3X3))
function onGetFormulaValues3(player, level, maglevel)
    local min = player:getEffectiveSkillLevel(SKILL_FISHING)/2
    local max = player:getEffectiveSkillLevel(SKILL_FISHING)+5
    return min, max
end
setCombatCallback(combat3, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")


local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end

function onCastSpell(cid, var, player)
local parameters = { cid = cid:getId(), var = var}
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 100, parameters)
addEvent(onCastSpell3, 101, parameters)
addEvent(onCastSpell2, 2000, parameters)
addEvent(onCastSpell3, 2001, parameters)
addEvent(onCastSpell2, 4000, parameters)
addEvent(onCastSpell3, 4001, parameters)
addEvent(onCastSpell2, 6000, parameters)
addEvent(onCastSpell3, 6001, parameters)
addEvent(onCastSpell2, 8000, parameters)
addEvent(onCastSpell3, 8001, parameters)
addEvent(onCastSpell2, 10000, parameters)
addEvent(onCastSpell3, 10001, parameters)

return true
end  