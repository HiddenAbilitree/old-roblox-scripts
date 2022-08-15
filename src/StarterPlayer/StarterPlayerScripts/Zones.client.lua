local Zone = require(game:GetService("ReplicatedStorage").Common.Zone)
local container = workspace.Zones
local zone = Zone.new(container)

local ZoneFrame = Instance.new("Frame")
ZoneFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ZoneFrame.Position = UDim2.new(0.5, 0, 0.25, 0)
zone.playerEntered:Connect(function() end)
