function onThink(interval)
	if os.time() > getGlobalStorageValue(548455)+60*60*4 then
     	for _, targetPlayer in ipairs(Game.getPlayers()) do
        targetPlayer:sendPrivateMessage(player, 'A vila Greenshore esta vulneravel!', TALKTYPE_BROADCAST)
      	end 
  	end
  	if os.time() > getGlobalStorageValue(548456)+60*60*4 then
     	for _, targetPlayer in ipairs(Game.getPlayers()) do
        targetPlayer:sendPrivateMessage(player, 'A vila Senja esta vulneravel!', TALKTYPE_BROADCAST)
      	end 
  	end
  	if os.time() > getGlobalStorageValue(548457)+60*60*4 then
     	for _, targetPlayer in ipairs(Game.getPlayers()) do
        targetPlayer:sendPrivateMessage(player, 'A vila Fibula esta vulneravel!', TALKTYPE_BROADCAST)
      	end 
  	end
  	if os.time() > getGlobalStorageValue(548458)+60*60*4 then
     	for _, targetPlayer in ipairs(Game.getPlayers()) do
        targetPlayer:sendPrivateMessage(player, 'A vila Kazordoon esta vulneravel!', TALKTYPE_BROADCAST)
      	end 
  	end
  	if os.time() > getGlobalStorageValue(548459)+60*60*4 then
     	for _, targetPlayer in ipairs(Game.getPlayers()) do
        targetPlayer:sendPrivateMessage(player, 'A vila Outaw camp esta vulneravel!', TALKTYPE_BROADCAST)
      	end 
  	end
  	if os.time() > getGlobalStorageValue(548459)+60*60*4 then
     	for _, targetPlayer in ipairs(Game.getPlayers()) do
        targetPlayer:sendPrivateMessage(player, 'A vila Northport esta vulneravel!', TALKTYPE_BROADCAST)
      	end 
  	end
   return true
end