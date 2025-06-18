function onUse(cid, item, frompos, item2, topos)
if getPlayerGuildId(cid) == getGlobalStorageValue(78978) then
  doPlayerSendTextMessage(cid, 22, "Seja bem vindo a vosso castelo!")   
  return true
else
if 1 == 1 then
      doPlayerSendTextMessage(cid, 22, "Guaaaardas, tirem esses invasores daqui!!")
       for i = 1, 2 do
           doSummonCreature("Guarda", getCreaturePosition(cid))
       end
     end
print(getGlobalStorageValue(78978))
end
end