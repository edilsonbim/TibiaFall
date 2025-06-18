reflectSystem = 
{
	storage = 32421,
	percentToReflect = 100

}

function reflectSystem:setReflect(player, reflect, seconds)
	seconds = seconds
	if (player) then 
		local value = 0
		if (reflect) then 
			value = os.time() + seconds
			addEvent(reflectSystemPlayerEffect, 100, player:getId())
		end 
		player:setStorageValue(self.storage, value)
	end 
end 

function reflectSystem:getReflect(player)
	if (player) then 
		local value = player:getStorageValue(self.storage)
		return value and math.max(value, 0) or 0
	end 
end 

function reflectSystem:hasActiveReflect(player)
	if (player) then 
		return self:getReflect(player) > os.time()
	end 
end 

function reflectSystem:reflect(player, target, combatType, damage)
	if (player and target ) and (player ~= target) then
		damage = target:isPlayer() and  damage or damage
		damage = damage * (self.percentToReflect / 100)
		doCreatureAddHealth(target, damage) 
		player:say("REFLECT!", TALKTYPE_MONSTER_SAY)
	end 
end 

function reflectSystemPlayerEffect(cid)
	local player = Player(cid)
	if (player) then 
		if (reflectSystem:hasActiveReflect(player)) then
			player:getPosition():sendMagicEffect(12)
			addEvent(reflectSystemPlayerEffect, 100, player:getId())
		end
	end 
end 
