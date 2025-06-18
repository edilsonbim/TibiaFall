teleportItem = 
{
	maxDistance = 6,
	exhaustTime = 2,
	storage = 32321
}

function teleportItem:addExhaust(player)
	if (player) then 
		player:setStorageValue(self.storage, os.time() + self.exhaustTime)
	end 
end 

function teleportItem:getExhaust(player)
	if (player) then 
		local value = player:getStorageValue(self.storage) 
		return value and math.max(value, 0) or 0
	end 

end 

function teleportItem:hasExhaust(player)
	if (player) then 
		return self:getExhaust(player) > os.time()
	end 
end 

function teleportItem:teleport(player, fromPos, toPos)
	if (player) then 

		local tile = Tile(toPos)
		if (not tile) then return false end 

		if (tile:queryAdd(player) ~= RETURNVALUE_NOERROR or tile:getHouse())then 
			return false 
		end 
	
		if (self:hasExhaust(player)) then 
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You can't use this right now.")
			return false 
		end 

		if (fromPos:getDistance(toPos) > self.maxDistance) then 
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "Too far away.")
			return false 	
		end 
		player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONHIT)
		player:teleportTo(toPos)
		toPos:sendMagicEffect(CONST_ME_EXPLOSIONHIT)
		self:addExhaust(player)
	end

end 
