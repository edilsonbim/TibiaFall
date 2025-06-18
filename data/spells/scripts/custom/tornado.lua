local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat1:setArea(createCombatArea(AREA_CIRCLE2X2))

function onGetFormulaValues1(player, level, maglevel)
    local min = maglevel
    local max = maglevel+35
    return -min, -max
end
combat1:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues1")


local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat2:setArea(createCombatArea(AREA_CIRCLE3X3))
--adicionar no spell pra push
function onTargetCreature2(creature, target)
if (creature ~= target) and (target:isPlayer()) then 
		pushTarget(creature, target)
	end 

	return true 
end 

combat2:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature2")

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var }
addEvent(onCastSpell1, 10, parameters)
addEvent(onCastSpell2, 200, parameters)
addEvent(onCastSpell2, 400, parameters)
addEvent(onCastSpell1, 600, parameters)
addEvent(onCastSpell2, 600, parameters)
addEvent(onCastSpell2, 800, parameters)
addEvent(onCastSpell2, 1000, parameters)
addEvent(onCastSpell2, 1200, parameters)
addEvent(onCastSpell1, 1200, parameters)
addEvent(onCastSpell2, 1400, parameters)
addEvent(onCastSpell2, 1600, parameters)
addEvent(onCastSpell2, 1800, parameters)
addEvent(onCastSpell2, 2000, parameters)
addEvent(onCastSpell2, 2200, parameters)
addEvent(onCastSpell1, 2200, parameters)
addEvent(onCastSpell2, 2400, parameters)
addEvent(onCastSpell2, 2600, parameters)
addEvent(onCastSpell2, 2800, parameters)
addEvent(onCastSpell2, 3000, parameters)
addEvent(onCastSpell2, 3200, parameters)
return true
end