local UIS = game:GetService("UserInputService")

local plr = game.Players.LocalPlayer
local Char = plr.Character or plr.CharacterAdded:Wait()
local HRP = Char:WaitForChild("HumanoidRootPart")
local Hum = Char:WaitForChild("Humanoid")
local Head = Char:WaitForChild("Head")

local HittingWall = false
local OnWall = false

local Normal
local Pos
local Wall
local previousWall

function upclimb()
	if HittingWall == true then
		HRP.Velocity = Vector3.new(0, 0, 0)
		HRP.Anchored = false
		if OnWall then
			local bv = HRP:FindFirstChild("BV")
			bv.Velocity = HRP.CFrame.LookVector * 0 + Vector3.new(0, 12.5, 0)
		end
	end
end

function downclimb()
	if HittingWall == true then
		HRP.Velocity = Vector3.new(0, 0, 0)
		HRP.Anchored = false
		if OnWall then
			local bv = HRP:FindFirstChild("BV")
			bv.Velocity = HRP.CFrame.LookVector * 0 + Vector3.new(0, -12.5, 0)
		end
	end
end

function upclimboff()
	HRP.Anchored = true
	local bv = HRP:FindFirstChild("BV")
	bv.Velocity = HRP.CFrame.LookVector * 0 + Vector3.new(0, bv.Velocity.Y - 12.5, 0)
end

function downclimboff()
	HRP.Anchored = true
	local bv = HRP:FindFirstChild("BV")
	bv.Velocity = HRP.CFrame.LookVector * 0 + Vector3.new(0, bv.Velocity.Y + 12.5, 0)
end

task.spawn(function()
	while game:GetService("RunService").RenderStepped:Wait() do
		local r = Ray.new(Head.CFrame.p, Head.CFrame.LookVector * 5)
		local hit, pos, normal = workspace:FindPartOnRay(r, Char)

		if hit then
			if hit.Name == "WallClimb" then
				HittingWall = true

				Pos = Pos
				Normal = normal
				Wall = hit
				previousWall = hit
			end
		end

		if not hit then
			if HRP:FindFirstChild("BV") and OnWall then
				local bv = HRP:FindFirstChild("BV")
				bv.Velocity = Vector3.new(0, 0, 0)
				bv.Velocity = HRP.CFrame.lookVector * 10 + Vector3.new(0, 40, 0)

				game.Debris:AddItem(bv, 0.15)
				OnWall = false
				Hum.AutoRotate = true
				Hum.PlatformStand = false
			elseif HRP:FindFirstChild("BV") == nil and OnWall then
				local bv = Instance.new("BodyVelocity", HRP)
				bv.MaxForce = Vector3.new(1, 1, 1) * math.huge
				bv.Velocity = HRP.CFrame.LookVector * 10 + Vector3.new(0, 40, 0)

				game.Debris:AddItem(bv, 0.15)
				OnWall = false
				Hum.AutoRotate = true
				Hum.PlatformStand = false
			end

			Pos = nil
			normal = nil
		end
		task.wait()
	end
end)

UIS.InputBegan:Connect(function(Key, Chat)
	if Key.KeyCode == Enum.KeyCode.X and not Chat then
		if HittingWall == true then
			if not OnWall then
				if Normal == nil then
					return
				end
				OnWall = true
				HRP.CFrame = CFrame.new(
					HRP.CFrame.p,
					Vector3.new(HRP.Position.X - Normal.x, HRP.Position.Y, HRP.Position.Z - Normal.z)
				)

				local bv = Instance.new("BodyVelocity", HRP)
				bv.MaxForce = Vector3.new(1, 1, 1) * math.huge
				bv.Velocity = HRP.CFrame.LookVector * 0
				bv.Name = "BV"

				Char.Humanoid.AutoRotate = false
				Char.Humanoid.PlatformStand = true
			else
				HRP:FindFirstChild("BV"):Destroy()
				Char.Humanoid.AutoRotate = true
				Char.Humanoid.PlatformStand = false
				OnWall = false
			end
		end
	elseif Key.KeyCode == Enum.KeyCode.W and not Chat then
		upclimb()
	elseif Key.KeyCode == Enum.KeyCode.S and not Chat then
		downclimb()
	end
end)

UIS.InputEnded:Connect(function(Key, Chat)
	if Key.KeyCode == Enum.KeyCode.W and not Chat and OnWall then
		upclimboff()
	elseif Key.KeyCode == Enum.KeyCode.S and not Chat and OnWall then
		downclimboff()
	end
end)
