local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local ScreenGUI = Player.PlayerGui:WaitForChild("GUI")

local DialogFrame = Instance.new("Frame")
DialogFrame.Visible = false
DialogFrame.Size = UDim2.new(1, 0, 0.4, 0)
DialogFrame.Position = UDim2.new(0, 0, 0.6, 0)
DialogFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
DialogFrame.BorderSizePixel = 0
DialogFrame.BackgroundTransparency = 0.2
DialogFrame.ZIndex = 100000
DialogFrame.LayoutOrder = 100000
DialogFrame.Parent = ScreenGUI

local DialogText = Instance.new("TextLabel")
DialogText.AnchorPoint = Vector2.new(0.5, 0.5)
DialogText.Size = UDim2.new(0.9, 0, 0.7)
DialogText.Position = UDim2.new(0.5, 0, 0.6, 0)

DialogText.Parent = DialogFrame

local NPCName = Instance.new("TextLabel")
NPCName.Name = "NPCName"
NPCName.BackgroundTransparency = 0
NPCName.TextSize = 30
NPCName.Font = Enum.Font.SourceSansBold
NPCName.Text = "Filler Text"
NPCName.TextColor3 = Color3.fromRGB(255, 255, 255)
NPCName.TextXAlignment = Enum.TextXAlignment.Center
NPCName.BorderSizePixel = 0
NPCName.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
NPCName.BackgroundTransparency = 0.2
NPCName.Size = UDim2.new(1, 0, 0, 30)
NPCName.Position = UDim2.new(0, 0, 0, 0)
NPCName.ZIndex = 100001
NPCName.LayoutOrder = 100001
NPCName.Parent = DialogFrame
