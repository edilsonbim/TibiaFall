local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)
function onGetFormulaValues1(cid, level, maglevel)
	local max = cid:getEffectiveSkillLevel(SKILL_FISHING)/3
	if cid:getHealth() < max then
		return false
	else
		doCreatureAddHealth(cid, -(max+50))
	return (max+50), (max+50)
	end
end
setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)

function onGetFormulaValues2(cid, level, maglevel)
	local max = cid:getEffectiveSkillLevel(SKILL_FISHING)/3
	if cid:getMana() < max then
		return false
	else
		doCreatureAddMana(cid, -(max+50))
	return (max+50), (max+50)
	end
end

setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var, player)
local parameters = { cid = cid:getId(), var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 101, parameters)

return true
end  