local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_CURSED)
combat:setArea(createCombatArea(AREA_CROSS5X5))

function acumular(player, target, cid)
	local player = Player(target) 
	local minDamage = ((player:getStorageValue(16456)*(player:getStorageValue(16456))*player:getMaxHealth())/90)*0.4+7
	local maxDamage = ((player:getStorageValue(16456)*(player:getStorageValue(16456))*player:getMaxHealth())/90)*0.6+35
	if (player) and player:getStorageValue(16457) >= os.time() then
	player:removeHealthFromSpell(COMBAT_FIREDAMAGE, minDamage, maxDamage, CONST_ME_MORTAREA)
		player:setStorageValue(16456, 0)
	else
		player:setStorageValue(16456, 0)
		player:removeHealthFromSpell(COMBAT_FIREDAMAGE, minDamage, maxDamage, CONST_ME_MORTAREA)
	end
end 

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "acumular")
function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
