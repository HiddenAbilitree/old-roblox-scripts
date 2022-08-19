local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local ZoneService = require(ReplicatedStorage.Common.Zone)

local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local StartZoneContainer = workspace.Zones.StartZone
local StarterZone = ZoneService.new(StartZoneContainer)
local WildernessContainer = workspace.Zones.Wilderness
local Wilderness = ZoneService.new(WildernessContainer)

StarterZone:setAccuracy("Low")
Wilderness:setAccuracy("Low")
local doorDebounce = false
--[[DoorOutside.localPlayerEntered:Connect(function()
	print("Bruh")
	repeat
		task.wait()
	until not doorDebounce
	doorDebounce = true
	local door = game:GetService("Workspace").MainHouse.Door.Door.Door
	local tween = TweenService:Create(door, TweenInfo.new(1), { Position = door.Position + Vector3.new(11, 0, 0) })
	local tween2 =
		TweenService:Create(door.Parent.Part, TweenInfo.new(1), { Position = door.Position + Vector3.new(11, 0, 0) })
	tween:Play()
	tween2:Play()
	tween.Completed:Connect(function()
		doorDebounce = false
	end)
end)

DoorOutside.localPlayerExited:Connect(function()
	print("Bruh")
	repeat
		task.wait()
	until not doorDebounce
	doorDebounce = true
	local door = game:GetService("Workspace").MainHouse.Door.Door.Door
	local tween = TweenService:Create(door, TweenInfo.new(1), { Position = door.Position + Vector3.new(-11, 0, 0) })
	local tween2 =
		TweenService:Create(door.Parent.Part, TweenInfo.new(1), { Position = door.Position + Vector3.new(-11, 0, 0) })
	tween:Play()
	tween2:Play()
	tween.Completed:Connect(function()
		doorDebounce = false
	end)
end)]]

local ZoneFrame = Instance.new("Frame")
ZoneFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ZoneFrame.Position = UDim2.new(0.5, 0, 0.25, 0)
ZoneFrame.Size = UDim2.new(0, 100, 0, 100)
ZoneFrame.BackgroundTransparency = 1
ZoneFrame.Parent = Player.PlayerGui:WaitForChild("GUI").GameFrame

local TopLine = Instance.new("Frame")
TopLine.AnchorPoint = Vector2.new(0.5, 0.5)
TopLine.Position = UDim2.new(0.5, 0, -0.1, 0)
TopLine.Size = UDim2.new(0, 150, 0, 5)
TopLine.BackgroundTransparency = 1
TopLine.BackgroundColor3 = Color3.new(1, 1, 1)
TopLine.BorderSizePixel = 0
TopLine.Parent = ZoneFrame

local BottomLine = Instance.new("Frame")
BottomLine.AnchorPoint = Vector2.new(0.5, 0.5)
BottomLine.Position = UDim2.new(0.5, 0, 1, 0)
BottomLine.Size = UDim2.new(0, 150, 0, 5)
BottomLine.BackgroundTransparency = 1
BottomLine.BackgroundColor3 = Color3.new(1, 1, 1)
BottomLine.BorderSizePixel = 0
BottomLine.Parent = ZoneFrame

local ZoneHeader = Instance.new("TextLabel")
ZoneHeader.AnchorPoint = Vector2.new(0.5, 0.5)
ZoneHeader.Position = UDim2.new(0.5, 0, 0.25, 0)
ZoneHeader.Size = UDim2.new(0, 300, 0, 50)
ZoneHeader.BackgroundTransparency = 1
ZoneHeader.TextTransparency = 1
ZoneHeader.Text = "Entering..."
ZoneHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
ZoneHeader.Font = Enum.Font.Fantasy
ZoneHeader.TextSize = 50
ZoneHeader.Parent = ZoneFrame

local ZoneText = Instance.new("TextLabel")
ZoneText.AnchorPoint = Vector2.new(0.5, 0.5)
ZoneText.Position = UDim2.new(0.5, 0, 0.75, 0)
ZoneText.Size = UDim2.new(0, 300, 0, 30)
ZoneText.BackgroundTransparency = 1
ZoneText.TextTransparency = 1
ZoneText.Text = "Filler Text"
ZoneText.TextColor3 = Color3.fromRGB(255, 255, 255)
ZoneText.Font = Enum.Font.Fantasy
ZoneText.TextSize = 30
ZoneText.Parent = ZoneFrame

local AppearTweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
local DisappearTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
--[[
local function GUIAppearTween(gui)
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
end]]

local function GUIAppearTween(gui, visible)
	if visible then
		TweenService:Create(gui, AppearTweenInfo, { Position = UDim2.new(0.5, 0, 0.25, -20) }):Play()
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
				elseif v:IsA("Frame") then
					TweenService:Create(v, AppearTweenInfo, {
						BackgroundTransparency = 0,
					}):Play()
				end
			end
		end
	else
		TweenService:Create(gui, DisappearTweenInfo, {
			Position = UDim2.new(0.5, 0, 0.25, 0),
		}):Play()
		for _, v in pairs(gui:GetDescendants()) do
			if not v:IsA("UICorner") and not v:IsA("UIListLayout") and not v:IsA("UIPadding") then
				if v:IsA("TextButton") or v:IsA("TextLabel") then
					TweenService:Create(v, DisappearTweenInfo, {
						TextTransparency = 1,
					}):Play()
					if v:IsA("TextButton") then
						TweenService:Create(v, DisappearTweenInfo, {
							BackgroundTransparency = 1,
						}):Play()
					end
				elseif v:IsA("ImageButton") or v:IsA("ImageLabel") then
					TweenService:Create(v, DisappearTweenInfo, {
						ImageTransparency = 1,
						BackgroundTransparency = 1,
					}):Play()
				elseif v:IsA("Frame") then
					TweenService:Create(v, DisappearTweenInfo, {
						BackgroundTransparency = 1,
					}):Play()
				end
			end
		end
	end
end
local debounce = false

Player.PlayerGui:WaitForChild("GUI").StartScreenFrame.StartButton.Activated:Connect(function()
	task.wait(2)
	StarterZone.localPlayerEntered:Connect(function()
		repeat
			task.wait()
		until not debounce
		--if not debounce then
		debounce = true
		print("Entering")
		GUIAppearTween(ZoneFrame, true)
		ZoneHeader.Text = "Entering"
		ZoneText.Text = "Starter Forest"
		task.wait(2)
		GUIAppearTween(ZoneFrame, false)
		task.wait(1)
		debounce = false
		--end
	end)
	Wilderness.localPlayerEntered:Connect(function()
		--if not debounce then
		repeat
			task.wait()
		until not debounce
		debounce = true
		print("Entering")
		GUIAppearTween(ZoneFrame, true)
		ZoneHeader.Text = "Entering"
		ZoneText.Text = "The Wilderness"
		task.wait(2)
		GUIAppearTween(ZoneFrame, false)
		task.wait(1)
		debounce = false
		--end
	end)
end)
