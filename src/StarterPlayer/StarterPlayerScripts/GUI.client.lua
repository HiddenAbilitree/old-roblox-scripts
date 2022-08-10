--Services

local LocalizationService = game:GetService("LocalizationService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Players = game:GetService("Players")
local ContentProvider = game:GetService("ContentProvider")

--local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
--local RunService = game:GetService("RunService")

--Defaults

ReplicatedFirst:RemoveDefaultLoadingScreen()
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)


--ScriptDefaults

--local Event = ReplicatedStorage.RemoteEvent
--local Player = Players.LocalPlayer
--local Mouse = Player:GetMouse()

--ZIndex/LayoutOrder

--Loading Screen
local LSFOrder = 100
local LBBOrder = 150
local LBOrder = 200
local LBTOrder = 300

--Start Screen


--Screen GUI
local ScreenGUI = Instance.new("ScreenGui")
ScreenGUI.Parent = script.Parent.Parent.PlayerGui
ScreenGUI.Name = "GUI"
ScreenGUI.Enabled = true
ScreenGUI.IgnoreGuiInset = true
ScreenGUI.ResetOnSpawn = false

--LoadingScreenFrame

local LoadingScreenFrame = Instance.new("Frame")
LoadingScreenFrame.Parent = ScreenGUI
LoadingScreenFrame.Name = "StartScreenFrame"
LoadingScreenFrame.BackgroundTransparency = 0
LoadingScreenFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LoadingScreenFrame.Position = UDim2.new(
	0,
	0,
	0,
	0
)
LoadingScreenFrame.Size = UDim2.new(1,0,1,0)
LoadingScreenFrame.LayoutOrder = LSFOrder
LoadingScreenFrame.ZIndex = LSFOrder

local LB_XSIZE = 300
local LB_YSIZE = 50

--LoadingBarBackground

local LoadingBarBackground = Instance.new("Frame")
LoadingBarBackground.Parent = LoadingScreenFrame
LoadingBarBackground.Name = "LoadingBarBackground"
LoadingBarBackground.BackgroundTransparency = 0
LoadingBarBackground.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
LoadingBarBackground.LayoutOrder = LBBOrder
LoadingBarBackground.ZIndex = LBBOrder
LoadingBarBackground.Size= UDim2.new(
	0,
	LB_XSIZE,
	0,
	LB_YSIZE
)

LoadingBarBackground.Position = UDim2.new(
    0.5,
	-LB_XSIZE/2,
	0.75,
	-LB_YSIZE/2
)

local LBB_UICorner = Instance.new("UICorner")
LBB_UICorner.Parent = LoadingBarBackground
LBB_UICorner.Name = "LBB_UICorner"
LBB_UICorner.CornerRadius = UDim.new(0,10)

local LoadingBar = Instance.new("Frame")
LoadingBar.Parent = LoadingScreenFrame
LoadingBar.Name = "LoadingBar"
LoadingBar.BackgroundTransparency = 0
LoadingBar.BackgroundColor3 = Color3.fromRGB(0, 90, 207)
LoadingBar.LayoutOrder = LBOrder
LoadingBar.ZIndex = LBOrder
LoadingBar.Size= UDim2.new(
	0,
	LB_XSIZE,
	0,
	LB_YSIZE
)

LoadingBar.Position = UDim2.new(
    0.5,
	-LB_XSIZE/2,
	0.75,
	-LB_YSIZE/2
)

local LB_UICorner = Instance.new("UICorner")
LB_UICorner.Parent = LoadingBar
LB_UICorner.Name = "LB_UICorner"
LB_UICorner.CornerRadius = UDim.new(0,10)

--Progress Text



local LBText = Instance.new("TextLabel")
LBText.Parent = LoadingBar
LBText.Name = "ProgressText"
LBText.ZIndex = LBTOrder
LBText.LayoutOrder = LBTOrder
LBText.Text = "Filler Text"
LBText.TextSize = 30
LBText.BackgroundTransparency = 0

LBText.Position = UDim2.new(
	0.5,
	-LB_XSIZE/2,
	0.75,
	-LB_YSIZE/2
)

--StartScreenFrame

local SSFrame = Instance.new("Frame")
SSFrame.Parent = ScreenGUI
SSFrame.Name = "StartScreenFrame"
SSFrame.BackgroundTransparency = 0
SSFrame.Position = UDim2.new(
	0,
	0,
	0,
	0
)
SSFrame.Size = UDim2.new(1,0,1,0)
SSFrame.LayoutOrder = 0
SSFrame.ZIndex = 0

--Button

local BUTTON_XSIZE = 300
local BUTTON_YSIZE = 60

local Button = Instance.new("TextButton")
Button.Parent = SSFrame
Button.Name = "StartButton"
Button.ZIndex= 0
Button.LayoutOrder = 0
Button.Text = "Start"
Button.TextSize = 50
Button.Font = Enum.Font.SourceSansBold
Button.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
Button.Size = UDim2.new(0,BUTTON_XSIZE,0,BUTTON_YSIZE)

Button.Position = UDim2.new(		--Button.Position
	0.5,  							--xScale
	-BUTTON_XSIZE/2,				--xOffset
	1.1,							--yScale
	-BUTTON_YSIZE/2					--yOffset
)

local ButtonUICorner = Instance.new("UICorner")
ButtonUICorner.Parent = Button
ButtonUICorner.Name = "ButtonUICorner"
ButtonUICorner.CornerRadius = UDim.new(0,10)

--Button Shadow

local ButtonShadow = Instance.new("Frame")
ButtonShadow.Parent = SSFrame
ButtonShadow.Name = "StartButtonShadow"
ButtonShadow.BackgroundColor3=Color3.fromRGB(84,84,84)
ButtonShadow.BackgroundTransparency = 0
ButtonShadow.ZIndex = -100
ButtonShadow.LayoutOrder = -100
ButtonShadow.Size = UDim2.new(0,BUTTON_XSIZE,0,BUTTON_YSIZE)

ButtonShadow.Position = UDim2.new(	--ButtonShadow.Position
	0.5,  							--xScale
	-BUTTON_XSIZE/2,				--xOffset
	1.1,							--yScale
	-BUTTON_YSIZE/2+7				--yOffset
)

local ButtonShadowUICorner = Instance.new("UICorner")
ButtonShadowUICorner.Parent = ButtonShadow
ButtonShadowUICorner.Name = "ButtonShadowUICorner"
ButtonShadowUICorner.CornerRadius = UDim.new(0,10)


--Runtime
print("Reached Runtime")
Players.LocalPlayer.CharacterAdded:Wait()
print("LoadedPlayer")



--Loading Screen

local assets = workspace:GetDescendants()
local totalassets = #assets
local currentasset = 0

for i = 1, #assets do
	currentasset = i
	local asset = assets[i]
	ContentProvider:PreloadAsync({asset})
	local progress = i / #assets
	LoadingBar:TweenSize(
		UDim2.new(
			0,
			progress*LB_XSIZE,
			0,
			LB_YSIZE
		),
		Enum.EasingDirection.In,
		Enum.EasingStyle.Sine,
		.1,
		true
	)
end


Button:TweenPosition(UDim2.new(
	0.5,  				--xScale
	-BUTTON_XSIZE/2,	--xOffset
	0.5,				--yScale
	-BUTTON_YSIZE/2		--yOffset
	),
	Enum.EasingDirection.Out,
	Enum.EasingStyle.Elastic,
	2
)
ButtonShadow:TweenPosition(UDim2.new(
	0.5,  				--xScale
	-BUTTON_XSIZE/2,	--xOffset
	0.5,				--yScale
	-BUTTON_YSIZE/2+7	--yOffset
	),
	Enum.EasingDirection.Out,
	Enum.EasingStyle.Elastic,
	2
)








Button.Activated:Connect(function()
	Button:TweenPosition(UDim2.new(
		0.5,  				--xScale
		-BUTTON_XSIZE/2,	--xOffset
		0,				--yScale
		-BUTTON_YSIZE-7		--yOffset
		),
		Enum.EasingDirection.In,
		Enum.EasingStyle.Elastic,
		0.5,
		true
	)
	ButtonShadow:TweenPosition(UDim2.new(
		0.5,  				--xScale
		-BUTTON_XSIZE/2,	--xOffset
		0,				--yScale
		-BUTTON_YSIZE	--yOffset
		),
		Enum.EasingDirection.In,
		Enum.EasingStyle.Elastic,
		0.5,
		true
	)
	task.wait(0.5)
	ButtonShadow.Visible = false
	Button.Visible = false
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
	print("End")
end)

