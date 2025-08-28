-- infinix Client | Brookhaven Rp | Português
-- Dev: Dev <thurxis>
-- NOTA DE SEGURANÇA: Este script NÃO executa ações que prejudiquem outros jogadores ou servidores.
-- Ações potencialmente disruptivas foram transformadas em simulações locais/avisos.

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = (LocalPlayer and LocalPlayer:FindFirstChildOfClass("PlayerGui")) or game:GetService("StarterGui")

-- Config
local DISCORD_LINK = "https://discord.gg/XT8DFw2QsG"
local THEME = {
    bg = Color3.fromRGB(5,5,5),
    panel = Color3.fromRGB(12,12,12),
    accent = Color3.fromRGB(30,144,255),
    text = Color3.fromRGB(255,255,255),
    muted = Color3.fromRGB(150,150,150),
    green = Color3.fromRGB(46,204,113),
}

-- Small helper to create instances
local function new(class, props)
    local obj = Instance.new(class)
    if props then
        for k,v in pairs(props) do
            if type(k) == "number" then
                v.Parent = obj
            else
                pcall(function() obj[k] = v end)
            end
        end
    end
    return obj
end

-- Root GUI
local screenGui = new("ScreenGui", {
    Name = "infinixClientGUI",
    ResetOnSpawn = false,
    Parent = PlayerGui
})

-- Background
local mainFrame = new("Frame", {
    Name = "Main",
    Parent = screenGui,
    AnchorPoint = Vector2.new(0.5,0.5),
    Position = UDim2.new(0.5,0.5,0.5,0),
    Size = UDim2.new(0.72,0,0.72,0),
    BackgroundColor3 = THEME.panel,
    BorderSizePixel = 0,
})
new("UICorner", {Parent = mainFrame, CornerRadius = UDim.new(0,12)})

-- TopBar: title + minimize + close
local topBar = new("Frame", {
    Parent = mainFrame,
    Size = UDim2.new(1,0,0,36),
    BackgroundTransparency = 1,
})
local title = new("TextLabel", {
    Parent = topBar,
    Text = "infinix Client  |  Brookhaven Rp  |  Português",
    TextColor3 = THEME.text,
    BackgroundTransparency = 1,
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
    Position = UDim2.new(0,12,0,6),
    Size = UDim2.new(0.75,0,1,0),
    TextXAlignment = Enum.TextXAlignment.Left,
})
local btnMin = new("TextButton", {
    Parent = topBar,
    Name = "Minimize",
    Text = "-",
    Font = Enum.Font.SourceSansBold,
    TextSize = 20,
    BackgroundColor3 = THEME.panel,
    TextColor3 = THEME.text,
    Size = UDim2.new(0,36,0,28),
    Position = UDim2.new(1,-90,0,4),
})
new("UICorner", {Parent = btnMin, CornerRadius = UDim.new(0,6)})
local btnClose = new("TextButton", {
    Parent = topBar,
    Name = "Close",
    Text = "X",
    Font = Enum.Font.SourceSansBold,
    TextSize = 18,
    BackgroundColor3 = THEME.panel,
    TextColor3 = THEME.text,
    Size = UDim2.new(0,36,0,28),
    Position = UDim2.new(1,-44,0,4),
})
new("UICorner", {Parent = btnClose, CornerRadius = UDim.new(0,6)})

-- Left menu
local leftPanel = new("Frame", {
    Parent = mainFrame,
    Position = UDim2.new(0,12,0,54),
    Size = UDim2.new(0,140,1,-70),
    BackgroundTransparency = 1,
})
local function createMenuButton(text, posY)
    local b = new("TextButton", {
        Parent = leftPanel,
        Text = text,
        Size = UDim2.new(1,0,0,44),
        Position = UDim2.new(0,0,posY,0),
        BackgroundColor3 = THEME.panel,
        TextColor3 = THEME.text,
        Font = Enum.Font.SourceSans,
        TextSize = 16,
    })
    new("UICorner", {Parent = b, CornerRadius = UDim.new(0,8)})
    return b
end
local btnInfo = createMenuButton("Informações", 0)
local btnInicio = createMenuButton("Início", 0.125)
local btnProtecao = createMenuButton("Proteção", 0.25)
local btnTroll = createMenuButton("Troll", 0.375)

-- Right content area
local rightArea = new("Frame", {
    Parent = mainFrame,
    Position = UDim2.new(0,164,0,54),
    Size = UDim2.new(1,-176,1,-70),
    BackgroundColor3 = THEME.bg,
    BorderSizePixel = 0,
})
new("UICorner", {Parent = rightArea, CornerRadius = UDim.new(0,10)})

-- Helper: clear rightArea
local function clearRight()
    for _,v in pairs(rightArea:GetChildren()) do
        v:Destroy()
    end
end

-- Content: Início (Discord)
local function showInicio()
    clearRight()
    local header = new("TextLabel", {
        Parent = rightArea,
        Text = "infinix Hub | Community",
        TextColor3 = THEME.text,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSansBold,
        TextSize = 20,
        Position = UDim2.new(0,12,0,12),
        Size = UDim2.new(1,-24,0,28),
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local sub = new("TextLabel", {
        Parent = rightArea,
        Text = "Junte-se a nossa comunidade discord para comprar um designer",
        TextColor3 = THEME.muted,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSans,
        TextSize = 15,
        Position = UDim2.new(0,12,0,46),
        Size = UDim2.new(1,-24,0,50),
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
    })
    local joinBtn = new("TextButton", {
        Parent = rightArea,
        Text = "Join",
        BackgroundColor3 = THEME.green,
        TextColor3 = THEME.text,
        Font = Enum.Font.SourceSansBold,
        TextSize = 16,
        Position = UDim2.new(0,12,0,110),
        Size = UDim2.new(0,120,0,40),
    })
    new("UICorner", {Parent = joinBtn, CornerRadius = UDim.new(0,8)})

    joinBtn.MouseButton1Click:Connect(function()
        -- tenta copiar para o clipboard (dependendo do executor)
        local ok, err = pcall(function()
            if setclipboard then
                setclipboard(DISCORD_LINK)
            else
                -- alguns executores suportam StarterGui:SetCore("SendNotification", {...}) mas copiar pode falhar
                -- fallback: usar StarterGui to show link
                -- apenas informamos localmente
            end
        end)
        if ok then
            -- notificação simples
            pcall(function()
                if game:GetService("StarterGui") and game:GetService("StarterGui").SetCore then
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Discord copiado",
                        Text = "Link copiado para a área de transferência.",
                        Duration = 3,
                    })
                end
            end)
        else
            warn("Não foi possível copiar: "..tostring(err))
        end
    end)
end

-- Content: Proteção (toggles locais)
local protectionStates = {
    ANT_VOID = false,
    ANT_SIT = false,
    ANT_SCRIPT = false,
}
local function showProtecao()
    clearRight()
    local header = new("TextLabel", {
        Parent = rightArea,
        Text = "Proteções",
        TextColor3 = THEME.text,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSansBold,
        TextSize = 20,
        Position = UDim2.new(0,12,0,12),
        Size = UDim2.new(1,-24,0,28),
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local function makeToggle(name, posY)
        local label = new("TextLabel", {
            Parent = rightArea,
            Text = name,
            TextColor3 = THEME.muted,
            BackgroundTransparency = 1,
            Font = Enum.Font.SourceSans,
            TextSize = 15,
            Position = UDim2.new(0,12,posY,0),
            Size = UDim2.new(0.6,-12,0,30),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
        })
        local btn = new("TextButton", {
            Parent = rightArea,
            Text = "OFF",
            BackgroundColor3 = Color3.fromRGB(90,90,90),
            TextColor3 = THEME.text,
            Font = Enum.Font.SourceSansBold,
            TextSize = 14,
            Position = UDim2.new(0.65,0,posY,0),
            Size = UDim2.new(0.33,0,0,30),
        })
        new("UICorner", {Parent = btn, CornerRadius = UDim.new(0,8)})
        btn.MouseButton1Click:Connect(function()
            protectionStates[name] = not protectionStates[name]
            if protectionStates[name] then
                btn.BackgroundColor3 = THEME.accent
                btn.Text = "ON"
                -- ação segura: apenas aviso local
                pcall(function()
                    if game:GetService("StarterGui").SetCore then
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            Title = "Proteção",
                            Text = name.." ativado (simulado localmente).",
                            Duration = 2,
                        })
                    end
                end)
            else
                btn.BackgroundColor3 = Color3.fromRGB(90,90,90)
                btn.Text = "OFF"
            end
        end)
    end

    makeToggle("ANT_VOID", 0.18)
    makeToggle("ANT_SIT", 0.32)
    makeToggle("ANT_SCRIPT", 0.46)
end

-- Content: Troll (SIMULAÇÕES LOCAIS)
local function showTroll()
    clearRight()
    local header = new("TextLabel", {
        Parent = rightArea,
        Text = "TROLL",
        TextColor3 = THEME.text,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSansBold,
        TextSize = 20,
        Position = UDim2.new(0,12,0,12),
        Size = UDim2.new(1,-24,0,28),
        TextXAlignment = Enum.TextXAlignment.Left,
    })

    -- Botão: "Bugar pula servidor (todos player)" -> substituído por SIMULAÇÃO local: só faz seu próprio personagem pular repetidamente
    local bugAllBtn = new("TextButton", {
        Parent = rightArea,
        Text = "Bugar pula servidor (simulação local)",
        BackgroundColor3 = THEME.accent,
        TextColor3 = THEME.text,
        Font = Enum.Font.SourceSansBold,
        TextSize = 14,
        Position = UDim2.new(0,12,0,60),
        Size = UDim2.new(0,300,0,40),
    })
    new("UICorner", {Parent = bugAllBtn, CornerRadius = UDim.new(0,8)})

    local jumping = false
    local jumpCoroutine
    bugAllBtn.MouseButton1Click:Connect(function()
        jumping = not jumping
        if jumping then
            bugAllBtn.BackgroundColor3 = THEME.green
            bugAllBtn.Text = "Parar simulação de pulo"
            -- apenas faz o seu personagem pular repetidamente (SIMULAÇÃO)
            jumpCoroutine = coroutine.create(function()
                while jumping do
                    local char = LocalPlayer.Character
                    if char then
                        local humanoid = char:FindFirstChildOfClass("Humanoid")
                        if humanoid and humanoid.Health > 0 then
                            humanoid.Jump = true
                        end
                    end
                    wait(0.45)
                end
            end)
            coroutine.resume(jumpCoroutine)
        else
            bugAllBtn.BackgroundColor3 = THEME.accent
            bugAllBtn.Text = "Bugar pula servidor (simulação local)"
        end
    end)

    -- Seletor de jogador (não executa ações nocivas; apenas mostra uma notificação/simulação)
    local selLabel = new("TextLabel", {
        Parent = rightArea,
        Text = "JOGADOR SELECIONADO",
        TextColor3 = THEME.muted,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        Position = UDim2.new(0,12,0,120),
        Size = UDim2.new(0.6,0,0,20),
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local dropdown = new("TextButton", {
        Parent = rightArea,
        Text = "Selecione...",
        BackgroundColor3 = Color3.fromRGB(80,80,80),
        TextColor3 = THEME.text,
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        Position = UDim2.new(0,12,0,146),
        Size = UDim2.new(0.5,0,0,34),
    })
    new("UICorner", {Parent = dropdown, CornerRadius = UDim.new(0,8)})

    local atualizarBtn = new("TextButton", {
        Parent = rightArea,
        Text = "ATUALIZAR PLAYERS",
        BackgroundColor3 = THEME.accent,
        TextColor3 = THEME.text,
        Font = Enum.Font.SourceSansBold,
        TextSize = 13,
        Position = UDim2.new(0.54,0,0,146),
        Size = UDim2.new(0.34,0,0,34),
    })
    new("UICorner", {Parent = atualizarBtn, CornerRadius = UDim.new(0,8)})

    local listFrame
    local selectedPlayerName

    local function refreshPlayerList()
        if listFrame then listFrame:Destroy() end
        listFrame = new("Frame", {
            Parent = rightArea,
            BackgroundColor3 = Color3.fromRGB(20,20,20),
            Position = UDim2.new(0,12,0,186),
            Size = UDim2.new(0,0,0,0),
            BorderSizePixel = 0,
        })
        new("UICorner", {Parent = listFrame, CornerRadius = UDim.new(0,8)})
        local y = 6
        for _,plr in ipairs(Players:GetPlayers()) do
            local pbtn = new("TextButton", {
                Parent = listFrame,
                Text = plr.Name,
                BackgroundColor3 = Color3.fromRGB(40,40,40),
                TextColor3 = THEME.text,
                Font = Enum.Font.SourceSans,
                TextSize = 14,
                Position = UDim2.new(0,6,0,y),
                Size = UDim2.new(0,240,0,28),
            })
            new("UICorner", {Parent = pbtn, CornerRadius = UDim.new(0,6)})
            pbtn.MouseButton1Click:Connect(function()
                selectedPlayerName = plr.Name
                dropdown.Text = selectedPlayerName
                -- fecha a lista
                listFrame:Destroy()
                listFrame = nil
            end)
            y = y + 34
        end
        -- ajustar tamanho
        local total = #Players:GetPlayers() * 34 + 12
        listFrame.Size = UDim2.new(0,260,0,total)
    end

    atualizarBtn.MouseButton1Click:Connect(function()
        refreshPlayerList()
    end)

    dropdown.MouseButton1Click:Connect(function()
        if listFrame then
            listFrame:Destroy()
            listFrame = nil
        else
            refreshPlayerList()
        end
    end)

    -- Botão "Bugar jogador selecionado" -> SIMULADO: mostra notificação/instrução
    local bugSelectedBtn = new("TextButton", {
        Parent = rightArea,
        Text = "BUGAR JOGADOR SELECIONADO (SIMULAÇÃO)",
        BackgroundColor3 = Color3.fromRGB(180,70,70),
        TextColor3 = THEME.text,
        Font = Enum.Font.SourceSansBold,
        TextSize = 14,
        Position = UDim2.new(0,12,0,220),
        Size = UDim2.new(0,360,0,40),
    })
    new("UICorner", {Parent = bugSelectedBtn, CornerRadius = UDim.new(0,8)})
    bugSelectedBtn.MouseButton1Click:Connect(function()
        if not selectedPlayerName then
            pcall(function()
                if game:GetService("StarterGui").SetCore then
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Erro",
                        Text = "Nenhum jogador selecionado.",
                        Duration = 2,
                    })
                end
            end)
            return
        end
        -- SIMULAÇÃO: não altera outros jogadores. Apenas notifica o executor.
        pcall(function()
            if game:GetService("StarterGui").SetCore then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Simulação",
                    Text = "Ação para "..selectedPlayerName.." simulada localmente. Não faz alterações reais.",
                    Duration = 3,
                })
            end
        end)
    end)
end

-- Default open Inicio
showInicio()

-- Menu button handlers
btnInicio.MouseButton1Click:Connect(showInicio)
btnProtecao.MouseButton1Click:Connect(showProtecao)
btnTroll.MouseButton1Click:Connect(showTroll)
btnInfo.MouseButton1Click:Connect(function()
    clearRight()
    local lbl = new("TextLabel", {
        Parent = rightArea,
        Text = "Informações:\nDev: Dev <thurxis>\nTema: Dark AMOLED\nExecutor: Delta (Android)",
        TextColor3 = THEME.muted,
        BackgroundTransparency = 1,
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        Position = UDim2.new(0,12,0,12),
        Size = UDim2.new(1,-24,1,-24),
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
    })
end)

-- Minimize / Close behavior -> substitui mainFrame por ícone arrastável
local iconButton
local function createIcon()
    if iconButton and iconButton.Parent then return end
    iconButton = new("TextButton", {
        Parent = screenGui,
        Text = "🏠",
        TextSize = 26,
        Font = Enum.Font.SourceSansBold,
        Size = UDim2.new(0,48,0,48),
        Position = UDim2.new(0,20,0,20),
        BackgroundColor3 = THEME.panel,
        TextColor3 = THEME.text,
        AutoButtonColor = true,
    })
    new("UICorner", {Parent = iconButton, CornerRadius = UDim.new(0,12)})

    -- arrastar
    local dragging = false
    local dragInput, dragStart, startPos
    iconButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = iconButton.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    iconButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            iconButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    iconButton.MouseButton1Click:Connect(function()
        if mainFrame.Parent then
            mainFrame.Visible = true
            iconButton:Destroy()
            iconButton = nil
        end
    end)
end

btnMin.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    createIcon()
end)
btnClose.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    createIcon()
end)

-- Estilização final: tornar botões do menu com texto branco e cantos arredondados
for _,v in ipairs(leftPanel:GetChildren()) do
    if v:IsA("TextButton") then
        v.TextColor3 = THEME.text
        v.BackgroundColor3 = Color3.fromRGB(18,18,18)
    end
end

-- Proteções: opcional, você pode conectar checks locais aqui
-- Exemplo: impedir que o personagem sente (simulação)
-- (MANTIDO OPCIONAL e LOCAL)

print("infinix Client GUI carregado (simulado).")

-- FIM DO SCRIPT
