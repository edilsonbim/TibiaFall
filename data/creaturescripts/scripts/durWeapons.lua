function onHealthChange(cid, attacker, type, combat, value)	
chance = 970
if type == STATSCHANGE_HEALTHLOSS then
	if isPlayer(attacker) then
		local slotWeapon = nil

			if weapons[getPlayerSlotItem(attacker, CONST_SLOT_RIGHT).itemid] then
				slotWeapon = CONST_SLOT_RIGHT					
			elseif weapons[getPlayerSlotItem(attacker, CONST_SLOT_LEFT).itemid] then
				slotWeapon = CONST_SLOT_LEFT
			end

		if slotWeapon == nil then
			return true
		end

		if (getItemAttribute(getPlayerSlotItem(attacker, slotWeapon).uid, "Charges") == "Broken") then
			doPlayerSendTextMessage(attacker, 22, "Sua weapon esta quebrada.")
			return false
		elseif (math.random(1,1000) > chance) then				
			setDurabilidade(attacker, slotWeapon, weapons)
		end						
	end	

elseif type == STATSCHANGE_HEALTHGAIN then
	return false									
end

return true
end

function onKill(cid, target)
registerCreatureEvent(target, "DurGain")
return true
end