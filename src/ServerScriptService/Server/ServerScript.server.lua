
local Players = game:GetService("Players")


local respawnDelay = 1

Players.CharacterAutoLoads = false

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		-- find the humanoid, and detect when it dies
		local humanoid = character:FindFirstChild("Humanoid")
		if humanoid then
			humanoid.Died:Connect(function()
				print(player .. " died")
				task.wait(respawnDelay)
				player:LoadCharacter()
				print(player .. " respawned")
			end)
		end
	end)
	player:LoadCharacter() -- load the character for the first time
end)


function PlayerJoined(Player)
	Player.CharacterAdded:Wait()
	local function RemoveMeshes(Character)
		local Humanoid = Character:WaitForChild("Humanoid")
		task.wait()
		local CurrentDescription = Humanoid:GetAppliedDescription()

		CurrentDescription.Head = 0
		CurrentDescription.Torso = 0
		CurrentDescription.LeftArm = 0
		CurrentDescription.RightArm  = 0
		CurrentDescription.LeftLeg = 0
		CurrentDescription.RightLeg = 0
		Humanoid:ApplyDescription(CurrentDescription)
	end
	Player.CharacterAppearanceLoaded:Connect(RemoveMeshes)

end
Players.PlayerAdded:Connect(function(Player)
	PlayerJoined(Player)
end)
