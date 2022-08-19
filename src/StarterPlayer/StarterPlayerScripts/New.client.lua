--[[Services

local LocalizationService = game:GetService("LocalizationService")
local GuiService = game:GetService("GuiService")
local Lighting = game:GetService("Lighting")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Players = game:GetService("Players")
local ContentProvider = game:GetService("ContentProvider")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local DraggableObject = require(ReplicatedStorage.Common.DraggableObject)

--Instances:

local Player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
local Option3Rework = Instance.new("Frame")
local Categories = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local Quests = Instance.new("TextButton")
local Character = Instance.new("TextButton")
local Inventory = Instance.new("TextButton")
local Settings = Instance.new("TextButton")
local StatsB = Instance.new("TextButton")
local Placeholder = Instance.new("Frame")
local Settings_2 = Instance.new("Frame")
local GeneralFrame = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local UIPadding_2 = Instance.new("UIPadding")
local TopBar = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local Display = Instance.new("TextButton")
local Keybinds = Instance.new("TextButton")
local General = Instance.new("TextButton")
local SideBar = Instance.new("Frame")
local UIListLayout_3 = Instance.new("UIListLayout")
local SettingDesc = Instance.new("TextLabel")
local ItemName = Instance.new("TextLabel")
local DisplayFrame = Instance.new("ScrollingFrame")
local UIPadding_3 = Instance.new("UIPadding")
local Shadows = Instance.new("TextButton")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ShadowsButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local UIListLayout_4 = Instance.new("UIListLayout")
local FastMode = Instance.new("TextButton")
local Frame_2 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local FastModeButton = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local KeybindsFrame = Instance.new("ScrollingFrame")
local UIGridLayout_2 = Instance.new("UIGridLayout")
local UIPadding_4 = Instance.new("UIPadding")
local Inventory_2 = Instance.new("Frame")
local MainBar = Instance.new("ScrollingFrame")
local UIGridLayout_3 = Instance.new("UIGridLayout")
local UIPadding_5 = Instance.new("UIPadding")
local TopBar_2 = Instance.new("Frame")
local UIListLayout_5 = Instance.new("UIListLayout")
local Food = Instance.new("TextButton")
local Armor = Instance.new("TextButton")
local Weapons = Instance.new("TextButton")
local Misc = Instance.new("TextButton")
local Search = Instance.new("TextBox")
local SideBar_2 = Instance.new("Frame")
local ItemName_2 = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local UIListLayout_6 = Instance.new("UIListLayout")
local ItemDescription = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local MenuButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local PancakeIcon = Instance.new("ImageLabel")

--Properties:

ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Option3Rework.Name = "Option 3 Rework"
Option3Rework.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Option3Rework.BackgroundTransparency = 0.800
Option3Rework.BorderSizePixel = 0
Option3Rework.Size = UDim2.new(1, 0, 1, 0)
Option3Rework.Visible = false
Option3Rework.Parent = ScreenGui

Categories.Name = "Categories"
Categories.Active = true
Categories.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Categories.BackgroundTransparency = 1.000
Categories.BorderSizePixel = 0
Categories.Position = UDim2.new(0, 0, 0.1, 0)
Categories.Size = UDim2.new(0.1, 0, 0.9, 0)
Categories.BottomImage = "rbxassetid://10619510003"
Categories.MidImage = "rbxassetid://10619510003"
Categories.ScrollBarThickness = 5
Categories.TopImage = "rbxassetid://10619510003"
Categories.Parent = Option3Rework

UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Categories

UIPadding.Parent = Categories

Quests.Name = "Quests"
Quests.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Quests.BackgroundTransparency = 0.400
Quests.BorderSizePixel = 0
Quests.Size = UDim2.new(1, 0, 0.1, 0)
Quests.Font = Enum.Font.Oswald
Quests.Text = "Quests"
Quests.TextColor3 = Color3.fromRGB(0, 0, 0)
Quests.TextSize = 40.000
Quests.TextWrapped = true
Quests.Parent = Categories

Character.Name = "Character"
Character.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Character.BackgroundTransparency = 0.400
Character.BorderSizePixel = 0
Character.LayoutOrder = -1000
Character.Size = UDim2.new(1, 0, 0.1, 0)
Character.Font = Enum.Font.Oswald
Character.Text = "Character"
Character.TextColor3 = Color3.fromRGB(0, 0, 0)
Character.TextSize = 40.000
Character.TextWrapped = true
Character.Parent = Categories

Inventory.Name = "Inventory"
Inventory.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Inventory.BackgroundTransparency = 0.400
Inventory.BorderSizePixel = 0
Inventory.LayoutOrder = -100
Inventory.Size = UDim2.new(1, 0, 0.1, 0)
Inventory.Font = Enum.Font.Oswald
Inventory.Text = "Inventory"
Inventory.TextColor3 = Color3.fromRGB(0, 0, 0)
Inventory.TextSize = 40.000
Inventory.TextWrapped = true
Inventory.Parent = Categories

Settings.Name = "Settings"
Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Settings.BackgroundTransparency = 0.400
Settings.BorderSizePixel = 0
Settings.LayoutOrder = 100
Settings.Size = UDim2.new(1, 0, 0.1, 0)
Settings.Font = Enum.Font.Oswald
Settings.Text = "Settings"
Settings.TextColor3 = Color3.fromRGB(0, 0, 0)
Settings.TextSize = 40.000
Settings.TextWrapped = true
Settings.Parent = Categories

StatsB.Name = "Stats"
StatsB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StatsB.BackgroundTransparency = 0.400
StatsB.BorderSizePixel = 0
StatsB.LayoutOrder = -500
StatsB.Size = UDim2.new(1, 0, 0.1, 0)
StatsB.Font = Enum.Font.Oswald
StatsB.Text = "Stats"
StatsB.TextColor3 = Color3.fromRGB(0, 0, 0)
StatsB.TextSize = 40.000
StatsB.TextWrapped = true
StatsB.Parent = Categories

Placeholder.Name = "Placeholder"
Placeholder.AnchorPoint = Vector2.new(0.5, 0.5)
Placeholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder.BackgroundTransparency = 0.400
Placeholder.BorderSizePixel = 0
Placeholder.LayoutOrder = 1000
Placeholder.Size = UDim2.new(1, 0, 0.5, 0)
Placeholder.Parent = Categories

Settings_2.Name = "Settings"
Settings_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Settings_2.BackgroundTransparency = 1.000
Settings_2.BorderSizePixel = 0
Settings_2.Position = UDim2.new(0.1, 0, 0, 0)
Settings_2.Size = UDim2.new(0.9, 0, 1, 0)
Settings_2.Parent = Option3Rework

GeneralFrame.Name = "GeneralFrame"
GeneralFrame.Active = true
GeneralFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GeneralFrame.BackgroundTransparency = 0.800
GeneralFrame.BorderSizePixel = 0
GeneralFrame.Position = UDim2.new(0, 0, 0.1, 0)
GeneralFrame.Size = UDim2.new(0.9, 0, 0.9, 0)
GeneralFrame.Visible = false
GeneralFrame.CanvasSize = UDim2.new(0, 0, 0.9, 0)
GeneralFrame.Parent = Settings_2

UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0.01, 0, 0.01, 0)
UIGridLayout.Parent = GeneralFrame

UIPadding_2.PaddingBottom = UDim.new(0.01, 0)
UIPadding_2.PaddingLeft = UDim.new(0.01, 0)
UIPadding_2.PaddingRight = UDim.new(0.1, 0)
UIPadding_2.PaddingTop = UDim.new(0.01, 0)
TopBar.Parent = Settings_2

TopBar.Name = "TopBar"
TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BackgroundTransparency = 1.000
TopBar.BorderColor3 = Color3.fromRGB(27, 42, 53)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0.1, 0)
TopBar.Parent = Settings_2

UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_2.Parent = TopBar

Display.Name = "Display"
Display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Display.BackgroundTransparency = 0.400
Display.BorderSizePixel = 0
Display.LayoutOrder = 10
Display.Size = UDim2.new(0.33333333333333, 0, 1, 0)
Display.Selected = true
Display.Font = Enum.Font.SourceSansBold
Display.Text = "Display"
Display.TextColor3 = Color3.fromRGB(0, 0, 0)
Display.TextSize = 30.000
Display.Parent = TopBar

Keybinds.Name = "Keybinds"
Keybinds.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Keybinds.BackgroundTransparency = 0.400
Keybinds.BorderColor3 = Color3.fromRGB(27, 42, 53)
Keybinds.BorderSizePixel = 0
Keybinds.LayoutOrder = 10
Keybinds.Size = UDim2.new(0.33333333333333, 0, 1, 0)
Keybinds.Font = Enum.Font.SourceSansBold
Keybinds.Text = "Keybinds"
Keybinds.TextColor3 = Color3.fromRGB(0, 0, 0)
Keybinds.TextSize = 30.000
Keybinds.Parent = TopBar

General.Name = "General"
General.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
General.BackgroundTransparency = 0.400
General.BorderSizePixel = 0
General.LayoutOrder = -1000
General.Size = UDim2.new(0.33333333333333, 0, 1, 0)
General.Font = Enum.Font.SourceSansBold
General.Text = "General"
General.TextColor3 = Color3.fromRGB(0, 0, 0)
General.TextSize = 30.000
General.Parent = TopBar

SideBar.Name = "SideBar"
SideBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SideBar.BackgroundTransparency = 0.800
SideBar.BorderSizePixel = 0
SideBar.Position = UDim2.new(0.8, 0, 0.1, 0)
SideBar.Size = UDim2.new(0.2, 0, 0.9, 0)
SideBar.Parent = Settings_2

UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Parent = SideBar

SettingDesc.Name = "SettingDesc"
SettingDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingDesc.BackgroundTransparency = 1.000
SettingDesc.Size = UDim2.new(1, 0, 0.85, 0)
SettingDesc.Font = Enum.Font.Oswald
SettingDesc.Text = "Setting Description"
SettingDesc.TextColor3 = Color3.fromRGB(0, 0, 0)
SettingDesc.TextSize = 30.000
SettingDesc.Parent = SideBar

ItemName.Name = "ItemName"
ItemName.AnchorPoint = Vector2.new(0.5, 0)
ItemName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemName.BackgroundTransparency = 1.000
ItemName.LayoutOrder = -100
ItemName.Position = UDim2.new(0.5, 0, 0, 0)
ItemName.Size = UDim2.new(1, 0, 0.15, 0)
ItemName.Font = Enum.Font.Oswald
ItemName.Text = "Setting Name"
ItemName.TextColor3 = Color3.fromRGB(0, 0, 0)
ItemName.TextSize = 75.000
ItemName.Parent = SideBar

DisplayFrame.Name = "DisplayFrame"
DisplayFrame.Active = true
DisplayFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DisplayFrame.BackgroundTransparency = 0.800
DisplayFrame.BorderSizePixel = 0
DisplayFrame.Position = UDim2.new(0, 0, 0.1, 0)
DisplayFrame.Size = UDim2.new(0.8, 0, 0.9, 0)
DisplayFrame.CanvasSize = UDim2.new(0, 0, 0.9, 0)
DisplayFrame.Parent = Settings_2

UIPadding_3.PaddingBottom = UDim.new(0.01, 0)
UIPadding_3.PaddingLeft = UDim.new(0.03, 0)
UIPadding_3.PaddingRight = UDim.new(0.1, 0)
UIPadding_3.PaddingTop = UDim.new(0.05, 0)
UIPadding_3.Parent = DisplayFrame

Shadows.Name = "Shadows"
Shadows.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shadows.BackgroundTransparency = 1.000
Shadows.Size = UDim2.new(0.3, 0, 0.1, 0)
Shadows.Font = Enum.Font.Oswald
Shadows.Text = "Shadows"
Shadows.TextColor3 = Color3.fromRGB(0, 0, 0)
Shadows.TextSize = 60.000
Shadows.TextWrapped = true
Shadows.Parent = DisplayFrame

Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.400
Frame.Position = UDim2.new(1.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0.6, 0, 0.3, 0)
Frame.Parent = Shadows

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Frame

ShadowsButton.Name = "Shadows Button"
ShadowsButton.AnchorPoint = Vector2.new(0.5, 0.5)
ShadowsButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ShadowsButton.Position = UDim2.new(0.1, 0, 0.5, 0)
ShadowsButton.Size = UDim2.new(0.2, 0, 1.5, 0)
ShadowsButton.Font = Enum.Font.SourceSans
ShadowsButton.Text = ""
ShadowsButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ShadowsButton.TextSize = 14.000
ShadowsButton.Parent = Frame

UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = ShadowsButton

UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_4.Padding = UDim.new(0.05, 0)
UIListLayout_4.Parent = DisplayFrame

FastMode.Name = "Fast Mode"
FastMode.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FastMode.BackgroundTransparency = 1.000
FastMode.Size = UDim2.new(0.3, 0, 0.1, 0)
FastMode.Font = Enum.Font.Oswald
FastMode.Text = "Fast Mode"
FastMode.TextColor3 = Color3.fromRGB(0, 0, 0)
FastMode.TextSize = 60.000
FastMode.TextWrapped = true
FastMode.Parent = DisplayFrame

Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_2.BackgroundTransparency = 0.400
Frame_2.Position = UDim2.new(1.5, 0, 0.5, 0)
Frame_2.Size = UDim2.new(0.6, 0, 0.3, 0)
Frame_2.Parent = FastMode

UICorner_3.CornerRadius = UDim.new(1, 0)
UICorner_3.Parent = Frame_2

FastModeButton.Name = "Fast Mode Button"
FastModeButton.AnchorPoint = Vector2.new(0.5, 0.5)
FastModeButton.BackgroundColor3 = Color3.fromRGB(108, 108, 108)
FastModeButton.Position = UDim2.new(0.9, 0, 0.5, 0)
FastModeButton.Size = UDim2.new(0.2, 0, 1.5, 0)
FastModeButton.Font = Enum.Font.SourceSans
FastModeButton.Text = ""
FastModeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FastModeButton.TextSize = 14.000
FastModeButton.Parent = Frame_2

UICorner_4.CornerRadius = UDim.new(1, 0)
UICorner_4.Parent = FastModeButton

KeybindsFrame.Name = "KeybindsFrame"
KeybindsFrame.Active = true
KeybindsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KeybindsFrame.BackgroundTransparency = 0.800
KeybindsFrame.BorderSizePixel = 0
KeybindsFrame.Position = UDim2.new(0, 0, 0.1, 0)
KeybindsFrame.Size = UDim2.new(0.8, 0, 0.9, 0)
KeybindsFrame.Visible = false
KeybindsFrame.CanvasSize = UDim2.new(0, 0, 0.9, 0)
KeybindsFrame.Parent = Settings_2

UIGridLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout_2.CellPadding = UDim2.new(0.01, 0, 0.01, 0)
UIGridLayout_2.Parent = KeybindsFrame

UIPadding_4.PaddingBottom = UDim.new(0.01, 0)
UIPadding_4.PaddingLeft = UDim.new(0.01, 0)
UIPadding_4.PaddingRight = UDim.new(0.01, 0)
UIPadding_4.PaddingTop = UDim.new(0.01, 0)
UIPadding_4.Parent = KeybindsFrame

Inventory_2.Name = "Inventory"
Inventory_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Inventory_2.BackgroundTransparency = 1.000
Inventory_2.Position = UDim2.new(0.1, 0, 0, 0)
Inventory_2.Size = UDim2.new(0.9, 0, 1, 0)
Inventory_2.Visible = false
Inventory_2.Parent = Option3Rework

MainBar.Name = "MainBar"
MainBar.Active = true
MainBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainBar.BackgroundTransparency = 0.800
MainBar.Position = UDim2.new(0, 0, 0.1, 0)
MainBar.Size = UDim2.new(0.8, 0, 0.9, 0)
MainBar.Parent = Inventory_2

UIGridLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout_3.CellPadding = UDim2.new(0.01, 0, 0.01, 0)
UIGridLayout_3.Parent = MainBar

UIPadding_5.PaddingBottom = UDim.new(0.01, 0)
UIPadding_5.PaddingLeft = UDim.new(0.01, 0)
UIPadding_5.PaddingRight = UDim.new(0.01, 0)
UIPadding_5.PaddingTop = UDim.new(0.01, 0)
UIPadding_5.Parent = MainBar

TopBar_2.Name = "TopBar"
TopBar_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar_2.BackgroundTransparency = 0.400
TopBar_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
TopBar_2.Size = UDim2.new(1, 0, 0.1, 0)
TopBar_2.Parent = Inventory_2

UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_5.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_5.Padding = UDim.new(0.1, 0)
UIListLayout_5.Parent = TopBar_2

Food.Name = "Food"
Food.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Food.BackgroundTransparency = 1.000
Food.LayoutOrder = 10
Food.Size = UDim2.new(0, 150, 0, 50)
Food.Selected = true
Food.Font = Enum.Font.SourceSansBold
Food.Text = "Food"
Food.TextColor3 = Color3.fromRGB(0, 0, 0)
Food.TextSize = 30.000
Food.Parent = TopBar_2

Armor.Name = "Armor"
Armor.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Armor.BackgroundTransparency = 1.000
Armor.LayoutOrder = 10
Armor.Size = UDim2.new(0, 150, 0, 50)
Armor.Font = Enum.Font.SourceSansBold
Armor.Text = "Armor"
Armor.TextColor3 = Color3.fromRGB(0, 0, 0)
Armor.TextSize = 30.000
Armor.Parent = TopBar_2

Weapons.Name = "Weapons"
Weapons.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Weapons.BackgroundTransparency = 1.000
Weapons.LayoutOrder = 10
Weapons.Size = UDim2.new(0, 150, 0, 50)
Weapons.Font = Enum.Font.SourceSansBold
Weapons.Text = "Weapons"
Weapons.TextColor3 = Color3.fromRGB(0, 0, 0)
Weapons.TextSize = 30.000
Weapons.Parent = TopBar_2

Misc.Name = "Misc"
Misc.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Misc.BackgroundTransparency = 1.000
Misc.LayoutOrder = 10
Misc.Size = UDim2.new(0, 150, 0, 50)
Misc.Font = Enum.Font.SourceSansBold
Misc.Text = "Misc."
Misc.TextColor3 = Color3.fromRGB(0, 0, 0)
Misc.TextSize = 30.000
Misc.Parent = TopBar_2

Search.Name = "Search"
Search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Search.BackgroundTransparency = 1.000
Search.LayoutOrder = 100
Search.Font = Enum.Font.SourceSansBold
Search.PlaceholderColor3 = Color3.fromRGB(20, 20, 20)
Search.PlaceholderText = "Search 🔎"
Search.Text = ""
Search.TextColor3 = Color3.fromRGB(0, 0, 0)
Search.TextSize = 40.000
Search.Parent = TopBar_2

SideBar_2.Name = "SideBar"
SideBar_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SideBar_2.BackgroundTransparency = 0.800
SideBar_2.Position = UDim2.new(0.8, 0, 0.1, 0)
SideBar_2.Size = UDim2.new(0.2, 0, 0.9, 0)
SideBar_2.Parent = Inventory_2

ItemName_2.Name = "ItemName"
ItemName_2.AnchorPoint = Vector2.new(0.5, 0)
ItemName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemName_2.BackgroundTransparency = 1.000
ItemName_2.Position = UDim2.new(0.5, 0, 0, 0)
ItemName_2.Size = UDim2.new(1, 0, 0.15, 0)
ItemName_2.Font = Enum.Font.Oswald
ItemName_2.Text = "Item Name"
ItemName_2.TextColor3 = Color3.fromRGB(0, 0, 0)
ItemName_2.TextSize = 75.000
ItemName_2.Parent = SideBar_2

ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.Position = UDim2.new(0, 0, 0.3, 0)
ImageLabel.Size = UDim2.new(1, 0, 0.35, 0)
ImageLabel.Image = "rbxassetid://10619510003"
ImageLabel.Parent = SideBar_2

UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_6.Parent = SideBar_2

ItemDescription.Name = "ItemDescription"
ItemDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ItemDescription.BackgroundTransparency = 1.000
ItemDescription.Size = UDim2.new(1, 0, 0.5, 0)
ItemDescription.Font = Enum.Font.SourceSans
ItemDescription.Text = "Item Description"
ItemDescription.TextColor3 = Color3.fromRGB(0, 0, 0)
ItemDescription.TextSize = 30.000
ItemDescription.Parent = SideBar_2

Close.Name = "Close"
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 0.400
Close.BorderSizePixel = 0
Close.LayoutOrder = -10000
Close.Size = UDim2.new(0.1, 0, 0.1, 0)
Close.Font = Enum.Font.PermanentMarker
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 0, 0)
Close.TextSize = 100.000
Close.Parent = Option3Rework

MenuButton.Name = "MenuButton"
MenuButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MenuButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
MenuButton.BorderSizePixel = 0
MenuButton.Position = UDim2.new(0, 50, 0, 50)
MenuButton.Size = UDim2.new(0.05, 0, 0.05, 0)
MenuButton.SizeConstraint = Enum.SizeConstraint.RelativeXX
MenuButton.Image = "rbxassetid://10640239593"
MenuButton.ImageTransparency = 1.000
MenuButton.Parent = ScreenGui

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = MenuButton

PancakeIcon.Name = "PancakeIcon"
PancakeIcon.AnchorPoint = Vector2.new(0.5, 0.5)
PancakeIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PancakeIcon.BackgroundTransparency = 1.000
PancakeIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
PancakeIcon.Size = UDim2.new(0.75, 0, 0.75, 0)
PancakeIcon.Image = "rbxassetid://10640227349"
PancakeIcon.ImageColor3 = Color3.fromRGB(107, 107, 107)
PancakeIcon.Parent = MenuButton

--Health Bar
local HB_XSIZE = 300
local HB_YSIZE = 20

local HBBackground = Instance.new("Frame")
HBBackground.AnchorPoint = Vector2.new(0.5, 0.5)
HBBackground.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
HBBackground.BackgroundTransparency = 1
HBBackground.Size = UDim2.new(0, HB_XSIZE, 0, HB_YSIZE)
HBBackground.Position = UDim2.new(0.5, 0, 0.95, 0)
HBBackground.Parent = ScreenGui

local HBB_UICorner = Instance.new("UICorner")
HBB_UICorner.CornerRadius = UDim.new(0.25, 0)
HBB_UICorner.Parent = HBBackground

local HBRight = Instance.new("Frame")
HBRight.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HBRight.BackgroundTransparency = 1
HBRight.Size = UDim2.new(1, 0, 1, 0)
HBRight.Position = UDim2.new(0, 0, 0, 0)
HBRight.Parent = HBBackground

local HBR_UICorner = Instance.new("UICorner")
HBR_UICorner.CornerRadius = UDim.new(0.25, 0)
HBR_UICorner.Parent = HBRight

-- Scripts:

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

MenuButton.Activated:Connect(function()
	MenuButton.Visible = false
	Option3Rework.Visible = true
end)

Close.Activated:Connect(function()
	MenuButton.Visible = true
	Option3Rework.Visible = false
end)
]]
