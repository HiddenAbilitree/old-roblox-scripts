local EToPickUp = {}
EToPickUp.__index = EToPickUp
EToPickUp.TAG_NAME = "EToPickUp"

function EToPickUp.new(item)
	-- Create a table which will act as our new door object.
	local self = {}
	-- Setting the metatable allows the table to access
	-- the SetOpen, OnTouch and Cleanup methods even if we did not
	-- add all of the functions ourself - this is because the
	-- __index metamethod is set in the Door metatable.
	setmetatable(self, EToPickUp)
	self.item = item
	self.item:WaitForChild("TouchInterest"):Destroy()
	self.proxim = Instance.new("ProximityPrompt")
	self.proxim.ActionText = "Pick Up"
	self.proxim.Parent = self.item
	self.proxim:Destroy()
	self.proxim.Triggered:Connect(function(player)
		local PlayerItem = self.item.Parent:Clone()
		PlayerItem.Parent = player.Backpack

		self.tool:Destroy()
	end)

	-- Print a message so we know when doors are initialized
	print("Initialized Item: " .. item:GetFullName())

	return self
end

return EToPickUp
