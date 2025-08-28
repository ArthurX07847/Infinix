-- Infinix Hub (LocalScript)
-- Coloque este arquivo em StarterPlayer > StarterPlayerScripts (LocalScript)
-- Tradução/descrição em português nos comentários.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Config defaults
local uiEnabled = true
local antSitEnabled = false
local antLagEnabled = false
local antScriptEnabled = false
local antHackerEnabled = false

-- Store original objects/properties to restore
local originalParticles = {}
local removedGuis = {}
local humanoidConnections = {}
local storedHumanoidProps = {}

-- Helper: create UI instances quickly
local function new(instType, props)
	local inst = Instance.new(instType)
	if props then
		for k,v in pairs(props) do
			if k == "Parent" then
				inst.Parent = v
			else
				inst[k] = v
			end
		end
	end
	return inst
end

-- Build ScreenGui
local screenGui = new("ScreenGui", {
	Parent = PlayerGui,
	Name = "InfinixHubGUI",
	ResetOnSpawn = false,
})
-- Root main frame
local mainFrame = new("Frame", {
	Parent = screenGui,
	Name = "MainFrame",
	Size = UDim2.new(0, 520, 0, 360),
	Position = UDim2.new(0.05, 0, 0.12, 0),
	BackgroundColor3 = Color3.fromRGB(18,18,20),
	BorderSizePixel = 0,
})
-- Draggable implementation (we'll implement manual dragging)
mainFrame.Active = true

-- Top bar (contains title and close/minimize)
local topBar = new("Frame", {
	Parent = mainFrame,
	Name = "TopBar",
	Size = UDim2.new(1,0,0,30),
	Position = UDim2.new(0,0,0,0),
	BackgroundTransparency = 1,
})

local titleLabel = new("TextLabel", {
	Parent = topBar,
	Name = "Title",
	Size = UDim2.new(1, -120, 1, 0),
	Position = UDim2.new(0, 8, 0, 0),
	BackgroundTransparency = 1,
	Font = Enum.Font.SourceSansBold,
	TextSize = 16,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextColor3 = Color3.new(1,1,1),
	Text = "infinix hub by thurxtech || ",
})
-- Neon "BROOKHAVEN RP 🏠 ||"
local neonLabel = new("TextLabel", {
	Parent = titleLabel,
	Name = "Neon",
	Size = UDim2.new(0.6, 0, 1, 0),
	Position = UDim2.new(0.62, 0, 0, 0),
	BackgroundTransparency = 1,
	Font = Enum.Font.SourceSansBold,
	TextSize = 16,
	Text = "BROOKHAVEN RP 🏠 ||",
	TextXAlignment = Enum.TextXAlignment.Left,
	TextColor3 = Color3.fromRGB(0,255,255),
	TextStrokeColor3 = Color3.fromRGB(0,255,255),
	TextStrokeTransparency = 0.6,
})
-- Neon gradient
local uiGradient = new("UIGradient", {Parent = neonLabel})
uiGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255,0,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0,128,255)),
}

-- Close and minimize buttons
local closeBtn = new("TextButton", {
	Parent = topBar,
	Name = "Close",
	Size = UDim2.new(0,28,0,20),
	Position = UDim2.new(1, -34, 0, 5),
	BackgroundColor3 = Color3.fromRGB(60,60,60),
	Text = "X",
	Font = Enum.Font.SourceSansBold,
	TextSize = 16,
	TextColor3 = Color3.new(1,1,1),
	AutoButtonColor = true,
})
local minBtn = new("TextButton", {
	Parent = topBar,
	Name = "Minimize",
	Size = UDim2.new(0,28,0,20),
	Position = UDim2.new(1, -68, 0, 5),
	BackgroundColor3 = Color3.fromRGB(60,60,60),
	Text = "-",
	Font = Enum.Font.SourceSansBold,
	TextSize = 16,
	TextColor3 = Color3.new(1,1,1),
	AutoButtonColor = true,
})

-- Left panel (buttons)
local leftPanel = new("Frame", {
	Parent = mainFrame,
	Name = "LeftPanel",
	Size = UDim2.new(0,140,1, -30),
	Position = UDim2.new(0,0,0,30),
	BackgroundColor3 = Color3.fromRGB(24,24
