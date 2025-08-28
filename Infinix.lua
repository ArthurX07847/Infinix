-- Configurações iniciais
local screenWidth, screenHeight = guiGetScreenSize()
local isMenuVisible = false
local isMinimized = false
local dragStartPos = nil
local menuPos = {x = screenWidth * 0.1, y = screenHeight * 0.2}
local menuSize = {width = screenWidth * 0.8, height = screenHeight * 0.6}
local iconSize = 50
local iconPos = {x = 20, y = screenHeight - 80}
local protectionActive = false
local mainActive = false

-- Estados dos botões de proteção
local antSitActive = false
local antLagActive = false
local antScriptActive = false
local antHackerActive = false

-- Função para desenhar o menu
function drawMenu()
    if isMinimized then return end
    
    -- Fundo do menu
    dxDrawRectangle(menuPos.x, menuPos.y, menuSize.width, menuSize.height, tocolor(20, 20, 30, 230))
    dxDrawRectangle(menuPos.x, menuPos.y, menuSize.width, 40, tocolor(30, 30, 45, 255))
    
    -- Título
    dxDrawText("infinix hub by thurxtech || BROOKHAVEN RP 🏠", 
               menuPos.x + 10, menuPos.y + 10, 
               menuPos.x + menuSize.width, menuPos.y + 30, 
               tocolor(255, 255, 255, 255), 1.0, "default-bold", "left", "center")
    
    -- Botões de controle (X e -)
    dxDrawRectangle(menuPos.x + menuSize.width - 70, menuPos.y + 5, 30, 30, tocolor(220, 50, 50, 255))
    dxDrawText("X", menuPos.x + menuSize.width - 65, menuPos.y + 5, 
               menuPos.x + menuSize.width - 40, menuPos.y + 35, 
               tocolor(255, 255, 255, 255), 1.0, "default-bold", "center", "center")
    
    dxDrawRectangle(menuPos.x + menuSize.width - 35, menuPos.y + 5, 30, 30, tocolor(50, 150, 220, 255))
    dxDrawText("-", menuPos.x + menuSize.width - 30, menuPos.y + 5, 
               menuPos.x + menuSize.width - 5, menuPos.y + 35, 
               tocolor(255, 255, 255, 255), 1.0, "default-bold", "center", "center")
    
    -- Botão Proteção (esquerda)
    local protectionColor = protectionActive and tocolor(70, 130, 180, 255) or tocolor(50, 50, 70, 255)
    dxDrawRoundedRectangle(menuPos.x + 20, menuPos.y + 60, menuSize.width * 0.3, 50, 10, protectionColor)
    dxDrawText("🗡", menuPos.x + 30, menuPos.y + 60, 
               menuPos.x + 60, menuPos.y + 110, 
               tocolor(255, 255, 255, 255), 1.5, "default-bold", "left", "center")
    dxDrawText("proteção", menuPos.x + 70, menuPos.y + 60, 
               menuPos.x + menuSize.width * 0.3, menuPos.y + 110, 
               tocolor(255, 255, 255, 255), 1.0, "default-bold", "left", "center")
    
    -- Botões de proteção (direita) - visíveis apenas quando proteção está ativa
    if protectionActive then
        -- ANT SIT
        local antSitColor = antSitActive and tocolor(50, 150, 50, 255) or tocolor(50, 50, 70, 255)
        dxDrawRectangle(menuPos.x + menuSize.width * 0.4, menuPos.y + 60, menuSize.width * 0.5, 50, antSitColor)
        dxDrawText("ANT SIT", menuPos.x + menuSize.width * 0.4 + 10, menuPos.y + 60, 
                   menuPos.x + menuSize.width * 0.9 - 30, menuPos.y + 110, 
                   tocolor(255, 255, 255, 255), 1.0, "default-bold", "left", "center")
        dxDrawCircle(menuPos.x + menuSize.width * 0.9 - 20, menuPos.y + 85, 15, antSitActive and tocolor(255, 50, 50, 255) or tocolor(100, 100, 120, 255))
        
        -- ANT LAG
        local antLagColor = antLagActive and tocolor(50, 150, 50, 255) or tocolor(50, 50, 70, 255)
        dxDrawRectangle(menuPos.x + menuSize.width * 0.4, menuPos.y + 120, menuSize.width * 0.5, 50, antLagColor)
        dxDrawText("ANT LAG", menuPos.x + menuSize.width * 0.4 + 10, menuPos.y + 120, 
                   menuPos.x + menuSize.width * 0.9 - 30, menuPos.y + 170, 
                   tocolor(255, 255, 255, 255), 1.0, "default-bold", "left", "center")
        dxDrawCircle(menuPos.x + menuSize.width * 0.9 - 20, menuPos.y + 145, 15, antLagActive and tocolor(255, 50, 50, 255) or tocolor(100, 100, 120, 255))
        
        -- ANT SCRIPT
        local antScriptColor = antScriptActive and tocolor(50, 150, 50, 255) or tocolor(50, 50, 70, 255)
        dxDrawRectangle(menuPos.x + menuSize.width * 0.4, menuPos.y + 180, menuSize.width * 0.5, 50, antScriptColor)
        dxDrawText("ANT SCRIPT", menuPos.x + menuSize.width * 0.4 + 10, menuPos.y + 180, 
                   menuPos.x + menuSize.width * 0.9 - 30, menuPos.y + 230, 
                   tocolor(255, 255, 255, 255), 1.0, "default-bold", "left", "center")
        dxDrawCircle(menuPos.x + menuSize.width * 0.9 - 20, menuPos.y + 205, 15, antScriptActive and tocolor(255, 50, 50, 255) or tocolor(100, 100, 120, 255))
        
        -- ANT HACKER
        local antHackerColor = antHackerActive and tocolor(50, 150, 50, 255) or tocolor(50, 50, 70, 255)
        dxDrawRectangle(menuPos.x + menuSize.width * 0.4, menuPos.y + 240, menuSize.width * 0.5, 50, antHackerColor)
        dxDrawText("ANT HACKER", menuPos.x + menuSize.width * 0.4 + 10, menuPos.y + 240, 
                   menuPos.x + menuSize.width * 0.9 - 30, menuPos.y + 290, 
                   tocolor(255, 255, 255, 255), 1.0, "default-bold", "left", "center")
        dxDrawCircle(menuPos.x + menuSize.width * 0.9 - 20, menuPos.y + 265, 15, antHackerActive and tocolor(255, 50, 50, 255) or tocolor(100, 100, 120, 255))
    end
    
    -- Botão Main (esquerda)
    local mainColor = mainActive and tocolor(70, 130, 180, 255) or tocolor(50, 50, 70, 255)
    dxDrawRoundedRectangle(menuPos.x + 20, menuPos.y + 130, menuSize.width * 0.3, 50, 10, mainColor)
    dxDrawText("📦", menuPos.x + 30, menuPos.y + 130, 
               menuPos.x + 60, menuPos.y + 180, 
               tocolor(255, 255, 255, 255), 1.5, "default-bold", "left", "center")
    dxDrawText("MAIN", menuPos.x + 70, menuPos.y + 130, 
               menuPos.x + menuSize.width * 0.3, menuPos.y + 180, 
               tocolor(255, 255, 255, 255), 1.0, "default-bold", "left", "center")
    
    -- Informações do servidor (visíveis apenas quando main está ativo)
    if mainActive then
        dxDrawRectangle(menuPos.x + menuSize.width * 0.4, menuPos.y + 60, menuSize.width * 0.5, menuSize.height - 80, tocolor(40, 40, 60, 255))
        
        -- Simulação de informações do servidor
        dxDrawText("INFORMAÇÕES DO SERVIDOR", menuPos.x + menuSize.width * 0.4 + 10, menuPos.y + 70, 
                   menuPos.x + menuSize.width * 0.9, menuPos.y + 100, 
                   tocolor(255, 255, 255, 255), 1.2, "default-bold", "left", "center")
        
        dxDrawText("Jogadores Online: 24/30", menuPos.x + menuSize.width * 0.4 + 20, menuPos.y + 110, 
                   menuPos.x + menuSize.width * 0.9, menuPos.y + 140, 
                   tocolor(200, 200, 200, 255), 1.0, "default", "left", "center")
        
        dxDrawText("Ping: 42ms", menuPos.x + menuSize.width * 0.4 + 20, menuPos.y + 150, 
                   menuPos.x + menuSize.width * 0.9, menuPos.y + 180, 
                   tocolor(200, 200, 200, 255), 1.0, "default", "left", "center")
        
        dxDrawText("Status: Estável", menuPos.x + menuSize.width * 0.4 + 20, menuPos.y + 190, 
                   menuPos.x + menuSize.width * 0.9, menuPos.y + 220, 
                   tocolor(200, 200, 200, 255), 1.0, "default", "left", "center")
        
        dxDrawText("Tempo de Atividade: 12h 34m", menuPos.x + menuSize.width * 0.4 + 20, menuPos.y + 230, 
                   menuPos.x + menuSize.width * 0.9, menuPos.y + 260, 
                   tocolor(200, 200, 200, 255), 1.0, "default", "left", "center")
    end
    
    -- Texto neon amoled
    dxDrawText("BROOKHAVEN RP", menuPos.x + 20, menuPos.y + 200, 
               menuPos.x + menuSize.width * 0.3, menuPos.y + 250, 
               tocolor(0, 255, 255, 255), 1.2, "default-bold", "left", "center", false, false, false, true)
end

-- Função para desenhar o ícone quando o menu está fechado
function drawIcon()
    if isMenuVisible then return end
    
    dxDrawCircle(iconPos.x + iconSize/2, iconPos.y + iconSize/2, iconSize/2, tocolor(30, 30, 45, 255))
    dxDrawText("🫣", iconPos.x, iconPos.y, 
               iconPos.x + iconSize, iconPos.y + iconSize, 
               tocolor(255, 255, 255, 255), 1.5, "default-bold", "center", "center")
end

-- Função para desenhar um retângulo com bordas arredondadas
function dxDrawRoundedRectangle(x, y, width, height, radius, color)
    dxDrawRectangle(x + radius, y + radius, width - (radius * 2), height - (radius * 2), color)
    dxDrawCircle(x + radius, y + radius, radius, 180, 270, color)
    dxDrawCircle(x + width - radius, y + radius, radius, 270, 360, color)
    dxDrawCircle(x + radius, y + height - radius, radius, 90, 180, color)
    dxDrawCircle(x + width - radius, y + height - radius, radius, 0, 90, color)
    dxDrawRectangle(x, y + radius, radius, height - (radius * 2), color)
    dxDrawRectangle(x + radius, y, width - (radius * 2), radius, color)
    dxDrawRectangle(x + width - radius, y + radius, radius, height - (radius * 2), color)
    dxDrawRectangle(x + radius, y + height - radius, width - (radius * 2), radius, color)
end

-- Função para desenhar um círculo
function dxDrawCircle(x, y, radius, color)
    local segments = 24
    local segmentAngle = 360 / segments
    local lastX, lastY
    
    for i = 0, segments do
        local angle = math.rad(i * segmentAngle)
        local nextX = x + math.cos(angle) * radius
        local nextY = y + math.sin(angle) * radius
        
        if lastX then
            dxDrawLine(lastX, lastY, nextX, nextY, color, 2)
        end
        
        lastX, lastY = nextX, nextY
    end
end

-- Função para verificar se o cursor está sobre um elemento
function isCursorOverElement(x, y, width, height)
    if not isCursorShowing() then return false end
    local cursorX, cursorY = getCursorPosition()
    cursorX, cursorY = cursorX * screenWidth, cursorY * screenHeight
    return cursorX >= x and cursorX <= x + width and cursorY >= y and cursorY <= y + height
end

-- Função para verificar se o cursor está sobre um círculo
function isCursorOverCircle(circleX, circleY, radius)
    if not isCursorShowing() then return false end
    local cursorX, cursorY = getCursorPosition()
    cursorX, cursorY = cursorX * screenWidth, cursorY * screenHeight
    local distance = math.sqrt((cursorX - circleX)^2 + (cursorY - circleY)^2)
    return distance <= radius
end

-- Função ANT SIT (impede que o jogador sente)
function activateAntSit()
    antSitActive = not antSitActive
    
    if antSitActive then
        -- Código para impedir que o jogador sente
        showMessage("ANT SIT ativado: Você não poderá sentar.")
        -- Aqui você implementaria a lógica real para bloquear a ação de sentar
    else
        showMessage("ANT SIT desativado: Você pode sentar normalmente.")
    end
end

-- Função ANT LAG (otimiza conexão)
function activateAntLag()
    antLagActive = not antLagActive
    
    if antLagActive then
        -- Código para otimizar a conexão e reduzir lag
        showMessage("ANT LAG ativado: Conexão otimizada.")
        -- Aqui você implementaria a lógica real para otimizar a conexão
    else
        showMessage("ANT LAG desativado: Conexão normal.")
    end
end

-- Função ANT SCRIPT (protege contra scripts maliciosos)
function activateAntScript()
    antScriptActive = not antScriptActive
    
    if antScriptActive then
        -- Código para proteger contra scripts maliciosos
        showMessage("ANT SCRIPT ativado: Proteção contra scripts ativada.")
        -- Aqui você implementaria a lógica real de proteção
    else
        showMessage("ANT SCRIPT desativado: Sem proteção contra scripts.")
    end
end

-- Função ANT HACKER (protege contra hackers)
function activateAntHacker()
    antHackerActive = not antHackerActive
    
    if antHackerActive then
        -- Código para proteger contra hackers
        showMessage("ANT HACKER ativado: Proteção contra hackers ativada.")
        -- Aqui você implementaria a lógica real de proteção
    else
        showMessage("ANT HACKER desativado: Sem proteção contra hackers.")
    end
end

-- Função para mostrar mensagens
function showMessage(text)
    -- Esta função exibiria mensagens na tela
    -- Em uma implementação real, você teria um sistema de mensagens
    print(text)  -- Por enquanto, apenas imprime no console
end

-- Função para lidar com cliques
function handleClicks(button, state)
    if button == "left" and state == "down" then
        -- Verificar se clicou no ícone quando o menu está fechado
        if not isMenuVisible and isCursorOverCircle(iconPos.x + iconSize/2, iconPos.y + iconSize/2, iconSize/2) then
            isMenuVisible = true
            return
        end
        
        if not isMenuVisible or isMinimized then return end
        
        -- Verificar se clicou no botão de fechar (X)
        if isCursorOverElement(menuPos.x + menuSize.width - 70, menuPos.y + 5, 30, 30) then
            isMenuVisible = false
            return
        end
        
        -- Verificar se clicou no botão de minimizar (-)
        if isCursorOverElement(menuPos.x + menuSize.width - 35, menuPos.y + 5, 30, 30) then
            isMinimized = true
            return
        end
        
        -- Verificar se está arrastando o menu
        if isCursorOverElement(menuPos.x, menuPos.y, menuSize.width, 40) then
            local cursorX, cursorY = getCursorPosition()
            dragStartPos = {x = cursorX * screenWidth - menuPos.x, y = cursorY * screenHeight - menuPos.y}
            return
        end
        
        -- Verificar se clicou no botão de proteção
        if isCursorOverElement(menuPos.x + 20, menuPos.y + 60, menuSize.width * 0.3, 50) then
            protectionActive = not protectionActive
            if protectionActive then
                mainActive = false
            end
            return
        end
        
        -- Verificar se clicou no botão main
        if isCursorOverElement(menuPos.x + 20, menuPos.y + 130, menuSize.width * 0.3, 50) then
            mainActive = not mainActive
            if mainActive then
                protectionActive = false
            end
            return
        end
        
        -- Verificar se clicou nos botões de proteção
        if protectionActive then
            -- ANT SIT
            if isCursorOverElement(menuPos.x + menuSize.width * 0.4, menuPos.y + 60, menuSize.width * 0.5, 50) then
                activateAntSit()
                return
            end
            
            -- ANT LAG
            if isCursorOverElement(menuPos.x + menuSize.width * 0.4, menuPos.y + 120, menuSize.width * 0.5, 50) then
                activateAntLag()
                return
            end
            
            -- ANT SCRIPT
            if isCursorOverElement(menuPos.x + menuSize.width * 0.4, menuPos.y + 180, menuSize.width * 0.5, 50) then
                activateAntScript()
                return
            end
            
            -- ANT HACKER
            if isCursorOverElement(menuPos.x + menuSize.width * 0.4, menuPos.y + 240, menuSize.width * 0.5, 50) then
                activateAntHacker()
                return
            end
        end
    elseif button == "left" and state == "up" then
        dragStartPos = nil
    end
end

-- Função para lidar com o arrasto do menu
function handleDragging()
    if not dragStartPos or not isCursorShowing() then return end
    
    local cursorX, cursorY = getCursorPosition()
    menuPos.x = cursorX * screenWidth - dragStartPos.x
    menuPos.y = cursorY * screenHeight - dragStartPos.y
    
    -- Limitar o menu à tela
    menuPos.x = math.max(0, math.min(screenWidth - menuSize.width, menuPos.x))
    menuPos.y = math.max(0, math.min(screenHeight - menuSize.height, menuPos.y))
end

-- Função principal de renderização
function render()
    if isMenuVisible then
        drawMenu()
    else
        drawIcon()
    end
end

-- Registrar eventos
addEventHandler("onDraw", render)
addEventHandler("onClick", handleClicks)
addEventHandler("onCursorMove", handleDragging)

-- Mensagem inicial
showMessage("Menu Infinix Hub carregado! Clique no ícone 🫣 para abrir.")
