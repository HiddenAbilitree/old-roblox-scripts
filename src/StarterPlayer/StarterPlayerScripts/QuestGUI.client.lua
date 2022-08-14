local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local ScreenGUI = Player.PlayerGui:WaitForChild("ScreenGUI")

local DialogFrame = Instance.new("Frame")

DialogFrame.Parent = ScreenGUI
DialogFrame.Visible = false
DialogFrame.Size = UDim2.new(1, 0, 0.25, 0)
DialogFrame.Position = UDim2.new(0, 0, 0.75, 0)
DialogFrame.BackgroundColor = Color3.fromRGB(83, 83, 83)
DialogFrame.BorderSizePixel = 0
DialogFrame.BackgroundTransparency = 0.2

local NPCName = Instance.new("TextLabel")
NPCName.Parent = DialogFrame
NPCName.Name = "NPCName"
NPCName.BackgroundTransparency = 1
NPCName.TextSize = 20
NPCName.Font = Enum.Font.SourceSansBold
NPCName.Text = "Filler Text"
NPCName.Size = UDim2.new(0, 100, 0, 10)
NPCName.Position = UDim2.new(0, 5, 0, 5)
