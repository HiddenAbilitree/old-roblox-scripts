local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local ZoneService = require(ReplicatedStorage.Common.Zone)

local TweenService = game:GetService("TweenService")
local container = workspace.Zones
local StarterZone = ZoneService.new(container)
StarterZone:setAccuracy("Low")
local ZoneFrame = Instance.new("Frame")
ZoneFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ZoneFrame.Position = UDim2.new(0.5, 0, 0.25, 0)
ZoneFrame.Size = UDim2.new(600, 400)
ZoneFrame.BackgroundTransparency = 1
ZoneFrame.Parent = Player.PlayerGui:WaitForChild("GUI").GameFrame

local ZoneText = Instance.new("TextLabel")
ZoneText.AnchorPoint = Vector2.new(0.5, 0.5)
ZoneText.Position = UDim2.new(0.5, 0, 0.5, 0)
ZoneText.Size = UDim2.new(300, 300)
ZoneText.BackgroundTransparency = 1
ZoneText.TextTransparency = 1
ZoneText.Text = "Filler Text"
ZoneText.Font = Enum.Font.Fantasy
ZoneText.TextSize = 50
ZoneText.Parent = ZoneFrame

local AppearTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)

local function GUIAppearTween(gui, visible)
	if visible then
		TweenService:Create(gui, AppearTweenInfo, {
			Position = UDim2.new(0.5, 0, 0.25, -20),
		}):Play()
		for _, v in pairs(gui:GetDescendants()) do
			if not v:IsA("UICorner") and not v:IsA("UIListLayout") and not v:IsA("UIPadding") then
				if v:IsA("TextButton") or v:IsA("TextLabel") then
					TweenService:Create(v, AppearTweenInfo, {
						TextTransparency = 0,
					}):Play()
					if v:IsA("TextButton") then
						TweenService:Create(v, AppearTweenInfo, {
							BackgroundTransparency = 0,
						}):Play()
					end
				elseif v:IsA("ImageButton") then
					TweenService:Create(v, AppearTweenInfo, {
						ImageTransparency = 1,
						BackgroundTransparency = 0,
					}):Play()
				elseif v:IsA("ImageLabel") then
					TweenService:Create(v, AppearTweenInfo, {
						ImageTransparency = 0,
						BackgroundTransparency = 1,
					}):Play()
				end
			end
		end
	else
		TweenService:Create(gui, AppearTweenInfo, {
			Position = UDim2.new(0.5, 0, 0.25, 0),
		}):Play()
		for _, v in pairs(gui:GetDescendants()) do
			if not v:IsA("UICorner") and not v:IsA("UIListLayout") and not v:IsA("UIPadding") then
				if v:IsA("TextButton") or v:IsA("TextLabel") then
					TweenService:Create(v, AppearTweenInfo, {
						TextTransparency = 1,
					}):Play()
					if v:IsA("TextButton") then
						TweenService:Create(v, AppearTweenInfo, {
							BackgroundTransparency = 1,
						}):Play()
					end
				elseif v:IsA("ImageButton") then
					TweenService:Create(v, AppearTweenInfo, {
						ImageTransparency = 1,
						BackgroundTransparency = 1,
					}):Play()
				elseif v:IsA("ImageLabel") then
					TweenService:Create(v, AppearTweenInfo, {
						ImageTransparency = 1,
						BackgroundTransparency = 1,
					}):Play()
				end
			end
		end
	end
end

task.wait(3)
StarterZone.localPlayerEntered:Connect(function()
	print("Entering")
	GUIAppearTween(ZoneFrame, true)
	ZoneText.Text = "Entering Starter Zone"
	task.wait(2)
	GUIAppearTween(ZoneFrame, false)
end)
StarterZone.localPlayerExited:Connect(function()
	print("Exiting")
	GUIAppearTween(ZoneFrame, true)
	ZoneText.Text = "Exiting Starter Zone"
	task.wait(2)
	GUIAppearTween(ZoneFrame, false)
end)
