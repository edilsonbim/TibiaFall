function acumular(player, target, cid)
	local player = Player(target)
	faltamax = player:getMaxHealth() - player:getHealth() 
	local minDamage = ((player:getStorageValue(16456)*faltamax)/11)+7
	local maxDamage = ((player:getStorageValue(16456)*faltamax)/10)+35
	if (player) then
	player:removeHealthFromSpell(COMBAT_FIREDAMAGE, minDamage, maxDamage, CONST_ME_MORTAREA)
		player:setStorageValue(16456, 0)
	end
