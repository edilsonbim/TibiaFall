local effects = {
    {position = Position( 32366, 32233, 7), text = 'Armorsmithing', effect = CONST_ME_GROUNDSHAKER},
	{position = Position( 32366, 32239, 7), text = 'Weaponsmithing', effect = CONST_ME_GROUNDSHAKER},
    {position = Position( 32372, 32232, 7), text = 'Smelting', effect = CONST_ME_GROUNDSHAKER},
    {position = Position( 32364, 32236, 7), text = 'Cooking', effect = CONST_ME_GROUNDSHAKER},
    {position = Position( 32372, 32239, 7), text = 'Laboratory', effect = CONST_ME_GROUNDSHAKER},
}
 
function onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 4, 4, 4, 4)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end
 