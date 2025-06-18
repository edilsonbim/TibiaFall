function test(player)
	-- The helper lib is used by passing a table value to the ModalWindow function
	local points = skillSystem:getPoints(player)

	local window = ModalWindow {
	    title = 'Character Attributes',
	    message = string.format("Available points %d\nReset Cost: %dk", points, skillSystem.resetCost/1000)
	}
	 
	local skill 
	local str 
	local skillLevel 
	for i = 1, #skillSystem.skillNames do 
		skill = skillSystem.skillNames[i]
		if (skill.id == SKILL_MAGLEVEL) then
			skillLevel = player:getMagicLevel()
		else
			skillLevel = player:getSkillLevel(skill.id)
		end
		price = skillSystem:calcPrice (0, skill.id, skillLevel +1)
		--print(price)
		str = string.format("%s: [%d][cost: %d]", skill.name, skillLevel, price)
		local choice
		choice = window:addChoice(str)
		choice.skill = skill.id
	end 

	window:addButton('add', 		function (button, choice)
			skillSystem:addSkill(player, choice.skill, 1)
			test(player)
		end)
	window:addButton('add +10', 		function (button, choice)
			skillSystem:addSkill(player, choice.skill, 10)
			test(player)
		end)
	window:addButton('Reset', 
		function (button, choice)
			skillSystem:returnPoints(player)
			test(player)
		end)


	window:addButton('Exit')

	window:setDefaultEnterButton('add')
	window:setDefaultEscapeButton('Exit')
	 
	window:sendToPlayer(player)

end 

function onSay(player, words, param)
	if (not player:hasEquipment()) then 
		test(player)
	else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "Vc so pode chamar menu sem equipmentos.")
	end
	return false
end
 