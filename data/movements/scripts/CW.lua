-- This script is part of Castle of Honor
-- Copyright (C) 2013 Roksas -
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

-- //

function onStepIn(cid, item, pos, fromPosition)
local pos = getThingPos(cid)
 
if item.actionid == 16203 then 
    if not isPlayer(cid) then
        return true
    end 
    if (getPlayerGuildId(cid) == guildVencedora()) then
        doSendMagicEffect(getThingPos(cid), 14)
        doSendAnimatedText(pos, "CW", math.random(1, 255))
    else
        doSendMagicEffect(getThingPos(cid), 2)
        doTeleportThing(cid, fromPosition, false)
        doPlayerSendCancel(cid, "[CASTLE WAR 24H] Você não pertence á guild dominante.")
    end
  return true
 end

if item.actionid == 16202 then
    if not isPlayer(cid) then
      return true
    end

    if getPlayerGuildId(cid) > 0 then
        if (getPlayerGuildId(cid) == guildVencedora()) then
            doPlayerSendCancel(cid, "[CASTLE WAR 24H] Sua guild ja esta dominando.")         
            return false
        end

    if (getPlayerGuildId(cid) ~= guildVencedora()) and (getPlayerLevel(cid) >= 100) then
        doPlayerSendTextMessage(cid, 20, "[CASTLE WAR 24H] Você e sua guild estão no comando, os antigos donos podem se vingar!")
        setGlobalStorageValue(COH_PREPARE1, -1)
        setGlobalStorageValue(COH_PREPARE2, -1)
        db.query("INSERT INTO `castelo_guerra` (`guild`) VALUES (" .. getPlayerGuildId(cid) .. ");")
        doCastleRemoveEnemies()
        doBroadcastMessage("[CASTLE WAR 24H] O jogador ["..getCreatureName(cid).."] e sua guild ["..getPlayerGuildName(cid).."] estão no comando do castelo, vá dominar e impedir isso!")
    end
    else
        doSendMagicEffect(pos, 2)  
        doTeleportThing(cid, fromPosition, false)
        doPlayerSendCancel(cid, "[CASTLE WAR 24H] Você não possui uma guild.")
    end
return true
 end

if item.actionid == 16200 then
  if not isPlayer(cid) then
      return true
  end
  if getPlayerGuildId(cid) > 0 then
    doSendAnimatedText(pos, "CW", math.random(1, 255))
    if (getPlayerGuildId(cid) == guildVencedora()) and (getGlobalStorageValue(COH_PREPARE1) ~= getPlayerGuildName(cid)) and ((getGlobalStorageValue(COH_PREPARE2) ~= getPlayerGuildName(cid))) then
        setGlobalStorageValue(COH_PREPARE1, getPlayerGuildName(cid))
        doBroadcastMessage("[CASTLE WAR 24H] Atenção! A guild "..getPlayerGuildName(cid).." está tentando dominar o castelo, preparem-se!")
    end
    else
        doSendMagicEffect(pos, 2)  
        doTeleportThing(cid, fromPosition, false)
        doPlayerSendCancel(cid, "[CASTLE WAR 24H] Você não possui uma guild.")   
    return true
    end   
end
 
if item.actionid == 16201 then
    if not isPlayer(cid) then
        return true
    end
    doSendAnimatedText(pos, "CW", math.random(1, 255))
    if (getPlayerGuildId(cid) == guildVencedora()) and (getGlobalStorageValue(COH_PREPARE2) ~= getPlayerGuildName(cid)) then
        setGlobalStorageValue(COH_PREPARE2, getPlayerGuildName(cid))
        doBroadcastMessage("[CASTLE WAR 24H] Atenção! A guild "..getPlayerGuildName(cid).." está muito próxima do domínio, ataquem!")
    end
    end
    return true
end