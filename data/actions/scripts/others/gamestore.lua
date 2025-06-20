--[[
  Items have been updated so that if the offer type is not one of the types: OFFER_TYPE_OUTFIT, OFFER_TYPE_OUTFIT_ADDON,
  OFFER_TYPE_MOUNT, OFFER_TYPE_NAMECHANGE, OFFER_TYPE_SEXCHANGE, OFFER_TYPE_PROMOTION, OFFER_TYPE_EXPBOOST,
  OFFER_TYPE_PREYSLOT, OFFER_TYPE_PREYBONUS, OFFER_TYPE_TEMPLE, OFFER_TYPE_BLESSINGS, OFFER_TYPE_PREMIUM,
  OFFER_TYPE_ALLBLESSINGS (it was not a non-item) then:
  1) If the offer's name didn't exist in items.xml then the offer has been removed.
    These items were removed from the shop because the name didn't exist in items.xml
    [ "Alchemistic Scales", "Alchemist Table", "Pile of Alchemist Books", "Alchemist Cup Board", "Torch of Change", "Ferumbras Bust", "Queen Eloise Bust", "Arrival At Thais Painting", "Tibia Street Painting", "Ferumbras Portrait", "SupremeHealth Potion", "Health Keg", "Strong Health Keg", "Great Health Keg", "Ultimate Health Keg", "Supreme Health Keg", "Mana Keg", "Strong Mana Keg", "Great Mana Keg", "Ultimate Mana Keg", "Ultimate Spirit Keg", "Disintegrate Rune", "Paralyse Rune", "Alchemistic Scales", "Alchemist Table", "Pile of Alchemist Books", "Alchemist Cup Board", "Torch of Change", "Ferumbras Bust", "Queen Eloise Bust", "Arrival At Thais Painting", "Tibia Street Painting", "Ferumbras Portrait", "Demon Pit", "Venoream Table Clock", "StoneTiles", "Bath Tube", "Daily Reward Shrine", "Health Cask", "Strong Health Cask", "Great Health Cask", "Ultimate Health Cask", "Supreme Health Cask", "Mana Cask", "Strong Mana Cask", "Great Mana Cask", "Ultimate Mana Cask", "Great Spirit Cask", "Ultimate Spirit Cask", "Skull Lamp", "Fish Tank", "Lit Protectress Lamp", "Lit Predator Lamp", "LordlyTapestry", "All-Seeing Tapestry", "Gold Pounch" ]
  2) If the offer's name did exist in items.xml then the thingId of the offer has been updated
     so that it matches the item id in items.xml.
]]

-- Parser
dofile('data/modules/scripts/gamestore/init.lua')

function onUse(cid, item, fromPosition, itemEx, toPosition)
  local player = Player(cid)
  if (not player) then
    return false
  end


player:parseOpenStore(player)

  return true
end


-- Config
GameStore.Categories = { {
   description = "Check out this category for the latest additions to the Store!",
   icons = { "Category_NewProducts.png" },
   name = "New Products",
   offers = { {
                count = 1,
                icons = { "Product_HouseEquipment_alchemisticcabinet.png" },
                name = "Alchemistic Cabinet",
                price = 100,
                id = 32020,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_alchemisticbookstand.png" },
                name = "Alchemistic Bookstand",
                price = 100,
                id = 32031,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_alchemisticchair.png" },
                name = "Alchemistic Chair",
                price = 50,
                id = 32018,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_lightofchange.png" },
                name = "Light of Change",
                price = 120,
                id = 33174,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_kingtibianusbust.png" },
                name = "King Tibianus Bust",
                price = 50,
                id = 32050,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              } },
   rookgaard = true,
   state = GameStore.States.STATE_NONE,
 }, {
   icons = { "Category_PremiumTime.png" },
   name = "Premium Time",
   offers = { {
                description = "Premium Account for 30 days.",
                icons = { "Product_PremiumTime30.png" },
                name = "30 Days of Premium Time",
                price = 250,
                state = GameStore.States.STATE_SALE,
                id = 30,
                type = GameStore.OfferTypes.OFFER_TYPE_PREMIUM,
                validUntil = 30
              }, {
                description = "Premium Account for 90 days.",
                icons = { "Product_PremiumTime90.png" },
                name = "90 Days of Premium Time",
                price = 400,
                state = GameStore.States.STATE_SALE,
                id = 90,
                type = GameStore.OfferTypes.OFFER_TYPE_PREMIUM,
                validUntil = 30
              }, {
                description = "Premium Account for 180 days.",
                icons = { "Product_PremiumTime180.png" },
                name = "180 Days of Premium Time",
                price = 700,
                state = GameStore.States.STATE_SALE,
                id = 180,
                type = GameStore.OfferTypes.OFFER_TYPE_PREMIUM,
                validUntil = 30
              }, {
                description = "Premium Account for 180 days.",
                icons = { "Product_PremiumTime360.png" },
                name = "360 Days of Premium Time",
                price = 1000,
                state = GameStore.States.STATE_SALE,
                id = 360,
                type = GameStore.OfferTypes.OFFER_TYPE_PREMIUM,
                validUntil = 30
              } },
   rookgaard = true,
   state = GameStore.States.STATE_SALVE,
 }, {
   description = "Buy an Extra Service to transfer a character to anothergame world or to change your character's name or sex.",
   icons = { "Category_ExtraServices.png" },
   name = "Extra Services",
   offers = { {
                description = "You must be in a protection zone to change your name. After entering your new name, you will be disconnected from the server. You must logout completely and login again using your account details in order to refresh your character list.",
                icons = { "namechanger.png" },
                name = "Character Name Change",
                price = 250,
                id = 65542,
                type = GameStore.OfferTypes.OFFER_TYPE_NAMECHANGE,
              }, {
                description = "Use this to change the sex of your character. Changes apply immediately. You don't need to logout for changes to apply.",
                icons = { "sexchanger.png" },
                name = "Character Sex Change",
                price = 120,
                id = 65543,
                type = GameStore.OfferTypes.OFFER_TYPE_SEXCHANGE,
              } },
   rookgaard = true,
   state = GameStore.States.STATE_NONE,
 }, {
   icons = { "Category_Blessings.png" },
   name = "Blessings",
   offers = { {
                icons = { "Product_Blessing_AllPvE.png" },
                name = "All Regular Blessings",
                price = 30,
                id = 9,
                type = GameStore.OfferTypes.OFFER_TYPE_ALLBLESSINGS,
              }, {
                icons = { "Product_Blessing_Fate.png" },
                name = "Twist of Fate",
                price = 2,
                id = 1,
                type = GameStore.OfferTypes.OFFER_TYPE_BLESSINGS,
              }, {
                icons = { "Product_Blessing_Solitude.png" },
                name = "The Wisdom of Solitude",
                price = 5,
                id = 2,
                type = GameStore.OfferTypes.OFFER_TYPE_BLESSINGS,
              }, {
                icons = { "Product_Blessing_Phoenix.png" },
                name = "The Spark of the Phoenix",
                price = 8,
                id = 3,
                type = GameStore.OfferTypes.OFFER_TYPE_BLESSINGS,
              }, {
                icons = { "Product_Blessing_Suns.png" },
                name = "The Fire of the Suns",
                price = 5,
                id = 4,
                type = GameStore.OfferTypes.OFFER_TYPE_BLESSINGS,
              }, {
                icons = { "Product_Blessing_Shielding.png" },
                name = "The Spiritual Shielding",
                price = 5,
                id = 5,
                type = GameStore.OfferTypes.OFFER_TYPE_BLESSINGS,
              }, {
                icons = { "Product_Blessing_Tibia.png" },
                name = "The Embrace of Tibia",
                price = 5,
                id = 6,
                type = GameStore.OfferTypes.OFFER_TYPE_BLESSINGS,
              }, {
                icons = { "Product_Blessing_HeartOfTheMountain.png" },
                name = "Heart of the Mountain",
                price = 10,
                id = 7,
                type = GameStore.OfferTypes.OFFER_TYPE_BLESSINGS,
              }, {
                icons = { "Product_Blessing_BloodOfTheMountain.png" },
                name = "Blood of the Mountain",
                price = 10,
                id = 8,
                type = GameStore.OfferTypes.OFFER_TYPE_BLESSINGS,
              } },
   rookgaard = true,
   state = GameStore.States.STATE_NONE,
 }, {
   description = "Buy potions to refil your character's hit points and mana.",
   icons = { "Category_Potions.png" },
   name = "Potions & Kegs",
   offers = { {
                count = 125,
                icons = { "Product_Potion_Health_potion.png" },
                name = "Health Potion",
                price = 4,
                id = 7618,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 300,
                icons = { "Product_Potion_Health_potion.png" },
                name = "Health Potion",
                price = 10,
                id = 7618,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 100,
                icons = { "Product_Potion_Strong_health_potion.png" },
                name = "Strong Health Potion",
                price = 7,
                id = 7588,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 300,
                icons = { "Product_Potion_Strong_health_potion.png" },
                name = "Strong Health Potion",
                price = 18,
                id = 7588,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 100,
                icons = { "Product_Potion_Great_health_potion.png" },
                name = "Great Health Potion",
                price = 13,
                id = 7591,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 300,
                icons = { "Product_Potion_Great_health_potion.png" },
                name = "Great Health Potion",
                price = 34,
                id = 7591,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 100,
                icons = { "Product_Potion_ultimate_health_potion.png" },
                name = "Ultimate Health Potion",
                price = 22,
                id = 8473,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 300,
                icons = { "Product_Potion_ultimate_health_potion.png" },
                name = "Ultimate Health Potion",
                price = 55,
                id = 8473,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 300,
                icons = { "Product_Potion_Supreme_health_potion.png" },
                name = "Supreme Health Potion",
                price = 90,
                id = 26031,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 125,
                icons = { "Product_Potion_Mana_Potion.png" },
                name = "Mana Potion",
                price = 4,
                id = 7620,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 300,
                icons = { "Product_Potion_Mana_Potion.png" },
                name = "Mana Potion",
                price = 10,
                id = 7620,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              } },
   rookgaard = true,
   state = GameStore.States.STATE_NONE,
 }, {
   description = "Buy magically filled runes to unleash their energy when in need of it.",
   icons = { "Category_Runes.png" },
   name = "Runes",
   offers = { {
                count = 250,
                description = "Here you can purchase a stack of '250 Animate Dead Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes boughtin the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_AnimateDeadRune.png" },
                name = "Animate Dead Rune",
                price = 75,
                id = 2316,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Avalanche Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone blockor a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_AvalancheRune.png" },
                name = "Avalanche Rune",
                price = 9,
                id = 2274,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Chameleon Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level andmagic level.",
                icons = { "Product_Rune_ChameleonRune.png" },
                name = "Chameleon Rune",
                price = 42,
                id = 2291,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Convince Creature Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in theStore can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_ConvinceRune.png" },
                name = "Convince Creature Rune",
                price = 16,
                id = 2290,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Cure Poison Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_CurePoisonRune.png" },
                name = "Cure Poison Rune",
                price = 13,
                id = 2266,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Energy Bomb Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runesneed to fit the character's level and magic level.",
                icons = { "Product_Rune_EnergyBombRune.png" },
                name = "Energy Bomb Rune",
                price = 32,
                id = 2262,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Energy Field Runes'. Use themto unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. Forthis reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_EnergyFieldRune.png" },
                name = "Energy Field Rune",
                price = 8,
                id = 2277,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Energy Wall Runes'. Use them to unleash their magical energy when in need of it.Note, characterswith a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_EnergyWallRune.png" },
                name = "Energy Wall Rune",
                price = 17,
                id = 2279,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here youcan purchase a stack of '250 Explosion Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_ExplosionRune.png" },
                name = "Explosion Rune",
                price = 6,
                id = 2313,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Fireball Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_FireballRune.png" },
                name = "Fireball Rune",
                price = 6,
                id = 2302,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Fire Bomb Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase.For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_FireBombRune.png" },
                name = "Fire Bomb Rune",
                price = 23,
                id = 2305,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Fire Field Runes'. Use them to unleash their magical energy when in need of it.Note, characterswith a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_FireFieldRune.png" },
                name = "Fire Field Rune",
                price = 6,
                id = 2301,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here youcan purchase a stack of '250 Fire Wall Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_FireWallRune.png" },
                name = "Fire Wall Rune",
                price = 12,
                id = 2303,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of 'Great Fireball Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_GreatFireBallRune.png" },
                name = "Great Fireball Rune",
                price = 9,
                id = 2304,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Icicle Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zoneblock or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_IcicleRune.png" },
                name = "Icicle Rune",
                price = 6,
                id = 2271,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Intense Healing Runes'. Use them to unleash their magical energy when in need ofit.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only beused by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_IntenseHealingRune.png" },
                name = "Intense Healing Rune",
                price = 19,
                id = 2265,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Magic Wall Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_MagicWallRune.png" },
                name = "Magic Wall Rune",
                price = 23,
                id = 2293,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Poison Bomb Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_PoisonBombRune.png" },
                name = "Poison Bomb Rune",
                price = 17,
                id = 2286,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Poison Wall Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runesneed to fit the character's level and magic level.",
                icons = { "Product_Rune_PoisonWallRune.png" },
                name = "Poison Wall Rune",
                price = 10,
                id = 2289,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Soulfire Runes'. Use them to unleashtheir magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_SoulfireRune.png" },
                name = "Soulfire Rune",
                price = 9,
                id = 2308,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Stone Shower Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes thatexceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magiclevel.",
                icons = { "Product_Rune_StoneShowerRune.png" },
                name = "Stone Shower Rune",
                price = 7,
                id = 2288,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Sudden Death Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_SuddenDeathRune.png" },
                name = "Sudden Death Rune",
                price = 22,
                id = 2268,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Thunderstorm Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_ThunderstormRune.png" },
                name = "Thunderstorm Rune",
                price = 7,
                id = 2315,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Ultimate Healing Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchase runes. Also, characters cannotbuy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_UltimateHealingRune.png" },
                name = "Ultimate Healing Rune",
                price = 35,
                id = 2273,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              }, {
                count = 250,
                description = "Here you can purchase a stack of '250 Wild Growth Runes'. Use them to unleash their magical energy when in need of it.Note, characters with a protection zone block or a battle sign cannot purchaserunes. Also, characters cannot buy runes that exceed their capacity. Finally, runes bought in the Store can only be used by the character that makes the purchase. For this reason, the purchased runes need to fit the character's level and magic level.",
                icons = { "Product_Rune_WildGrowthRune.png" },
                name = "Wild Growth Rune",
                price = 32,
                id = 2269,
                type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE,
              } },
   rookgaard = true,
   state = GameStore.States.STATE_NONE,
 }, {
   description = "Buy your character one or more of the fabolous Mountsoffered here.",
   icons = { "Category_Mounts.png" },
   name = "Mounts",
   offers = { {
                description = "Here you can purchase the Mount 'Cranium Spider' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_SkullSpider_v1.png" },
                name = "Cranium Spider",
                price = 690,
                id = 116,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Cave Tarantula' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_SkullSpider_v2.png" },
                name = "Cave Tarantula",
                price = 690,
                id = 117,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Snow Pelt' for your character. Riding on a mount isnot only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_SkullSpider_v3.png" },
                name = "Gloom Widow",
                price = 690,
                id = 118,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Gloom Widow' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_UnicornFire.png" },
                name = "Blazing Unicorn",
                price = 870,
                id = 113,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Artic Unicorn' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_UnicornRainbow.png" },
                name = "Artic Unicorn",
                price = 870,
                id = 114,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Prismatic Unicorn' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_UnicornIce.png" },
                name = "Prismatic Unicorn",
                price = 870,
                id = 115,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Armoured War Horse' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_ArmouredWarHorse.png" },
                name = "Armoured War Horse",
                price = 870,
                id = 23,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Shadow Draptor' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_shadowdraptor.png" },
                name = "Shadow Draptor",
                price = 870,
                id = 24,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Steelbeak' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_steelbeak.png" },
                name = "Steelbeak",
                price = 870,
                id = 34,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you canpurchase the Mount 'Crimson Ray' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_crimsonray.png" },
                name = "CrimsonRay",
                price = 870,
                id = 33,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Jungle Saurian' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Saurian_v1.png" },
                name = "Jungle Saurian",
                price = 750,
                id = 110,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Ember Saurian' for your character. Riding on a mount is not only cool, but also gives yourcharacter a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Saurian_v2.png" },
                name = "Ember Saurian",
                price = 750,
                id = 111,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Lagoon Saurian' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Saurian_v3.png" },
                name = "Lagoon Saurian",
                price = 750,
                id = 112,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'GoldSphinx' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Sphinx_v1.png" },
                name = "Gold Sphinx",
                price = 750,
                id = 107,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Emerald Sphinx' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Sphinx_v2.png" },
                name = "Emerald Sphinx",
                price = 750,
                id = 108,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Shadow Sphinx' foryour character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Sphinx_v3.png" },
                name = "Shadow Sphinx",
                price = 750,
                id = 109,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Jackalope' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_AntleredRabbit_v1.png" },
                name = "Jackalope",
                price = 870,
                id = 103,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Dreadhare' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mountwill only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_AntleredRabbit_v2.png" },
                name = "Dreadhare",
                price = 870,
                id = 104,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Wolpertinger' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_AntleredRabbit_v3.png" },
                name = "Wolpertinger",
                price = 870,
                id = 105,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Ivory Fang' for your character. Riding on amount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_ivoryfang.png" },
                name = "Ivory Fang",
                price = 750,
                id = 100,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Shadow Claw' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_ShadowClaw.png" },
                name = "Shadow Claw",
                price = 750,
                id = 101,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Snow Pelt' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_SnowPelt.png" },
                name = "Snow Pelt",
                price = 750,
                id = 102,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Swamp Snapper' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_SwampSnapper.png" },
                name = "Swamp Snapper",
                price = 690,
                id = 95,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Mould Shell' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased itin the Store.",
                icons = { "Product_Mount_MouldShell.png" },
                name = "Mould Shell",
                price = 690,
                id = 96,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount'Reed Lurker' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_ReedLurker.png" },
                name = "Reed Lurker",
                price = 690,
                id = 97,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Bloodcurl' for your character. Riding on a mount is not only cool, but also gives your character a speed boost.Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Bloodcurl.png" },
                name = "Bloodcurl",
                price = 720,
                id = 92,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Leafscuttler' for yourcharacter. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Leafscuttler.png" },
                name = "Leafscuttler",
                price = 750,
                id = 93,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Mouldpincer' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Mouldpincer.png" },
                name = "Mouldpincer",
                price = 750,
                id = 91,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Nightdweller' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Nightdweller.png" },
                name = "Nightdweller",
                price = 870,
                id = 88,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Frostflare' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Frostflare.png" },
                name = "Frostflare",
                price = 870,
                id = 89,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Cinderhoof' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Cinderhoof.png" },
                name = "Cinderhoof",
                price = 870,
                id = 90,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you canpurchase the Mount 'Slagsnare' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Slagsnare.png" },
                name = "Slagsnare",
                price = 780,
                id = 84,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Nightstinger' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Nightstinger.png" },
                name = "Nightstinger",
                price = 780,
                id = 85,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Razorcreep' for your character. Riding on a mount is not only cool, but also gives your character aspeed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Razorcreep.png" },
                name = "Razorcreep",
                price = 780,
                id = 86,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Gorongra' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note:The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Gorongra.png" },
                name = "Gorongra",
                price = 720,
                id = 81,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Noctungra' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Noctungra.png" },
                name = "Noctungra",
                price = 720,
                id = 82,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Silverneck' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Silverneck.png" },
                name = "Silverneck",
                price = 720,
                id = 83,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Sea Devil' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_SeaDevil.png" },
                name = "Sea Devil",
                price = 570,
                id = 78,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Coralripper' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Coralripper.png" },
                name = "Coralripper",
                price = 570,
                id = 79,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Plumfish' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Plumfish.png" },
                name = "Plumfish",
                price = 570,
                id = 80,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Flitterkatzen' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Flitterkatzen.png" },
                name = "Flitterkatzen",
                price = 870,
                id = 75,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Venompaw' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Venompaw.png" },
                name = "Venompaw",
                price = 870,
                id = 76,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Batcat' for your character. Riding on amount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_BatCat.png" },
                name = "Batcat",
                price = 870,
                id = 77,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Ringtail Waccoon' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will onlybe received by the character who purchased it in the Store.",
                icons = { "Product_Mount_RingtailWaccoon.png" },
                name = "Ringtail Waccoon",
                price = 750,
                id = 68,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Night Waccoon' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_NightWaccoon.png" },
                name = "Night Waccoon",
                price = 750,
                id = 69,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Emerald Waccoon' for your character. Riding on amount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_EmeraldWaccoon.png" },
                name = "Emerald Waccoon",
                price = 750,
                id = 70,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Flying Divan' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be receivedby the character who purchased it in the Store.",
                icons = { "Product_Mount_FlyingDivan.png" },
                name = "Flying Divan",
                price = 900,
                id = 65,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Magic Carpet' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_MagicCarpet.png" },
                name = "Magic Carpet",
                price = 900,
                id = 66,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Floating Kashmir' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_FloatingKashmir.png" },
                name = "Floating Kashmir",
                price = 900,
                id = 67,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Shadow Hart' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_ShadowHart.png" },
                name = "Shadow Hart",
                price = 660,
                id = 72,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Black Stag' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_BlackStag.png" },
                name = "Black Stag",
                price = 660,
                id = 73,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Emperor Deer' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it inthe Store.",
                icons = { "Product_Mount_EmperorDeer.png" },
                name = "Emperor Deer",
                price = 660,
                id = 74,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Tundra Rambler' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_TundraRambler.png" },
                name = "Tundra Rambler",
                price = 750,
                id = 62,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Highland Yak' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_HighlandYak.png" },
                name = "Highland Yak",
                price = 750,
                id = 63,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Glacier Vagabond' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_GlacierVagabond.png" },
                name = "Glacier Vagabond",
                price = 750,
                id = 64,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Golden Dragonfly' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_GoldenDragonfly.png" },
                name = "Golden Dragonfly",
                price = 600,
                id = 59,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Steel Bee' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_SteelBee.png" },
                name = "Steel Bee",
                price = 600,
                id = 60,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Copper Fly' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_CopperFly.png" },
                name = "Copper Fly",
                price = 600,
                id = 61,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Doombringer' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Doombringer.png" },
                name = "Doombringer",
                price = 780,
                id = 53,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Woodland Prince' for your character.Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_WoodlandPrince.png" },
                name = "Woodland Prince",
                price = 780,
                id = 54,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Hailtorm Fury' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_HailstormFury.png" },
                name = "Hailtorm Fury",
                price = 780,
                id = 55,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Siegebreaker' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only bereceived by the character who purchased it in the Store.",
                icons = { "Product_Mount_Siegebreaker.png" },
                name = "Siegebreaker",
                price = 690,
                id = 56,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Poisonbane' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Poisonbane.png" },
                name = "Poisonbane",
                price = 690,
                id = 57,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Hereyou can purchase the Mount 'Blackpelt' for your character. Riding on a mount is not only cool, butalso gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Blackpelt.png" },
                name = "Blackpelt",
                price = 690,
                id = 58,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Nethersteed' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Nethersteed.png" },
                name = "Nethersteed",
                price = 900,
                id = 50,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Tempest' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Tempest.png" },
                name = "Tempest",
                price = 900,
                id = 51,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Flamesteed' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Flamesteed.png" },
                name = "Flamesteed",
                price = 900,
                id = 47,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Tombstinger' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_Tombstinger.png" },
                name = "Tombstinger",
                price = 600,
                id = 36,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Death Crawler' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_DeathCrawler.png" },
                name = "Death Crawler",
                price = 600,
                id = 46,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Jade Pincer' for your character. Riding on amount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_JadePincer.png" },
                name = "Jade Pincer",
                price = 600,
                id = 49,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Desert King' for your character. Riding on a mount is not only cool, but also gives your character a speed boost. Note: The Mount will only be received bythe character who purchased it in the Store.",
                icons = { "Product_Mount_DesertKing.png" },
                name = "Desert King",
                price = 450,
                id = 41,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Hereyou can purchase the Mount 'Jade Lion' for your character. Riding on a mount is not only cool, butalso gives your character a speed boost. Note: The Mount will only be received by the character who purchased it in the Store.",
                icons = { "Product_Mount_JadeLion.png" },
                name = "Jade Lion",
                price = 450,
                id = 48,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              }, {
                description = "Here you can purchase the Mount 'Winter king' for your character. Riding on a mount is not only cool, but also givesyour character a speed boost. Note: The Mount will only be received by the character who purchasedit in the Store.",
                icons = { "Product_Mount_WinterKing.png" },
                name = "Winter King",
                price = 450,
                id = 52,
                type = GameStore.OfferTypes.OFFER_TYPE_MOUNT,
              } },
   rookgaard = true,
   state = GameStore.States.STATE_NONE,
 }, {
   -- Base outfit has addon = 0 or no defined addon. By default addon is set to 0.
   description = "Buy your character one more of the classy outfits offered here.",
   icons = { "Category_Outfits.png" },
   name = "Outfits",
   offers = { {
                addon = 3,
                icons = { "Product_Outfit_SunPriest_Male_Full.png", "Product_Outfit_SunPriest_Female_Full.png" },
                name = "Full Sun Priest Outfit",
                price = 750,
                sexId = {
                  female = 1024,
                  male = 1023
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_SunPriest_Male_Base.png", "Product_Outfit_SunPriest_Female_Base.png" },
                name = "Sun Priest Outfit",
                price = 570,
                sexId = {
                  female = 1024,
                  male = 1023
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_SunPriest_Male_Addon1.png", "Product_Outfit_SunPriest_Female_Addon1.png" },
                name = "Sun Priest Addon 1",
                price = 120,
                sexId = {
                  female = 1024,
                  male = 1023
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_SunPriest_Male_Addon2.png", "Product_Outfit_SunPriest_Female_Addon2.png" },
                name = "Sun Priest Addon 2",
                price = 120,
                sexId = {
                  female = 1024,
                  male = 1023
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_Herbalist_Male_Full.png", "Product_Outfit_Herbalist_Female_Full.png" },
                name = "Full Herbalist Outfit",
                price = 750,
                sexId = {
                  female = 1020,
                  male = 1021
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_Herbalist_Male_Base.png", "Product_Outfit_Herbalist_Female_Base.png" },
                name = "Herbalist Outfit",
                price = 570,
                sexId = {
                  female = 1020,
                  male = 1021
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_Herbalist_Male_Addon1.png", "Product_Outfit_Herbalist_Female_Addon1.png" },
                name = "Herbalist Addon 1",
                price = 120,
                sexId = {
                  female = 1020,
                  male = 1021
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_Herbalist_Male_Addon2.png", "Product_Outfit_Herbalist_Female_Addon2.png" },
                name = "Herbalist Addon 2",
                price = 120,
                sexId = {
                  female = 1020,
                  male = 1021
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_Entrepreneur_Male_Full.png", "Product_Outfit_Entrepreneur_Female_Full.png" },
                name = "Full Entrepreneur Outfit",
                price = 750,
                sexId = {
                  female = 471,
                  male = 472
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_Entrepreneur_Male_Base.png", "Product_Outfit_Entrepreneur_Female_Base.png" },
                name = "Entrepreneur Outfit",
                price = 570,
                sexId = {
                  female = 471,
                  male = 472
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_Entrepreneur_Male_Addon1.png", "Product_Outfit_Entrepreneur_Female_Addon1.png" },
                name = "Entrepreneur Addon 1",
                price = 120,
                sexId = {
                  female = 471,
                  male = 472
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_Entrepreneur_Male_Addon2.png", "Product_Outfit_Entrepreneur_Female_Addon2.png" },
                name = "Entrepreneur Addon 2",
                price = 120,
                sexId = {
                  female = 471,
                  male = 472
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_TrophyHunter_Male_Full.png", "Product_Outfit_TrophyHunter_Female_Full.png" },
                name = "Full Trophy Hunter Outfit",
                price = 870,
                sexId = {
                  female = 900,
                  male = 899
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_TrophyHunter_Male_Base.png", "Product_Outfit_TrophyHunter_Female_Base.png" },
                name = "Trophy Hunter Outfit",
                price = 690,
                sexId = {
                  female = 900,
                  male = 899
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_TrophyHunter_Male_Addon1.png", "Product_Outfit_TrophyHunter_Female_Addon1.png" },
                name = "Trophy Hunter Addon 1",
                price = 120,
                sexId = {
                  female = 900,
                  male = 899
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_TrophyHunter_Male_Addon2.png", "Product_Outfit_TrophyHunter_Female_Addon2.png" },
                name = "Trophy Hunter Addon 2",
                price = 120,
                sexId = {
                  female = 900,
                  male = 899
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                icons = { "Product_Outfit_RetroCitizen_Male_Base.png", "Product_Outfit_RetroCitizen_Female_Base.png" },
                name = "Retro Citizen",
                price = 870,
                sexId = {
                  female = 975,
                  male = 974
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_RetroHunter_Male_Base.png", "Product_Outfit_RetroHunter_Female_Base.png" },
                name = "Retro Hunter",
                price = 870,
                sexId = {
                  female = 973,
                  male = 972
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_RetroKnight_Male_Base.png", "Product_Outfit_RetroKnight_FemaleFix_Base.png" },
                name = "Retro Knight",
                price = 870,
                sexId = {
                  female = 971,
                  male = 970
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_RetroMage_Male_Base.png", "Product_Outfit_RetroMage_Female_Base.png" },
                name = "Retro Wizzard",
                price = 870,
                sexId = {
                  female = 969,
                  male = 968
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_RetroNobleman_Male_Base.png", "Product_Outfit_RetroNobleman_Female_Base.png" },
                name = "Retro Noblewoman",
                price = 870,
                sexId = {
                  female = 967,
                  male = 966
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_RetroSummoner_Male_Base.png", "Product_Outfit_RetroSummoner_Female_Base.png" },
                name = "Retro Summoner",
                price = 870,
                sexId = {
                  female = 965,
                  male = 964
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_RetroWarrior_Male_Base.png", "Product_Outfit_RetroWarrior_Female_Base.png" },
                name = "Retro Warrior",
                price = 870,
                sexId = {
                  female = 963,
                  male = 962
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 3,
                icons = { "Product_Outfit_Pharaoh_male_Full.png", "Product_Outfit_Pharaoh_female_Full.png" },
                name = "Full Pharaoh Outfit",
                price = 570,
                sexId = {
                  female = 956,
                  male = 955
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_Pharaoh_male_Base.png", "Product_Outfit_Pharaoh_female_Base.png" },
                name = "Pharaoh Outfit",
                price = 390,
                sexId = {
                  female = 956,
                  male = 955
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_Pharaoh_male_Addon1.png", "Product_Outfit_Pharaoh_female_Addon1.png" },
                name = "Pharaoh Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 956,
                  male = 955
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_Pharaoh_male_Addon2.png", "Product_Outfit_Pharaoh_female_Addon2.png" },
                name = "Pharaoh Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 956,
                  male = 955
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_AntlerDruid_male_Full.png", "Product_Outfit_AntlerDruid_female_Full.png" },
                name = "Full Groove Keeper Outfit",
                price = 870,
                sexId = {
                  female = 909,
                  male = 908
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_AntlerDruid_male_Base.png", "Product_Outfit_AntlerDruid_female_Base.png" },
                name = "Groove Keeper Outfit",
                price = 690,
                sexId = {
                  female = 900,
                  male = 899
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_AntlerDruid_male_Addon1.png", "Product_Outfit_AntlerDruid_female_Addon1.png" },
                name = "Groove Keeper Addon 1",
                price = 120,
                sexId = {
                  female = 900,
                  male = 899
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_AntlerDruid_male_Addon2.png", "Product_Outfit_AntlerDruid_female_Addon2.png" },
                name = "Groove Keeper Addon 2",
                price = 120,
                sexId = {
                  female = 900,
                  male = 899
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_LupinWarden_male_Full.png", "Product_Outfit_LupinWarden_female_Full.png" },
                name = "Full Lupine Wardem Outfit",
                price = 840,
                sexId = {
                  female = 900,
                  male = 899
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 3,
                icons = { "Product_Outfit_LupinWarden_male_Base.png", "Product_Outfit_LupinWarden_female_Base.png" },
                name = "Lupine Wardem Outfit",
                price = 660,
                sexId = {
                  female = 900,
                  male = 899
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_LupinWarden_male_Addon1.png", "Product_Outfit_LupinWarden_female_Addon1.png" },
                name = "Lupine Wardem Addon 1",
                price = 120,
                sexId = {
                  female = 900,
                  male = 899
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_LupinWarden_male_Addon2.png", "Product_Outfit_LupinWarden_female_Addon2.png" },
                name = "Lupine WardemAddon 2",
                price = 120,
                sexId = {
                  female = 900,
                  male = 899
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_ArenaChampion_Male_Full.png", "Product_Outfit_ArenaChampion_Female_Full.png" },
                name = "Full Arena Champion Outfit",
                price = 870,
                sexId = {
                  female = 885,
                  male = 884
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_ArenaChampion_Male_Base.png", "Product_Outfit_ArenaChampion_Female_Base.png" },
                name = "Arena Champion Outfit",
                price = 690,
                sexId = {
                  female = 885,
                  male = 884
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 2,
                icons = { "Product_Outfit_Beastmaster_Male_Addon2.png", "Product_Outfit_Beastmaster_Female_Addon2.png" },
                name = "Arena Champion Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 885,
                  male = 884
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 1,
                icons = { "Product_Outfit_Beastmaster_Male_Addon1.png", "Product_Outfit_Beastmaster_Female_Addon1.png" },
                name = "Arena Champion Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 885,
                  male = 884
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_Professor_Male_Full.png", "Product_Outfit_Professor_Female_Full.png" },
                name = "Full Philosopher Outfit",
                price = 750,
                sexId = {
                  female = 874,
                  male = 873
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_Professor_Male_Base.png", "Product_Outfit_Professor_Female_Base.png" },
                name = "Philosopher Outfit",
                price = 570,
                sexId = {
                  female = 874,
                  male = 873
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_Professor_Male_Addon1.png", "Product_Outfit_Professor_Female_Addon1.png" },
                name = "Philosopher Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 874,
                  male = 873
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_Professor_Male_Addon2.png", "Product_Outfit_Professor_Female_Addon2.png" },
                name = "Philosopher Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 874,
                  male = 873
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_WinterWarden_Male_Full.png", "Product_Outfit_WinterWarden_Female_Full.png" },
                name = "Full Winter Warden Outfit",
                price = 870,
                sexId = {
                  female = 852,
                  male = 853
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_WinterWarden_Male_Base.png", "Product_Outfit_WinterWarden_Female_Base.png" },
                name = "Winter Warden Outfit",
                price = 690,
                sexId = {
                  female = 852,
                  male = 853
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_WinterWarden_Male_Addon1.png", "Product_Outfit_WinterWarden_Female_Addon1.png" },
                name = "Winter Warden Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 852,
                  male = 853
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_WinterWarden_Male_Addon2.png", "Product_Outfit_WinterWarden_Female_Addon2.png" },
                name = "Winter Warden Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 852,
                  male = 853
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_RoyalPumpkin_Male_Full.png", "Product_Outfit_RoyalPumpkin_Female_Full.png" },
                name = "Full Royal Pumpkin Outfit",
                price = 640,
                sexId = {
                  female = 759,
                  male = 760
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_RoyalPumpkin_Male_Base.png", "Product_Outfit_RoyalPumpkin_Female_Base.png" },
                name = "Royal Pumpkin Outfit",
                price = 660,
                sexId = {
                  female = 759,
                  male = 760
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_RoyalPumpkin_Male_Addon1.png", "Product_Outfit_RoyalPumpkin_Female_Addon1.png" },
                name = "Royal Pumpkin Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 759,
                  male = 760
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_RoyalPumpkin_Male_Addon2.png", "Product_Outfit_RoyalPumpkin_Female_Addon2.png" },
                name = "Royal Pumpkin Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 759,
                  male = 760
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_SeaDog_Male_Full.png", "Product_Outfit_SeaDog_Female_Full.png" },
                name = "Full Sea Dog Outfit",
                price = 600,
                sexId = {
                  female = 749,
                  male = 750
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_SeaDog_Male_Base.png", "Product_Outfit_SeaDog_Female_Base.png" },
                name = "Sea Dog Outfit",
                price = 420,
                sexId = {
                  female = 749,
                  male = 750
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_SeaDog_Male_Addon1.png", "Product_Outfit_SeaDog_Female_Addon1.png" },
                name = "Sea Dog Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 749,
                  male = 750
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_SeaDog_Male_Addon2.png", "Product_Outfit_SeaDog_Female_Addon2.png" },
                name = "Sea Dog Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 749,
                  male = 750
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_Champion_Male_Full.png", "Product_Outfit_Champion_Female_Full.png" },
                name = "Full Champion Outfit",
                price = 570,
                sexId = {
                  female = 632,
                  male = 633
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_Champion_Male_Base.png", "Product_Outfit_Champion_Female_Base.png" },
                name = "Champion Outfit",
                price = 390,
                sexId = {
                  female = 632,
                  male = 633
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 2,
                icons = { "Product_Outfit_Champion_Male_Addon2.png", "Product_Outfit_Champion_Female_Addon2.png" },
                name = "Champion Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 632,
                  male = 633
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 1,
                icons = { "Product_Outfit_Champion_Male_Addon1.png", "Product_Outfit_Champion_Female_Addon1.png" },
                name = "Champion Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 632,
                  male = 633
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_Conjurer_Male_Full.png", "Product_Outfit_Conjurer_Female_Full.png" },
                name = "Full Conjurer Outfit",
                price = 720,
                sexId = {
                  female = 635,
                  male = 634
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_Conjurer_Male_Base.png", "Product_Outfit_Conjurer_Female_Base.png" },
                name = "Conjurer Outfit",
                price = 540,
                sexId = {
                  female = 635,
                  male = 634
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_Conjurer_Male_Addon1.png", "Product_Outfit_Conjurer_Female_Addon1.png" },
                name = "Conjurer Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 635,
                  male = 634
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_Conjurer_Male_Addon2.png", "Product_Outfit_Conjurer_Female_Addon2.png" },
                name = "Conjurer Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 635,
                  male = 634
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_Beastmaster_Male_Full.png", "Product_Outfit_Beastmaster_Female_Full.png" },
                name = "Full Beastmaster Outfit",
                price = 870,
                sexId = {
                  female = 636,
                  male = 637
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_Beastmaster_Male_Base.png", "Product_Outfit_Beastmaster_Female_Base.png" },
                name = "Beastmaster Outfit",
                price = 690,
                sexId = {
                  female = 636,
                  male = 637
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_Beastmaster_Male_Addon1.png", "Product_Outfit_Beastmaster_Female_Addon1.png" },
                name = "Beastmaster Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 636,
                  male = 637
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_Beastmaster_Male_Addon2.png", "Product_Outfit_Beastmaster_Female_Addon2.png" },
                name = "Beastmaster Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 637,
                  male = 637
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_ChaosAcolyte_Male_Full.png", "Product_Outfit_ChaosAcolyte_Female_Full.png" },
                name = "Full Chaos Acolyte Outfit",
                price = 600,
                sexId = {
                  female = 664,
                  male = 665
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_ChaosAcolyte_Male_Base.png", "Product_Outfit_ChaosAcolyte_Female_Base.png" },
                name = "Chaos Acolyte Outfit",
                price = 420,
                sexId = {
                  female = 664,
                  male = 665
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_ChaosAcolyte_Male_Addon1.png", "Product_Outfit_ChaosAcolyte_Female_Addon1.png" },
                name = "Chaos Acolyte Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 664,
                  male = 665
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_ChaosAcolyte_Male_Addon2.png", "Product_Outfit_ChaosAcolyte_Female_Addon2.png" },
                name = "Chaos Acolyte Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 664,
                  male = 665
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_DeathHerald_Male_Full.png", "Product_Outfit_DeathHerald_Female_Full.png" },
                name = "Full Death Herald Outfit",
                price = 600,
                sexId = {
                  female = 666,
                  male = 667
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_DeathHerald_Male_Base.png", "Product_Outfit_DeathHerald_Female_Base.png" },
                name = "Death Herald Outfit",
                price = 420,
                sexId = {
                  female = 666,
                  male = 667
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_DeathHerald_Male_Addon1.png", "Product_Outfit_DeathHerald_Female_Addon1.png" },
                name = "Death Herald Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 666,
                  male = 667
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_DeathHerald_Male_Addon2.png", "Product_Outfit_DeathHerald_Female_Addon2.png" },
                name = "Death Herald Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 666,
                  male = 667
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_Ranger_Male_Full.png", "Product_Outfit_Ranger_Female_Full.png" },
                name = "Full Ranger Outfit",
                price = 750,
                sexId = {
                  female = 683,
                  male = 684
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_Ranger_Male_Base.png", "Product_Outfit_Ranger_Female_Base.png" },
                name = "Ranger Outfit",
                price = 570,
                sexId = {
                  female = 683,
                  male = 684
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_Ranger_Male_Addon1.png", "Product_Outfit_Ranger_Female_Addon1.png" },
                name = "Ranger Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 683,
                  male = 684
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_Ranger_Male_Addon2.png", "Product_Outfit_Ranger_Female_Addon2.png" },
                name = "Ranger Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 683,
                  male = 684
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_CeremonialGarb_Male_Full.png", "Product_Outfit_CeremonialGarb_Female_Full.png" },
                name = "Full Ceremonial Garb Outfit",
                price = 750,
                sexId = {
                  female = 694,
                  male = 695
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_CeremonialGarb_Male_Base.png", "Product_Outfit_CeremonialGarb_Female_Base.png" },
                name = "Ceremonial Garb Outfit",
                price = 570,
                sexId = {
                  female = 694,
                  male = 695
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_CeremonialGarb_Male_Addon1.png", "Product_Outfit_CeremonialGarb_Female_Addon1.png" },
                name = "Ceremonial Garb Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 694,
                  male = 695
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_CeremonialGarb_Male_Addon2.png", "Product_Outfit_CeremonialGarb_Female_Addon2.png" },
                name = "Ceremonial Garb Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 694,
                  male = 695
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_Puppeteer_Male_Full.png", "Product_Outfit_Puppeteer_Female_Full.png" },
                name = "Full Puppeteer Outfit",
                price = 870,
                sexId = {
                  female = 696,
                  male = 697
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_Puppeteer_Male_Base.png", "Product_Outfit_Puppeteer_Female_Base.png" },
                name = "Puppeteer Outfit",
                price = 690,
                sexId = {
                  female = 696,
                  male = 697
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_Puppeteer_Male_Addon1.png", "Product_Outfit_Puppeteer_Female_Addon1.png" },
                name = "Puppeteer Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 696,
                  male = 697
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_Puppeteer_Male_Addon2.png", "Product_Outfit_Puppeteer_Female_Addon2.png" },
                name = "Puppeteer Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 696,
                  male = 697
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_SpiritCaller_Male_Full.png", "Product_Outfit_SpiritCaller_Female_Full.png" },
                name = "Full Spirit Caller Outfit",
                price = 600,
                sexId = {
                  female = 698,
                  male = 699
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_SpiritCaller_Male_Base.png", "Product_Outfit_SpiritCaller_Female_Base.png" },
                name = "Spirit Caller Outfit",
                price = 420,
                sexId = {
                  female = 698,
                  male = 699
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_SpiritCaller_Male_Addon1.png", "Product_Outfit_SpiritCaller_Female_Addon1.png" },
                name = "Spirit Caller Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 698,
                  male = 699
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_SpiritCaller_Male_Addon2.png", "Product_Outfit_SpiritCaller_Female_Addon2.png" },
                name = "Spirit Caller Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 698,
                  male = 699
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_Evoker_Male_Full.png", "Product_Outfit_Evoker_Female_Full.png" },
                name = "Full Evoker Outfit",
                price = 840,
                sexId = {
                  female = 724,
                  male = 725
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_Evoker_Male_Base.png", "Product_Outfit_Evoker_Female_Base.png" },
                name = "Evoker Outfit",
                price = 660,
                sexId = {
                  female = 724,
                  male = 725
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_Evoker_Male_Addon1.png", "Product_Outfit_Evoker_Female_Addon1.png" },
                name = "Evoker Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 724,
                  male = 725
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_Evoker_Male_Addon2.png", "Product_Outfit_Evoker_Female_Addon2.png" },
                name = "Evoker OutfitAddon 2",
                price = 120,
                sexId = {
                  female = 724,
                  male = 725
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 3,
                icons = { "Product_Outfit_SeaWeaver_Male_Full.png", "Product_Outfit_SeaWeaver_Female_Full.png" },
                name = "Full Seaweaver Outfit",
                price = 570,
                sexId = {
                  female = 732,
                  male = 733
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                icons = { "Product_Outfit_SeaWeaver_Male_Base.png", "Product_Outfit_SeaWeaver_Female_Base.png" },
                name = "Seaweaver Outfit",
                price = 390,
                sexId = {
                  female = 732,
                  male = 733
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT,
              }, {
                addon = 1,
                icons = { "Product_Outfit_SeaWeaver_Male_Addon1.png", "Product_Outfit_SeaWeaver_Female_Addon1.png" },
                name = "Seaweaver Outfit Addon 1",
                price = 120,
                sexId = {
                  female = 732,
                  male = 733
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              }, {
                addon = 2,
                icons = { "Product_Outfit_SeaWeaver_Male_Addon2.png", "Product_Outfit_SeaWeaver_Female_Addon2.png" },
                name = "Seaweaver Outfit Addon 2",
                price = 120,
                sexId = {
                  female = 732,
                  male = 733
                },
                type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON,
              } },
   rookgaard = true,
   state = GameStore.States.STATE_NONE,
 }, {
   description = "Buy exceptional equipment to upgrade your Tibia House",
   icons = { "Category_HouseEquipment.png" },
   name = "House Equipment",
   offers = { {
                count = 1,
                icons = { "Product_HouseEquipment_alchemisticcabinet.png" },
                name = "Alchemistic Cabinet",
                price = 100,
                id = 32020,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_alchemisticbookstand.png" },
                name = "Alchemistic Bookstand",
                price = 100,
                id = 32031,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_alchemisticchair.png" },
                name = "Alchemistic Chair",
                price = 50,
                id = 32018,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_lightofchange.png" },
                name = "Light of Change",
                price = 120,
                id = 33174,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_kingtibianusbust.png" },
                name = "King Tibianus Bust",
                price = 50,
                id = 32050,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_Carpet23.png" },
                name = "Wheat Carpet",
                price = 30,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_Carpet24.png" },
                name = "Crested Carpet",
                price = 25,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_Carpet25.png" },
                name = "Decorated Carpet",
                price = 35,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_EgyptianFurniture_Table.png" },
                name = "Ornate Table",
                price = 50,
                id = 29397,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_EgyptianFurniture_Chair.png" },
                name = "Ornate Chair",
                price = 50,
                id = 29395,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_EgyptianFurniture_Chest.png" },
                name = "Ornate Chest",
                price = 80,
                id = 29403,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_EgyptianFurniture_Cupboard.png" },
                name = "Ornate Cabinet",
                price = 100,
                id = 29399,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_Housepet_Snake.png" },
                name = "Terrarium Snake",
                price = 180,
                id = 29408,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_NaturalFurniture_Chair.png" },
                name = "Verdant Chair",
                price = 50,
                id = 29340,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_NaturalFurniture_Cabinet.png" },
                name = "Verdant Cabinet",
                price = 100,
                id = 29342,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_NaturalFurniture_Chest.png" },
                name = "Verdant Trunk",
                price = 50,
                id = 29346,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_NaturalFurniture_Table.png" },
                name = "Verdant Table",
                price = 80,
                id = 29347,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_Carpet_18.png" },
                name = "Verdant Carpet",
                price = 30,
                id = 29351,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_Carpet_19.png" },
                name = "Shaggy Carpet",
                price = 30,
                id = 29353,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_Carpet_20.png" },
                name = "Mystic Carpet",
                price = 35,
                id = 29355,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_Carpet_22.png" },
                name = "Wooden Planks",
                price = 25,
                id = 29359,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_HrodmirianWeaponRack.png" },
                name = "Hrodmiran Weapons Rack",
                price = 90,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_BabyGiantSpider.png" },
                name = "Terrarium Spider",
                price = 180,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                icons = { "Product_HouseEquipment_ShinyDailyRewardShrine.png" },
                name = "Shiny Daily Reward Shrine",
                price = 150,
                id = 29024,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Vengothic Chair to decorate your home.",
                icons = { "Product_HouseEquipment_VengothicFurniture_Chair.png" },
                name = "Vengothic Chair",
                price = 50,
                id = 27900,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Vengothic Chest to decorate your home.",
                icons = { "Product_HouseEquipment_VengothicFurniture_Chest.png" },
                name = "Vengothic Chest",
                price = 80,
                id = 27908,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Vengothic Cabinet to decorate your home.",
                icons = { "Product_HouseEquipment_VengothicFurniture_Cupboard.png" },
                name = "Vengothic Cabinet",
                price = 100,
                id = 27904,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Vengothic Table to decorate your home.",
                icons = { "Product_HouseEquipment_VengothicFurniture_Table.png" },
                name = "Vengothic Table",
                price = 50,
                id = 27902,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Vengothic Lamp to decorate your home.",
                icons = { "Product_HouseEquipment_VengothicLamp.png" },
                name = "Vengothic Lamp",
                price = 180,
                id = 27909,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Chamaleon to decorate your home.",
                icons = { "Product_HouseEquipment_Chameleon.png" },
                name = "Chamaleon",
                price = 250,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Blooming Cactus to decorate your home.",
                icons = { "Product_HouseEquipment_BloomingCactus.png" },
                name = "Blooming Cactus",
                price = 50,
                id = 27892,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Bitter-Smack Leaf to decorate your home.",
                icons = { "Product_HouseEquipment_BitterSmackLeaf.png" },
                name = "Bitter-Smack Leaf",
                price = 50,
                id = 27893,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Pink Roses to decorate your home.",
                icons = { "Product_HouseEquipment_PinkRoses.png" },
                name = "Pink Roses",
                price = 50,
                id = 27894,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Red Roses to decorate your home.",
                icons = { "Product_HouseEquipment_RedRoses.png" },
                name = "Red Roses",
                price = 50,
                id = 27895,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Yellow Roses to decorate your home.",
                icons = { "Product_HouseEquipment_YellowRoses.png" },
                name = "Yellow Roses",
                price = 50,
                id = 27896,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Parrot to decorate your home.",
                icons = { "Product_HouseEquipment_Housepet_Parrot.png" },
                name = "Parrot",
                price = 180,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Flowery Carpet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_10.png" },
                name = "Flowery Carpet",
                price = 35,
                id = 27092,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Colourful Carpet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_11.png" },
                name = "Colourful Carpet",
                price = 35,
                id = 27093,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Striped Carpet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_12.png" },
                name = "Striped Carpet",
                price = 35,
                id = 27094,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Patterned Carpet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_15.png" },
                name = "Patterned Carpet",
                price = 30,
                id = 27097,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Fur Carpet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_13.png" },
                name = "Fur Carpet",
                price = 30,
                id = 27095,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Diamond Carpet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_14.png" },
                name = "Diamond Carpet",
                price = 30,
                id = 27096,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an Night Sky Carpet Carpet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_16.png" },
                name = "Night Sky Carpet",
                price = 30,
                id = 27098,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Star Carpet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_17.png" },
                name = "Star Carpet",
                price = 30,
                id = 27099,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Gilded Imbuing Shrine to decorate your home.",
                icons = { "Product_HouseEquipment_GildedImbuingShrine.png" },
                name = "Gilded Imbuing Shrine",
                price = 200,
                id = 27851,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Imbuing Shrine to decorate your home.",
                icons = { "Product_HouseEquipment_ImbuingShrine.png" },
                name = "Imbuing Shrine",
                price = 150,
                id = 27729,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Dog House to decorate your home.",
                icons = { "Product_HouseEquipment_Housepet_DogHouse.png" },
                name = "Dog House",
                price = 150,
                id = 26365,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Golden Dragon Tapestry to decorate your home.",
                icons = { "Product_HouseEquipment_Tapestry_04.png" },
                name = "Golden Dragon Tapestry",
                price = 70,
                id = 26379,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Sword Tapestry to decorate your home.",
                icons = { "Product_HouseEquipment_Tapestry_05.png" },
                name = "Sword Tapestry",
                price = 60,
                id = 26380,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Brocade Tapestry to decorate your home.",
                icons = { "Product_HouseEquipment_Tapestry_06.png" },
                name = "Brocade Tapestry",
                price = 50,
                id = 26381,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Rustic Cabinet to decorate your home.",
                icons = { "Product_HouseEquipment_RusticFurniture_Cabinet.png" },
                name = "Rustic Cabinet",
                price = 100,
                id = 26357,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Rustic Chair to decorate your home.",
                icons = { "Product_HouseEquipment_RusticFurniture_Chair.png" },
                name = "Rustic Chair",
                price = 50,
                id = 26352,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Rustic Trunk to decorate your home.",
                icons = { "Product_HouseEquipment_RusticFurniture_Chest.png" },
                name = "Rustic Trunk",
                price = 80,
                id = 26362,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Rustic Table to decorate your home.",
                icons = { "Product_HouseEquipment_RusticFurniture_Table.png" },
                name = "Rustic Table",
                price = 50,
                id = 26355,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Crimson Carpet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_04.png" },
                name = "Crimson Carpet",
                price = 35,
                id = 26371,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Azure Carpet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_05.png" },
                name = "Azure Carpet",
                price = 35,
                id = 26372,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Emerald Carpet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_06.png" },
                name = "Emerald Carpet",
                price = 30,
                id = 26373,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Light Parquet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_07.png" },
                name = "Light Parquet",
                price = 30,
                id = 26374,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Dark Parquet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_08.png" },
                name = "Dark Parquet",
                price = 30,
                id = 26375,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Marble Floor to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet_09.png" },
                name = "Marble Floor",
                price = 30,
                id = 23259,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Baby Dragon to decorate your home.",
                icons = { "Product_HouseEquipment_Housepet_BabyDragon.png" },
                name = "Baby Dragon",
                price = 250,
                id = 26099,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Cat in a Basket to decorate your home.",
                icons = { "Product_HouseEquipment_Housepet_Cat.png" },
                name = "Cat in a Basket",
                price = 150,
                id = 26108,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Hamster in a Wheel to decorate your home.",
                icons = { "Product_HouseEquipment_Housepet_Hamster.png" },
                name = "Hamster in a Wheel",
                price = 180,
                id = 26101,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Magnificent Cabinet to decorate your home.",
                icons = { "Product_HouseEquipment_BaroqueFurniture_Cabinet.png" },
                name = "Magnificent Cabinet",
                price = 100,
                id = 26076,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Magnificent chair to decorate your home.",
                icons = { "Product_HouseEquipment_BaroqueFurniture_Chair.png" },
                name = "Magnificent Chair",
                price = 60,
                id = 26062,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Magnificent Trunk to decorate your home.",
                icons = { "Product_HouseEquipment_BaroqueFurniture_Chest.png" },
                name = "Magnificent Trunk",
                price = 70,
                id = 26086,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Magnificent Table to decorate your home.",
                icons = { "Product_HouseEquipment_BaroqueFurniture_Table.png" },
                name = "Magnificent Table",
                price = 60,
                id = 26074,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Ferocious Cabinet to decorate your home.",
                icons = { "Product_HouseEquipment_TortureChamberFurniture_Cabinet.png" },
                name = "Ferocious Cabinet",
                price = 110,
                id = 26078,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Ferocious Chair to decorate your home.",
                icons = { "Product_HouseEquipment_TortureChamberFurniture_Chair.png" },
                name = "Ferocious Chair",
                price = 50,
                id = 26066,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Ferocious Trunk to decorate your home.",
                icons = { "Product_HouseEquipment_TortureChamberFurniture_Chest.png" },
                name = "Ferocious Trunk",
                price = 80,
                id = 26082,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Ferocious Table to decorate your home.",
                icons = { "Product_HouseEquipment_TortureChamberFurniture_Table.png" },
                name = "Ferocious Table",
                price = 50,
                id = 26070,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Yalaharian Carpet to decorateyour home.",
                icons = { "Product_HouseEquipment_Carpet1.png" },
                name = "Yalaharian Carpet",
                price = 35,
                id = 26109,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible White Fur Carpet to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet2.png" },
                name = "White Fur Carpet",
                price = 30,
                id = 26110,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 26111,
                description = "Buy an incredible Bamboo Mat to decorate your home.",
                icons = { "Product_HouseEquipment_Carpet3.png" },
                name = "Bamboo Mat",
                price = 25,
                id = 26111,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Royal Mailbox to decorate your home.",
                icons = { "Product_HouseEquipment_Mailbox_Golden.png" },
                name = "Royal Mailbox",
                price = 150,
                id = 26056,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Ornate Mailbox to decorate your home.",
                icons = { "Product_HouseEquipment_Mailbox_Standard.png" },
                name = "Ornate Mailbox",
                price = 200,
                id = 26058,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              }, {
                count = 1,
                description = "Buy an incredible Menacing Tapestry to decorate your home.",
                icons = { "Product_HouseEquipment_Tapestry_02.png" },
                name = "Menacing Tapestry",
                price = 70,
                id = 26105,
                type = GameStore.OfferTypes.OFFER_TYPE_HOUSE,
              } },
   rookgaard = true,
   state = GameStore.States.STATE_NONE,
 }, {
   description = "Buy your character a boost to speed up your character development.",
   icons = { "Category_Boosts.png" },
   name = "XP Boost",
   offers = { {
                icons = { "xpboosticon.png" },
                name = "XP Boost 50%",
                price = 30,
                id = 65541,
                type = GameStore.OfferTypes.OFFER_TYPE_EXPBOOST,
              } },
   rookgaard = true,
   state = GameStore.States.STATE_NONE,
 }, {
   description = "Buy yourcharacter one or more of the helpful items offered here.",
   icons = { "Category_Convenience.png" },
   name = "Useful Things",
   offers = { {
                count = 1,
                icons = { "Product_UsefulThings_PreyBonusReroll.png" },
                name = "Prey Bonus Reroll",
                price = 5,
                id = 65540,
                type = GameStore.OfferTypes.OFFER_TYPE_PREYBONUS,
              }, {
                count = 5,
                icons = { "Product_UsefulThings_PreyBonusReroll.png" },
                name = "5x Prey Bonus Reroll",
                price = 25,
                id = 65539,
                type = GameStore.OfferTypes.OFFER_TYPE_PREYBONUS,
              }, {
                icons = { "Product_UsefulThings_PreyBonusReroll.png" },
                name = "Permanent Prey Slot",
                price = 450,
                id = 65538,
                type = GameStore.OfferTypes.OFFER_TYPE_PREYSLOT,
              }, {
                icons = { "Product_Transportation_TempleTeleport.png" },
                name = "Temple Teleport",
                price = 25,
                id = 65537,
                type = GameStore.OfferTypes.OFFER_TYPE_TEMPLE,
              },
              {
                name = "Gold Pouch",
                id = 26377,
                count = 1,
                type = GameStore.OfferTypes.OFFER_TYPE_ITEM,
                price = 900,
                icons = { "Product_MagicCoinPurse.png" },
                description = "With Gold Pounch you can carry the amount of gold without having to keep many knapsacks in the backpack, this product allows you to be charged as much gold as your ability allows." }
   },
   rookgaard = true,
   state = GameStore.States.STATE_NONE,
} }


-- Each outfit must be uniquely identified to distinguish between addons.
-- Here we dynamically assign ids for outfits. These ids must be unique.
local runningId = 45000
for k, category in ipairs(GameStore.Categories) do
  if category.name == "Outfits" and category.offers then
    for m, offer in ipairs(category.offers) do
      offer.id = runningId
      runningId = runningId + 1

      if not offer.type then
        offer.type = GameStore.OfferTypes.OFFER_TYPE_NONE
      end
    end
  end
end
