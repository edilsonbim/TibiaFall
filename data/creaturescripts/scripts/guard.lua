function onCombat(cid, target)

if(not isPlayer(target)) then
return true
else

targets = getMonsterTargetList(cid)

if getPlayerGuildId(target) == getGlobalStorageValue(123123﻿) then
  addEvent(check,1000,cid,targets)
  return false
else
return true
end
end
end

function check(cid,targets)

for i=1, #targets do
   if getPlayerGuildId(targets[i]) == getGlobalStorageValue(123123) then

      addEvent(check,1000,cid,targets)
      return false
   else
       stopEvent(check)
       return true
   end
end
end