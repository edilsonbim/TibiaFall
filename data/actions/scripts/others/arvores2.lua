local config = {
	item1 = 2700,
	item1b = 2703,
	item2 = 2719,
	item3 = 2770,
	item4 = 2771,
	porcentagem = 40, 
} 

local function revertIce(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(config.item4)
		if thing then
			thing:transform(config.item3)
		end
	end
end

local function revertIce2(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(config.item3)
		if thing then
			thing:transform(config.item2)
		end
	end
end
local function revertIce3(toPosition)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(config.item2)
		if thing then
			thing:transform(config.item1)
		end
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local value = player:getStorageValue(16456)
	local rand = math.random(1, 200)
	local skill = player:getSoul()+30
	local loot1 = math.random(2, 10)
	local loot2 = math.random(0, 0)
		if (target.itemid == config.item1) and (skill >= rand) or (target.itemid == config.item1b) and (skill >= rand) then
				player:addItem(5901, loot1)
				player:addItem(2157, loot2)
				addEvent(revertIce, 60 * 1000, toPosition)
				addEvent(revertIce2, 120 * 1000, toPosition)
				addEvent(revertIce3, 180 * 1000, toPosition)
				target:transform(config.item4)
				if loot2 >= 1 then
				player:sendTextMessage(MESSAGE_INFO_DESCR, 'You got ' ..loot1.. ' pieces of iron and ' .. loot2.. ' gold nugget.')
				else
				player:sendTextMessage(MESSAGE_INFO_DESCR, 'You got ' ..loot1.. ' woods.')
				end								
		elseif target.itemid == config.item1 or target.itemid == config.item1b then
				target:getPosition():sendMagicEffect(3)
				if (player) and value >= 1 then 
					player:setStorageValue(16456, value+1)
					player:say(tostring(value) .. "%", TALKTYPE_MONSTER_SAY)
					if value >= 100 then
					player:setStorageValue(16456, 1)
					player:say(tostring(value) .. "%", TALKTYPE_MONSTER_SAY)
					player:addSoul(1)
					end
				else
					player:setStorageValue(16456, 1)
					player:say(tostring(value), TALKTYPE_MONSTER_SAY)
				end
		return false
		end
	return true
end

