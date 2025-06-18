weapons = {

[2421] = {charge=100},
[2415] = {charge=50},
[2404] = {charge=50}

}

shields = {

[2516] = {charge=50, def=31}, -- dragon shield
[2520] = {charge=50, def=35} -- demon shield

}

armors = {

[2486] = {charge=50, arm=15}

}

legs = {

[7894] = {charge=50, arm=8}

}

helmets = {

[2501] = {charge=50, arm=7}

}

boots = {

[11113] = {charge=50, arm=3}

}

-- Não configurar daqui para baixo --

function isWeapon(uid) -- Function by Mock the bear.
	 uid = uid or 0
	 local f = getItemWeaponType(uid)
	 if f == 1 or f == 2 or f == 3 then
		 return true
	 end
	 return false
end
function isShield(uid) -- Function by Mock the bear.
	 uid = uid or 0
	 if getItemWeaponType(uid) == 4 then
		 return true
	 end
	 return false
end

function setItemName(uid,name) -- Function by Mock the bear.
return doItemSetAttribute(uid,'name',name)
end

function setItemDefense(uid,name) -- Function by Mock the bear.
return doItemSetAttribute(uid,'defense',name)
end

function setItemArmor(uid,name) -- Function by Mock the bear.
return doItemSetAttribute(uid,'armor',name)
end

function setDurabilidade(cid, slot, lib)
if (isPlayer(cid)) then
if getPlayerSlotItem(cid, slot).uid > 0 then
	if (getItemAttribute(getPlayerSlotItem(cid, slot).uid, "Charges")) ~= "Broken" then	
		doItemSetAttribute(getPlayerSlotItem(cid, slot).uid, "Charges", (getItemAttribute(getPlayerSlotItem(cid, slot).uid, "Charges")) - 1)
		setItemName(getPlayerSlotItem(cid, slot).uid, getItemNameById(getPlayerSlotItem(cid, slot).itemid)..' [Dur: '.. (getItemAttribute(getPlayerSlotItem(cid, slot).uid, "Charges")) ..'/'.. lib[getPlayerSlotItem(cid, slot).itemid].charge ..']')
		if getItemAttribute(getPlayerSlotItem(cid, slot).uid, "Charges") <= 0 then
			doPlayerSendTextMessage(cid, 22, "Your item has broken.")
			if (isShield(getPlayerSlotItem(cid, slot).uid)) then
				setItemDefense(getPlayerSlotItem(cid, slot).uid, 0)
			end
			if (not isShield(getPlayerSlotItem(cid, slot).uid) and not isWeapon(getPlayerSlotItem(cid, slot).uid)) then
				setItemArmor(getPlayerSlotItem(cid, slot).uid, 0)
			end
			doSendMagicEffect(getPlayerPosition(cid), 2)
			doItemSetAttribute(getPlayerSlotItem(cid, slot).uid, "Charges", "Broken")
			return true
		end
	else
		doSendMagicEffect(getPlayerPosition(cid), 2)
		return false
	end
	end
end
end

function setDurMaxHit(cid, slot, lib)
if (getItemAttribute(getPlayerSlotItem(cid, slot).uid, "Charges")) ~= "Broken" then
if (getItemAttribute(getPlayerSlotItem(cid, slot).uid, "Charges") == nil or getItemAttribute(getPlayerSlotItem(cid, slot).uid, "Charges") == 0 and slot ~= nil) then
	doItemSetAttribute(getPlayerSlotItem(cid, slot).uid, "Charges", lib[getPlayerSlotItem(cid, slot).itemid].charge)
	setItemName(getPlayerSlotItem(cid, slot).uid, getItemNameById(getPlayerSlotItem(cid, slot).itemid)..' [Dur: '.. (getItemAttribute(getPlayerSlotItem(cid, slot).uid, "Charges")) ..'/'.. lib[getPlayerSlotItem(cid, slot).itemid].charge ..']')
	return true
end
end
return false
end