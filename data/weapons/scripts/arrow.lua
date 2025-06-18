
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ARROW)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setFormula(COMBAT_FORMULA_SKILL, 0, 0, 1, 0)


function onUseWeapon(creature, var)
	if creature:removeItem(2544,1) then
		combat:execute(creature, var)
	return true
	else
	return false
end
end