--[[ local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local vocation = {}
local town = {}
local config = {
	towns = {
		["venore"] = 1,
		["thais"] = 2,
		["carlin"] = 4
	},

	vocations = {
		["battlebrand"] = {
			text = "A Warrior Battle-Brand! ARE YOU SURE?",
			vocationId = 10,
			--equipment spellbook, wand of vortex, magician's robe, mage hat, studded legs, leather boots, scarf
			{{2175, 1}, {2190, 1}, {8819, 1}, {8820, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
			--container rope, shovel, mana potion, adventurer's stone
			{{2120, 1}, {2554, 1}, {7620, 1}, {18559, 1}}
		},

		["baresark"] = {
			text = "Warrior Baresark! ARE YOU SURE?",
			vocationId = 14,
			--equipment spellbook, snakebite rod, magician's robe, mage hat, studded legs, leather boots scarf
			{{2175, 1}, {2182, 1}, {8819, 1}, {8820, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
			--container rope, shovel, mana potion, adventurer's stone
			{{2120, 1}, {2554, 1}, {7620, 1}, {18559, 1}}
		}
	}
}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	local player = Player(cid)
	local level = player:getLevel()
	if level < 8 then
		npcHandler:say("CHILD! COME BACK WHEN YOU HAVE GROWN UP!", cid)
		npcHandler:resetNpc(cid)
		return false
	else
		npcHandler:setMessage(MESSAGE_GREET, player:getName() ..", ARE YOU PREPARED TO FACE YOUR DESTINY WARRIOR?")
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if npcHandler.topic[cid] == 0 then
		if msgcontains(msg, "yes") then
			npcHandler:say("IN ".. string.upper(msg) .."! AND WHAT WARRIOR HAVE YOU CHOSEN: {BARESARK} OR {BATTLEBRAND}?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif npcHandler.topic[cid] == 2 then
		local vocationTable = config.vocations[msg:lower()]
		if vocationTable then
			npcHandler:say(vocationTable.text, cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = vocationTable.vocationId
		else
			npcHandler:say("{BARESARK} OR {BATTLEBRAND}?", cid)
		end
	elseif npcHandler.topic[cid] == 3 then
		local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
		if msgcontains(msg, "yes") then
			npcHandler:say("SO BE IT!", cid)
			player:setVocation(Vocation(vocation[cid]))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received a backpack with starting items for reaching the mainlands.")
			inbox:addItem(2304, 10):getUniqueId()
		else
			npcHandler:say("THEN WHAT? {BARESARK} OR {BATTLEBRAND}?", cid)
			npcHandler.topic[cid] = 2
		end
	end
	return true
end

local function onAddFocus(cid)
	town[cid] = 0
	vocation[cid] = 0
end

local function onReleaseFocus(cid)
	town[cid] = nil
	vocation[cid] = nil
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
]]--
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	local player = Player(cid)
	local level = player:getLevel()
	if level < 1 then
		npcHandler:say("CHILD! COME BACK WHEN YOU HAVE GROWN UP TO LEVEL 20!", cid)
		npcHandler:resetNpc(cid)
		return false
	else
		npcHandler:setMessage(MESSAGE_GREET, "Hello " .. player:getName() ..", do you want to join the {Warrior} class?")
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if npcHandler.topic[cid] == 0 then
		if msgcontains(msg, "yes") then
			npcHandler:say("All right, now yous a Parimalist, don't dishonor your class!", cid)
			player:setVocation(10)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You now is a Warrior")
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setMessage(MESSAGE_FAREWELL, "COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
