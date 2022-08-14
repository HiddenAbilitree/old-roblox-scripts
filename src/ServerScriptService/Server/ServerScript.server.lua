local Players = game:GetService("Players")

local respawnDelay = 3

Players.CharacterAutoLoads = false

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
		player.CharacterAppearanceLoaded:Connect(function()
			task.wait()
			local CurrentDescription = humanoid:GetAppliedDescription()
			CurrentDescription.Head = 0
			CurrentDescription.Torso = 0
			CurrentDescription.LeftArm = 0
			CurrentDescription.RightArm = 0
			CurrentDescription.LeftLeg = 0
			CurrentDescription.RightLeg = 0
			humanoid:ApplyDescription(CurrentDescription)
		end)
		-- find the humanoid, and detect when it dies
		humanoid.Died:Connect(function()
			print(tostring(player) .. " died")
			task.wait(respawnDelay)
			player:LoadCharacter()
			print(tostring(player) .. " respawned")
		end)
	end)
	player:LoadCharacter() -- load the character for the first time
end)

function PlayerJoined(Player)
	Player.CharacterAppearanceLoaded:Connect(function(Character)
		local Humanoid = Character:WaitForChild("Humanoid")
		task.wait()
		local CurrentDescription = Humanoid:GetAppliedDescription()

		CurrentDescription.Head = 0
		CurrentDescription.Torso = 0
		CurrentDescription.LeftArm = 0
		CurrentDescription.RightArm = 0
		CurrentDescription.LeftLeg = 0
		CurrentDescription.RightLeg = 0
		Humanoid:ApplyDescription(CurrentDescription)
	end)
end
Players.PlayerAdded:Connect(function(Player)
	PlayerJoined(Player)
end)
