--Services

--local LocalizationService = game:GetService("LocalizationService")
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
local Player = Players.LocalPlayer
--local Character = Player.Character or Player.CharacterAdded:Wait()
--local Humanoid = Character:WaitForChild("Humanoid")
--local Mouse = Player:GetMouse()

--ZIndex/LayoutOrder

--Game GUI
local GFOrder = 8500
--local MOrder = 9500
local HBOrder = 9750
--local HBFOrder = 9500
local HBBOrder = 9000

--local EBOrder = 9500
--local EBBOrder = 9000
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

local SB_XSIZE = 300
local SB_YSIZE = 60
local SB_XPOS = 0.5
--local SB_YPOS = 60



local StartButton = Instance.new("TextButton")
StartButton.Parent = SSFrame
StartButton.Name = "StartButton"
StartButton.ZIndex= SSBOrder
StartButton.LayoutOrder = SSBOrder
StartButton.Text = "Start"
StartButton.TextSize = 50
StartButton.Font = Enum.Font.SourceSansBold
StartButton.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
StartButton.Size = UDim2.new(0,SB_XSIZE,0,SB_YSIZE)

StartButton.Position = UDim2.new(	--Button.Position
	SB_XPOS,  							--xScale
	-SB_XSIZE/2,				--xOffset
	1.1,							--yScale
	-SB_YSIZE/2					--yOffset
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
SBShadow.Size = UDim2.new(0,SB_XSIZE,0,SB_YSIZE)

SBShadow.Position = UDim2.new(		--SBShadow.Position
	SB_XPOS,  							--xScale
	-SB_XSIZE/2,				--xOffset
	1.1,							--yScale
	-SB_YSIZE/2+7				--yOffset
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





local RMTButton = Instance.new("TextButton")
RMTButton.Name = "RMTButton"
RMTButton.Parent = GameFrame
RMTButton.BackgroundColor3 = Color3.fromRGB(77, 156, 115)
RMTButton.BorderSizePixel = 0
RMTButton.Position = UDim2.new(0.05, 0, 0.5, 0)
RMTButton.Size = UDim2.new(0, 180, 0, 45)
RMTButton.ZIndex = 2
RMTButton.Font = Enum.Font.GothamMedium
RMTButton.Text = ""
RMTButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RMTButton.TextScaled = true
RMTButton.TextSize = 14.000
RMTButton.TextWrapped = true

local RMTB_UICorner = Instance.new("UICorner")
RMTB_UICorner.Parent = RMTButton
RMTB_UICorner.Name = "RMTB_UICorner"
RMTB_UICorner.CornerRadius = UDim.new(0,10)

local RMTShadow = Instance.new("Frame")
RMTShadow.Name = "Shadow"
RMTShadow.Parent = RMTButton
RMTShadow.BackgroundColor3 = Color3.fromRGB(58, 118, 86)
RMTShadow.BorderSizePixel = 0
RMTShadow.Size = UDim2.new(1, 0, 1, 4)

local RMTS_UICorner = Instance.new("UICorner")
RMTS_UICorner.Parent = RMTShadow
RMTS_UICorner.Name = "RMTS_UICorner"
RMTS_UICorner.CornerRadius = UDim.new(0,10)

local RMTTextLabel = Instance.new("TextLabel")
RMTTextLabel.Parent = RMTButton
RMTTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
RMTTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RMTTextLabel.BackgroundTransparency = 1.000
RMTTextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
RMTTextLabel.BorderSizePixel = 0
RMTTextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
RMTTextLabel.Size = UDim2.new(1, -20, 1, -20)
RMTTextLabel.ZIndex = 2
RMTTextLabel.Font = Enum.Font.GothamMedium
RMTTextLabel.Text = "Remove Textures"
RMTTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
RMTTextLabel.TextScaled = true
RMTTextLabel.TextSize = 14.000
RMTTextLabel.TextWrapped = true

local HB_XSIZE = 300
local HB_YSIZE = 20

local HBBackground = Instance.new("Frame")
HBBackground.Parent = GameFrame
HBBackground.Name = "HBBackground"
HBBackground.ZIndex = HBBOrder
HBBackground.LayoutOrder = HBBOrder
HBBackground.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
HBBackground.BackgroundTransparency = 1
HBBackground.Size = UDim2.new(
	0,
	HB_XSIZE,
	0,
	HB_YSIZE
)
HBBackground.Position = UDim2.new(
	0.5,
	-HB_XSIZE/2,
	0.95,
	HB_YSIZE/2
)

local HBB_UICorner = Instance.new("UICorner")
HBB_UICorner.Parent = HBBackground
HBB_UICorner.Name = "HBB_UICorner"
HBB_UICorner.CornerRadius = UDim.new(0.25,0)

local HBLeft = Instance.new("Frame")
HBLeft.Parent = HBBackground
HBLeft.Name = "HBLeft"
HBLeft.ZIndex = HBOrder
HBLeft.LayoutOrder = HBOrder
HBLeft.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HBLeft.BackgroundTransparency = 1
HBLeft.Size = UDim2.new(
	0,
	15,
	0,
	HB_YSIZE
)
HBLeft.Position = UDim2.new(
	0,
	0,
	0,
	0
)

local HBL_UICorner = Instance.new("UICorner")
HBL_UICorner.Parent = HBLeft
HBL_UICorner.Name = "HBL_UICorner"
HBL_UICorner.CornerRadius = UDim.new(0.5,0)

local HBRight = Instance.new("Frame")
HBRight.Parent = HBBackground
HBRight.Name = "HBRight"
HBRight.ZIndex = HBOrder
HBRight.LayoutOrder = HBOrder
HBRight.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HBRight.BackgroundTransparency = 1
HBRight.Size = UDim2.new(
	0,
	HB_XSIZE,
	0,
	HB_YSIZE
)
HBRight.Position = UDim2.new(
	0,
	0,
	0,
	0
)
local HBR_UICorner = Instance.new("UICorner")
HBR_UICorner.Parent = HBRight
HBR_UICorner.Name = "HBR_UICorner"
HBR_UICorner.CornerRadius = UDim.new(0.25,0)

--Runtime
print("Reached Runtime")

--HealthBar

Player.CharacterAdded:Connect(function(character)
	if character then
		HBRight.Size = UDim2.new(
			0,
			HB_XSIZE,
			0,
			HB_YSIZE
		)
		character:WaitForChild("Humanoid").HealthChanged:Connect(function(health)
			if health*HB_XSIZE/100<=15 then 
				HBRight:TweenSize(UDim2.new(
					0,
					15,
					0,
					HB_YSIZE
					),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quad,
					0.25
				)	
			else
				HBRight:TweenSize(UDim2.new(
					0,
					health*HB_XSIZE/100,
					0,
					HB_YSIZE
					),
					Enum.EasingDirection.Out,
					Enum.EasingStyle.Quad,
					0.25
				)
			end
			
			print("Tweened Size")
		end)
	end
end)

--Loading Screen

local assets = ReplicatedStorage:GetDescendants()



for i = 1, #assets do
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
local TransparentBackground = {
	BackgroundTransparency = 1
}
local TransparentText = {
	TextTransparency = 1
}
local OpaqueBackground = {
	BackgroundTransparency = 0
}
--[[local OpaqueText = {
	TextTransparency = 0
}]]

task.wait(0.5)
local LSFTween = TweenService:Create(LSFrame, tweenInfo, TransparentBackground)
local LSBTween = TweenService:Create(LoadingBar, tweenInfo, TransparentBackground)
local LSBBTween = TweenService:Create(LoadingBarBackground, tweenInfo, TransparentBackground)
local LSBTTween = TweenService:Create(LBText, tweenInfo, TransparentText)
LSFTween:Play()
LSBTween:Play()
LSBBTween:Play()
LSBTTween:Play()

local Camera = workspace.CurrentCamera
Camera.CameraType = Enum.CameraType.Scriptable
Camera.CFrame = CFrame.new(0,10,0)
local Connection
Connection = RunService.RenderStepped:Connect(function(DeltaTime)
    Camera.CFrame = Camera.CFrame*CFrame.Angles(0,0.005*(DeltaTime*60),0)
end)


--Tween Start Button Location
LSFTween.Completed:Connect(function()
	StartButton:TweenPosition(UDim2.new(
		SB_XPOS,  				--xScale
		-SB_XSIZE/2,	--xOffset
		0.5,				--yScale
		-SB_YSIZE/2		--yOffset
		),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Elastic,
		2
	)



	SBShadow:TweenPosition(UDim2.new(
		SB_XPOS,  				--xScale
		-SB_XSIZE/2,	--xOffset
		0.5,				--yScale
		-SB_YSIZE/2+7	--yOffset
		),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Elastic,
		2
	)
end)


local HBBInfo = {
	BackgroundTransparency = 0,
	Position = UDim2.new(
		0.5,
		-HB_XSIZE/2,
		0.90,
		HB_YSIZE/2
	)
}

StartButton.Activated:Connect(function()
	StartButton:TweenPosition(UDim2.new(
		SB_XPOS,  				--xScale
		-SB_XSIZE/2,	--xOffset
		0,					--yScale
		-SB_YSIZE-7		--yOffset
		),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quad,
		0.5,
		true
	)
	SBShadow:TweenPosition(UDim2.new(
		SB_XPOS,  				--xScale
		-SB_XSIZE/2,	--xOffset
		0,					--yScale
		-SB_YSIZE		--yOffset
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

	local HBBTween = TweenService:Create(HBBackground, tweenInfo, HBBInfo)
	local HBRightTween = TweenService:Create(HBRight, tweenInfo, OpaqueBackground)
	local HBLeftTween = TweenService:Create(HBLeft, tweenInfo, OpaqueBackground)
	HBBTween:Play()
	HBRightTween:Play()
	HBRightTween.Completed:Connect(function()
		HBLeftTween:Play()
	end)
end)


RMTButton.Activated:Connect(function()
	for _,v in pairs(workspace:GetDescendants()) do
		if v:IsA("Part") then
			v.Material = Enum.Material.SmoothPlastic
		end
	end
end)


--[[
	Cutscene Example

local data = {{CFrame = CFrame.new(7.24662495, 49.8838158, 122.809601, -0.998124301, 0.00225036126, 0.0611790381, -0, 0.999324203, -0.0367583483, -0.0612204149, -0.0366894007, -0.997449756);Seconds = 2;Style = Enum.EasingStyle.Back},{CFrame = CFrame.new(55.0575294, 102.970627, -54.8986664, -0.600295603, -0.254995555, 0.75803864, -0, 0.947811007, 0.318832844, -0.799778223, 0.191393957, -0.568966746);Seconds = 2;Style = Enum.EasingStyle.Back}}

repeat
	task.wait()
	Camera.CameraType = Enum.CameraType.Scriptable
until Camera.CameraType == Enum.CameraType.Scriptable
for _,v in pairs(data) do
	TweenService:Create(
		Camera,
		TweenInfo.new(
			v.Seconds,
			v.Style,
			Enum.EasingDirection.Out,
			0,
			false,
			0
		),
		{CFrame = v.CFrame}
	):Play()
	task.wait(v.Seconds)
end
Camera.CameraType = Enum.CameraType.Custom]]