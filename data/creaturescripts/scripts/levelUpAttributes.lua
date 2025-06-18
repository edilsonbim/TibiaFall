function onAdvance(player, skill, oldLevel, newLevel)
	if (skill == SKILL_LEVEL) then 
		skillSystem:addLevelUpPoints(player, oldLevel, newLevel)
	end 

	return true 
end