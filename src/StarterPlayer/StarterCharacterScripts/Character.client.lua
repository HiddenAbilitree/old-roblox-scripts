local Players = game:GetService("Players")
--local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService('Debris')
--local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local Camera = workspace.Camera
local CurrentCamera = workspace.CurrentCamera

--local Player = Players.LocalPlayer
local Character = script.Parent
local Humanoid = Character:WaitForChild("Humanoid")

local WALK_SPEED = 16
local SPRINT_SPEED_ADD = 4
local SPRINT_FOV = 90
local WALK_FOV = 70

Humanoid.WalkSpeed = WALK_SPEED

local SprintProperties = {FieldOfView = SPRINT_FOV}
local toSprintInfo = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local toSprintTween = TweenService:Create(CurrentCamera, toSprintInfo, SprintProperties)

local WalkProperties = {FieldOfView = WALK_FOV}
local toWalkInfo = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local toWalkTween = TweenService:Create(CurrentCamera, toWalkInfo, WalkProperties)

--local DashSound = ReplicatedStorage.Sounds["Dash Sound Effect"]

local CanRun = Instance.new("BoolValue")
CanRun.Parent = script.Parent
CanRun.Name = "CanRun"
CanRun.Value = true
local IsDead = false
local debounce = false
local sprinting = false
local scriptdebounce = false
local function StartSprinting()
	Humanoid.WalkSpeed += SPRINT_SPEED_ADD
	toSprintTween:Play()
end

local function EndSprinting()
	Humanoid.WalkSpeed -= SPRINT_SPEED_ADD
	toWalkTween:Play()
end

local function onDeath()
	toWalkTween:Play()
	Humanoid.WalkSpeed = WALK_SPEED
	CurrentCamera.FieldOfView = WALK_FOV
	Character.CanRun.Value = false
	IsDead = true
	sprinting = false
	scriptdebounce = false
	debounce = true
end

local function CharacterAdded()
	toWalkTween:Play()
	Humanoid.WalkSpeed = WALK_SPEED
	CurrentCamera.FieldOfView = WALK_FOV
	IsDead = false
end

UserInputService.InputBegan:Connect(function(key1)			--First W Input
	if key1.KeyCode == Enum.KeyCode.W and not debounce and not scriptdebounce and not IsDead then
		scriptdebounce = true
		print("First")
		local Second
		local Third
		Second = UserInputService.InputBegan:Connect(function(key2)	--Second W input
			if key2.KeyCode == Enum.KeyCode.W and not sprinting and not debounce then
				print("Second")
				StartSprinting()
				debounce = true
				sprinting = true
			end
		end)
		Third = UserInputService.InputEnded:Connect(function(key3) --Second W input ends
			if key3.KeyCode == Enum.KeyCode.W and sprinting and debounce then
				print("Ended")
				EndSprinting()
				sprinting = false
				task.wait(0.5)
				debounce = false
			end
		end)
		task.wait(0.2)
		repeat
			task.wait()
		until not debounce
		scriptdebounce = false
		Second:Disconnect()
		Third:Disconnect()
	end
end)

local DashDebounce = false
local DashCooldown = 1.5
local DashDuration = 0.5
local DashSpeed = 50
local TrailEnabled = true
local function AddTrails()
	for _, v in pairs(Character:GetChildren()) do
		if v:IsA("BasePart") and TrailEnabled then
			local Att1 = Instance.new("Attachment")
			Att1.Parent = v
			Att1.Orientation = Vector3.new(-90, 0, 0)
			Att1.Position = Vector3.new(0,0.5,0)
			local Att2 = Instance.new("Attachment")
			Att2.Parent = v
			Att2.Orientation = Vector3.new(-90, 0, 0)
			Att2.Position = Vector3.new(0,-0.5,0)
			local Trail = Instance.new("Trail")
			Trail.Parent = v
			Trail.Attachment0 = Att1
			Trail.Attachment1 = Att2
			Trail.Lifetime = 0.1
			Debris:AddItem(Att1, DashDuration)
			Debris:AddItem(Att2, DashDuration)
			Debris:AddItem(Trail, 0.5)
		end
	end
end

UserInputService.InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.Q and not DashDebounce then
		DashDebounce = true
		Humanoid.WalkSpeed += DashSpeed
		AddTrails()
		task.wait(DashDuration)
		Humanoid.WalkSpeed -= DashSpeed
		task.wait(DashCooldown)
		DashDebounce = false
	end
end)

local function PlayerAdded(player)

	player.CharacterAdded:Connect(CharacterAdded)

	local char = player.Character
	if char then
		CharacterAdded()
	end
end

for _,v in pairs(game.Players:GetPlayers()) do
	PlayerAdded(v)
end

Players.PlayerAdded:Connect(PlayerAdded)

Humanoid.Died:Connect(function()
	onDeath()
end)




