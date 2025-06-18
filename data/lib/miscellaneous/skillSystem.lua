--start: 23:57 
local testMode = true

local baseStorage = 39000 
skillSystem = 
{
	startValue = 
	{
		magic = 3,
		distance = 2,
		other = 1
	},

	resetCost = 100,
	maxSkill = 151, 
	skillPrices = 
	{
		[SKILL_MAGLEVEL] = 3,
	    [SKILL_FIST] = 3,
	    [SKILL_CLUB] = 3,
	    [SKILL_SWORD] = 3,
	    [SKILL_AXE] = 3,
	    [SKILL_DISTANCE] = 3,
	    [SKILL_SHIELD] = 3,
	    [SKILL_FISHING] = 3,
	},

	skillPriceStages = 
	{
		{fromLevel = 1, toLevel = 30},
		{fromLevel = 31, toLevel = 50}, --x2
		{fromLevel = 51, toLevel = 60}, --x3
		{fromLevel = 61, toLevel = 70}, --x4
		{fromLevel = 71, toLevel = 80},
		{fromLevel = 81, toLevel = 90},
		{fromLevel = 91, toLevel = 100},
		{fromLevel = 101, toLevel = 110},
		{fromLevel = 111, toLevel = 120},
		{fromLevel = 121, toLevel = 130},
		{fromLevel = 131, toLevel = 140},
		{fromLevel = 141, toLevel = 150},
	},

	skillNames = 
	{
		{ name = "Inteligence", id = SKILL_MAGLEVEL},
	    { name = "Attack Speed", id = SKILL_FIST},
	    { name = "Club", id = SKILL_CLUB},
	    { name = "Sword", id = SKILL_SWORD},
	    { name = "Axe", id = SKILL_AXE},
	    { name = "Dexterity", id = SKILL_DISTANCE},
	    { name = "Strength", id = SKILL_SHIELD},
	    { name = "Wisdom", id = SKILL_FISHING},
	},

	storages = 
	{
		points = 
		{
			["actual"] = baseStorage ,
			["used"] = baseStorage + 1,
		},
		levels = baseStorage + 2
	}
   
}


function skillSystem:setPoints(player, points)
	if (player) then 
		player:setStorageValue(self.storages.points.actual, points)
	end 
end 

function skillSystem:getPoints(player)
	if (player) then 
		local value = player:getStorageValue(self.storages.points.actual)
		return value and math.max(value, 0) or 0
	end 

end 

function skillSystem:updatePoints(player, pointsToAdd)
	if (player) then 
		local points = self:getPoints(player)
		local newPoints = points + pointsToAdd
		self:setPoints(player, newPoints)
	end

end 

function skillSystem:setUsedPoints(player, points)
	if (player) then 
		player:setStorageValue(self.storages.points.used, points)
	end 

end 

function skillSystem:getUsedPoints(player)
	if (player) then 
		local value = player:getStorageValue(self.storages.points.used)
		return value and math.max(value, 0) or 0
	end 

end 

function skillSystem:updateUsedPoints(player, pointsToAdd)
	if (player) then 
		local points = self:getUsedPoints(player)
		local newPoints = points + pointsToAdd
		self:setUsedPoints(player, newPoints)
	end

end  

function skillSystem:setSkill(player, skill, value)
	if (player) then 
		player:setSkill(skill, value)
	end 
	if (skill == SKILL_MAGLEVEL) then
		value = player:getMagicLevel()
		player:setMaxMana(400+(value*5))
	end 
	if (skill == SKILL_SHIELD) then
		value = player:getSkillLevel(skill)
		player:setMaxHealth(400+(value*5))
	end 
	if (skill == SKILL_FISHING) then
		value = player:getSkillLevel(skill)
	end 

end

function skillSystem:getSkill(player, skill)
	if (player) then 
		return player:getSkillLevel(skill)
	end 

end

function skillSystem:calcPrice (price, skill, level)
	local stages = self.skillPriceStages
	local stage
	local stageValue = 0
	for i = 1, #stages do 
		stage = stages[i]
		if (level >= stage.fromLevel and level <= stage.toLevel) then 
			stageValue = i
			break
		end 
	end 

	local multiplier = 1
	if (skill == SKILL_MAGLEVEL) then
		multiplier = 1
	elseif (skill == SKILL_DISTANCE) then
		multiplier = 1
	elseif (skill == SKILL_FIST) then
		multiplier = 1
	end 
	local res = stageValue * multiplier 
	--print(res)

	return res 
end 

function skillSystem:addSkill(player, skill, count)
	if (player) then 
		local value = player:getSkillLevel(skill)
		if (skill == SKILL_MAGLEVEL) then 
			value = player:getMagicLevel()
		end 
		--check max skill
		if (value >= self.maxSkill) then 
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You have already reached max skill.")
			return false
		end 

		local newValue = value + count 
		if (newValue >= self.maxSkill) then 
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You have already reached max skill.")
			return false
		end 

		--check price
		local skillPrice = self.skillPrices[skill]  
		local points = skillSystem:getPoints(player) 
		
		--stages price 
		skillPrice = self:calcPrice (skillPrice, skill, newValue)
		--print(skillPrice, count)
		skillPrice = skillPrice * count
		if (points >= skillPrice) then 
			self:setSkill(player, skill, newValue)
			self:updatePoints(player, skillPrice * -1)
			self:updateUsedPoints(player, skillPrice)
			self:debugPoints(player)
		else
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "Not enough points. You need +"..skillPrice-points .." attribute points.")
			return false
		end 
	end 	
end 

--return points

function skillSystem:returnPoints(player)
	local accid = player:getAccountId()
	if (player) then 
		if (not player:removeCoinsBalance(100)) then 
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "Not enough TibiaFall coins")
			return false
		end 
		local usedPoints = self:getUsedPoints(player)
		if (usedPoints > 0) then 
			--reset all skills to 10
			--for skill,_ in pairs(self.skillPrices) do 
			--	self:setSkill(player, skill, 10)
			--end 
			self:resetSkills(player)
			--return points		
			self:updatePoints(player, usedPoints)
			self:updateUsedPoints(player, usedPoints * -1)
			self:debugPoints(player)
		end 
		
	end 	
end 

function skillSystem:debugPoints(player)
	if (player) then 
		local strs = {}
		strs[#strs + 1] = string.format("Actual points: %d", self:getPoints(player))
		strs[#strs + 1] = string.format("Used points: %d", self:getUsedPoints(player))
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, table.concat(strs, "\n"))
	end 
end

--[[
	Agregar level up points
	stages 
]]--

function skillSystem:addLevelUpPoints(player, oldLevel, newLevel)
	if (oldLevel > newLevel) then 
		return false 
	else 
		local msgs = {}
		local pointsToAdd = 0
		for i = oldLevel, newLevel do 
			if (not self:hasReceivedLevelUpPoints(player, i)) then 
				pointsToAdd = pointsToAdd + 3
				self:setReceivedLevelUpPoints(player, i)
			end 
		end  
		local msg = string.format("You have received %d attribute points.", pointsToAdd)
		self:updatePoints(player, pointsToAdd)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, msg)
	end 

end 

function skillSystem:setReceivedLevelUpPoints(player, level)
	if (player) then 
		local valueToCheck = self.storages.levels + level
		player:setStorageValue(valueToCheck, 1)
	end 
end 

function skillSystem:getReceivedLevelUpPoints(player, level)
	if (player) then 
		local valueToCheck = self.storages.levels + level
		local retValue = player:getStorageValue(valueToCheck)
		return retValue and math.max(retValue, 0) or 0
	end 
	return 0
end 

function skillSystem:hasReceivedLevelUpPoints(player, level)
	return self:getReceivedLevelUpPoints(player, level) > 0
end 

function skillSystem:resetSkills(player)
	if (player) then 
		local value 
		for i,x in pairs(self.skillPrices) do 
			if (i == SKILL_MAGLEVEL) then 
				value = 10
			else
				value = 10
			end 
			self:setSkill(player, i, value)
			
		end 
	end 


end 