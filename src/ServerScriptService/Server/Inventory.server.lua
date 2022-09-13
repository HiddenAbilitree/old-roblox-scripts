local Event = game.ReplicatedStorage.RemoteEvent

game.Players.PlayerAdded:Connect(function(Player)
	local Inventory = Instance.new("Folder")
	Inventory.Name = "Inventory"
	Inventory.Parent = Player

	Inventory.ChildAdded:Connect(function(Item)
		Event:FireClient(Player, Item, true, true)
	end)
	Event.OnServerEvent:Connect(function(player, ItemObject, ItemType, value, count)
		if value then
			local Item = ItemObject
			Item.Parent = player.Inventory
			local Stackable = Instance.new("BoolValue")
			if ItemType == "Tool" then
				Stackable = false
			elseif ItemType == "Resource" then
				Stackable = true
				Item.Amount = count
			end
		elseif not value then
			if ItemType == "Tool" then
				Inventory.ItemObject.Parent = nil
			elseif ItemType == "Resource" then
				if Inventory.ItemObject.Amount < count then
					Inventory.ItemObject.Amount = 0
				elseif Inventory.ItemObject.Amount > count then
					Inventory.ItemObject.Amount -= count
				elseif Inventory.ItemObject.Amount == count then
					Inventory.ItemObject.Parent = nil
				end
			end
		end

		local Item = ItemObject

		Item.Parent = player.Inventory
	end)
end)
