local config = {
		corpseId = 3058, -- Item Id
		timee = 30000 -- Seconds
}
local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SLEEP)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local condition = Condition(CONDITION_REGENERATION)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
condition:setParameter(CONDITION_PARAM_TICKS, true)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 10)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 1000)
condition:setParameter(CONDITION_PARAM_MANAGAIN, 10)
condition:setParameter(CONDITION_PARAM_MANATICKS, 1000)
combat:addCondition(condition)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
condition:setParameter(CONDITION_PARAM_TICKS, 3000)
condition:setParameter(CONDITION_PARAM_SKILL_FIST, -1000)
condition:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, -1000)
condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, -1000)
condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, -1000)
condition:setParameter(CONDITION_PARAM_SKILL_FISHINGPERCENT, -1000)
condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, -1000)
condition:setParameter(CONDITION_PARAM_SKILL_DISABLE_DEFENSE, -1000)
combat:addCondition(condition)

local disable = Condition(CONDITION_PACIFIED)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
disable:setParameter(CONDITION_PARAM_TICKS, 3000)
combat:addCondition(disable)

local function onCastSpell1(parameters)
    doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var, player)
	local player = Player(cid)
	player:setNoMove(true, 30)
	doSetItemOutfit(player, config.corpseId, config.timee)

local parameters = { cid = cid, var = var}

addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell1, 2000, parameters)
addEvent(onCastSpell1, 4000, parameters)
addEvent(onCastSpell1, 6000, parameters)
addEvent(onCastSpell1, 8000, parameters)
addEvent(onCastSpell1, 10000, parameters)
addEvent(onCastSpell1, 12000, parameters)
addEvent(onCastSpell1, 14000, parameters)
addEvent(onCastSpell1, 16000, parameters)
addEvent(onCastSpell1, 18000, parameters)
addEvent(onCastSpell1, 20000, parameters)
addEvent(onCastSpell1, 22000, parameters)
addEvent(onCastSpell1, 24000, parameters)
addEvent(onCastSpell1, 26000, parameters)
addEvent(onCastSpell1, 28000, parameters)
return true
end  