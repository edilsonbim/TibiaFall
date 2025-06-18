local config = {
-- Configuracao da Janela Modal
    mainTitleMsg = "Crafting System", -- TITUTLO DA JANELA QUE ABRE
    mainMsg = "Welcome to the crafting system. Please choose a vocation to begin.", -- MENSAGEM DA JANELA
 
    craftTitle = "Crafting System: ", -- Titulo da tela de craft apos o player selecionar a vocacao destinada dos items
    craftMsg = "Here is a list of all items that can be crafted for the ", -- Mensagem na tela de craft após escolhas do jogador de vocação
-- Fim da config Janela Modal
 
-- Notificacoes ao player
    needItems = "You do not have all the required items to make ", -- Mensagem que aparece quando o player tenta craftar e nao tem todos os items
 
-- Configuracoes de Crafting
    system = {
    [1] = {vocation = "Master Wizard", -- Isto e apenas uma categoria, nao influencia em nada
            items = {
                [1] = {item = "arcane staff", -- item name (O NOME TEM QUE SER EXATO, SENAO NAO FUNCIONA!)
                        itemID = 2453, -- ID do item que sera feito, tem que ser compativel com o nome acima
                        reqItems = { -- items e quantidade dos items necessarios para craftar
                                [1] = {item = 9969, count = 1}, -- Black Skull
                                [2] = {item = 5904, count = 30}, -- Magic Sulphur
                            },
                        },
                   
                [2] = {item = "enchanted spear",
                        itemID = 7367,    
                        reqItems = {
                                [1] = {item = 9969, count = 1}, -- Black Skull
                                [2] = {item = 5904, count = 30}, -- Magic Sulphur
                            },
                        },
                 	},
				},
				
	[2] = {vocation = "Elder Wizard", 
            items = {
                [1] = {item = "arcane staff", 
                        itemID = 2453,
                        reqItems = { 
                                [1] = {item = 9969, count = 1}, -- Black Skull
                                [2] = {item = 5904, count = 30}, -- Magic Sulphur
                            },
                        },
                   
                [2] = {item = "enchanted spear",
                        itemID = 7367,    
                        reqItems = {
                                [1] = {item = 9969, count = 1}, -- Black Skull
                                [2] = {item = 5904, count = 30}, -- Magic Sulphur
                            },
                        },
                 	},
				},			
				
	[3] = {vocation = "Swift Archer", 
            items = {
                [1] = {item = "arcane staff", 
                        itemID = 2453,
                        reqItems = { 
                                [1] = {item = 9969, count = 1}, -- Black Skull
                                [2] = {item = 5904, count = 30}, -- Magic Sulphur
                            },
                        },
                   
                [2] = {item = "enchanted spear",
                        itemID = 7367,    
                        reqItems = {
                                [1] = {item = 9969, count = 1}, -- Black Skull
                                [2] = {item = 5904, count = 30}, -- Magic Sulphur
                            },
                        },
                 	},
				},			
			
	[4] = {vocation = "Guardian Warrior",
            items = {
                [1] = {item = "arcane staff", 
                        itemID = 2453,
                        reqItems = { 
                                [1] = {item = 9969, count = 1}, -- Black Skull
                                [2] = {item = 5904, count = 30}, -- Magic Sulphur
                            },
                        },
                   
                [2] = {item = "enchanted spear",
                        itemID = 7367,    
                        reqItems = {
                                [1] = {item = 9969, count = 1}, -- Black Skull
                                [2] = {item = 5904, count = 30}, -- Magic Sulphur
                            },
                        },
                 	},
				},		
								
			},
        		
		}
		
               
local player = Player(cid)
function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

		player:sendMainCraftWindow(config)

	return true
end﻿