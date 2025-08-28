-- Infinix Hub UI (Interface apenas) - compatível para uso em executores tipo Delta no Android
-- ATENÇÃO: este script NÃO executa cheats nem altera o jogo. Apenas cria a interface visual e placeholders.
-- Carregamento ~10s -> mostra menu com botões à esquerda e painel de funções à direita.
-- Minimizador: botão "-" cria um ícone redondo (🗡) que pode ser arrastado e solto para permanecer no local.

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui") or Instance.new("ScreenGui", player:FindFirstChildOfClass("PlayerGui") or game:GetService("CoreGui"))
playerGui.Name = "InfinixHubGUI"

-- Root ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InfinixHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Fundo escuro AMOLED
local background = Instance.new("Frame")
background.Name = "Background"
background.BackgroundColor3 = Color3.fromRGB(5,5,5) -- quase preto
background.Size = UDim2.new(1,0,1,0)
background.Position = UDim2.new(0,0,0,0)
background.Parent = screenGui

-- Loading Screen
local loadingFrame = Instance.new("Frame")
loadingFrame.Name = "LoadingFrame"
loadingFrame.Size = UDim2.new(0.6,0,0.25,0)
loadingFrame.Position = UDim2.new(0.2,0,0.375,0)
loadingFrame.AnchorPoint = Vector2.new(0,0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = background

local uic = Instance.new("UICorner", loadingFrame)
uic.CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0.35,0)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0,0,0,0)
title.Text = "infinix hub carregamento"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(200,200,200)
title.Parent = loadingFrame

local progressBarBack = Instance.new("Frame")
progressBarBack.Size = UDim2.new(0.9,0,0.25,0)
progressBarBack.Position = UDim2.new(0.05,0,0.55,0)
progressBarBack.BackgroundColor3 = Color3.fromRGB(25,25,25)
progressBarBack.Parent = loadingFrame
Instance.new("UICorner", progressBarBack).CornerRadius = UDim.new(0,8)

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0,0,1,0)
progressBar.Position = UDim2.new(0,0,0,0)
progressBar.BackgroundColor3 = Color3.fromRGB(200,30,30) -- vermelho
progressBar.Parent = progressBarBack
Instance.new("UICorner", progressBar).CornerRadius = UDim.new(0,8)

-- Loading animation (simula ~10 segundos)
spawn(function()
    local totalTime = 10 -- segundos
    local start = tick()
    while tick() - start < totalTime do
        local t = (tick() - start)/totalTime
        progressBar.Size = UDim2.new(t,0,1,0)
        wait(0.05)
    end
    progressBar.Size = UDim2.new(1,0,1,0)
    wait(0.25)
    -- remove loading e mostra menu
    loadingFrame:Destroy()
    createMainMenu()
end)

-- Função para criar menu principal
function createMainMenu()
    -- Container principal
    local menu = Instance.new("Frame")
    menu.Name = "InfinixMenu"
    menu.Size = UDim2.new(0,700,0,420)
    menu.Position = UDim2.new(0.5, -350, 0.5, -210)
    menu.AnchorPoint = Vector2.new(0.5,0.5)
    menu.BackgroundColor3 = Color3.fromRGB(12,12,12)
    menu.Parent = background
    Instance.new("UICorner", menu).CornerRadius = UDim.new(0,10)
    local menuStroke = Instance.new("UIStroke", menu)
    menuStroke.Color = Color3.fromRGB(60,60,60)
    menuStroke.Thickness = 1

    -- Top bar (titulo + X e -)
    local topBar = Instance.new("Frame")
    topBar.Size = UDim2.new(1,0,0,38)
    topBar.Position = UDim2.new(0,0,0,0)
    topBar.BackgroundTransparency = 1
    topBar.Parent = menu

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(0.8,0,1,0)
    titleLabel.Position = UDim2.new(0.02,0,0,0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "INFINIX HUB BY THURX TECHKKJ ||  BROOKHAVEN RP 🏠"
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 18
    titleLabel.TextColor3 = Color3.fromRGB(220,220,220)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = topBar

    -- Botões de controlar janela: minimize e close
    local btnClose = Instance.new("TextButton")
    btnClose.Size = UDim2.new(0,34,0,24)
    btnClose.Position = UDim2.new(0.92,0,0.06,0)
    btnClose.BackgroundColor3 = Color3.fromRGB(30,30,30)
    btnClose.Text = "X"
    btnClose.Font = Enum.Font.SourceSansBold
    btnClose.TextSize = 18
    btnClose.TextColor3 = Color3.fromRGB(220,220,220)
    btnClose.Parent = topBar
    Instance.new("UICorner", btnClose).CornerRadius = UDim.new(0,6)
    Instance.new("UIStroke", btnClose).Color = Color3.fromRGB(60,60,60)

    local btnMin = Instance.new("TextButton")
    btnMin.Size = UDim2.new(0,34,0,24)
    btnMin.Position = UDim2.new(0.85,0,0.06,0)
    btnMin.BackgroundColor3 = Color3.fromRGB(30,30,30)
    btnMin.Text = "-"
    btnMin.Font = Enum.Font.SourceSansBold
    btnMin.TextSize = 22
    btnMin.TextColor3 = Color3.fromRGB(220,220,220)
    btnMin.Parent = topBar
    Instance.new("UICorner", btnMin).CornerRadius = UDim.new(0,6)
    Instance.new("UIStroke", btnMin).Color = Color3.fromRGB(60,60,60)

    -- Painel esquerdo (botões de categoria)
    local leftPanel = Instance.new("Frame")
    leftPanel.Size = UDim2.new(0,180,1,-48)
    leftPanel.Position = UDim2.new(0,8,0,40)
    leftPanel.BackgroundTransparency = 1
    leftPanel.Parent = menu

    -- Botão "Protecao" com icone 🗡 (letra cinza, ícone branco)
    local protecBtn = Instance.new("TextButton")
    protecBtn.Name = "ProtecaoBtn"
    protecBtn.Size = UDim2.new(1,0,0,54)
    protecBtn.Position = UDim2.new(0,0,0,0)
    protecBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
    protecBtn.Text = "" -- vamos montar com labels internos
    protecBtn.Parent = leftPanel
    Instance.new("UICorner", protecBtn).CornerRadius = UDim.new(0,10)
    Instance.new("UIStroke", protecBtn).Color = Color3.fromRGB(70,70,70)

    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0,36,0,36)
    iconLabel.Position = UDim2.new(0.04,0,0.12,0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = "🗡"
    iconLabel.Font = Enum.Font.SourceSans
    iconLabel.TextSize = 24
    iconLabel.TextColor3 = Color3.fromRGB(255,255,255) -- branco
    iconLabel.Parent = protecBtn

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0.7,0,0.8,0)
    textLabel.Position = UDim2.new(0.3,0,0.1,0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "Protecao"
    textLabel.Font = Enum.Font.SourceSans
    textLabel.TextSize = 18
    textLabel.TextColor3 = Color3.fromRGB(150,150,150) -- cinza
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.Parent = protecBtn

    -- Painel direito (conteúdo)
    local rightPanel = Instance.new("Frame")
    rightPanel.Size = UDim2.new(1,-208,1,-48)
    rightPanel.Position = UDim2.new(0,200,0,40)
    rightPanel.BackgroundColor3 = Color3.fromRGB(15,15,15)
    rightPanel.Parent = menu
    Instance.new("UICorner", rightPanel).CornerRadius = UDim.new(0,8)
    Instance.new("UIStroke", rightPanel).Color = Color3.fromRGB(60,60,60)

    local contentTitle = Instance.new("TextLabel")
    contentTitle.Size = UDim2.new(1, -20, 0, 28)
    contentTitle.Position = UDim2.new(0,10,0,10)
    contentTitle.BackgroundTransparency = 1
    contentTitle.Text = "Protecao"
    contentTitle.Font = Enum.Font.SourceSansBold
    contentTitle.TextSize = 20
    contentTitle.TextColor3 = Color3.fromRGB(220,220,220)
    contentTitle.TextXAlignment = Enum.TextXAlignment.Left
    contentTitle.Parent = rightPanel

    local functionsHolder = Instance.new("Frame")
    functionsHolder.Size = UDim2.new(1,-20,1,-48)
    functionsHolder.Position = UDim2.new(0,10,0,40)
    functionsHolder.BackgroundTransparency = 1
    functionsHolder.Parent = rightPanel

    -- Função auxiliar para criar botões de função (arredondado, cor cinza)
    local function createFunctionButton(parent, yOffset, text)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.85,0,0,46)
        b.Position = UDim2.new(0,0,0, yOffset)
        b.BackgroundColor3 = Color3.fromRGB(30,30,30)
        b.Text = text
        b.Font = Enum.Font.SourceSans
        b.TextSize = 16
        b.TextColor3 = Color3.fromRGB(170,170,170) -- cinza
        b.Parent = parent
        Instance.new("UICorner", b).CornerRadius = UDim.new(0,12)
        Instance.new("UIStroke", b).Color = Color3.fromRGB(60,60,60)
        return b
    end

    -- ANT SIT button + description (apenas label e estado)
    local antSitBtn = createFunctionButton(functionsHolder, 0, "ANT SIT")
    local antSitDesc = Instance.new("TextLabel")
    antSitDesc.Size = UDim2.new(0.85,0,0,40)
    antSitDesc.Position = UDim2.new(0,0,0,54)
    antSitDesc.BackgroundTransparency = 1
    antSitDesc.Text = "ficara imune de sofas, vc nao comsegue sentar em nada"
    antSitDesc.Font = Enum.Font.SourceSans
    antSitDesc.TextSize = 14
    antSitDesc.TextColor3 = Color3.fromRGB(180,180,180)
    antSitDesc.TextWrapped = true
    antSitDesc.TextXAlignment = Enum.TextXAlignment.Left
    antSitDesc.Parent = functionsHolder

    -- ANT VOID button
    local antVoidBtn = createFunctionButton(functionsHolder, 110, "ANT VOID")

    -- IMUNE SCRIPT button
    local imuneBtn = createFunctionButton(functionsHolder, 170, "IMUNE SCRIPT")

    -- Estado (apenas visual)
    local stateLabel = Instance.new("TextLabel")
    stateLabel.Size = UDim2.new(1,-20,0,28)
    stateLabel.Position = UDim2.new(0,10,1,-36)
    stateLabel.BackgroundTransparency = 1
    stateLabel.Text = "Status: Nenhuma ação ativa"
    stateLabel.Font = Enum.Font.SourceSansItalic
    stateLabel.TextSize = 14
    stateLabel.TextColor3 = Color3.fromRGB(170,170,170)
    stateLabel.TextXAlignment = Enum.TextXAlignment.Left
    stateLabel.Parent = rightPanel

    -- Estados locais (booleans)
    local antSitEnabled = false
    local antVoidEnabled = false
    local imuneEnabled = false

    -- Placeholder actions: apenas atualizam o label (NÃO modificam jogo)
    local function updateStateLabel()
        local parts = {}
        if antSitEnabled then table.insert(parts, "ANT SIT: ON") end
        if antVoidEnabled then table.insert(parts, "ANT VOID: ON") end
        if imuneEnabled then table.insert(parts, "IMUNE SCRIPT: ON") end
        if #parts == 0 then
            stateLabel.Text = "Status: Nenhuma ação ativa"
        else
            stateLabel.Text = "Status: " .. table.concat(parts, " | ")
        end
    end

    antSitBtn.Activated:Connect(function()
        antSitEnabled = not antSitEnabled
        antSitBtn.Text = "ANT SIT" .. (antSitEnabled and "  (ON)" or "")
        updateStateLabel()
        -- PLACEHOLDER: implementar lógica legítima aqui, se apropriado.
        -- Ex: chamar uma função local que apenas bloqueie animações locais (sem afetar outros jogadores).
    end)

    antVoidBtn.Activated:Connect(function()
        antVoidEnabled = not antVoidEnabled
        antVoidBtn.Text = "ANT VOID" .. (antVoidEnabled and "  (ON)" or "")
        updateStateLabel()
        -- PLACEHOLDER: implementar lógica legítima aqui.
    end)

    imuneBtn.Activated:Connect(function()
        imuneEnabled = not imuneEnabled
        imuneBtn.Text = "IMUNE SCRIPT" .. (imuneEnabled and "  (ON)" or "")
        updateStateLabel()
        -- PLACEHOLDER: implementar lógica legítima aqui.
    end)

    -- Ao clicar no botão "Protecao", highlight e mudar conteúdo do painel direito (já é Protecao por padrão)
    protecBtn.Activated:Connect(function()
        -- Visual: toque de feedback
        local tInfo = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(protecBtn, tInfo, {BackgroundColor3 = Color3.fromRGB(40,40,40)}):Play()
        wait(0.12)
        TweenService:Create(protecBtn, tInfo, {BackgroundColor3 = Color3.fromRGB(20,20,20)}):Play()
    end)

    -- Fechar (X)
    btnClose.Activated:Connect(function()
        menu:Destroy()
        -- também remove minimizador se existir
        local minim = screenGui:FindFirstChild("InfinixMinimizer")
        if minim then minim:Destroy() end
    end)

    -- Minimizar (-) -> cria ícone redondo arrastável e esconde menu
    btnMin.Activated:Connect(function()
        menu.Visible = false

        -- Se já existe minimizador, mostra e retorna
        local existing = screenGui:FindFirstChild("InfinixMinimizer")
        if existing then
            existing.Visible = true
            return
        end

        local minGui = Instance.new("Frame")
        minGui.Name = "InfinixMinimizer"
        minGui.Size = UDim2.new(0,60,0,60)
        minGui.Position = UDim2.new(0.02,0,0.8,0)
        minGui.BackgroundColor3 = Color3.fromRGB(20,20,20)
        minGui.Parent = screenGui
        Instance.new("UICorner", minGui).CornerRadius = UDim.new(1,0)
        Instance.new("UIStroke", minGui).Color = Color3.fromRGB(70,70,70)

        local icon = Instance.new("TextLabel")
        icon.Size = UDim2.new(1,0,1,0)
        icon.BackgroundTransparency = 1
        icon.Text = "🗡"
        icon.Font = Enum.Font.SourceSansBold
        icon.TextSize = 30
        icon.TextColor3 = Color3.fromRGB(255,255,255)
        icon.Parent = minGui

        -- Dragging logic
        local dragging = false
        local dragInput, dragStart, startPos

        local function update(input)
            local delta = input.Position - dragStart
            local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            minGui.Position = newPos
        end

        minGui.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = minGui.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        minGui.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)

        -- Ao tocar no minimizador, restaura o menu
        minGui.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                -- se foi um clique curto, restaura
                local elapsed = 0
                -- restaurar
                menu.Visible = true
                minGui:Destroy()
            end
        end)
    end)
end

-- Nota final:
-- Este script só controla a interface. As funções dos botões (ANT SIT, ANT VOID, IMUNE SCRIPT) são placeholders e NÃO executam nenhuma ação no jogo.
-- Se quiser, posso explicar como transformar estes placeholders em ações estritamente locais e legítimas (por exemplo: apenas alterar efeitos visuais locais, mostrar notificações, salvar preferências do usuário), mas não posso ajudar a criar cheats que afetem outros jogadores.
