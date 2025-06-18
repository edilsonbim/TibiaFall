local combat1 = createCombatObject()
local druid = {lookType = 290, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
local combat1 = createCombatObject()
setConditionParam(outfit, CONDITION_PARAM_TICKS, 5000)
setCombatParam(combat1, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ANI_DEATH)
local outfit = createConditionObject(CONDITION_OUTFIT)
setConditionParam(outfit, CONDITION_PARAM_TICKS, 5000)
addOutfitCondition(outfit, druid)
addCombatCondition(combat1, outfit)
local combat2 = createCombatObject()
local function spellCallback2(param)
if param.count > 0 or math.random(0, 1) == 1 then
doSendMagicEffect(param.pos, CONST_ME_DRAWBLOOD)
doAreaCombatHealth(param.cid, COMBAT_PHYSICALDAMAGE, param.pos, 0, -300, -1000, CONST_ANI_DEATH)
end

if(param.count < 5) then
param.count = param.count + 1
addEvent(spellCallback2, math.random(1000, 8000), param)
end
end

local function onTargetTile(cid, pos)
local param = {}
param.cid = cid:getId()
param.pos = pos
param.count = 0
spellCallback2(param)
end

setCombatCallback(combat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

setCombatArea(combat1, createCombatArea(AREA_CIRCLE5X5))
setCombatArea(combat2, createCombatArea(AREA_CIRCLE5X5))
local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end
local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end
function onCastSpell(cid, var)
local parameters = { cid = cid:getId(), var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 250, parameters)
return print(param.cid)
end