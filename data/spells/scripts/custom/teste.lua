local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

function onGetFormulaValues(player, level, maglevel)
	local min = (maglevel * 0.2) + 1
	local max = (maglevel * 0.4) + 4
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function acumular(player, target)
	local player = Player(target)
	local value = player:getStorageValue(16456)+1
	local tempo = os.time() + 30
	if (player) and player:getStorageValue(16457) >= 1 then 
		if player:getStorageValue(16456) >= 9 then
			player:setStorageValue(16456, 9)
			player:setStorageValue(16457, tempo)
		else
			player:setStorageValue(16456, value)
			player:setStorageValue(16457, tempo)
		end 
			player:say(tostring(value), TALKTYPE_MONSTER_SAY)
	else 
		player:setStorageValue(16456, 1)
		player:setStorageValue(16457, tempo)
		player:say(tostring(tempo), TALKTYPE_MONSTER_SAY)
	end
end 

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "acumular")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
