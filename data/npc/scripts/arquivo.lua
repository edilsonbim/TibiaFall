--[[
This file is part of Pokemon Systems by Mkalo.
﻿
Pokemon Systems by Mkalo is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Pokemon System By Mkalo is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Pu﻿blic License for more details.

You should have received a copy of the GNU General Public License
along with Pokemon System By Mkalo. If not, see <http://www.gnu.org/licenses/>.
]]--
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

if(not npcHandler:isFocused(cid)) then
return false
end

if msgcontains(msg, 'heal') then
if #getCreatureSummons(cid) >= 1 then
return selfSay('Voce precisa botar seus pokemons dentro da pokebola.', cid)
end

for slo = CONST_SLOT_FIRST, CONST_SLOT_LAST do
local item = getPlayerSlotItem(cid, slo)
if isContainer(item.uid) then
local items = getItemsInContainerById(item.uid, pokeout)
for i,x in pairs(items) do
local maxh = tonumber(getItemAttribute(x, "poke"):match("/(.+)]"))
doItemSetAttribute(x, "poke", getItemAttribute(x, "poke"):sub(1, findLetter(getItemAttribute(x, "poke"), ".")) .. " HP = ["..maxh.."/"..maxh.."]")
doTransformItem(x, pokein)
end
local items2 = getItemsInContainerById(item.uid, pokein)
for i,x in pairs(items2) do
local maxh = tonumber(getItemAttribute(x, "poke"):match("/(.+)]"))
doItemSetAttribute(x, "poke", getItemAttribute(x, "poke"):sub(1, findLetter(getItemAttribute(x, "poke"), ".")) .. " HP = ["..maxh.."/"..maxh.."]")
end

elseif item.itemid == pokeout or item.itemid == pokein then
local maxh = tonumber(getItemAttribute(item.uid, "poke"):match("/(.+)]"))
doItemSetAttribute(item.uid, "poke", getItemAttribute(item.uid, "poke"):sub(1, findLetter(getItemAttribute(item.uid, "poke"), ".")) .. " HP = ["..maxh.."/"..maxh.."]")
doTransformItem(item.uid, pokein)
end
end

selfSay('Pronto, voce e seus pokemons estao com a life maxima.', cid) 
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())