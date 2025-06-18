function onDeath(player, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	if getPlayerFlagValue(player, PlayerFlag_NotGenerateLoot) then --or player:getVocation():getId() == VOCATION_NONE then
		return true
	end

		for i = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
			local item = player:getSlotItem(i)
			if item then
				if isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) or math.random(item:isContainer() and 0 or 0) <= player:getLossPercent() then
					item:moveTo(corpse)
				end
			end
		end


	if not player:getSlotItem(CONST_SLOT_BACKPACK) then
		local bag = player:addItem(ITEM_BAG, 1, false, CONST_SLOT_BACKPACK)
	end
	return true
end
