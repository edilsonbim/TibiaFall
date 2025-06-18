local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMOKE)
function onCast(player, fromPos, toPos)

	local position = player:getPosition()
	position:getNextPosition(player:getDirection())
	if not position == isWalkable(position) then
		player:sendCancelMessage("You cannot teleport there.")
		return false
	end
	position = player:getClosestFreePosition(position, false)
	player:teleportTo(position)
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onCast")

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat, parameters.var)
end
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var }
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell1, 400, parameters)
addEvent(onCastSpell1, 500, parameters)

return true
end