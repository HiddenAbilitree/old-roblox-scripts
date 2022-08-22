local CollectionService = game:GetService("CollectionService")
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
	self.tool = self.item.Parent
	self.tool.CanBeDropped = false
	self.item:WaitForChild("TouchInterest"):Destroy()

	if self.tool.Parent.Name ~= "Backpack" then
		self.clone = self.tool:Clone()
		self.proxim = Instance.new("ProximityPrompt")
		self.proxim.ActionText = "Pick Up"
		self.proxim.Parent = self.item
		self.proxim.Triggered:Connect(function(player)
			self.clone.Parent = player.Backpack
			self.tool:Destroy()
		end)
	else
		CollectionService:RemoveTag(self.item, "EToPickUp")
		print(CollectionService:HasTag(self.item, "EToPickUp"))
	end

	-- Print a message so we know when doors are initialized
	print("Initialized Item: " .. item:GetFullName())

	return self
end

return EToPickUp
