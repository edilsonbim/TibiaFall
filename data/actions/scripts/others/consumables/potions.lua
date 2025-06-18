local berserk = Condition(CONDITION_ATTRIBUTES)
berserk:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
berserk:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
berserk:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
berserk:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local mastermind = Condition(CONDITION_ATTRIBUTES)
mastermind:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
mastermind:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)
mastermind:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local bullseye = Condition(CONDITION_ATTRIBUTES)
bullseye:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
bullseye:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 5)
bullseye:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
bullseye:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local antidote = Combat()
antidote:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
antidote:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
antidote:setParameter(COMBAT_PARAM_DISPEL, CONDITION_POISON)
antidote:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
antidote:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

local pmana = Condition(CONDITION_REGENERATION)
pmana:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
pmana:setParameter(CONDITION_PARAM_TICKS, 1 * 6 * 1000)
pmana:setParameter(CONDITION_PARAM_MANAGAIN, 10)

local smana = Condition(CONDITION_REGENERATION)
smana:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
smana:setParameter(CONDITION_PARAM_TICKS, 1 * 6 * 1000)
smana:setParameter(CONDITION_PARAM_MANAGAIN, 20)

local gmana = Condition(CONDITION_REGENERATION)
gmana:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
gmana:setParameter(CONDITION_PARAM_TICKS, 1 * 6 * 1000)
gmana:setParameter(CONDITION_PARAM_MANAGAIN, 30)

local phealth = Condition(CONDITION_REGENERATION)
phealth:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
phealth:setParameter(CONDITION_PARAM_TICKS, 1 * 6 * 1000)
phealth:setParameter(CONDITION_PARAM_HEALTHGAIN, 10)

local shealth = Condition(CONDITION_REGENERATION)
shealth:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
shealth:setParameter(CONDITION_PARAM_TICKS, 1 * 6 * 1000)
shealth:setParameter(CONDITION_PARAM_HEALTHGAIN, 20)

local ghealth = Condition(CONDITION_REGENERATION)
ghealth:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
ghealth:setParameter(CONDITION_PARAM_TICKS, 1 * 6 * 1000)
ghealth:setParameter(CONDITION_PARAM_HEALTHGAIN, 30)

local sspirit = Condition(CONDITION_REGENERATION)
sspirit:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
sspirit:setParameter(CONDITION_PARAM_TICKS, 1 * 6 * 1000)
sspirit:setParameter(CONDITION_PARAM_HEALTHGAIN, 15)
sspirit:setParameter(CONDITION_PARAM_MANAGAIN, 15)

local gspirit = Condition(CONDITION_REGENERATION)
gspirit:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
gspirit:setParameter(CONDITION_PARAM_TICKS, 1 * 6 * 1000)
gspirit:setParameter(CONDITION_PARAM_HEALTHGAIN, 25)
gspirit:setParameter(CONDITION_PARAM_MANAGAIN, 25)




local exhaust = Condition(CONDITION_EXHAUST_HEAL)
exhaust:setParameter(CONDITION_PARAM_TICKS, 60*1000)
-- 1000 - 100 due to exact condition timing. -100 doesn't hurt us, and players don't have reminding ~50ms exhaustion.

local potions = {
	[6558] = {transform = {id = {7588, 7589}}, effect = CONST_ME_DRAWBLOOD},
	[7439] = {condition = berserk, vocations = {4, 8}, effect = CONST_ME_MAGIC_RED,
			description = "Only knights may drink this potion.", text = "You feel stronger."},

	[7440] = {condition = mastermind, vocations = {1, 2, 5, 6}, effect = CONST_ME_MAGIC_BLUE,
			description = "Only sorcerers and druids may drink this potion.", text = "You feel smarter."},

	[7443] = {condition = bullseye, vocations = {3, 7}, effect = CONST_ME_MAGIC_GREEN,
			description = "Only paladins may drink this potion.", text = "You feel more accurate."},

	[7620] = {condition = pmana, vocations = {1, 2, 3, 4}, effect = CONST_ME_MAGIC_BLUE, flask = 7636},

	[7589] = {condition = smana, vocations = {1, 2, 3, 4}, effect = CONST_ME_MAGIC_BLUE, flask = 7634},

	[7590] = {condition = gmana, vocations = {1, 2, 3, 4}, effect = CONST_ME_MAGIC_BLUE, flask = 7635},

	[7618] = {condition = phealth, vocations = {1, 2, 3, 4}, effect = CONST_ME_MAGIC_RED, flask = 7636},

	[7588] = {condition = shealth, vocations = {1, 2, 3, 4}, effect = CONST_ME_MAGIC_RED, flask = 7634},

	[7591] = {condition = ghealth, vocations = {1, 2, 3, 4}, effect = CONST_ME_MAGIC_RED, flask = 7635},

	[8472] = {condition = sspirit, vocations = {1, 2, 3, 4}, effect = CONST_ME_MAGIC_RED, flask = 7635},

	[26030] = {condition = gspirit, vocations = {1, 2, 3, 4}, effect = CONST_ME_MAGIC_RED, flask = 7635},






	[8473] = {health = {1, 1}, vocations = {4, 8}, level = 130, flask = 7635,
			description = "Only knights of level 130 or above may drink this fluid."},

	[8474] = {combat = antidote, flask = 7636},
	[8704] = {health = {1, 1}, flask = 7636},
	[26029] = {mana = {1, 1}, vocations = {1, 2, 5, 6}, level = 130, flask = 7635,
			description = "Only druids and sorcerers of level 130 or above may drink this fluid."},



	[26031] = {health = {1, 1}, vocations = {4, 8}, level = 200, flask = 7635,
			description = "Only knights of level 200 or above may drink this fluid."}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if type(target) == "userdata" and not target:isPlayer() then
		return false
	end

	local potion = potions[item:getId()]
	if potion.level and player:getLevel() < potion.level or potion.vocations and not table.contains(potion.vocations, player:getVocation():getBase():getId()) and not (player:getGroup():getId() >= 2) then
		player:say(potion.description, TALKTYPE_MONSTER_SAY)
		return true
	end

	if player:getCondition(CONDITION_EXHAUST_HEAL) then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUAREEXHAUSTED))
		return true
	end

	if potion.health or potion.mana or potion.combat or potion.condition then
		if potion.health then
			doTargetCombatHealth(0, target, COMBAT_HEALING, potion.health[1], potion.health[2], CONST_ME_MAGIC_BLUE)
		end

		if potion.mana then
			doTargetCombatMana(0, target, potion.mana[1], potion.mana[2], CONST_ME_MAGIC_BLUE)
		end

		if potion.combat then
			potion.combat:execute(target, Variant(target:getId()))
		end

		player:addAchievementProgress('Potion Addict', 100000)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		player:addItem(potion.flask, 1)
		player:addCondition(exhaust)
		player:setStorageValue(38412, player:getStorageValue(38412)+1)
	end

	if potion.condition then
		target:addCondition(potion.condition)
		target:say(potion.text, TALKTYPE_MONSTER_SAY)
		target:getPosition():sendMagicEffect(potion.effect)
	end

	if potion.transform then
		item:transform(potion.transform.id[math.random(#potion.transform.id)])
		item:getPosition():sendMagicEffect(potion.effect)
		return true
	end

	if not configManager.getBoolean(configKeys.REMOVE_POTION_CHARGES) then
		return true
	end

	item:remove(1)
	return true
end
