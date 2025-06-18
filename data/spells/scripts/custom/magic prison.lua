local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_WILDGROWTH)
combat:setArea(createCombatArea(AREA_CROSS1X1))

function onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end
