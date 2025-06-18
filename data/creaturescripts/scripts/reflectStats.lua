function rollDodge(player)
	if (player) then 
		local val = player:getDodge()
		local rand = math.random(1, 100)
		if (rand <= val) then 
			return true
		end 

	end 

	return false 
end 


function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

	if (rollDodge(creature) and primaryType ~= COMBAT_HEALING and (attacker and attacker ~= creature or not attacker)) then 
		creature:say('DODGE', TALKTYPE_MONSTER_SAY)
		return 0, COMBAT_NONE, 0, COMBAT_NONE
	end 
	if (reflectSystem:hasActiveReflect(creature)) then 
		reflectSystem:reflect(creature, attacker, primaryType, primaryDamage)

		reflectSystem:reflect(creature, attacker, secondaryType, secondaryDamage)

		--return 0, COMBAT_NONE, 0, COMBAT_NONE
	end 


	return primaryDamage, primaryType, secondaryDamage, secondaryType
end 

function onManaChange(creature, attacker, manaChange, origin)
	if (rollDodge(creature) and (attacker and attacker ~= creature or not attacker)) then 
		creature:say('DODGE', TALKTYPE_MONSTER_SAY)
		return 0
	end 

	if (reflectSystem:hasActiveReflect(creature)) then 
		reflectSystem:reflect(creature, attacker, COMBAT_MANADRAIN, manaChange)
		--return 0
	end 

	return manaChange
end 