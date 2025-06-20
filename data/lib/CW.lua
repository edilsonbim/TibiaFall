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

COH_PUSHTIME = 10800 -- Tempo (em segundos) de exhausted para usar o comando !gocastle - Padrão (3 horas)
COH_AREA = {{x = 11107, y = 1104, z = 7}, {x = 1109, y = 1106, z = 7}} -- Canto superior esquerdo / inferior direito do Castle

-- // Não mexa daqui para baixo 
COH_STATUS = 201320111714
COH_PREPARE1 = 201320111715 
COH_PUSHSTOR = 201320111716 
COH_PREPARE2 = 201320111717 

function guildVencedora()
    local name
    local consulta = db.getResult("SELECT `guild` FROM `castelo_guerra` ORDER BY `id` DESC;")
    if (consulta:getID() ~= -1) then
        name = tonumber(consulta:getDataInt('guild'))
    else
        return 0
    end
    return name
end

function doCastleRemoveEnemies()

 for index, creature in ipairs(getPlayersOnline()) do
  if isInArea(getThingPos(creature), COH_AREA[1], COH_AREA[2]) then
   if (guildVencedora() ~= getPlayerGuildId(cid)) then
    doTeleportThing(creature, getTownTemplePosition(getPlayerTown(creature)))
   end
  end
 end
 return true
end