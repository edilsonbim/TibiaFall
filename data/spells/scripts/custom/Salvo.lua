
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_NONE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -60, -1, -60, 5, 5, 4, 7)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ARROW)

function onTargetCombat(cid, target)
	local posCid = getCreaturePosition(cid)
	local posTarget = getCreaturePosition(target)
	doSendDistanceShoot(posCid, posTarget, CONST_ANI_ARROW)
end

setCombatCallback(combat, 4, "onTargetCombat")

local area = createCombatArea(AREA_CIRCLE6X6)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end