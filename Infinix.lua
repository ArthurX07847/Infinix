--// Infinix Client | Brookhaven Rp
--// Dev: <thurxis>

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Criar GUI principal
local ScreenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
ScreenGui.Name = "InfinixClient"

-- Botão flutuante 🏠
local DragButton = Instance.new("TextButton")
DragButton.Size = UDim2.new(0, 50, 0, 50)
DragButton.Position = UDim2.new(0.05, 0, 0.2, 0)
DragButton.Text = "🏠"
DragButton.TextColor3 = Color3.fromRGB(255,255,255)
DragButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
DragButton.BackgroundTransparency = 0.3
DragButton.TextScaled = true
DragButton.Parent = ScreenGui
DragButton.Active = true
DragButton.Draggable = true

-- Janela principal
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

-- Botões fechar e minimizar
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
CloseBtn.TextScaled = true
CloseBtn.BackgroundTransparency = 0.2

local MinBtn = Instance.new("TextButton", MainFrame)
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -70, 0, 5)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(255,255,255)
MinBtn.BackgroundColor3 = Color3.fromRGB(20,20,20)
MinBtn.TextScaled = true
MinBtn.BackgroundTransparency = 0.2

-- Menu lateral esquerdo
local LeftFrame = Instance.new("Frame", MainFrame)
LeftFrame.Size = UDim2.new(0, 150, 1, -10)
LeftFrame.Position = UDim2.new(0, 5, 0, 5)
LeftFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)

-- Área direita (conteúdo)
local RightFrame = Instance.new("Frame", MainFrame)
RightFrame.Size = UDim2.new(1, -170, 1, -10)
RightFrame.Position = UDim2.new(0, 160, 0, 5)
RightFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)

-- Função de criar botão
local function CreateButton(name, parent, yPos)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 40)
    Btn.Position = UDim2.new(0, 5, 0, yPos)
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(255,255,255)
    Btn.BackgroundColor3 = Color3.fromRGB(25,25,25)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 14
    Btn.AutoButtonColor = true
    Btn.Parent = parent
    Btn.BorderSizePixel = 0
    Btn.BackgroundTransparency = 0.1
    Btn.ClipsDescendants = true
    Btn.TextWrapped = true
    Btn.ZIndex = 2
    Btn.UICorner = Instance.new("UICorner", Btn)
    Btn.UICorner.CornerRadius = UDim.new(0,12)
    return Btn
end

-- Criando botões do menu
local InicioBtn = CreateButton("Início", LeftFrame, 10)
local ProtecaoBtn = CreateButton("Proteção", LeftFrame, 60)
local TrollBtn = CreateButton("Troll", LeftFrame, 110)

-- Criar abas (frames)
local InicioFrame = Instance.new("Frame", RightFrame)
InicioFrame.Size = UDim2.new(1,0,1,0)
InicioFrame.BackgroundTransparency = 1

local ProtecaoFrame = Instance.new("Frame", RightFrame)
ProtecaoFrame.Size = UDim2.new(1,0,1,0)
ProtecaoFrame.BackgroundTransparency = 1
ProtecaoFrame.Visible = false

local TrollFrame = Instance.new("Frame", RightFrame)
TrollFrame.Size = UDim2.new(1,0,1,0)
TrollFrame.BackgroundTransparency = 1
TrollFrame.Visible = false

-- Conteúdo Início
local InicioLabel = Instance.new("TextLabel", InicioFrame)
InicioLabel.Size = UDim2.new(1,0,0,40)
InicioLabel.Text = "Infinix Hub | Community"
InicioLabel.TextColor3 = Color3.fromRGB(255,255,255)
InicioLabel.BackgroundTransparency = 1
InicioLabel.TextSize = 18

local JoinBtn = Instance.new("TextButton", InicioFrame)
JoinBtn.Size = UDim2.new(0,200,0,40)
JoinBtn.Position = UDim2.new(0,10,0,50)
JoinBtn.Text = "Join"
JoinBtn.TextColor3 = Color3.fromRGB(255,255,255)
JoinBtn.BackgroundColor3 = Color3.fromRGB(0,200,0)
JoinBtn.UICorner = Instance.new("UICorner", JoinBtn)

JoinBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/XT8DFw2QsG")
end)

-- Conteúdo Proteção
local ant1 = CreateButton("ANT VOID", ProtecaoFrame, 10)
local ant2 = CreateButton("ANT SIT", ProtecaoFrame, 60)
local ant3 = CreateButton("ANT SCRIPT", ProtecaoFrame, 110)

-- (Aqui você conecta os sistemas reais das proteções ANT)

-- Conteúdo Troll
local TrollLabel = Instance.new("TextLabel", TrollFrame)
TrollLabel.Size = UDim2.new(1,0,0,30)
TrollLabel.Text = "TROLL"
TrollLabel.TextColor3 = Color3.fromRGB(255,255,255)
TrollLabel.BackgroundTransparency = 1

local BugarServerBtn = CreateButton("BUGAR PULAR SERVIDOR (Todos players)", TrollFrame, 40)
local BugarPlayerBtn = CreateButton("BUGAR JOGADOR SELECIONADO", TrollFrame, 90)

local PlayerList = Instance.new("ScrollingFrame", TrollFrame)
PlayerList.Size = UDim2.new(0,200,0,150)
PlayerList.Position = UDim2.new(0,10,0,140)
PlayerList.BackgroundColor3 = Color3.fromRGB(20,20,20)
PlayerList.CanvasSize = UDim2.new(0,0,0,0)

local AtualizarBtn = CreateButton("ATUALIZAR PLAYERS", TrollFrame, 300)

-- Função de atualizar lista de jogadores
local function UpdatePlayers()
    for _,child in pairs(PlayerList:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    local y = 0
    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local Btn = CreateButton(plr.Name, PlayerList, y)
            y = y + 40
            Btn.MouseButton1Click:Connect(function()
                -- aqui vai lógica de bugar só esse jogador
                warn("Bugando "..plr.Name)
            end)
        end
    end
    PlayerList.CanvasSize = UDim2.new(0,0,0,y)
end
AtualizarBtn.MouseButton1Click:Connect(UpdatePlayers)

-- Troca de abas
InicioBtn.MouseButton1Click:Connect(function()
    InicioFrame.Visible = true
    ProtecaoFrame.Visible = false
    TrollFrame.Visible = false
end)

ProtecaoBtn.MouseButton1Click:Connect(function()
    InicioFrame.Visible = false
    ProtecaoFrame.Visible = true
    TrollFrame.Visible = false
end)

TrollBtn.MouseButton1Click:Connect(function()
    InicioFrame.Visible = false
    ProtecaoFrame.Visible = false
    TrollFrame.Visible = true
    UpdatePlayers()
end)

-- Mostrar menu
DragButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

MinBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)
