--Services

--local LocalizationService = game:GetService("LocalizationService")
--local GuiService = game:GetService("GuiService")
local Lighting = game:GetService("Lighting")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Players = game:GetService("Players")
local ContentProvider = game:GetService("ContentProvider")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local DraggableObject = require(ReplicatedStorage.Common.DraggableObject)
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

--GUI Buttons
local GUIBBOrder = 20000
local GUIBOrder = 20010
local GUIButtonOrder = 20020
local GUIImageOrder = 20030

--Settings
local SFOrder = 10000
local SFTOrder = 10003
local SFBOrder = 10002
local SFSOrder = 10001
local SFBackOrder = 9999

--Quests
local QFOrder = 15000
local QFTOrder = 15003
local QFBOrder = 15002
local QFSOrder = 15001
local QFBackOrder = 14999

local IFOrder = 17500
local IFTOrder = 17503
local IFBOrder = 17502
local IFSOrder = 17501
local IFBackOrder = 17499
--Game Frame

local GFOrder = 8500

--Money
--local MOrder = 9500

--Health Bar

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
--local LBTOrder = 13000

--Screen GUI

local ScreenGUI = Instance.new("ScreenGui")
ScreenGUI.Name = "GUI"
ScreenGUI.Enabled = true
ScreenGUI.IgnoreGuiInset = true
ScreenGUI.ResetOnSpawn = false
ScreenGUI.Parent = Player.PlayerGui

--LoadingScreenFrame

local LSFrame = Instance.new("Frame")
LSFrame.BackgroundTransparency = 0
LSFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LSFrame.Position = UDim2.new(0, 0, 0, 0)
LSFrame.Size = UDim2.new(1, 0, 1, 0)
LSFrame.LayoutOrder = LSFOrder
LSFrame.ZIndex = LSFOrder
LSFrame.Parent = ScreenGUI

local LB_XSIZE = 300
local LB_YSIZE = 50

--Loading Bar

local LoadingBarBackground = Instance.new("Frame")
LoadingBarBackground.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingBarBackground.BackgroundTransparency = 0
LoadingBarBackground.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
LoadingBarBackground.LayoutOrder = LBBOrder
LoadingBarBackground.ZIndex = LBBOrder
LoadingBarBackground.Size = UDim2.new(0, LB_XSIZE, 0, LB_YSIZE)
LoadingBarBackground.Position = UDim2.new(0.5, 0, 0.75, 0)
LoadingBarBackground.Parent = LSFrame

local LBB_UICorner = Instance.new("UICorner")
LBB_UICorner.CornerRadius = UDim.new(0, 10)
LBB_UICorner.Parent = LoadingBarBackground

local LoadingBar = Instance.new("Frame")
LoadingBar.AnchorPoint = Vector2.new(0, 0.5)
LoadingBar.BackgroundTransparency = 0
LoadingBar.BackgroundColor3 = Color3.fromRGB(0, 90, 207)
LoadingBar.LayoutOrder = LBOrder
LoadingBar.ZIndex = LBOrder
LoadingBar.Size = UDim2.new(0, LB_XSIZE, 0, LB_YSIZE)
LoadingBar.Position = UDim2.new(0, 0, 0.5, 0)
LoadingBar.Parent = LoadingBarBackground

local LB_UICorner = Instance.new("UICorner")
LB_UICorner.CornerRadius = UDim.new(0, 10)
LB_UICorner.Parent = LoadingBar

local LBText = Instance.new("TextLabel")
LBText.AnchorPoint = Vector2.new(0.5, 0.5)
LBText.LayoutOrder = LBOrder
LBText.ZIndex = LBOrder
LBText.Text = "Filler Text"
LBText.TextSize = 50
LBText.Font = Enum.Font.SourceSansBold
LBText.BackgroundTransparency = 1
LBText.Size = UDim2.new(0, LB_XSIZE, 0, LB_YSIZE)
LBText.Position = UDim2.new(0.5, 0, 0.5)
LBText.Parent = LoadingBarBackground

local LBT_UICorner = Instance.new("UICorner")
LBT_UICorner.CornerRadius = UDim.new(0, 10)
LBT_UICorner.Parent = LBText

--Progress Text

--StartScreenFrame

local SSFrame = Instance.new("Frame")
SSFrame.Name = "StartScreenFrame"
SSFrame.BackgroundTransparency = 1
SSFrame.Position = UDim2.new(0, 0, 0, 0)
SSFrame.Size = UDim2.new(1, 0, 1, 0)
SSFrame.LayoutOrder = SSFOrder
SSFrame.ZIndex = SSFOrder
SSFrame.Parent = ScreenGUI

--Start Button

local SB_XSIZE = 300
local SB_YSIZE = 60
--local SB_YPOS = 60

local StartButton = Instance.new("TextButton")
StartButton.Name = "StartButton"
StartButton.ZIndex = SSBOrder
StartButton.LayoutOrder = SSBOrder
StartButton.Text = "Start"
StartButton.TextSize = 50
StartButton.Font = Enum.Font.SourceSansBold
StartButton.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
StartButton.Size = UDim2.new(0, SB_XSIZE, 0, SB_YSIZE)
StartButton.AnchorPoint = Vector2.new(0.5, 0.5)
StartButton.Position = UDim2.new(0.5, 0, 1.1, 0)
StartButton.Parent = SSFrame

local SB_UICorner = Instance.new("UICorner")
SB_UICorner.CornerRadius = UDim.new(0, 10)
SB_UICorner.Parent = StartButton

--Start Button Shadow

local SBShadow = Instance.new("Frame")
SBShadow.AnchorPoint = Vector2.new(0.5, 0.5)
SBShadow.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
SBShadow.BackgroundTransparency = 0
SBShadow.ZIndex = SSBSOrder
SBShadow.LayoutOrder = SSBSOrder
SBShadow.Size = UDim2.new(0, SB_XSIZE, 0, SB_YSIZE)
SBShadow.Position = UDim2.new(0.5, 0, 0.5, 5)
SBShadow.Parent = StartButton

local SBS_UICorner = Instance.new("UICorner")
SBS_UICorner.CornerRadius = UDim.new(0, 10)
SBS_UICorner.Parent = SBShadow

--Credits Button

local CreditButton = Instance.new("TextButton")
CreditButton.ZIndex = SSBOrder
CreditButton.LayoutOrder = SSBOrder
CreditButton.Text = "Credits"
CreditButton.TextSize = 50
CreditButton.Font = Enum.Font.SourceSansBold
CreditButton.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
CreditButton.Size = UDim2.new(0, SB_XSIZE, 0, SB_YSIZE)
CreditButton.AnchorPoint = Vector2.new(0.5, 0.5)
CreditButton.Position = UDim2.new(0.5, 0, 1.25, 0)
CreditButton.Parent = SSFrame

local CB_UICorner = Instance.new("UICorner")
CB_UICorner.CornerRadius = UDim.new(0, 10)
CB_UICorner.Parent = CreditButton

--Credits Button Shadow

local CBShadow = Instance.new("Frame")
CBShadow.AnchorPoint = Vector2.new(0.5, 0.5)
CBShadow.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
CBShadow.BackgroundTransparency = 0
CBShadow.ZIndex = SSBSOrder
CBShadow.LayoutOrder = SSBSOrder
CBShadow.Size = UDim2.new(0, SB_XSIZE, 0, SB_YSIZE)
CBShadow.Position = UDim2.new(0.5, 0, 0.5, 5)
CBShadow.Parent = CreditButton

local CBS_UICorner = Instance.new("UICorner")
CBS_UICorner.CornerRadius = UDim.new(0, 10)
CBS_UICorner.Parent = CBShadow

--GameFrame
local GameFrame = Instance.new("Frame")
GameFrame.Name = "GameFrame"
GameFrame.BackgroundTransparency = 1
GameFrame.ZIndex = GFOrder
GameFrame.LayoutOrder = GFOrder
GameFrame.Size = UDim2.new(1, 0, 1, 0)
GameFrame.Position = UDim2.new(0, 0, 0, 0)
GameFrame.Parent = ScreenGUI

--GUI Button Frame TRANSPARENT TO START

local GUIBB_XSIZE = 400
local GUIBB_YSIZE = 80

local GUIBBFrame = Instance.new("Frame")
GUIBBFrame.AnchorPoint = Vector2.new(0.5, 0.5)
GUIBBFrame.Visible = false
GUIBBFrame.BackgroundTransparency = 1
GUIBBFrame.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
GUIBBFrame.ZIndex = GUIBBOrder
GUIBBFrame.LayoutOrder = GUIBBOrder
GUIBBFrame.Size = UDim2.new(0, GUIBB_XSIZE, 0, GUIBB_YSIZE)
GUIBBFrame.Position = UDim2.new(0.85, 0 - 20, 0.9, 0)
GUIBBFrame.Parent = GameFrame

local GUIBB_UICorner = Instance.new("UICorner")
GUIBB_UICorner.CornerRadius = UDim.new(1, 0)
GUIBB_UICorner.Parent = GUIBBFrame

local GUIBBDrag = DraggableObject.new(GUIBBFrame)
GUIBBDrag:Enable()

local GUIBFrame = Instance.new("Frame")
GUIBFrame.BackgroundTransparency = 1
GUIBFrame.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
GUIBFrame.ZIndex = GUIBOrder
GUIBFrame.LayoutOrder = GUIBOrder
GUIBFrame.AnchorPoint = Vector2.new(0.5, 0.5)
GUIBFrame.Size = UDim2.new(0, GUIBB_XSIZE - 20, 0, GUIBB_YSIZE - 20)
GUIBFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
GUIBFrame.Parent = GUIBBFrame

local GUIB_UICorner = Instance.new("UICorner")
GUIB_UICorner.CornerRadius = UDim.new(1, 0)
GUIB_UICorner.Parent = GUIBFrame

--GUI Buttons

local GUIBListLayout = Instance.new("UIListLayout")
GUIBListLayout.Padding = UDim.new(0, 10)
GUIBListLayout.FillDirection = Enum.FillDirection.Horizontal
GUIBListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
GUIBListLayout.Parent = GUIBFrame

local GUIBPadding = Instance.new("UIPadding")
GUIBPadding.PaddingLeft = UDim.new(0, 10)
GUIBPadding.Parent = GUIBFrame
--Transparent start

local SettingButton = Instance.new("ImageButton")
SettingButton.AnchorPoint = Vector2.new(0.5, 0.5)
SettingButton.ZIndex = GUIButtonOrder
SettingButton.LayoutOrder = GUIButtonOrder
SettingButton.BackgroundColor3 = Color3.fromRGB(83, 83, 83)
--SettingButton.Position = UDim2.new(0, GUIBB_YSIZE - 44, 0.5, 0)
SettingButton.Size = UDim2.new(0, GUIBB_YSIZE - 20, 0, GUIBB_YSIZE - 30)
SettingButton.Image = "rbxassetid://10550379079"
SettingButton.ImageTransparency = 1
SettingButton.Parent = GUIBFrame

local QuestB_UICorners = Instance.new("UICorner")
QuestB_UICorners.CornerRadius = UDim.new(1, 0)
QuestB_UICorners.Parent = SettingButton

--Transparent start

local SettingImage = Instance.new("ImageLabel")
SettingImage.AnchorPoint = Vector2.new(0.5, 0.5)
SettingImage.ZIndex = GUIImageOrder
SettingImage.LayoutOrder = GUIImageOrder
SettingImage.BackgroundTransparency = 1
SettingImage.ImageTransparency = 1
SettingImage.Position = UDim2.new(0.5, 0, 0.5, 0)
SettingImage.Size = UDim2.new(0, GUIBB_YSIZE - 50, 0, GUIBB_YSIZE - 50)
SettingImage.Image = "rbxassetid://10572640817"
SettingImage.Parent = SettingButton

local QuestButton = Instance.new("ImageButton")
QuestButton.AnchorPoint = Vector2.new(0.5, 0.5)
QuestButton.ZIndex = GUIButtonOrder
QuestButton.LayoutOrder = GUIButtonOrder
QuestButton.BackgroundColor3 = Color3.fromRGB(83, 83, 83)
--QuestButton.Position = UDim2.new(0, GUIBB_YSIZE, 0.5, 0)
QuestButton.Size = UDim2.new(0, GUIBB_YSIZE - 20, 0, GUIBB_YSIZE - 30)
QuestButton.Image = "rbxassetid://10550379079"
QuestButton.ImageTransparency = 1
QuestButton.Parent = GUIBFrame

local QB_UICorners = Instance.new("UICorner")
QB_UICorners.CornerRadius = UDim.new(1, 0)
QB_UICorners.Parent = QuestButton

--Transparent start

local QuestImage = Instance.new("ImageLabel")
QuestImage.AnchorPoint = Vector2.new(0.5, 0.5)
QuestImage.ZIndex = GUIImageOrder
QuestImage.LayoutOrder = GUIImageOrder
QuestImage.BackgroundTransparency = 1
QuestImage.Position = UDim2.new(0.5, 0, 0.5, 0)
QuestImage.Size = UDim2.new(0, GUIBB_YSIZE - 50, 0, GUIBB_YSIZE - 50)
QuestImage.Image = "rbxassetid://10596687853"
QuestImage.ImageColor3 = Color3.fromRGB(51, 51, 51)
QuestImage.ImageTransparency = 1
QuestImage.Parent = QuestButton

local InventoryButton = Instance.new("ImageButton")
InventoryButton.AnchorPoint = Vector2.new(0.5, 0.5)
InventoryButton.ZIndex = GUIButtonOrder
InventoryButton.LayoutOrder = GUIButtonOrder
InventoryButton.BackgroundColor3 = Color3.fromRGB(83, 83, 83)
InventoryButton.Size = UDim2.new(0, GUIBB_YSIZE - 20, 0, GUIBB_YSIZE - 30)
InventoryButton.Image = "rbxassetid://10550379079"
InventoryButton.ImageTransparency = 1
InventoryButton.Parent = GUIBFrame

local IB_UICorners = Instance.new("UICorner")
IB_UICorners.CornerRadius = UDim.new(1, 0)
IB_UICorners.Parent = InventoryButton

--Transparent start

local InventoryImage = Instance.new("ImageLabel")
InventoryImage.AnchorPoint = Vector2.new(0.5, 0.5)
InventoryImage.ZIndex = GUIImageOrder
InventoryImage.LayoutOrder = GUIImageOrder
InventoryImage.BackgroundTransparency = 1
InventoryImage.Position = UDim2.new(0.5, 0, 0.5, 0)
InventoryImage.Size = UDim2.new(0, GUIBB_YSIZE - 50, 0, GUIBB_YSIZE - 43)
InventoryImage.Image = "rbxassetid://10596808400"
InventoryImage.ImageColor3 = Color3.fromRGB(51, 51, 51)
InventoryImage.ImageTransparency = 1
InventoryImage.Parent = InventoryButton

--Settings Frame

local SFB_XSIZE = 0.2
local SFB_YSIZE = 0.8

--local SFBackTransparency = 0
--local SFrameTransparency = 0.1
local SFBackground = Instance.new("Frame")
SFBackground.BackgroundTransparency = 1
SFBackground.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
SFBackground.AnchorPoint = Vector2.new(0.5, 0.5)
SFBackground.ZIndex = SFBackOrder
SFBackground.LayoutOrder = SFBackOrder
SFBackground.Visible = false
SFBackground.Size = UDim2.new(SFB_XSIZE, 0, SFB_YSIZE, 0)
SFBackground.Position = UDim2.new(0.15, 0, 0.5, 0)
SFBackground.Parent = GameFrame
local DraggableFrame = DraggableObject.new(SFBackground)
DraggableFrame:Enable()

local SFB_UICorner = Instance.new("UICorner")
SFB_UICorner.CornerRadius = UDim.new(0, 20)
SFB_UICorner.Parent = SFBackground

local SettingFrame = Instance.new("Frame")
SettingFrame.BackgroundTransparency = 1
SettingFrame.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
SettingFrame.ZIndex = SFOrder
SettingFrame.LayoutOrder = SFOrder
SettingFrame.AnchorPoint = Vector2.new(0.5, 0)
SettingFrame.Size = UDim2.new(1, -20, 1, -80)
SettingFrame.Position = UDim2.new(0.5, 0, 0, 70)
SettingFrame.Parent = SFBackground

local SF_UICorner = Instance.new("UICorner")
SF_UICorner.CornerRadius = UDim.new(0, 18)
SF_UICorner.Parent = SettingFrame

local SFHeader = Instance.new("TextLabel")
SFHeader.BackgroundTransparency = 1
SFHeader.TextTransparency = 1
SFHeader.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
SFHeader.ZIndex = SFBOrder
SFHeader.LayoutOrder = SFBOrder
SFHeader.TextXAlignment = Enum.TextXAlignment.Center
SFHeader.Font = Enum.Font.SourceSansBold
SFHeader.TextSize = 50
SFHeader.Text = "Settings"
SFHeader.AnchorPoint = Vector2.new(0.5, 0)
SFHeader.Size = UDim2.new(1, -20, 0, 50)
SFHeader.Position = UDim2.new(0.5, 0, 0, 10)
SFHeader.Parent = SFBackground

local SFH_UICorner = Instance.new("UICorner")
SFH_UICorner.CornerRadius = UDim.new(0, 18)
SFH_UICorner.Parent = SFHeader

local SF_ListLayout = Instance.new("UIListLayout")
SF_ListLayout.Padding = UDim.new(0, 20)
SF_ListLayout.FillDirection = Enum.FillDirection.Vertical
SF_ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SF_ListLayout.Parent = SettingFrame

local SF_Padding = Instance.new("UIPadding")
SF_Padding.PaddingTop = UDim.new(0.1, 0)
SF_Padding.Parent = SettingFrame

--Remove Textures Button

local RMTButton = Instance.new("TextButton")
RMTButton.AnchorPoint = Vector2.new(0.5, 0.5)
RMTButton.BackgroundColor3 = Color3.fromRGB(77, 156, 115)
RMTButton.BorderSizePixel = 0
--RMTButton.Position = UDim2.new(0.5, 0, 0.3, 0)
RMTButton.Size = UDim2.new(1, -100, 0, 45)
RMTButton.ZIndex = SFBOrder
RMTButton.LayoutOrder = SFBOrder
RMTButton.Font = Enum.Font.GothamMedium
RMTButton.Text = "Remove Textures"
RMTButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RMTButton.TextScaled = true
RMTButton.TextSize = 12.000
RMTButton.TextWrapped = true
RMTButton.Parent = SettingFrame

local RMTB_UICorner = Instance.new("UICorner")
RMTB_UICorner.CornerRadius = UDim.new(0, 10)
RMTB_UICorner.Parent = RMTButton

local RMTShadow = Instance.new("Frame")
RMTShadow.BackgroundColor3 = Color3.fromRGB(58, 118, 86)
RMTShadow.BorderSizePixel = 0
RMTShadow.LayoutOrder = SFSOrder
RMTShadow.ZIndex = SFSOrder
RMTShadow.Size = UDim2.new(1, 0, 1, 0)
RMTShadow.Position = UDim2.new(0, 0, 0, 4)
RMTShadow.Parent = RMTButton

local RMTS_UICorner = Instance.new("UICorner")
RMTS_UICorner.CornerRadius = UDim.new(0, 10)
RMTS_UICorner.Parent = RMTShadow

--Remove Shadows Button

local RMSButton = Instance.new("TextButton")
RMSButton.AnchorPoint = Vector2.new(0.5, 0.5)
RMSButton.BackgroundColor3 = Color3.fromRGB(77, 156, 115)
RMSButton.BorderSizePixel = 0
RMSButton.Size = UDim2.new(1, -100, 0, 45)
RMSButton.ZIndex = SFBOrder
RMSButton.LayoutOrder = SFBOrder
RMSButton.Font = Enum.Font.GothamMedium
RMSButton.Text = "Toggle Shadows"
RMSButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RMSButton.TextScaled = true
RMSButton.TextSize = 12.000
RMSButton.TextWrapped = true
RMSButton.Parent = SettingFrame

local RMSB_UICorner = Instance.new("UICorner")
RMSB_UICorner.CornerRadius = UDim.new(0, 10)
RMSB_UICorner.Parent = RMSButton

local RMSShadow = Instance.new("Frame")
RMSShadow.BackgroundColor3 = Color3.fromRGB(58, 118, 86)
RMSShadow.BorderSizePixel = 0
RMSShadow.ZIndex = SFSOrder
RMSShadow.LayoutOrder = SFSOrder
RMSShadow.Size = UDim2.new(1, 0, 1, 4)
RMSShadow.Parent = RMSButton

local RMSS_UICorner = Instance.new("UICorner")
RMSS_UICorner.CornerRadius = UDim.new(0, 10)
RMSS_UICorner.Parent = RMSShadow

--Quest Frame

local QFB_XSIZE = 0.25
local QFB_YSIZE = 0.7

local QFBackground = Instance.new("Frame")
QFBackground.BackgroundTransparency = 1
QFBackground.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
QFBackground.AnchorPoint = Vector2.new(0.5, 0.5)
QFBackground.ZIndex = QFBackOrder
QFBackground.LayoutOrder = QFBackOrder
QFBackground.Visible = false
QFBackground.Size = UDim2.new(QFB_XSIZE, 0, QFB_YSIZE, 0)
QFBackground.Position = UDim2.new(1, -260, 0.5, 0)
QFBackground.Parent = GameFrame
local DraggableFrame = DraggableObject.new(QFBackground)
DraggableFrame:Enable()

local QFB_UICorner = Instance.new("UICorner")
QFB_UICorner.CornerRadius = UDim.new(0, 20)
QFB_UICorner.Parent = QFBackground

local QuestFrame = Instance.new("Frame")
QuestFrame.BackgroundTransparency = 1
QuestFrame.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
QuestFrame.ZIndex = QFOrder
QuestFrame.LayoutOrder = QFOrder
QuestFrame.AnchorPoint = Vector2.new(0.5, 0)
QuestFrame.Size = UDim2.new(1, -20, 1, -80)
QuestFrame.Position = UDim2.new(0.5, 0, 0, 70)
QuestFrame.Parent = QFBackground

local QF_UICorner = Instance.new("UICorner")
QF_UICorner.CornerRadius = UDim.new(0, 18)
QF_UICorner.Parent = QuestFrame

local QFHeader = Instance.new("TextLabel")
QFHeader.BackgroundTransparency = 1
QFHeader.TextTransparency = 1
QFHeader.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
QFHeader.ZIndex = QFTOrder
QFHeader.LayoutOrder = QFTOrder
QFHeader.TextXAlignment = Enum.TextXAlignment.Center
QFHeader.Font = Enum.Font.SourceSansBold
QFHeader.TextSize = 50
QFHeader.Text = "Quests"
QFHeader.AnchorPoint = Vector2.new(0.5, 0)
QFHeader.Size = UDim2.new(1, -20, 0, 50)
QFHeader.Position = UDim2.new(0.5, 0, 0, 10)
QFHeader.Parent = QFBackground

local QFH_UICorner = Instance.new("UICorner")
QFH_UICorner.CornerRadius = UDim.new(0, 18)
QFH_UICorner.Parent = QFHeader

local QF_ListLayout = Instance.new("UIListLayout")
QF_ListLayout.Padding = UDim.new(0, 20)
QF_ListLayout.FillDirection = Enum.FillDirection.Vertical
QF_ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
QF_ListLayout.Parent = QuestFrame

local QF_Padding = Instance.new("UIPadding")
QF_Padding.PaddingTop = UDim.new(0, 10)
QF_Padding.Parent = QuestFrame

--Inventory Frame

local IFB_XSIZE = 0.4
local IFB_YSIZE = 0.7

local IFBackground = Instance.new("Frame")
IFBackground.BackgroundTransparency = 1
IFBackground.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
IFBackground.AnchorPoint = Vector2.new(0.5, 0.5)
IFBackground.ZIndex = IFBackOrder
IFBackground.LayoutOrder = IFBackOrder
IFBackground.Visible = false
IFBackground.Size = UDim2.new(IFB_XSIZE, 0, IFB_YSIZE, 0)
IFBackground.Position = UDim2.new(0.478, 0, 0.5, 0)
IFBackground.Parent = GameFrame
local DraggableFrame = DraggableObject.new(IFBackground)
DraggableFrame:Enable()

local IFB_UICorner = Instance.new("UICorner")
IFB_UICorner.CornerRadius = UDim.new(0, 20)
IFB_UICorner.Parent = IFBackground

local InventoryFrame = Instance.new("ScrollingFrame")
InventoryFrame.BackgroundTransparency = 1
InventoryFrame.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
InventoryFrame.ZIndex = IFOrder
InventoryFrame.LayoutOrder = IFOrder
InventoryFrame.AnchorPoint = Vector2.new(0.5, 0)
InventoryFrame.Size = UDim2.new(1, -30, 1, -90)
InventoryFrame.Position = UDim2.new(0.5, 0, 0, 75)
InventoryFrame.Parent = IFBackground

local IF_UICorner = Instance.new("UICorner")
IF_UICorner.CornerRadius = UDim.new(0, 18)
IF_UICorner.Parent = InventoryFrame

local IFHeader = Instance.new("TextLabel")
IFHeader.BackgroundTransparency = 1
IFHeader.TextTransparency = 1
IFHeader.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
IFHeader.ZIndex = IFTOrder
IFHeader.LayoutOrder = IFTOrder
IFHeader.TextXAlignment = Enum.TextXAlignment.Center
IFHeader.Font = Enum.Font.SourceSansBold
IFHeader.TextSize = 50
IFHeader.Text = "Inventory"
IFHeader.AnchorPoint = Vector2.new(0.5, 0)
IFHeader.Size = UDim2.new(1, -20, 0, 50)
IFHeader.Position = UDim2.new(0.5, 0, 0, 10)
IFHeader.Parent = IFBackground

local IFH_UICorner = Instance.new("UICorner")
IFH_UICorner.CornerRadius = UDim.new(0, 18)
IFH_UICorner.Parent = IFHeader

local IF_ListLayout = Instance.new("UIListLayout")
IF_ListLayout.Padding = UDim.new(0, 20)
IF_ListLayout.FillDirection = Enum.FillDirection.Vertical
IF_ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
IF_ListLayout.Parent = InventoryFrame

local IF_Padding = Instance.new("UIPadding")
IF_Padding.PaddingTop = UDim.new(0, 10)
IF_Padding.Parent = InventoryFrame

--Health Bar

local HB_XSIZE = 300
local HB_YSIZE = 20

local HBBackground = Instance.new("Frame")
HBBackground.ZIndex = HBBOrder
HBBackground.LayoutOrder = HBBOrder
HBBackground.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
HBBackground.BackgroundTransparency = 1
HBBackground.Size = UDim2.new(0, HB_XSIZE, 0, HB_YSIZE)
HBBackground.Position = UDim2.new(0.5, -HB_XSIZE / 2, 0.95, HB_YSIZE / 2)
HBBackground.Parent = GameFrame

local HBB_UICorner = Instance.new("UICorner")
HBB_UICorner.CornerRadius = UDim.new(0.25, 0)
HBB_UICorner.Parent = HBBackground

local HBRight = Instance.new("Frame")
HBRight.ZIndex = HBOrder
HBRight.LayoutOrder = HBOrder
HBRight.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HBRight.BackgroundTransparency = 1
HBRight.Size = UDim2.new(1, 0, 1, 0)
HBRight.Position = UDim2.new(0, 0, 0, 0)
HBRight.Parent = HBBackground

local HBR_UICorner = Instance.new("UICorner")
HBR_UICorner.CornerRadius = UDim.new(0.25, 0)
HBR_UICorner.Parent = HBRight

--Runtime
--print("Reached Runtime")
--Runtime Functions

local function GUIAppearTween(gui, visible, tweenInfo, tweenPosition, TextLabelVisible)
	if visible then
		TweenService
			:Create(gui, tweenInfo, { Position = tweenPosition + UDim2.new(0, 0, 0, -20), BackgroundTransparency = 0 })
			:Play()
		for _, v in pairs(gui:GetDescendants()) do
			if not v:IsA("UICorner") and not v:IsA("UIListLayout") and not v:IsA("UIPadding") then
				if v:IsA("TextButton") or v:IsA("TextLabel") then
					TweenService:Create(v, tweenInfo, {
						TextTransparency = 0,
					}):Play()
					if v:IsA("TextButton") or TextLabelVisible then
						TweenService:Create(v, tweenInfo, {
							BackgroundTransparency = 0,
						}):Play()
					end
				elseif v:IsA("ImageButton") then
					TweenService:Create(v, tweenInfo, {
						ImageTransparency = 1,
						BackgroundTransparency = 0,
					}):Play()
				elseif v:IsA("ImageLabel") then
					TweenService:Create(v, tweenInfo, {
						ImageTransparency = 0,
						BackgroundTransparency = 1,
					}):Play()
				elseif v:IsA("Frame") or v:IsA("ScrollingFrame") then
					TweenService:Create(v, tweenInfo, {
						BackgroundTransparency = 0,
					}):Play()
					if v:IsA("ScrollingFrame") then
						TweenService:Create(v, tweenInfo, {
							ScrollBarImageTransparency = 0,
						}):Play()
					end
				end
			end
		end
	elseif not visible then
		TweenService:Create(gui, tweenInfo, {
			Position = tweenPosition + UDim2.new(0, 0, 0, 20),
			BackgroundTransparency = 1,
		}):Play()
		for _, v in pairs(gui:GetDescendants()) do
			if not v:IsA("UICorner") and not v:IsA("UIListLayout") and not v:IsA("UIPadding") then
				if v:IsA("TextButton") or v:IsA("TextLabel") then
					TweenService:Create(v, tweenInfo, {
						TextTransparency = 1,
					}):Play()
					if v:IsA("TextButton") or TextLabelVisible then
						TweenService:Create(v, tweenInfo, {
							BackgroundTransparency = 1,
						}):Play()
					end
				elseif v:IsA("ImageButton") or v:IsA("ImageLabel") then
					TweenService:Create(v, tweenInfo, {
						ImageTransparency = 1,
						BackgroundTransparency = 1,
					}):Play()
				elseif v:IsA("Frame") or v:IsA("ScrollingFrame") then
					TweenService:Create(v, tweenInfo, {
						BackgroundTransparency = 1,
					}):Play()
					if v:IsA("ScrollingFrame") then
						TweenService:Create(v, tweenInfo, {
							Transparency = 1,
						}):Play()
					end
				end
			end
		end
	else
		error("No Visibility Option")
	end
end
--HealthBar

Player.CharacterAdded:Connect(function(character)
	HBRight.Size = UDim2.new(0, HB_XSIZE, 0, HB_YSIZE)
	character:WaitForChild("Humanoid").HealthChanged:Connect(function(health)
		if health * HB_XSIZE / 100 <= 15 then
			HBRight:TweenSize(UDim2.new(0, 15, 0, HB_YSIZE), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25)
		else
			HBRight:TweenSize(
				UDim2.new(0, health * HB_XSIZE / 100, 0, HB_YSIZE),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quad,
				0.25
			)
		end
		--print("Tweened Size")
	end)
end)

--Title Theme
local TitleTheme = ReplicatedStorage.Sounds.Title_Theme
TitleTheme.Volume = 0

TitleTheme:Play()

local TitleTween = TweenService:Create(TitleTheme, TweenInfo.new(30, Enum.EasingStyle.Linear), { Volume = 0.5 })
TitleTween:Play()
local assets = ReplicatedStorage:GetDescendants()

for i = 1, #assets do
	local asset = assets[i]
	ContentProvider:PreloadAsync({ asset })
	--print("Loaded: "..tostring(assets[i]))
	local progress = i / #assets
	LBText.Text = tostring(i) .. "/" .. tostring(#assets)
	LoadingBar:TweenSize(
		UDim2.new(0, progress * LB_XSIZE, 0, LB_YSIZE),
		Enum.EasingDirection.In,
		Enum.EasingStyle.Sine,
		0.1,
		true
	)
end

--print("\nFinished loading assets\nStarting StartScreenTweens")

--Loading Screen Tween Out
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local TransparentBackground = {
	BackgroundTransparency = 1,
}
local TransparentText = {
	TextTransparency = 1,
}
local OpaqueBackground = {
	BackgroundTransparency = 0,
}
--[[local BarelyVisibleBackground = {
	BackgroundTransparency = 0.1,
}
local OpaqueText = {
	TextTransparency = 0
} ]]

task.wait(0.5)
local LSFTween = TweenService:Create(LSFrame, tweenInfo, TransparentBackground)
TweenService:Create(LoadingBar, tweenInfo, TransparentBackground):Play()
TweenService:Create(LoadingBarBackground, tweenInfo, TransparentBackground):Play()
TweenService:Create(LBText, tweenInfo, TransparentText):Play()
LSFTween:Play()
local Camera = workspace.CurrentCamera
Camera.CameraType = Enum.CameraType.Scriptable
Camera.CFrame = CFrame.new(0, 10, 0)
local Connection
Connection = RunService.RenderStepped:Connect(function(DeltaTime)
	Camera.CFrame = Camera.CFrame * CFrame.Angles(0, 0.0025 * (DeltaTime * 60), 0)
end)
local AppearTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
--Tween Start Button Location
LSFTween.Completed:Connect(function()
	StartButton:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 1.5)
	task.wait(0.1)
	CreditButton:TweenPosition(UDim2.new(0.5, 0, 0.65, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 1.5)
end)

local HBBInfo = {
	BackgroundTransparency = 0,
	Position = UDim2.new(0.5, -HB_XSIZE / 2, 0.90, HB_YSIZE / 2),
}

CreditButton.Activated:Connect(function()
	CreditButton:TweenPosition(UDim2.new(0.5, 0, 1.25, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
	task.wait(0.1)
	StartButton:TweenPosition(UDim2.new(0.5, 0, 1.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
end)

StartButton.Activated:Connect(function()
	local TitleTweenStop = TweenService:Create(TitleTheme, TweenInfo.new(5, Enum.EasingStyle.Linear), { Volume = 0 })
	TitleTweenStop:Play()
	CreditButton:TweenPosition(UDim2.new(0.5, 0, 1.25, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
	task.wait(0.1)
	StartButton:TweenPosition(UDim2.new(0.5, 0, 1.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)

	task.wait(0.5)

	SSFrame.Visible = false
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)

	Camera.CameraType = Enum.CameraType.Custom
	Connection:Disconnect()

	TweenService:Create(HBBackground, AppearTweenInfo, HBBInfo):Play()
	TweenService:Create(HBRight, AppearTweenInfo, OpaqueBackground):Play()
	GUIBBFrame.Visible = true
	GUIAppearTween(GUIBBFrame, true, AppearTweenInfo, UDim2.new(GUIBBFrame.Position.X, GUIBBFrame.Position.Y), false)
end)

RMTButton.Activated:Connect(function()
	--print("Removing Textures")
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Part") then
			v.Material = Enum.Material.SmoothPlastic
		elseif v:IsA("Texture") then
			v:Destroy()
		end
	end
	RMTButton.Active = false
	RMTButton.Text = "Textures Removed!" .. "\n" .. "Rejoin to Reset"
end)

local RMSBDebounce = false
RMSButton.Activated:Connect(function()
	if not RMSBDebounce then
		--print("Toggling Shadows")
		RMSBDebounce = true
		if Lighting.GlobalShadows == true then
			Lighting.GlobalShadows = false
			RMSButton.Text = "Turned Off Shadows!"
		elseif Lighting.GlobalShadows == false then
			Lighting.GlobalShadows = true
			RMSButton.Text = "Turned On Shadows!"
		else
			print("Lighting Error")
		end
		task.wait(0.5)
		RMSButton.Text = "Toggle Shadows"
		RMSBDebounce = false
	end
end)

local SettingButtonDebounce = false
SettingButton.Activated:Connect(function()
	if not SettingButtonDebounce then
		--print("In")
		SettingButtonDebounce = true
		if not SFBackground.Visible then
			SFBackground.Visible = true
			GUIAppearTween(
				SFBackground,
				true,
				AppearTweenInfo,
				UDim2.new(SFBackground.Position.X, SFBackground.Position.Y),
				true
			)
			task.wait(1)
		else
			GUIAppearTween(
				SFBackground,
				false,
				AppearTweenInfo,
				UDim2.new(SFBackground.Position.X, SFBackground.Position.Y),
				true
			)
			task.wait(1)
			SFBackground.Visible = false
		end
		SettingButtonDebounce = false
	end
end)

local QuestButtonDebounce = false
QuestButton.Activated:Connect(function()
	if not QuestButtonDebounce then
		--print("In")
		QuestButtonDebounce = true
		if not QFBackground.Visible then
			QFBackground.Visible = true
			GUIAppearTween(
				QFBackground,
				true,
				AppearTweenInfo,
				UDim2.new(QFBackground.Position.X, QFBackground.Position.Y),
				true
			)
			task.wait(1)
		else
			GUIAppearTween(
				QFBackground,
				false,
				AppearTweenInfo,
				UDim2.new(QFBackground.Position.X, QFBackground.Position.Y),
				true
			)
			task.wait(1)
			QFBackground.Visible = false
		end
		QuestButtonDebounce = false
	end
end)

local InventoryFrameDebounce = false
InventoryButton.Activated:Connect(function()
	if not InventoryFrameDebounce then
		--print("In")
		InventoryFrameDebounce = true
		if not IFBackground.Visible then
			IFBackground.Visible = true
			GUIAppearTween(
				IFBackground,
				true,
				AppearTweenInfo,
				UDim2.new(IFBackground.Position.X, IFBackground.Position.Y),
				true
			)
			task.wait(1)
		else
			GUIAppearTween(
				IFBackground,
				false,
				AppearTweenInfo,
				UDim2.new(IFBackground.Position.X, IFBackground.Position.Y),
				true
			)
			task.wait(1)
			IFBackground.Visible = false
		end
		InventoryFrameDebounce = false
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
