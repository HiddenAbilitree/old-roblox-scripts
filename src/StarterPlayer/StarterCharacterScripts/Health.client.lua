local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

Humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
