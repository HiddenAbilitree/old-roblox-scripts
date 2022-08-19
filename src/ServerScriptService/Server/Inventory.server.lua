local Event = game.ReplicatedStorage.RemoteEvent

game.Players.PlayerAdded:Connect(function(Player)
	local Inventory = Instance.new("Folder")
	Inventory.Name = "Inventory"
	Inventory.Parent = Player

	Inventory.ChildAdded:Connect(function(Item)
		Event:FireClient(Player, Item, true)
	end)
	Event.OnServerEvent:Connect(function(player, ItemName, ItemType, value)
		local Item = Instance.new(ItemType)
		Item.Parent = player.Inventory
	end)
end)
