
function lifene(player)
	if (player) then 
		local val = player:getHealth()
		local rand = 200
		if (val <= rand) then 
			return true
		end 

	end 

	return false 
end 
function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if (lifene(creature) and primaryType ~= COMBAT_HEALING and (attacker and attacker ~= creature or not attacker)) then 
		creature:say('Morreu', TALKTYPE_MONSTER_SAY)
		return 0, COMBAT_NONE, 0, COMBAT_NONE
	end 

	return 0, COMBAT_NONE, 0, COMBAT_NONE
end 