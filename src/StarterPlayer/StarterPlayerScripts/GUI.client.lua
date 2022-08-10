--Services

local LocalizationService = game:GetService("LocalizationService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Players = game:GetService("Players")
local ContentProvider = game:GetService("ContentProvider")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

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

--Game GUI
local GFOrder = 8500
local MOrder = 9500
local HBOrder = 9750
local HBFOrder = 9500
local HBBOrder = 9000

local EBOrder = 9500
local EBBOrder = 9000
--Start Screen
local SSFOrder = 10000
local SSBSOrder = 10500
local SSBOrder = 11000

--Loading Screen
local LSFOrder = 11500
local LBBOrder = 12000
local LBOrder = 12500
local LBTOrder = 13000



--Screen GUI
local ScreenGUI = Instance.new("ScreenGui")
ScreenGUI.Parent = script.Parent.Parent.PlayerGui
ScreenGUI.Name = "GUI"
ScreenGUI.Enabled = true
ScreenGUI.IgnoreGuiInset = true
ScreenGUI.ResetOnSpawn = false

--LoadingScreenFrame

local LSFrame = Instance.new("Frame")
LSFrame.Parent = ScreenGUI
LSFrame.Name = "LoadingScreenFrame"
LSFrame.BackgroundTransparency = 0
LSFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LSFrame.Position = UDim2.new(
	0,
	0,
	0,
	0
)
LSFrame.Size = UDim2.new(1,0,1,0)
LSFrame.LayoutOrder = LSFOrder
LSFrame.ZIndex = LSFOrder

local LB_XSIZE = 300
local LB_YSIZE = 50

--LoadingBarBackground

local LoadingBarBackground = Instance.new("Frame")
LoadingBarBackground.Parent = LSFrame
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
LoadingBar.Parent = LSFrame
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
LBText.TextSize = 50
LBText.Font = Enum.Font.SourceSansBold
LBText.BackgroundTransparency = 1
LBText.Size = UDim2.new(
	0,
	LB_XSIZE,
	0,
	LB_YSIZE
)
LBText.Position = UDim2.new(
	0.5,
	-LB_XSIZE/2,
	0.75,
	-LB_YSIZE/2-15
)
local LBT_UICorner = Instance.new("UICorner")
LBT_UICorner.Parent = LBText
LBT_UICorner.Name = "LB_UICorner"
LBT_UICorner.CornerRadius = UDim.new(0,10)


--StartScreenFrame

local SSFrame = Instance.new("Frame")
SSFrame.Parent = ScreenGUI
SSFrame.Name = "StartScreenFrame"
SSFrame.BackgroundTransparency = 1
SSFrame.Position = UDim2.new(
	0,
	0,
	0,
	0
)
SSFrame.Size = UDim2.new(1,0,1,0)
SSFrame.LayoutOrder = SSFOrder
SSFrame.ZIndex = SSFOrder

--Button

local BUTTON_XSIZE = 300
local BUTTON_YSIZE = 60

local StartButton = Instance.new("TextButton")
StartButton.Parent = SSFrame
StartButton.Name = "StartButton"
StartButton.ZIndex= SSBOrder
StartButton.LayoutOrder = SSBOrder
StartButton.Text = "Start"
StartButton.TextSize = 50
StartButton.Font = Enum.Font.SourceSansBold
StartButton.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
StartButton.Size = UDim2.new(0,BUTTON_XSIZE,0,BUTTON_YSIZE)

StartButton.Position = UDim2.new(	--Button.Position
	0.5,  							--xScale
	-BUTTON_XSIZE/2,				--xOffset
	1.1,							--yScale
	-BUTTON_YSIZE/2					--yOffset
)

local ButtonUICorner = Instance.new("UICorner")
ButtonUICorner.Parent = StartButton
ButtonUICorner.Name = "ButtonUICorner"
ButtonUICorner.CornerRadius = UDim.new(0,10)

--Button Shadow

local SBShadow = Instance.new("Frame")
SBShadow.Parent = SSFrame
SBShadow.Name = "SBShadow"
SBShadow.BackgroundColor3=Color3.fromRGB(84,84,84)
SBShadow.BackgroundTransparency = 0
SBShadow.ZIndex = SSBSOrder
SBShadow.LayoutOrder = SSBSOrder
SBShadow.Size = UDim2.new(0,BUTTON_XSIZE,0,BUTTON_YSIZE)

SBShadow.Position = UDim2.new(		--SBShadow.Position
	0.5,  							--xScale
	-BUTTON_XSIZE/2,				--xOffset
	1.1,							--yScale
	-BUTTON_YSIZE/2+7				--yOffset
)

local ButtonShadowUICorner = Instance.new("UICorner")
ButtonShadowUICorner.Parent = SBShadow
ButtonShadowUICorner.Name = "ButtonShadowUICorner"
ButtonShadowUICorner.CornerRadius = UDim.new(0,10)


--GameFrame
local GameFrame = Instance.new("Frame")
GameFrame.Parent = ScreenGUI
GameFrame.Name = "GameFrame"
GameFrame.BackgroundTransparency = 1
GameFrame.ZIndex = GFOrder
GameFrame.LayoutOrder = GFOrder

GameFrame.Size = UDim2.new(
	1,
	0,
	1,
	0
)

GameFrame.Position = UDim2.new(
	0,
	0,
	0,
	0
)

local HB_XSIZE = 300
local HB_YSIZE = 20

local HealthBarFrame = Instance.new("Frame")
HealthBarFrame.Parent = GameFrame
HealthBarFrame.Name = "HealthBarFrame"
HealthBarFrame.ZIndex = HBFOrder
HealthBarFrame.LayoutOrder = HBFOrder
HealthBarFrame.BackgroundColor3 = Color3.fromRGB(84,84,84)
HealthBarFrame.BackgroundTransparency = 1
HealthBarFrame.Size = UDim2.new(
	0,
	HB_XSIZE,
	0,
	HB_YSIZE
)
HealthBarFrame.Position = UDim2.new(
	0.5,
	-HB_XSIZE/2,
	0.9,
	HB_YSIZE/2
)

local HB_UICorner = Instance.new("UICorner")
HB_UICorner.Parent = HealthBarFrame
HB_UICorner.Name = "HB_UICorner"
HB_UICorner.CornerRadius = UDim.new(0,20)

local HealthBar = Instance.new("Frame")
HealthBar.Parent = HealthBarFrame
HealthBar.Name = "HealthBar"
HealthBar.ZIndex = HBBOrder
HealthBar.LayoutOrder = HBBOrder
HealthBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HealthBar.BackgroundTransparency = 0
HealthBar.Size = UDim2.new(
	0,
	HB_XSIZE,
	0,
	HB_YSIZE
)
HealthBar.Position = UDim2.new(
	0.5,
	-HB_XSIZE/2,
	0.9,
	HB_YSIZE/2
)

local HBBackground = Instance.new("Frame")
HBBackground.Parent = GameFrame
HBBackground.Name = "HBBackground"
HBBackground.ZIndex = HBOrder
HBBackground.LayoutOrder = HBOrder
HBBackground.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HBBackground.BackgroundTransparency = 0
HBBackground.Size = UDim2.new(
	0,
	HB_XSIZE,
	0,
	HB_YSIZE
)
HBBackground.Position = UDim2.new(
	0.5,
	-HB_XSIZE/2,
	0.9,
	HB_YSIZE/2
)

local HBB_UICorner = Instance.new("UICorner")
HBB_UICorner.Parent = HBBackground
HBB_UICorner.Name = "HBB_UICorner"
HBB_UICorner.CornerRadius = UDim.new(0,20)

--Runtime
print("Reached Runtime")
Players.LocalPlayer.CharacterAdded:Wait()




--Loading Screen

local assets = ReplicatedStorage:GetDescendants()

for i = 1, #assets do
	currentasset = i
	local asset = assets[i]
	ContentProvider:PreloadAsync({asset})
	--print("Loaded: "..tostring(assets[i]))
	local progress = i / #assets
	LBText.Text = tostring(i).."/"..tostring(#assets)
	LoadingBar:TweenSize(
		UDim2.new(
			0,					--xScale
			progress*LB_XSIZE,	--xOffset
			0,					--yscale
			LB_YSIZE			--yOffset
		),
		Enum.EasingDirection.In,
		Enum.EasingStyle.Sine,
		.1,
		true
	)
end

print("\nFinished loading assets\nStarting StartScreenTweens")

--Loading Screen Tween Out
local tweenInfo = TweenInfo.new(
2,							--Time
Enum.EasingStyle.Sine, 		--EasingStyle
Enum.EasingDirection.Out,	--EasingDirection
0,							--Repeat Count
false,						--Reverse
0							--Delay Between Reverses
)
local GUIProperty = {
	BackgroundTransparency = 1
}
local TextProperty = {
	TextTransparency = 1
}
task.wait(0.5)
local LSFTween = TweenService:Create(LSFrame, tweenInfo, GUIProperty)
local LSBTween = TweenService:Create(LoadingBar, tweenInfo, GUIProperty)
local LSBBTween = TweenService:Create(LoadingBarBackground, tweenInfo, GUIProperty)
local LSBTTween = TweenService:Create(LBText, tweenInfo, TextProperty)
LSFTween:Play()
LSBTween:Play()
LSBBTween:Play()
LSBTTween:Play()

local Camera = workspace.CurrentCamera
Camera.CameraType = Enum.CameraType.Scriptable
Camera.CFrame = CFrame.new(0,10,0)
local Connection
Connection = RunService.RenderStepped:Connect(function(deltaTime)
    Camera.CFrame = Camera.CFrame*CFrame.Angles(0,0.005,0)
end)


--Tween Start Button Location
LSFTween.Completed:Connect(function()
	StartButton:TweenPosition(UDim2.new(
	0.5,  				--xScale
	-BUTTON_XSIZE/2,	--xOffset
	0.5,				--yScale
	-BUTTON_YSIZE/2		--yOffset
	),
	Enum.EasingDirection.Out,
	Enum.EasingStyle.Elastic,
	2)

	SBShadow:TweenPosition(UDim2.new(
	0.5,  				--xScale
	-BUTTON_XSIZE/2,	--xOffset
	0.5,				--yScale
	-BUTTON_YSIZE/2+7	--yOffset
	),
	Enum.EasingDirection.Out,
	Enum.EasingStyle.Elastic,
	2
	)
end)



StartButton.Activated:Connect(function()
	StartButton:TweenPosition(UDim2.new(
		0.5,  				--xScale
		-BUTTON_XSIZE/2,	--xOffset
		0,					--yScale
		-BUTTON_YSIZE-7		--yOffset
		),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quad,
		0.5,
		true
	)
	SBShadow:TweenPosition(UDim2.new(
		0.5,  				--xScale
		-BUTTON_XSIZE/2,	--xOffset
		0,					--yScale
		-BUTTON_YSIZE		--yOffset
		),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quad,
		0.5,
		true
	)
	task.wait(0.5)
	SBShadow.Visible = false
	StartButton.Visible = false
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)

	Camera.CameraType = Enum.CameraType.Custom
	Connection:Disconnect()
end)

