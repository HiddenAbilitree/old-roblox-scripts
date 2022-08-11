local Players = game:GetService("Players")
--local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService('Debris')
local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local Camera = workspace.Camera
local CurrentCamera = workspace.CurrentCamera

local Player = Players.LocalPlayer
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

local DashSound = ReplicatedStorage.Sounds["Dash Sound Effect"]

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

local function CharacterAdded(char)
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
				debounce = false
				sprinting = false
			end
		end)
		task.wait(0.5)
		repeat
			task.wait()
		until not debounce
		scriptdebounce = false
		Second:Disconnect()
		Third:Disconnect()
	end
end)
-- Run Script
--[[UserInputService.InputBegan:Connect(function(input)
	if not IsDead and input.KeyCode==Enum.KeyCode.W then --and not Character.IsStunned.Value
		local StartConnection
		local EndConnection
		local InterruptConnection
		StartConnection = UserInputService.InputBegan:Connect(function(input2)
			if input2.KeyCode==Enum.KeyCode.W and Character.CanRun.Value and not debounce then
				debounce = true
				StartSprinting()
				EndConnection = UserInputService.InputEnded:Connect(function(input3)
					if input3.KeyCode==Enum.KeyCode.W then
						EndSprinting()
						EndConnection:Disconnect()
						InterruptConnection:Disconnect()
						task.wait(.4)
						Character.CanRun.Value =true
						debounce = false
					end
				end)
				InterruptConnection = Character.CanRun:GetPropertyChangedSignal("Value"):Connect(function()
					if not Character.CanRun.Value  then
						Humanoid.WalkSpeed = 5
						toWalkTween:Play()
						EndConnection:Disconnect()
						InterruptConnection:Disconnect()
						task.wait(1.5)
						Character.CanRun.Value =true
						debounce = false
					end
				end)
			end
		end)
		--[[
		task.wait(0.23)
		if not debounce then
			StartConnection:Disconnect()
			EndSprinting()
		elseif debounce then
			repeat
                task.wait()
            until not debounce
			StartConnection:Disconnect()
			EndSprinting()
		else
			print("Sprinting Error")
		end
	elseif IsDead then
		onDeath()
	end
end)


]]


local function PlayerAdded(player)

	player.CharacterAdded:Connect(CharacterAdded)

	local char = player.Character
	if char then
		CharacterAdded(char)
	end
end

for _,v in pairs(game.Players:GetPlayers()) do
	PlayerAdded(v)
end

Players.PlayerAdded:Connect(PlayerAdded)

Humanoid.Died:Connect(function()
	onDeath()
end)



--[[
UserInputService.InputBegan:Connect(function(key)
	if not dashdebounce and key.KeyCode == Enum.KeyCode.Q and Humanoid.MoveDirection.Magnitude>0 then
		dashdebounce = true
		print(Humanoid.WalkSpeed)
		Humanoid.WalkSpeed += dashSpeed
		print(Humanoid.WalkSpeed)
		--DashSound:Play()
		--animation:Play()
		for _, v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") and trailEnabled then
				addTrail(v,dashCooldown)
			end
		end
		print(Humanoid.WalkSpeed)
		task.wait(dashDuration)
		print(Humanoid.WalkSpeed)
		Humanoid.WalkSpeed -= dashSpeed
		print(Humanoid.WalkSpeed)
		task.wait(dashCooldown)
		dashdebounce = false
	end
end)]]
