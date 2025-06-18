function onUse(cid, item, frompos, item2, topos)
if (cid:getCondition(CONDITION_INFIGHT) or cid:isPzLocked()) == false then
if getHouseByPlayerGUID(getPlayerGUID(cid)) then        
doTeleportThing(cid, getHouseEntry(getHouseByPlayerGUID(getPlayerGUID(cid))))  
doRemoveItem(item.uid,1)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
doPlayerSendTextMessage(cid,22,"You have been teleported to your house, 1x house teleporter removed!")                                                  
else
doPlayerSendTextMessage(cid,22,"You still do not have a house, buy a talking '!buyhouse' front of her.")
return true
end
end
if (cid:getCondition(CONDITION_INFIGHT) or cid:isPzLocked()) == true then
doPlayerSendTextMessage(cid,22,"Please wait for your Battle/PZ for using house teleporter!")
return true
end
end