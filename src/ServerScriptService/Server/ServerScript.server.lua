local Players = game:GetService("Players")

local respawnDelay = 3

Players.CharacterAutoLoads = false

Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAppearanceLoaded:Connect(function(Character)
		local Humanoid = Character:WaitForChild("Humanoid")
		local CurrentDescription = Humanoid:GetAppliedDescription()
		CurrentDescription.Head = 0
		CurrentDescription.Torso = 0
		CurrentDescription.LeftArm = 0
		CurrentDescription.RightArm = 0
		CurrentDescription.LeftLeg = 0
		CurrentDescription.RightLeg = 0
		Humanoid:ApplyDescription(CurrentDescription)
	end)
	Player.CharacterAdded:Connect(function(Character)
		Character.Humanoid.Died:Connect(function()
			print(tostring(Player) .. " died")
			task.wait(respawnDelay)
			Player:LoadCharacter()
			print(tostring(Player) .. " respawned")
		end)
	end)
	Player:LoadCharacter()
end)
