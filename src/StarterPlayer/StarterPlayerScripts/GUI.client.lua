--Services

local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Players = game:GetService("Players")
--local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local TweenService = game:GetService("TweenService")
--local StarterGui = game:GetService("StarterGui")
--local RunService = game:GetService("RunService")

--Defaults

ReplicatedFirst:RemoveDefaultLoadingScreen()

--ScriptDefaults

--local Event = ReplicatedStorage.RemoteEvent
--local Player = Players.LocalPlayer
--local Mouse = Player:GetMouse()

--Screen GUI
local ScreenGUI = Instance.new("ScreenGui")
ScreenGUI.Parent = script.Parent.Parent.PlayerGui
ScreenGUI.Name = "GUI"
ScreenGUI.Enabled = true
ScreenGUI.IgnoreGuiInset = true
ScreenGUI.ResetOnSpawn = false

--Frame

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGUI
Frame.Name = "StartScreenFrame"
Frame.BackgroundTransparency = 1
Frame.Size = UDim2.new(1,0,1,0)
Frame.Position = UDim2.new(
	0,
	0,
	0,
	0
)
Frame.LayoutOrder = -100
Frame.ZIndex = -100

--Button

local BUTTON_XSIZE = 300
local BUTTON_YSIZE = 60

local Button = Instance.new("TextButton")
Button.Parent = Frame
Button.Name = "StartButton"
Button.ZIndex= 100
Button.LayoutOrder= 100
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
ButtonShadow.Parent = Frame
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
print("reached Checkpoint")
Players.LocalPlayer.CharacterAdded:Wait()
print("LoadedPlayer")
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


end)

