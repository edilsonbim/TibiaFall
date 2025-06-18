-----------------------------------            
---------SCRIPT por PC98------------    NAO REMOVA OS CREDITOS      
-----------------------------------            


function onUse(cid, item, frompos, item2, topos) 

------------------ Inicio das Config ------------

local castle_one_name = "Ratim Bum"                  -- Nome do castelo 1
local storages﻿ = {154154,54321,123123}               -- Storages ( se vc eh iniciante, deixe como está...)



-------PREMIOs  I N D I V I D U A L ---------

local premio_por_vezes = 1         -- Premio por vezes de conquista de castelo. (1) = Ativo  (0) = Desativa. 
local premio_vezes = 13            -- Caso ativo, a quantidade de conquista que o player tem, para ganhar PREMIO.
local premio = 2472                -- ID do Premio
local premio_cont = 1              -- Quantidade do Premio
local premio_reset = 1             -- Resetar o contador do premio depois que atingir a meta?? (1) = SIM  (0) = NAO

-------FIM PREMIOs I N D I V I D U A L ---------
print(getGlobalStorageValue(154154))
print(getGlobalStorageValue(54321))
print(getGlobalStorageValue(123123))


----------------- FIM DAS CONFIG -----------------

local sto_ativ = getGlobalStorageValue(54321)
position = getCreaturePosition(cid)


  if isPlayerGuild(cid) == true then
     if isPlayerGuild(cid) == true then

        guildname = getPlayerGuildName(cid)     
        guild = getPlayerGuildId(cid)               
        guild_sto = getGlobalStorageValue(123123)

           if guild ~= guild_sto then            
              setPlayerStorageValue(cid,guild_sto,guild)                      
              if getPlayerStorageValue(cid,154154) == -1 then
                 setPlayerStorageValue(cid,154154,0)
              end

              sto_vezes = getPlayerStorageValue(cid,154154)                   

              setGlobalStorageValue(123123,getPlayerGuildId(cid))
              setPlayerStorageValue(cid,154154, sto_vezes + 1)

              sto_vezes_total = getPlayerStorageValue(cid,154154)

              doBroadcastMessage("O(a) "..getCreatureName(cid).." acabou de conquistar o castelo "..castle_one_name.." para a guild \""..guildname.."\" pela "..sto_vezes_total.."ª vez(s).", 22)
              doSendMagicEffect(position, 39)  

                if premio_por_vezes == 1 then
                   if getPlayerStorageValue(cid,154154) == premio_vezes then
                      if getItemWeightById(premio,1) <= getPlayerFreeCap(cid) then
                         doBroadcastMessage("O "..getCreatureName(cid).." ganhou uma(o) "..getItemNameById(premio).." como recompensa das suas "..premio_vezes.." conquistas!", 21)
                         doPlayerAddItem(cid, premio,premio_cont)
                         doPlayerSendTextMessage(cid, 18, "Voce recebeu o(a) "..getItemNameById(premio).." como recompensa das suas "..premio_vezes.." conquistas!")
                       -----------------------------------------------  --  
                           if premio_reset == 1 then                    --
                              setPlayerStorageValue(cid,154154,0)  --  Resetar a contagem
                           end                                          --
                       -----------------------------------------------  --

                      else
                      doPlayerSendTextMessage(cid, 18, "Voce nao tem capacidade para ganhar o item. Vamos verificar novamente em 10 segundos!")
                      addEvent(additem,10000,cid,premio,premio_cont,premio_reset)
                      end
                   end                                        
                end               
           else
             doPlayerSendCancel(cid,"Este castelo ja foi conquistado pela sua guild!")
             doSendMagicEffect(position, 2)
           end
     else
     doPlayerSendCancel(cid,"O sistema está desativado")
     end      
  else
  doPlayerSendCancel(cid,"É nescessario ter guild para dominar o castelo!")
  doSendMagicEffect(position, 2)
  end
end

------------------------- por pc98

function additem(cid,premio,premio_cont,premio_reset)

if getItemWeightById(premio,1) <= getPlayerFreeCap(cid) then
   doPlayerAddItem(cid, premio,premio_cont)
   doPlayerSendTextMessage(cid, 18, "Voce recebeu o(a) "..getItemNameById(premio).." como recompensa das suas "..premio_vezes.." conquistas!")
    if premio_reset == 1 then
       setPlayerStorageValue(cid,154154,0)
    end
   stopEvent(additem)
 else
 doPlayerSendTextMessage(cid, 18, "Voce nao tem capacidade para ganhar o item. Verificando novamente em 10 segundos!")
 addEvent(additem,10000,cid)
 end
end

-------------------------  por pc98
function isPlayerGuild(cid)
if getPlayerGuildName(cid) ~= "" then
return true
else
return false
end
end