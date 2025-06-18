local config = {
	[0] = {
		--club, coat
		items = {{2398, 1}, {2461, 1}, {2467, 1}, {2649, 1}},
		--container rope, shovel, red apple
		container = {{2120, 1}, {2554, 1}, {2674, 2}}
	},
	[1] = {
		--equipment spellbook, wand of vortex, magician's robe, mage hat, studded legs, leather boots, scarf
		items = {{6528, 1000}, {36575, 2000}, {36576, 2000}, {36577, 2000}, {36578, 2000}, {2544, 100}, {2661, 1}},
		--container platinum coin, rope, shovel, mana potion
		container = {{36595, 1}, {36598, 1}, {2422, 1}, {2120, 1}, {2554, 1}, {7618, 5}, {7620, 5}, {32124, 1}}
	},
	[2] = {
		--equipment spellbook, snakebite rod, magician's robe, mage hat, studded legs, leather boots scarf
		items = {{32418, 1000}, {36579, 2000}, {36580, 2000}, {36581, 2000}, {36582, 2000}, {2544, 100}, {2661, 1}},
		--container platinum coin, rope, shovel, mana potion
		container = {{36595, 1}, {36598, 1}, {2422, 1}, {2120, 1}, {2554, 1}, {7618, 5}, {7620, 5}, {32127, 1}}
	},
	[3] = {
		--equipment dwarven shield, 5 spear, ranger's cloak, ranger legs scarf, legion helmet
		items = {{25422, 1000}, {36587, 2000}, {36588, 2000}, {36589, 2000}, {36590, 2000}, {2661, 1}},
		--container platinum coin, rope, shovel, health potion, mana potion
		container = {{36595, 1}, {36598, 1}, {2422, 1}, {2120, 1}, {2554, 1}, {7618, 5}, {7620, 5}, {32129, 1}}
	},
	[4] = {
		--equipment dwarven shield, steel axe, brass armor, brass helmet, brass legs scarf
		items = {{15400, 1000}, {36583, 2000}, {36584, 2000}, {36585, 2000}, {36586, 2000}, {2661, 1}},
		--container platinum coin, jagged sword, daramian mace, rope, shovel, health potion, mana potion
		container = {{36595, 1}, {36598, 1}, {2422, 1}, {2120, 1}, {2554, 1}, {7618, 5}, {7620, 5}, {32128, 1}}
	}

}

function onLogin(player)
	local targetVocation = config[player:getVocation():getId()]
	if not targetVocation then
		return true
	end

	if player:getLastLoginSaved() ~= 0 then
		return true
	end

	if (player:getSlotItem(CONST_SLOT_LEFT)) then
		return true
	end

	for i = 1, #targetVocation.items do
		player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
	end

	local backpack = player:getVocation():getId() == 0 and player:addItem(1987) or player:addItem(1988)
	if not backpack then
		return true
	end

	for i = 1, #targetVocation.container do
		backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
	end
	return true
end
