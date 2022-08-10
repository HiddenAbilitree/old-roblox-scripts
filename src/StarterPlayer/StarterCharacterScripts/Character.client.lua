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
local SPRINT_SPEED = 20
local SPRINT_FOV = 90
local WALK_FOV = 70

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

local function StartSprinting()
	Humanoid.WalkSpeed = SPRINT_SPEED
	toSprintTween:Play()
end

local function EndSprinting()
	Humanoid.WalkSpeed = WALK_SPEED
	toWalkTween:Play()
end

local function onDeath()
	toWalkTween:Play()
	Humanoid.WalkSpeed = WALK_SPEED
	CurrentCamera.FieldOfView = WALK_FOV
	Character.CanRun.Value = false
	IsDead = true
end

local function CharacterAdded(char)
	toWalkTween:Play()
	Humanoid.WalkSpeed = WALK_SPEED
	CurrentCamera.FieldOfView = WALK_FOV
	char.CanRun.Value = true
	IsDead = false
end

-- Run Script
UserInputService.InputBegan:Connect(function(input)
	if not IsDead and input.KeyCode==Enum.KeyCode.W  then --and not Character.IsStunned.Value
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
		wait(0.23)
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



-- Dash Script

--Trail Function

local trailHeight = 0.25
local trailWidth = .1
local function addTrail(object, length)
	local Att1 = Instance.new("Attachment")
    Att1.Parent = object
	Att1.Orientation = Vector3.new(-90, 0, 0)
	Att1.Position = Vector3.new(trailWidth,trailHeight,0)
	local Att2 = Instance.new("Attachment")
    Att2.Parent = object
	Att2.Orientation = Vector3.new(-90, 0, 0)
	Att2.Position = Vector3.new(-trailWidth,-trailHeight,0)
	local Trail = Instance.new("Trail")
    Trail.Parent = object
	Trail.Attachment0 = Att1
	Trail.Attachment1 = Att2
	Trail.Lifetime = 0.1
	Trail.Color = ColorSequence.new(Color3.new(0.921569, 1, 0.0470588),Color3.new(1, 1, 1))
	Debris:AddItem(Att1, length)
	Debris:AddItem(Att2, length)
	Debris:AddItem(Trail, 0.5)
end

--Dash Animation

local animation
for _,v in ipairs(ReplicatedStorage.Animations:GetChildren()) do 
	if v:IsA("Animation") and v.Name == "Dash Animation" then 
		animation = Player.Character:WaitForChild("Humanoid"):LoadAnimation(v)
	end
end

--Dash Script

local dashdebounce = false
local dashDuration = .5
local dashSpeed = 50
local dashCooldown = 1.5
local trailEnabled = true
UserInputService.InputBegan:Connect(function(key)
	if not dashdebounce and key.KeyCode == Enum.KeyCode.Q and Humanoid.MoveDirection.Magnitude>0 then
		dashdebounce = true
		Humanoid.WalkSpeed += dashSpeed
		DashSound:Play()
		animation:Play()
		for _, v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") and trailEnabled then
				addTrail(v,dashCooldown)
			end
		end
		task.wait(dashDuration)
		Humanoid.WalkSpeed -= dashSpeed
		task.wait(dashCooldown)
		dashdebounce = false
	end
end)

