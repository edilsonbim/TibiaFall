function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if (not player) then
		return false
	end

	player:openImbuementWindow(itemEx)

	return true
end

--[[
	1~3 => Element Type
	4~6 => Total Time (segundos - 20 h)
	7~9 => Time Passed (seconds)
]]

--[[ Icon List --
	0 = NONE
	1 ~ 3   = Critical
	4 ~ 6   = Death
	7 ~ 9   = Earth
	10 ~ 12 = Energy
	13 ~ 15 = Fire
	16 ~ 18 = Holy
	19 ~ 21 = Ice
	22 ~ 24 = Fire (grey | not used)
	25 ~ 27 = Shielding (grey | not used)
	28 ~ 30 = Reduction Earth
	31 ~ 33 = Reduction Energy
	34 ~ 36 = Reduction Fire
	37 ~ 39 = Reduction Holy
	40 ~ 42 = Reduction Ice
	43 ~ 45 = Shielding (white | not used)
	46 ~ 48 = Life Leech
	49 ~ 51 = Mana Leech
	52 ~ 54 = Axe Fighting
	55 ~ 57 = Club Fighting
	58 ~ 60 = Distance Fighting
	61 ~ 63 = Fist Fighting
	64 ~ 66 = Magic Level
	67 ~ 69 = Shielding Fighting
	70 ~ 72 = Sword Fighting
	73 ~ 75 = Speed
]]

ImbuingSystem = {
	Developer = "Charles (Cjaker)",
	Version = "1.0",
	LastUpdate = "24/05/2017 - 03:50 (AM)"
}

local Imbuements = {

	{
		Name = "Heavy Helmet",
		Category = "Heavy Helmets",
		Type = "absorbPercentDeath",
		IconID = 25,
		Description = "Reduces all damages by %%.",
		Levels = {"Dread helmet", "Golden helmet", "Dragon Scale helmet"},
		LevelsPercent = {9, 10, 12},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Heavy Armor",
		Category = "Heavy Armors",
		Type = "absorbPercentEarth",
		IconID = 28,
		Description = "Reduces all damages by %%.",
		Levels = {"Dread armor", "Golden armor", "Dragon Scale mail"},
		LevelsPercent = {9, 10, 12},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Heavy Legs",
		Category = "Heavy Legs",
		Type = "absorbPercentFire",
		IconID = 34,
		Description = "Reduces all damages by %%.",
		Levels = {"Dread legs", "Golden legs", "Dragon Scale legs"},
		LevelsPercent = {9, 10, 12},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Heavy Boots",
		Category = "Heavy Boots",
		Type = "absorbPercentIce",
		IconID = 40,
		Description = "Reduces all damages by %%.",
		Levels = {"Dread boots", "Golden boots", "Dragon Scale boots"},
		LevelsPercent = {9, 10, 12},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Medium Helmet",
		Category = "Medium Helmets",
		Type = "absorbPercentDeath",
		IconID = 25,
		Description = "Reduces all damages by %%.",
		Levels = {"Intricate helmet", "Intricate helmet", "Intricate helmet"},
		LevelsPercent = {8, 9, 10},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Medium Armor",
		Category = "Medium Armors",
		Type = "absorbPercentEarth",
		IconID = 28,
		Description = "Reduces all damages by %%.",
		Levels = {"Intricate armor", "Intricate armor", "Intricate armor"},
		LevelsPercent = {8, 9, 10},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Medium Legs",
		Category = "Medium Legs",
		Type = "absorbPercentFire",
		IconID = 34,
		Description = "Reduces all damages by %%.",
		Levels = {"Intricate Legs", "Intricate Legs", "Intricate Legs"},
		LevelsPercent = {8, 9, 10},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Medium Boots",
		Category = "Medium Boots",
		Type = "absorbPercentIce",
		IconID = 40,
		Description = "Reduces all damages by %%.",
		Levels = {"Intricate boots", "Intricate boots", "Intricate boots"},
		LevelsPercent = {8, 9, 10},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},	
	{
		Name = "Light Helmet",
		Category = "Light Helmets",
		Type = "absorbPercentDeath",
		IconID = 25,
		Description = "Reduces all damages by %%.",
		Levels = {"Elegant hat", "Elegant hat", "Elegant hat"},
		LevelsPercent = {7, 8, 9},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Light Armor",
		Category = "Light Armors",
		Type = "absorbPercentEarth",
		IconID = 28,
		Description = "Reduces all damages by %%.",
		Levels = {"Elegant robe", "Elegant robe", "Elegant robe"},
		LevelsPercent = {7, 8, 9},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Light Legs",
		Category = "Light Legs",
		Type = "absorbPercentFire",
		IconID = 34,
		Description = "Reduces all damages by %%.",
		Levels = {"Elegant legs", "Elegant legs", "Elegant legs"},
		LevelsPercent = {7, 8, 9},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Light Boots",
		Category = "Light Boots",
		Type = "absorbPercentIce",
		IconID = 40,
		Description = "Reduces all damages by %%.",
		Levels = {"Elegant shoes", "Elegant shoes", "Elegant shoes"},
		LevelsPercent = {7, 8, 9},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},	
	{
		Name = "Soft Helmet",
		Category = "Soft Helmets",
		Type = "absorbPercentDeath",
		IconID = 25,
		Description = "Reduces all damages by %%.",
		Levels = {"Archmage hat", "Archmage hat", "Archmage hat"},
		LevelsPercent = {7, 8, 9},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Soft Armor",
		Category = "Soft Armors",
		Type = "absorbPercentEarth",
		IconID = 28,
		Description = "Reduces all damages by %%.",
		Levels = {"Archmage robe", "Archmage robe", "Archmage robe"},
		LevelsPercent = {7, 8, 9},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Soft Legs",
		Category = "Soft Legs",
		Type = "absorbPercentFire",
		IconID = 34,
		Description = "Reduces all damages by %%.",
		Levels = {"Archmage legs", "Archmage legs", "Archmage legs"},
		LevelsPercent = {7, 8, 9},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Soft Boots",
		Category = "Soft Boots",
		Type = "absorbPercentIce",
		IconID = 40,
		Description = "Reduces all damages by %%.",
		Levels = {"Archmage boots", "Archmage boots", "Archmage boots"},
		LevelsPercent = {7, 8, 9},
		Weapons = {"Armorsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Bow",
		Category = "Bow",
		Type = "absorbPercentEnergy",
		IconID = 31,
		Description = "Aumenta seu dexterity em %.",
		Levels = {"Falcon Bow", "Falcon Bow", "Falcon Bow"},
		LevelsPercent = {3, 8, 15},
		Weapons = {"Weaponsmithing"},
		Items = {{5892, 8}, {9971, 16}, {27606, 4}}
	},
	{
		Name = "Shield",
		Category = "Shields",
		Type = "absorbPercentEnergy",
		IconID = 31,
		Description = "Reduces all damages by %.",
		Levels = {"Plate", "Golden", "Dragon Scale"},
		LevelsPercent = {3, 8, 15},
		Weapons = {"Weaponsmithing"},
		Items = {{5892, 8}, {9971, 16}, {27606, 4}}
	},
	{
		Name = "Wood Axe",
		Category = "Wood Axes",
		Type = "magiclevelpoints",
		IconID = 64,
		Description = "Aumenta sua coleta em %.",
		Levels = {"Selentine", "Veilron", "Leenspar"},
		LevelsPercent = {1, 2, 4},
		Weapons = {"Weaponsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Pick",
		Category = "Picks",
		Type = "absorbPercentHoly",
		IconID = 37,
		Description = "Aumenta sua coleta %.",
		Levels = {"Selentine", "Veilron", "Leenspar"},
		LevelsPercent = {3, 8, 15},
		Weapons = {"Weaponsmithing"},
		Items = {{5892, 4}, {9971, 8}, {27606, 2}}
	},
	{
		Name = "Sword",
		Category = "Swords",
		Type = "speed",
		IconID = 73,
		Description = "Aumenta seu attack speed em %.",
		Levels = {"Avenger", "Magic Long", "Warlord"},
		LevelsPercent = {3, 6, 10},
		Weapons = {"Weaponsmithing"},
		Items = {{5892, 8}, {9971, 16}, {27606, 4}}
	},
	{
		Name = "Axe",
		Category = "Axes",
		Type = "skillAxe",
		IconID = 52,
		Description = "Aumenta seu axe fighting em %.",
		Levels = {"Guardian", "War", "Demonwing"},
		LevelsPercent = {3, 6, 10},
		Weapons = {"Weaponsmithing"},
		Items = {{5892, 8}, {9971, 16}, {27606, 4}}
	},
	{
		Name = "Hammer",
		Category = "Clubs",
		Type = "skillSword",
		IconID = 70,
		Description = "Aumenta seu strenght em %.",
		Levels = {"Wrath", "Thunder", "Jade"},
		LevelsPercent = {6, 12, 25},
		Weapons = {"Weaponsmithing"},
		Items = {{5892, 8}, {9971, 16}, {27606, 4}}
	},
	{
		Name = "Coal",
		Category = "Coal",
		Type = "skillClub",
		IconID = 52,
		Description = "Craft %x Coal.",
		Levels = {"1x", "5x", "20x"},
		LevelsPercent = {1, 5, 20},
		Weapons = {"Smelting"},
		Items = {{5901, 5}, {5901, 20}, {5901, 75}}
	},
	{
		Name = "Smelth",
		Category = "Smelth",
		Type = "skillClub",
		IconID = 52,
		Description = "Craft 1 %.",
		Levels = {"Coal", "Crude Iron", "Gold Ingot"},
		LevelsPercent = {"Coal", "Crude Iron", "Gold Ingot"},
		Weapons = {"Smelting"},
		Items = {{5901, 5}, {2225, 10}, {2157, 20}}
	},
	{
		Name = "Blockade",
		Category = "Increase Shielding",
		Type = "skillShield",
		IconID = 67,
		Description = "raises shielding skill by %.",
		Levels = {"Basic", "Intricate", "Powerful"},
		LevelsPercent = {1, 2, 4},
		Weapons = {"Laboratory"},
		Items = {{10558, 20}, {12659, 25}, {22533, 25}}
	},
	{
		Name = "Epiphany",
		Category = "Increase Magic Level",
		Type = "magiclevelpoints",
		IconID = 64,
		Description = "raises magic level by %.",
		Levels = {"Basic", "Intricate", "Powerful"},
		LevelsPercent = {1, 2, 4},
		Weapons = {"Laboratory"},
		Items = {{10552, 25}, {12408, 15}, {11226, 15}}
	},
	{
		Name = "Featherweight",
		Category = "Increase Capacity",
		Type = "capacity",
		IconID = 64,
		Description = "raises capacity by %.",
		Levels = {"Basic", "Intricate", "Powerful"},
		LevelsPercent = {3, 8, 15},
		Weapons = {"Laboratory"},
		Items = {{28998, 25}, {29006, 10}, {22539, 5}}
	}
}

local Weapons = {
	["Armorsmithing"] = {24964, 24965},
	["Weaponsmithing"] = {8671},
	["Smelting"] = {8669, 8670},
	["Cooking"] = {8686},
	["Laboratory"] = {26398},

	["Letherworking"] = {8855, 25987},
	["backpack"] = {1988, 27063},
	["wand"] = {8920, 25991},
	["rod"] = {8910, 25995},
	["axe"] = {2429, 25971},
	["club"] = {2391, 25939},
	["sword"] = {7407, 25959, 25963}
}

local ImbuingInfo = {
	[1] = {Price = 5, Protection = 5, Percent = 90},
	[2] = {Price = 5, Protection = 50, Percent = 90},
	[3] = {Price = 5, Protection = 250, Percent = 90}
}

local imbuingShrineIds = {
	27728, 27729, 27850, 27851
}

local ImbuementElements = {
	"firedamage", "earthdamage", "energydamage", "deathdamage", "icedamage"
}

local ErrorMessages = {
	MESSAGEDIALOG_IMBUEMENT_ERROR = 1,
	MESSAGEDIALOG_IMBUEMENT_ROLL_FAILED = 2,
	MESSAGEDIALOG_IMBUING_STATION_NOT_FOUND = 3,
	MESSAGEDIALOG_CLEARING_CHARM_SUCCESS = 10,
	MESSAGEDIALOG_CLEARING_CHARM_ERROR = 11
}

local ClientPackets = {
	ApplyImbuement = 0xD5,
	ClearImbuement = 0xD6
}

function onRecvbyte(player, msg, byte)
	if (byte == ClientPackets.ApplyImbuement) then
		-- Apply Imbuement
		player:applyImbuement(msg)
	elseif (byte == ClientPackets.ClearImbuement) then
		-- Clear Imbuement
		player:clearImbuement(msg)
	end
end

local function tableContains(table, value)
	for i = 1, #table do
		if (table[i] == value) then
			return true
		end
	end

	return false
end

local function haveImbuingShrine(player)
	for x = -1, 1 do
		for y = -1, 1 do
			local posX, posY, posZ = player:getPosition().x+x, player:getPosition().y+y, player:getPosition().z
			local tile = Tile(posX, posY, posZ)
			if (tile) then
				for index, id in pairs(imbuingShrineIds) do
					if tile:getItemById(id) then
						return true
					end
				end
			end
		end
	end

	return false
end

local function getEquipById(id)
	for i, v in pairs(Weapons) do
		if (tableContains(v, id)) then
			return i
		end
	end

	return nil
end

local function getImbuementEquip(equip)
	local tableReturn = {}
	for i = 1, #Imbuements do
		if (tableContains(Imbuements[i].Weapons, equip)) then
			tableReturn[#tableReturn+1] = Imbuements[i]
		end
	end

	return tableReturn
end

local function getActiveImbuement(item, slot)
	for i = 1, #Imbuements do
		for j = 1, 3 do
			local level = Imbuements[i].Levels[j]
			local enchant = item:getSpecialAttribute(slot)
			if (enchant and type(enchant) ~= 'number' and enchant:find(level) and enchant:find(Imbuements[i].Name)) then
				return Imbuements[i], j
			end
		end
	end

	return nil
end

local function getImbuementByIndex(index, id)
	local equip = getEquipById(id)
	local myImbuements = getImbuementEquip(equip)
	local tmpIndex = 0
	for i = 1, #myImbuements do
		for k = 1, 3 do
			tmpIndex = tmpIndex + 1
			if (index == tmpIndex) then
				return myImbuements[i], k
			end
		end
	end

	return nil
end

local function sendImbuementError(self, message, errorType)
	local msg = NetworkMessage()
	msg:addByte(0xED)
	msg:addByte(errorType or 0x01)
	msg:addString(message)
	msg:sendToPlayer(self)
end

local function mergeImbuementList(table1, table2)
	local newTable = {}
	for i, v in pairs(table1) do
		if (v.Name ~= table2.Name and not (tableContains(ImbuementElements, v.Type) and tableContains(ImbuementElements, table2.Type))) then
			newTable[#newTable+1] = v
		end
	end

	return newTable
end

function Player.applyImbuement(self, msg)
	local item = lastItemImbuing[self:getGuid()]
	if not item then
		sendImbuementError(self, "Cannot find item, please contact an Administrator.", ErrorMessages.MESSAGEDIALOG_IMBUEMENT_ERROR)
		return false
	end

	local slot, choiceId, useProtection = msg:getByte(), msg:getU32(), msg:getByte()
	local myImbuements = getImbuementEquip(getEquipById(item:getId()))
	local imbuingLevel = 0
	local imbuementNow, index = nil, 0

	for i = 1, item:getType():getImbuingSlots() do
		existsImbuement, enchantLevel = getActiveImbuement(item, i)
		if existsImbuement then
			myImbuements = mergeImbuementList(myImbuements, existsImbuement)
		end
	end

	for k = 1, #myImbuements do
		for i = 1, 3 do
			index = index + 1
			if not imbuementNow and index == choiceId then
				imbuementNow = myImbuements[k]
			end
		end
	end

	for i = 3, index, 3 do
		if choiceId >= i-2 and choiceId <= i then
			imbuingLevel = math.abs((i - 2) - choiceId) + 1
			break
		end
	end

	if (not imbuementNow) then
		sendImbuementError(self, "Cannot find imbuement data, please contact an Administrator.", ErrorMessages.MESSAGEDIALOG_IMBUEMENT_ERROR)
		return false
	end

	local imbuingPrice = ImbuingInfo[imbuingLevel].Price
	if (useProtection == 1) then
		imbuingPrice = imbuingPrice + ImbuingInfo[imbuingLevel].Protection
	end

	if (not self:removeMoneyNpc(imbuingPrice)) then
		sendImbuementError(self, "You don't have enough money " ..imbuingPrice.. " gps.", ErrorMessages.MESSAGEDIALOG_IMBUEMENT_ROLL_FAILED)
		return false
	end

	slot = slot + 1
	if self:getAccountType() < 5 then
		for j = 1, imbuingLevel do
			local itemID, itemCount = imbuementNow.Items[j][1], imbuementNow.Items[j][2]
			if (self:getItemCount(itemID) < itemCount) then
				sendImbuementError(self, "You don't have all necessary items.", ErrorMessages.MESSAGEDIALOG_IMBUEMENT_ROLL_FAILED)
			return false
			end
				self:removeItem(itemID, itemCount)

		end
	end

	if (item:isActiveImbuement(slot+3)) then
		sendImbuementError(self, "An error ocurred, please reopen imbuement window.", ErrorMessages.MESSAGEDIALOG_IMBUEMENT_ERROR)
		return false
	end

	local applyChance = math.random(100)
	if (ImbuingInfo[imbuingLevel].Percent < applyChance and useProtection == 0) then
		sendImbuementError(self, "Item failed to apply imbuement.", ErrorMessages.MESSAGEDIALOG_IMBUEMENT_ROLL_FAILED)
		return false
	end


--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< item que a
	self:openImbuementWindow(item)

				if imbuementNow.Name == "Heavy Helmet" and imbuingLevel == 1 then
				self:addItem(36575, 20000)
				end
				if imbuementNow.Name == "Heavy Armor" and imbuingLevel == 1 then
				self:addItem(36576, 20000)
				end
				if imbuementNow.Name == "Heavy Legs" and imbuingLevel == 1 then
				self:addItem(36577, 20000)
				end
				if imbuementNow.Name == "Heavy Boots" and imbuingLevel == 1 then
				self:addItem(36578, 20000)
				end
				if imbuementNow.Name == "Heavy Helmet" and imbuingLevel == 2 then
				self:addItem(2471, 20000)
				end
				if imbuementNow.Name == "Heavy Armor" and imbuingLevel == 2 then
				self:addItem(2466, 20000)
				end
				if imbuementNow.Name == "Heavy Legs" and imbuingLevel == 2 then
				self:addItem(2470, 20000)
				end
				if imbuementNow.Name == "Heavy Boots" and imbuingLevel == 2 then
				self:addItem(2646, 20000)
				end
				if imbuementNow.Name == "Heavy Helmet" and imbuingLevel == 3 then
				self:addItem(2506, 20000)
				end
				if imbuementNow.Name == "Heavy Armor" and imbuingLevel == 3 then
				self:addItem(2492, 20000)
				end
				if imbuementNow.Name == "Heavy Legs" and imbuingLevel == 3 then
				self:addItem(2469, 20000)
				end
				if imbuementNow.Name == "Heavy Boots" and imbuingLevel == 3 then
				self:addItem(11118, 20000)
				end

				if imbuementNow.Name == "Medium Helmet" and imbuingLevel == 1 then
				self:addItem(36579, 20000)
				end
				if imbuementNow.Name == "Medium Armor" and imbuingLevel == 1 then
				self:addItem(36580, 20000)
				end
				if imbuementNow.Name == "Medium Legs" and imbuingLevel == 1 then
				self:addItem(36581, 20000)
				end
				if imbuementNow.Name == "Medium Boots" and imbuingLevel == 1 then
				self:addItem(36582, 20000)
				end
				if imbuementNow.Name == "Medium Helmet" and imbuingLevel == 2 then
				self:addItem(36579, 20000)
				end
				if imbuementNow.Name == "Medium Armor" and imbuingLevel == 2 then
				self:addItem(36580, 20000)
				end
				if imbuementNow.Name == "Medium Legs" and imbuingLevel == 2 then
				self:addItem(36581, 20000)
				end
				if imbuementNow.Name == "Medium Boots" and imbuingLevel == 2 then
				self:addItem(36582, 20000)
				end
				if imbuementNow.Name == "Medium Helmet" and imbuingLevel == 3 then
				self:addItem(36579, 20000)
				end
				if imbuementNow.Name == "Medium Armor" and imbuingLevel == 3 then
				self:addItem(36580, 20000)
				end
				if imbuementNow.Name == "Medium Legs" and imbuingLevel == 3 then
				self:addItem(36581, 20000)
				end
				if imbuementNow.Name == "Medium Boots" and imbuingLevel == 3 then
				self:addItem(36582, 20000)
				end

				if imbuementNow.Name == "Light Helmet" and imbuingLevel == 1 then
				self:addItem(36587, 20000)
				end
				if imbuementNow.Name == "Light Armor" and imbuingLevel == 1 then
				self:addItem(36588, 20000)
				end
				if imbuementNow.Name == "Light Legs" and imbuingLevel == 1 then
				self:addItem(36589, 20000)
				end
				if imbuementNow.Name == "Light Boots" and imbuingLevel == 1 then
				self:addItem(36590, 20000)
				end
				if imbuementNow.Name == "Light Helmet" and imbuingLevel == 2 then
				self:addItem(36587, 20000)
				end
				if imbuementNow.Name == "Light Armor" and imbuingLevel == 2 then
				self:addItem(36588, 20000)
				end
				if imbuementNow.Name == "Light Legs" and imbuingLevel == 2 then
				self:addItem(36589, 20000)
				end
				if imbuementNow.Name == "Light Boots" and imbuingLevel == 2 then
				self:addItem(36590, 20000)
				end
				if imbuementNow.Name == "Light Helmet" and imbuingLevel == 3 then
				self:addItem(36587, 20000)
				end
				if imbuementNow.Name == "Light Armor" and imbuingLevel == 3 then
				self:addItem(36588, 20000)
				end
				if imbuementNow.Name == "Light Legs" and imbuingLevel == 3 then
				self:addItem(36589, 20000)
				end
				if imbuementNow.Name == "Light Boots" and imbuingLevel == 3 then
				self:addItem(36590, 20000)
				end

				if imbuementNow.Name == "Soft Helmet" and imbuingLevel == 1 then
				self:addItem(36583, 20000)
				end
				if imbuementNow.Name == "Soft Armor" and imbuingLevel == 1 then
				self:addItem(36584, 20000)
				end
				if imbuementNow.Name == "Soft Legs" and imbuingLevel == 1 then
				self:addItem(36585, 20000)
				end
				if imbuementNow.Name == "Soft Boots" and imbuingLevel == 1 then
				self:addItem(36586, 20000)
				end
				if imbuementNow.Name == "Soft Helmet" and imbuingLevel == 2 then
				self:addItem(36583, 20000)
				end
				if imbuementNow.Name == "Soft Armor" and imbuingLevel == 2 then
				self:addItem(36584, 20000)
				end
				if imbuementNow.Name == "Soft Legs" and imbuingLevel == 2 then
				self:addItem(36585, 20000)
				end
				if imbuementNow.Name == "Soft Boots" and imbuingLevel == 2 then
				self:addItem(36586, 20000)
				end
				if imbuementNow.Name == "Soft Helmet" and imbuingLevel == 3 then
				self:addItem(36583, 20000)
				end
				if imbuementNow.Name == "Soft Armor" and imbuingLevel == 3 then
				self:addItem(36584, 20000)
				end
				if imbuementNow.Name == "Soft Legs" and imbuingLevel == 3 then
				self:addItem(36585, 20000)
				end
				if imbuementNow.Name == "Soft Boots" and imbuingLevel == 3 then
				self:addItem(36586, 20000)
				end


				if imbuementNow.Name == "Bow" and imbuingLevel == 1 then
				self:addItem(32418, 10000)
				end
				if imbuementNow.Name == "Bow" and imbuingLevel == 2 then
				self:addItem(32418, 10000)
				end
				if imbuementNow.Name == "Bow" and imbuingLevel == 3 then
				self:addItem(32418, 10000)
				end
				if imbuementNow.Name == "Wood Axe" and imbuingLevel == 1 then
				self:addItem(32400, 1)
				end
				if imbuementNow.Name == "Wood Axe" and imbuingLevel == 2 then
				self:addItem(32401, 1)
				end
				if imbuementNow.Name == "Wood Axe" and imbuingLevel == 3 then
				self:addItem(32402, 1)
				end
				if imbuementNow.Name == "Pick" and imbuingLevel == 1 then
				self:addItem(32403, 1)
				end
				if imbuementNow.Name == "Pick" and imbuingLevel == 2 then
				self:addItem(32404, 1)
				end
				if imbuementNow.Name == "Pick" and imbuingLevel == 3 then
				self:addItem(32405, 1)
				end
				if imbuementNow.Name == "Sword" and imbuingLevel == 1 then
				self:addItem(6528, 1)
				end
				if imbuementNow.Name == "Sword" and imbuingLevel == 2 then
				self:addItem(2390, 1)
				end
				if imbuementNow.Name == "Sword" and imbuingLevel == 3 then
				self:addItem(2408, 1)
				end
				if imbuementNow.Name == "Axe" and imbuingLevel == 1 then
				self:addItem(15454, 1)
				end
				if imbuementNow.Name == "Axe" and imbuingLevel == 2 then
				self:addItem(2454, 1)
				end
				if imbuementNow.Name == "Axe" and imbuingLevel == 3 then
				self:addItem(8926, 1)
				end
				if imbuementNow.Name == "Hammer" and imbuingLevel == 1 then
				self:addItem(2444, 1)
				end
				if imbuementNow.Name == "Hammer" and imbuingLevel == 2 then
				self:addItem(2421, 1)
				end
				if imbuementNow.Name == "Hammer" and imbuingLevel == 3 then
				self:addItem(7422, 1)
				end
				if imbuementNow.Name == "Smelth" and imbuingLevel == 1 then
				self:addItem(13757, 1)
				end
				if imbuementNow.Name == "Smelth" and imbuingLevel == 2 then
				self:addItem(5892, 1)
				end
				if imbuementNow.Name == "Smelth" and imbuingLevel == 3 then
				self:addItem(9971, 1)
				end
				if imbuementNow.Name == "Coal" and imbuingLevel == 1 then
				self:addItem(13757, 1)
				end
				if imbuementNow.Name == "Coal" and imbuingLevel == 2 then
				self:addItem(13757, 5)
				end
				if imbuementNow.Name == "Coal" and imbuingLevel == 3 then
				self:addItem(13757, 20)
				end
				if itemID == itemID then
				end	
end

function Player.clearImbuement(self, msg)
	if (not haveImbuingShrine(self)) then
		sendImbuementError(self, "Sorry, not possible.", ErrorMessages.MESSAGEDIALOG_CLEARING_CHARM_ERROR)
		return false
	end

	local item = lastItemImbuing[self:getGuid()]
	if (item == nil) then
		sendImbuementError(self, "Cannot find item, please send this message to a Administrator.", ErrorMessages.MESSAGEDIALOG_CLEARING_CHARM_ERROR)
		return false
	end

	local weaponSlot = msg:getByte()
	if (not weaponSlot) then
		sendImbuementError(self, "Sorry, not possible.", ErrorMessages.MESSAGEDIALOG_CLEARING_CHARM_ERROR)
		return false
	end

	weaponSlot = weaponSlot + 1
	if (not item:isActiveImbuement(weaponSlot + 3)) then
		sendImbuementError(self, "Sorry, not possible.", ErrorMessages.MESSAGEDIALOG_CLEARING_CHARM_ERROR)
		return false
	end

	if (not self:removeMoneyNpc(15000)) then
		sendImbuementError(self, "You don't have enough money 15000 gps.", ErrorMessages.MESSAGEDIALOG_CLEARING_CHARM_ERROR)
		return false
	end


	self:openImbuementWindow(item)
	sendImbuementError(self, "Item clean success!", ErrorMessages.MESSAGEDIALOG_CLEARING_CHARM_SUCCESS)
end

function Player.closeImbuementWindow(self)
	local msg = NetworkMessage()
	msg:addByte(0xEC)
	msg:sendToPlayer(self)
end

function Player.openImbuementWindow(self, item)
	if (not item or not item:isItem() or not item:isImbuementEquip()) then
		self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Este item deve ser usado em uma mesa de craft.")
		return false
	end

	for slot = 1, 10 do
		if (self:getSlotItem(slot) and self:getSlotItem(slot):getUniqueId() == item:getUniqueId()) then
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot imbue an equipped item.")
			return false
		end
	end

	local msg = NetworkMessage()
	local itemID = item:getId()
	local equip = getEquipById(item:getId())
	local myImbuements = getImbuementEquip(equip)
	local imbuingSlots = item:getType():getImbuingSlots()
	lastItemImbuing[self:getGuid()] = item

	msg:addByte(0xEB)
	msg:addItemId(itemID) -- Item to put slots imbuement
	msg:addByte(imbuingSlots) -- Loop Exists Imbuement and slot (soon)

	for i = 1, imbuingSlots do
		if (item:isActiveImbuement(i+3)) then
			local existsImbuement, enchantLevel = getActiveImbuement(item, i)
			myImbuements = mergeImbuementList(myImbuements, existsImbuement)
			msg:addByte(0x01) -- No have imbuement (byte 1 need more packets)
			msg:addU32(900) -- Start Read Imbuement Data
			msg:addString(existsImbuement.Levels[enchantLevel].. " " ..existsImbuement.Name) -- Name Element

			local newDescription = existsImbuement.Description:gsub(" %%", " " ..existsImbuement.LevelsPercent[enchantLevel].."%%")
			msg:addString(newDescription.. "\nLasts for 20h 0min while fighting.") -- Description
			msg:addString(existsImbuement.Category) -- Type Imbuement
			msg:addU16(existsImbuement.IconID+(enchantLevel-1)) -- Icon ID (wtf?)
			msg:addU32(72000) -- duration in seconds (20hrs)
			msg:addByte(0x01) -- premium true
			msg:addByte(enchantLevel) -- Loop Length astral sources
			for j = 1, enchantLevel do
				local itemID, itemName = existsImbuement.Items[j][1], ItemType(existsImbuement.Items[j][1]):getName()
				msg:addItemId(itemID or 2160) -- Astral ID
				msg:addString(itemName or "") -- Astral Name
				msg:addU16(existsImbuement.Items[j][2]) -- Astral Necessary count
			end

			msg:addU32(ImbuingInfo[enchantLevel].Price)
			msg:addByte(ImbuingInfo[enchantLevel].Percent)
			msg:addU32(ImbuingInfo[enchantLevel].Protection) -- End Read Imbuement Data
			msg:addU32(item:getTimeImbuement(i+3)) -- Remaining Seconds
			msg:addU32(15000) -- Clear Cost Gold
		else
			msg:addByte(0x00)
		end
	end

	msg:addU16(#myImbuements*3) -- Loop Read Imbuement data
	local index = 0
	for k = 1, #myImbuements do
		for i = 1, 3 do
			index = index + 1
			msg:addU32(index) -- Start Read Imbuement Data
			msg:addString(myImbuements[k].Levels[i].. " ") -- Name Element

			local newDescription = myImbuements[k].Description:gsub(" %%", " " ..myImbuements[k].LevelsPercent[i])
			msg:addString(newDescription.. "\nLasts for 20h 0min while fighting.") -- Description
			msg:addString(myImbuements[k].Category) -- Type Imbuement
			msg:addU16(1) -- Icon ID (wtf?)
			msg:addU32(72000) -- duration in seconds (20hrs)
			if (i > 1) then
				msg:addByte(0x00) -- premium true
			else
				msg:addByte(0x00) -- premium false
			end

			msg:addByte(i) -- Loop Length astral sources
			for j = 1, i do
				local itemID, itemName = myImbuements[k].Items[j][1], ItemType(myImbuements[k].Items[j][1]):getName()
				msg:addItemId(itemID or 2160) -- Astral ID
				msg:addString(itemName or "") -- Astral Name
				msg:addU16(myImbuements[k].Items[j][2]) -- Astral Necessary count
			end

			msg:addU32(ImbuingInfo[i].Price)
			msg:addByte(ImbuingInfo[i].Percent)
			msg:addU32(ImbuingInfo[i].Protection) -- End Read Imbuement Data
		end
	end

	msg:addU32(#myImbuements*3)
	for k = 1, #myImbuements do
		for j = 1, 3 do
			msg:addItemId(myImbuements[k].Items[j][1])
			if self:getAccountType() < 5 then
				msg:addU16(self:getItemCount(myImbuements[k].Items[j][1]))
			else
				msg:addU16(999)
			end
		end
	end

	self:sendResource("bank", self:getBankBalance())
	self:sendResource("inventory", self:getMoney())
	msg:sendToPlayer(self)
end

function Item:isActiveImbuement(index)
	local time = self:getSpecialAttribute(index)
	if (time and time > 0) then
		return true
	end

	return false
end

function Item:getTimeImbuement(index)
	local time = self:getSpecialAttribute(index)
	if (time and time > 0) then
		return time
	end

	return false
end

function Item:isImbuementEquip()
	if (not self) then
		return false
	end

	if (self:getType() and self:getType():getImbuingSlots() > 0) then
		return true
	end

	return false
end

function Item:getImbuementType(slot)
	local enchant = self:getSpecialAttribute(slot)
	if (enchant == 0) then
		return false
	end

	for i, v in pairs(Imbuements) do
		for j = 1, 3 do
			if (enchant:find(v.Name) and enchant:find(v.Levels[j])) then
				return v.Type
			end
		end
	end

	return nil
end

function Item:getImbuementPercent(name)
	for i, v in pairs(Imbuements) do
		for j = 1, 3 do
			if (name:find(v.Name) and name:find(v.Levels[j]) and name ~= 0) then
				return v.LevelsPercent[j]
			end
		end
	end

	return nil
end
