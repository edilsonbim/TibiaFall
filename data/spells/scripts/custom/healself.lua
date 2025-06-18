local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)

function onGetFormulaValues2(player, level, maglevel)
	local max = (player:getEffectiveSkillLevel(SKILL_FISHING)/5)
	doCreatureAddHealth(player, 30+ max)
	return
end
combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")

local function onCastSpell1(parameters)
    doCombat(parameters.cid, combat1, parameters.var)
end
local function onCastSpell2(parameters)
    doCombat(parameters.cid, combat2, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 10, parameters)
addEvent(onCastSpell2, 2000, parameters)
addEvent(onCastSpell2, 4000, parameters)
addEvent(onCastSpell2, 6000, parameters)


return true
end  