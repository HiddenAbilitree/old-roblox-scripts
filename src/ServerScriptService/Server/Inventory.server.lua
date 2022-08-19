local Event = game.ReplicatedStorage.RemoteEvent

game.Players.PlayerAdded:Connect(function(Player)
	local Inventory = Instance.new("Folder")
	Inventory.Name = "Inventory"
	Inventory.Parent = Player

	Inventory.ChildAdded:Connect(function(item)
		Event:FireClient(Player, item, true)
	end)
	Inventory.OnServerEvent:Connect(function(PLayer, Item, Value)
		print("Bru")
	end)
end)
