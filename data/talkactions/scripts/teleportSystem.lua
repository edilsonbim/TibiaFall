TP_MODAL_SYSTEM = {
    id = 1060, -- se nao souber do que se trata, nao mude
    titulo = "Sistema de teleport", -- titulo da janela
    mensagem = "Selecione seu destino abaixo", -- mensagem da janela
    
    tempo = 10, -- Tempo em segundos para o jogador poder utilizar o sistema novamente
    
    -- CONFIG DE HOUSES -- 
    houses_modal = true, -- se deseja exibir a house do jogador no modal de teleport, true/false
    house_pago = true, -- se o player precisa pagar para se teleportar para a house, true/false
    house_custo = 6000, -- custo do teleport para a house, caso tenha colocado true acima
    -- FIM DE CONFIG DOS HOUSES -- 
    
    protect_zone = true, -- se o player precisa ta em uma zona segura para utilizar o comando, true/false
    
    msgs = {
        ptz = "Voce precisa esta em uma protect zone para utilizar o sistema de teleport!",
        mny = "Voce nao tem %d gold coins para esta viagem!",
        exh = "Voce precisa esperar %d segundos para utilizar novamente o sistema de teleport!",
    },
    
    locais = {
        [1] = {
            nome = 'Templo', -- Nome do local a ser mostrado na janela
            pago = false, -- caso o jogador tenha que pagar para usar o teleport -> true/false
            custo = 5000, -- custo da viagem, caso tenha colocado true acima
            pos = Position(32369, 32236, 7) -- Posicao que ira se teleportar. Segue a ordem: X,Y,Z
        },
        
        [2] = {
            nome = 'Depot',
            pago = true,
            custo = 5000,
            pos = Position(32345, 32222, 7)
            
        },
        
        [3] = {
            nome = 'Ferreiro',
            pago = true,
            custo = 1000,
            pos = Position(31880, 33083, 7)
        },
        -- para adicionar mais, copie a partir do [3] até a linha de cima deste comentario, em seguida, adicione modifique para [4] e assim por diante
    },
    
    locais_wp = {}, -- não mexa
    storage = 44958, -- Storage que irá controlar o tempo para utilizar o sistema novamente
}

local function create_modal(id, title, message, tb, p)
    local wd = ModalWindow(id, title, message)
   
    for i, v in pairs(tb.locais) do
        wd:addChoice(i, v.nome .. ' | custo: ' .. ((v.pago and v.custo) or 0))
    end 
    
    local start_tp = #tb.locais
    
    if (TP_MODAL_SYSTEM.houses_modal) then 
        local p_house = p:getHouse()
        if (p_house) then 
            tb.locais_wp[p:getGuid()] = {}
            table.insert(tb.locais_wp[p:getGuid()], {
                nome = "House",
                pago = tb.house_pago,
                custo = tb.house_custo,
                pos = p_house:getExitPosition()
            })
        end 
        if (tb.locais_wp[p:getGuid()]) then 
            for i, v in pairs(tb.locais_wp[p:getGuid()]) do
                wd:addChoice(i + start_tp, v.nome .. ' | custo: ' .. ((v.pago and v.custo) or 0))
            end 
        end 
    end 
   
    wd:addButton(101, "Teleport")
    wd:addButton(100, "Cancel")
    
    wd:setDefaultEnterButton(101)
    wd:setDefaultEscapeButton(100)
    return wd  
end


local function check_cond(p)
    if (p:getStorageValue(TP_MODAL_SYSTEM.storage) >= os.time()) then 
        p:sendCancelMessage((TP_MODAL_SYSTEM.msgs.exh):format(p:getStorageValue(TP_MODAL_SYSTEM.storage) - os.time()))
        p:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end 
    
    if (TP_MODAL_SYSTEM.protect_zone) then 
        if not (Tile(p:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE)) then 
            p:sendCancelMessage(TP_MODAL_SYSTEM.msgs.ptz)
            p:getPosition():sendMagicEffect(CONST_ME_POFF)
            return false 
        end 
    end
    return true
end 

function onSay(player, words, param)
    if not (check_cond(player)) then return false end
    player:registerEvent("Modal_tpsystem")
    local window = create_modal(TP_MODAL_SYSTEM.id, TP_MODAL_SYSTEM.titulo, TP_MODAL_SYSTEM.mensagem, TP_MODAL_SYSTEM, player)
    window:sendToPlayer(player)
    player:setStorageValue(TP_MODAL_SYSTEM.storage, os.time() + TP_MODAL_SYSTEM.tempo)
    return true
end