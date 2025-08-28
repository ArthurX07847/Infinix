-- Infinix HUB estilo da print

local Player = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MenuUI"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- Label canto superior esquerdo
local TopLabel = Instance.new("TextLabel")
TopLabel.Size = UDim2.new(0, 450, 0, 30)
TopLabel.Position = UDim2.new(0, 5, 0, 5)
TopLabel.BackgroundTransparency = 1
TopLabel.Text = "Infinix HUB by || ThurXtech kkkj || Brookhaven RP 🏠"
TopLabel.TextColor3 = Color3.fromRGB(255,255,255)
TopLabel.TextScaled = true
TopLabel.TextXAlignment = Enum.TextXAlignment.Left
TopLabel.Parent = ScreenGui

-- Frame principal
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Barra lateral
local SideBar = Instance.new("Frame")
SideBar.Size = UDim2.new(0, 120, 1, 0)
SideBar.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
SideBar.BorderSizePixel = 0
SideBar.Parent = MainFrame

-- Área conteúdo
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -120, 1, 0)
Content.Position = UDim2.new(0, 120, 0, 0)
Content.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
Content.BorderSizePixel = 0
Content.Parent = MainFrame

-- Botão Fechar (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.Parent = MainFrame

-- Botão Minimizar (-)
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -70, 0, 5)
MinBtn.Text = "-"
MinBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
MinBtn.TextColor3 = Color3.fromRGB(255,255,255)
MinBtn.Parent = MainFrame

-- Botão círculo ☠️ (reabre menu)
local CircleBtn = Instance.new("TextButton")
CircleBtn.Size = UDim2.new(0, 50, 0, 50)
CircleBtn.Position = UDim2.new(0.5, -25, 0.5, -25)
CircleBtn.Text = "☠️"
CircleBtn.BackgroundColor3 = Color3.fromRGB(200,0,0)
CircleBtn.TextColor3 = Color3.fromRGB(255,255,255)
CircleBtn.Visible = false
CircleBtn.Parent = ScreenGui
CircleBtn.TextScaled = true
CircleBtn.BorderSizePixel = 0

-- Minimizar
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        Content.Visible = false
        SideBar.Visible = false
    else
        Content.Visible = true
        SideBar.Visible = true
    end
end)

-- Fechar
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    CircleBtn.Visible = true
end)

-- Reabrir
CircleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    CircleBtn.Visible = false
end)

-- Sistema de páginas
local Pages = {}
local function CreatePage(name, text)
    local Page = Instance.new("Frame")
    Page.Name = name
    Page.Size = UDim2.new(1,0,1,0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.Parent = Content

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1,0,1,0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(255,255,255)
    Label.TextScaled = true
    Label.Parent = Page

    Pages[name] = Page
end

local function CreateButton(name,text)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1,0,0,40)
    Button.BackgroundColor3 = Color3.fromRGB(180,0,0)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255,255,255)
    Button.Parent = SideBar

    Button.MouseButton1Click:Connect(function()
        for _,p in pairs(Pages) do p.Visible=false end
        if Pages[name] then Pages[name].Visible=true end
    end)
end

-- Páginas exemplo
CreatePage("info","Página de Informações")
CreatePage("protecao","Página de Proteção")
CreatePage("trolar","Página de Trolar")

-- Botões exemplo
CreateButton("info","Informações")
CreateButton("protecao","Proteção")
CreateButton("trolar","Trolar")
