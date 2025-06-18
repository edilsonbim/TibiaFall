local slotShield = nil
local slotArmor = nil
local slotLegs = nil
local slotHelmet = nil
local slotBoots = nil	

local slots = {

[1] = {slot=slotHelmet, lib=helmets},	
[4] = {slot=slotArmor, lib=armors},
[5] = {slot=slotShield, lib=shields},
[6] = {slot=slotShield, lib=shields},
[7] = {slot=slotLegs, lib=legs},
[8] = {slot=slotBoots, lib=boots}	

}

function onThink(cid, interval)

if (isPlayer(cid)) then
for i=1, 8 do
if slots[i] ~= nil then
	if slots[i].lib[getPlayerSlotItem(cid, i).itemid] then
		slots[i].slot = i					
		if setDurMaxHit(cid, slots[i].slot, slots[i].libs) then
			return true
		end
	end
end
end
local slotWeapon = nil
if weapons[getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid] then
slotWeapon = CONST_SLOT_RIGHT					
elseif weapons[getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid] then
slotWeapon = CONST_SLOT_LEFT
end
if slotWeapon ~= nil then
if setDurMaxHit(cid, slotWeapon, weapons) then
	return true
end
end

if getPlayerStorageValue(cid, 456431) < 0 then
	chance = math.random(15,30)
	setPlayerStorageValue(cid, 456432, chance)
end

chance = getPlayerStorageValue(cid, 456432)
if(getCreatureCondition(cid, CONDITION_INFIGHT)) and getPlayerStorageValue(cid, 456431) < chance then
	local health = getCreatureHealth(cid)
	setPlayerStorageValue(cid, 456431, getPlayerStorageValue(cid, 456431)+1)
﻿	if getPlayerStorageValue(cid, 456431) == chance-1 then
		addEvent(verificaLife, 1000, health, cid)
		setPlayerStorageValue(cid, 456431, -1)
	end
end
end
end

function verificaLife(health, cid)
if (isPlayer(cid)) then
if getCreatureHealth(cid) < health then		
	for i=1, 8 do
		if slots[i] ~= nil then
			if slots[i].lib[getPlayerSlotItem(cid, i).itemid] then
				slots[i].slot = i					
				addEvent(setDurabilidade, math.random(10000,60000), cid, slots[i].slot, slots[i].libs)
			end	
		end
	end
end
end
end