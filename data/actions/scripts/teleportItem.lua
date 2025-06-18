function onUse(player, item, fromPosition, itemEx, toPosition)
	teleportItem:teleport(player, player:getPosition(), toPosition)
	return true 
end 