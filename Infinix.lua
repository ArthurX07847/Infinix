-- Cliente Infinix | Brookhaven Rp | Português
-- Dev: <thurxis>

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local LeftFrame = Instance.new("Frame")
local RightFrame = Instance.new("Frame")

local UICorner = Instance.new("UICorner")

-- Config ScreenGui
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Frame
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Left menu
LeftFrame.Size = UDim2.new(0, 120, 1, 0)
LeftFrame.Position = UDim2.new(0, 0, 0, 0)
LeftFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LeftFrame.Parent = MainFrame

-- Right content
RightFrame.Size = UDim2.new(1, -120, 1, 0)
RightFrame.Position = UDim2.new(0, 120, 0, 0)
RightFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
RightFrame.Parent = MainFrame

-- Função p/ criar botão
local function createButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.Position = UDim2.new(0, 5, 0, (#LeftFrame:GetChildren()-1) * 45 + 5)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Text = text
    btn.Parent = LeftFrame
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Função para limpar RightFrame
local function clearRight()
    for _, v in pairs(RightFrame:GetChildren()) do
        if v:IsA("GuiObject") then
            v:Destroy()
        end
    end
end

-- Início
createButton("Início", function()
    clearRight()
    local title = Instance.new("TextLabel")
    title.Text = "infinix Hub | Community"
    title.Size = UDim2.new(1, 0, 0, 40)
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.Parent = RightFrame

    local desc = Instance.new("TextLabel")
    desc.Text = "Junte-se a nossa comunidade discord para comprar um designer"
    desc.Size = UDim2.new(1, -20, 0, 60)
    desc.Position = UDim2.new(0, 10, 0, 50)
    desc.TextColor3 = Color3.fromRGB(200, 200, 200)
    desc.Font = Enum.Font.Gotham
    desc.TextWrapped = true
    desc.TextSize = 14
    desc.Parent = RightFrame

    local joinBtn = Instance.new("TextButton")
    joinBtn.Text = "Join"
    joinBtn.Size = UDim2.new(0, 100, 0, 40)
    joinBtn.Position = UDim2.new(0, 10, 0, 120)
    joinBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    joinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    joinBtn.Font = Enum.Font.GothamBold
    joinBtn.TextSize = 14
    joinBtn.Parent = RightFrame
    Instance.new("UICorner", joinBtn).CornerRadius = UDim.new(0, 8)

    joinBtn.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/XT8DFw2QsG")
    end)
end)

-- Proteção
createButton("Proteção", function()
    clearRight()
    local prot = Instance.new("TextLabel")
    prot.Text = "Funções de Proteção:\n- ANT VOID\n- ANT SIT\n- ANT SCRIPT"
    prot.Size = UDim2.new(1, -20, 1, -20)
    prot.Position = UDim2.new(0, 10, 0, 10)
    prot.TextColor3 = Color3.fromRGB(255, 255, 255)
    prot.Font = Enum.Font.Gotham
    prot.TextWrapped = true
    prot.TextSize = 14
    prot.Parent = RightFrame
end)

-- Troll
createButton("Troll", function()
    clearRight()
    local troll = Instance.new("TextLabel")
    troll.Text = "TROLL"
    troll.Size = UDim2.new(1, 0, 0, 30)
    troll.TextColor3 = Color3.fromRGB(255, 255, 255)
    troll.Font = Enum.Font.GothamBold
    troll.TextSize = 18
    troll.Parent = RightFrame
end)
