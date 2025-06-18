local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SLEEP)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
spell = {
start = function onTargetCreature(cid, target, markpos)
   if not isCreature(target) then return true end
   if isCreature(target) then
        doTeleportThing(target, markpos)
        return true
   end
  end
}
target = getCreatureTarget(cid)
if target then
 spell.start(cid, target, getThingPos(cid))

end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")
	return combat:execute(creature, var)
end
