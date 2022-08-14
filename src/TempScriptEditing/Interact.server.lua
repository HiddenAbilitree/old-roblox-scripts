local Proximity = Instance.new("ProximityPrompt")
--local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = Instance.new("RemoteEvent")
Proximity.Triggered:Connect(function(Player)
	RemoteEvent:FireClient(Player, "TutorialNPC")
	Proximity.Enabled = false
	RemoteEvent.OnServerEvent:Connect(function(Event)
		if Event == "TNPCDone" then
			Proximity.Enabled = true
		end
	end)
end)
