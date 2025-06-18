--Lumberjack by: Lwkass
--Version: 1.1.5

--Configs--
local configs = {
sign = {{level = {0,9}, quant = {1,2}, percent = 40},
{level = {10,19}, quant = {2,4}, percent = 45},
{level = {20,29}, quant = {3,6}, percent = 50},
{level = {30,39}, quant = {4,8}, percent = 55},
{level = {40,49}, quant = {5,10}, percent = 60},
{level = {50,59}, quant = {6,12}, percent = 65},
{level = {60,69}, quant = {7,14}, percent = 70},
{level = {70,79}, quant = {8,16}, percent = 75},
{level = {80,89}, quant = {9,18}, percent = 80},
{level = {90,99}, quant = {10,20}, percent = 85},
{level = {100}, quant = {11,22}, percent = 90}},
stones = {1285, 1356},
gold = {{2157, 'all'}},
stone_delay = 15,
MaxLevel = 100
}
--END Configs--
function onUse(cid, item, fromPosition, itemEx, toPosition)
local STORAGE_SKILL_LEVEL = 20000
local STORAGE_SKILL_TRY = 20001
local skillLevel = getPlayerStorageValue(cid,STORAGE_SKILL_LEVEL)
local skillTry = getPlayerStorageValue(cid,STORAGE_SKILL_TRY)
local objeto2 = getThingFromPos(toPosition)
local player = getCreaturePosition(cid)

if skillLevel == -1 then
setPlayerStorageValue(cid,STORAGE_SKILL_LEVEL,1)
end
for Q = 1, #configs.sign do
if configs.sign[Q].level[2] == nil then
configs.sign[Q].level[2] = configs.sign[Q].level[1]
end
if skillLevel >= configs.sign[Q].level[1] and skillLevel <= configs.sign[Q].level[2] then
quant = math.random(configs.sign[Q].quant[1],configs.sign[Q].quant[2])
percent = configs.sign[Q].percent
break
end
end
for i = 1, #configs.stones do
if objeto2.itemid == configs.stones[i] then
if math.random(1,100) <= percent then
possible_gold = {{},{}}
for h = 1, #configs.gold do
if configs.gold[h][2] == objeto2.itemid then
possible_gold[1][#possible_gold[1]+1] = configs.gold[h][1]
else
if configs.gold[h][2] == 'all' then
possible_gold[2][#possible_gold[2]+1] = configs.gold[h][1]
end
end
end
if possible_gold[1][1] == nil and possible_gold[2][1] == nil then
doPlayerSendTextMessage(cid,22,"This stone can not be mined.")
elseif possible_gold[1][1] ~= nil then
doPlayerAddItem(cid,possible_gold[1][math.random(1,#possible_gold[1])],quant)
elseif possible_gold[1][1] == nil and possible_gold[2][1] ~= nil then
doPlayerAddItem(cid,possible_gold[2][math.random(1,#possible_gold[2])],quant)
end
if possible_gold[1][1] ~= nil or possible_gold[2][1] ~= nil then
if skillTry >= 0 then
setPlayerStorageValue(cid,STORAGE_SKILL_TRY,skillTry + 1)
else
setPlayerStorageValue(cid,STORAGE_SKILL_TRY,1)
end
doSendMagicEffect(getCreaturePosition(cid), 12)
doPlayerSendTextMessage(cid,22,"You got "..quant.." gold "..getItemNameById(objeto2.itemid)..".")
doSendAnimatedText(getCreaturePosition(cid), ''..quant..'', 192, cid)
setItemName(objeto2.uid, 'A remains of '..getItemNameById(objeto2.itemid))
doSendMagicEffect(toPosition, 3)
addEvent(dostoneReturn,configs.stone_delay * 1000,toPosition,objeto2.itemid)
doTransformItem(objeto2.uid, 3610)
break
end
else
doPlayerSendCancel(cid,"You got nothing")
doSendMagicEffect(toPosition, 3)
setItemName(objeto2.uid, 'A remains of '..getItemNameById(objeto2.itemid))
doSendAnimatedText(getCreaturePosition(cid), 'Fail!', 180, cid)
addEvent(dostoneReturn,configs.stone_delay * 1000,toPosition,objeto2.itemid)
doTransformItem(objeto2.uid, 3610)
break
end
else
doPlayerSendCancel(cid,"You can only mine stones")
end
end
if skillTry >= ((skillLevel+1)*3) then
if skillLevel == configs.MaxLevel then
doPlayerSendTextMessage(cid, 22, "Max level reached in mining.")
setPlayerStorageValue(cid,STORAGE_SKILL_TRY,0)
else
setPlayerStorageValue(cid,STORAGE_SKILL_LEVEL,skillLevel + 1)
setPlayerStorageValue(cid,STORAGE_SKILL_TRY,0)
doPlayerSendTextMessage(cid, 22, "You advanced from level ".. skillLevel .." to level ".. skillLevel + 1 .." in Mining.")
doSendMagicEffect(getCreaturePosition(cid),14)
doSendAnimatedText(getCreaturePosition(cid), 'Advance!', 18, cid)
end
end
end

function dostoneReturn(itemposition,oldid)
local pos = getThingfromPos(itemposition)
doTransformItem(pos.uid,oldid)
setItemName(pos.uid, getItemNameById(oldid))
doSendMagicEffect(itemposition,math.random(28,30))
end
--Lumberjack by: Lwkass