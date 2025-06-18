local function revertIce(topos)
  local tile = topos:getTile()
  if tile then
    local thing = tile:getItemById(30739)
    if thing then
      thing:transform(30738)
    end
  end
end

function onUse(cid, item, frompos, item2, topos) 

local castle_one_name = "Outlaw Camp"
local storage1 = 123127
local storage2 = 456460
local storage3 = 78982
local storage4 = 548459
position = getCreaturePosition(cid)

  if isPlayerGuild(cid) == true then
    guildname = getPlayerGuildName(cid)     
    guildID = getPlayerGuildId(cid)            
    dominanteID = getGlobalStorageValue(storage3)

    if os.time() > getGlobalStorageValue(storage4)+60*60*4 then 
      if (getGlobalStorageValue(storage2) < 100) then
      setGlobalStorageValue(storage2,getGlobalStorageValue(storage2)+1)
      cid:say(getGlobalStorageValue(storage2).."%", TALKTYPE_MONSTER_SAY)
      end
      if (getGlobalStorageValue(storage2) == 2) then
        for _, targetPlayer in ipairs(Game.getPlayers()) do
          targetPlayer:sendPrivateMessage(player, getCreatureName(cid).." da guild "..guildname.. " esta capturando a vila " ..castle_one_name..".", TALKTYPE_BROADCAST)
        end  
      end
      if (getGlobalStorageValue(storage2) >= 100) then
        setGlobalStorageValue(storage2,0)
        setGlobalStorageValue(storage3,guildID)
        setGlobalStorageValue(storage4,os.time())
        item:transform(30739)
        addEvent(revertIce, 60000*60*4, topos)
        local platinum = math.random(10, 30)
        local rare = math.random(1, 100)
        local iron = math.random(10, 20)
        local gold = math.random(10, 20)
        for _, targetPlayer in ipairs(Game.getPlayers()) do
          if getPlayerGuildId(targetPlayer) == guildID then
              targetPlayer:addItem(2152, platinum)
              targetPlayer:addItem(5892, iron)
              targetPlayer:addItem(9971, gold)
              if rare <= 10 then
              targetPlayer:addItem(27606, 1)
              end
          end 
        end

      for _, targetPlayer in ipairs(Game.getPlayers()) do
        targetPlayer:sendPrivateMessage(player, getCreatureName(cid).." acabou de coletar a recompensa da vila "..castle_one_name.." para a guild \""..guildname.."\" .", TALKTYPE_BROADCAST)
      end  
      end
    else
    cid:sendCancelMessage("Esta vila ainda esta sob proteção!")
    end
  else
   cid:sendCancelMessage("Voce nao tem guild!")
  end
  return true
end

function isPlayerGuild(cid)
if getPlayerGuildName(cid) ~= false then
return true
else
return false
end
end