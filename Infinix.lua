-- GUI estilo Drip Solutions (modelo preto)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)

-- Menu principal (lado esquerdo)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 160, 0, 320)
MainFrame.Position = UDim2.new(0, 20, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
MainFrame.BorderSizePixel = 0

-- Título
local Titulo = Instance.new("TextLabel", MainFrame)
Titulo.Size = UDim2.new(1,0,0,40)
Titulo.Text = "Infinix HUB"
Titulo.BackgroundColor3 = Color3.fromRGB(25,25,25)
Titulo.TextColor3 = Color3.fromRGB(255,255,255)
Titulo.Font = Enum.Font.GothamBold
Titulo.TextSize = 18

-- Frame lateral (abre quando clicar)
local SideFrame = Instance.new("Frame", ScreenGui)
SideFrame.Size = UDim2.new(0, 260, 0, 320)
SideFrame.Position = UDim2.new(0, 200, 0.5, -160)
SideFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
SideFrame.BorderSizePixel = 0
SideFrame.Visible = false

-- Função criar botão lateral
local function criarBotao(nome, ordem, func)
    local Btn = Instance.new("TextButton", MainFrame)
    Btn.Size = UDim2.new(1,0,0,35)
    Btn.Position = UDim2.new(0,0,0,(ordem*40))
    Btn.Text = nome
    Btn.TextColor3 = Color3.fromRGB(255,255,255)
    Btn.BackgroundColor3 = Color3.fromRGB(30,30,30)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 16
    Btn.BorderSizePixel = 0
    Btn.MouseButton1Click:Connect(func)
end

-- Função criar toggle no painel lateral
local function criarToggle(nome, ordem)
    local Toggle = Instance.new("TextButton", SideFrame)
    Toggle.Size = UDim2.new(1,-20,0,30)
    Toggle.Position = UDim2.new(0,10,0,(ordem*35)+10)
    Toggle.Text = nome.." [OFF]"
    Toggle.TextColor3 = Color3.fromRGB(255,255,255)
    Toggle.BackgroundColor3 = Color3.fromRGB(40,0,60)
    Toggle.Font = Enum.Font.Gotham
    Toggle.TextSize = 15
    Toggle.BorderSizePixel = 0
    local ativo = false
    Toggle.MouseButton1Click:Connect(function()
        ativo = not ativo
        Toggle.Text = nome.." ["..(ativo and "ON" or "OFF").."]"
    end)
end

-- Botão Proteção (abre painel lateral)
criarBotao("Proteção",1,function()
    SideFrame.Visible = true
    for _,v in pairs(SideFrame:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    local opcoes = {"Anti Tool","Anti Car","Anti Script","Anti Bug","Anti ChatSpy"}
    for i,n in ipairs(opcoes) do
        criarToggle(n,i)
    end
end)

-- Adiciona mais botões principais iguais o print
criarBotao("Spam/Client",2,function()
    SideFrame.Visible = true
    for _,v in pairs(SideFrame:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    local opcoes = {"Spam 1","Spam 2","Spam 3"}
    for i,n in ipairs(opcoes) do criarToggle(n,i) end
end)

criarBotao("Personagem",3,function()
    SideFrame.Visible = true
    for _,v in pairs(SideFrame:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    local opcoes = {"Speed","Fly","Noclip"}
    for i,n in ipairs(opcoes) do criarToggle(n,i) end
end)

criarBotao("Trolar",4,function()
    SideFrame.Visible = true
    for _,v in pairs(SideFrame:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    local opcoes = {"Explodir","Teleportar Players","Crash Local"}
    for i,n in ipairs(opcoes) do criarToggle(n,i) end
end)

criarBotao("Audio/Música",5,function()
    SideFrame.Visible = true
    for _,v in pairs(SideFrame:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    local opcoes = {"Tocar Música","Parar Música"}
    for i,n in ipairs(opcoes) do criarToggle(n,i) end
end)

criarBotao("Roupas",6,function()
    SideFrame.Visible = true
    for _,v in pairs(SideFrame:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    local opcoes = {"Roupa 1","Roupa 2","Roupa 3"}
    for i,n in ipairs(opcoes) do criarToggle(n,i) end
end)
