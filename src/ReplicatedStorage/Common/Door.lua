------------------------------------------------------------------------------
-- In this section of the script, we define a Door class. This could be placed in
-- its own independent ModuleScript.

-- For more information on this class pattern, check out
-- the object-oriented programming chapter in Programming in Lua:
-- https://www.lua.org/pil/16.html

local Door = {}
Door.__index = Door
Door.TAG_NAME = "Door"
Door.OPEN_TIME = 2

function Door.new(door)
	-- Create a table which will act as our new door object.
	local self = {}
	-- Setting the metatable allows the table to access
	-- the SetOpen, OnTouch and Cleanup methods even if we did not
	-- add all of the functions ourself - this is because the
	-- __index metamethod is set in the Door metatable.
	setmetatable(self, Door)

	-- Keep track of some door properties of our own
	self.door = door
	self.debounce = false

	-- Initialize a Touched event to call a method of the door
	self.touchConn = door.Touched:Connect(function(...)
		self:OnTouch(...)
	end)

	-- Initialize the state of the door
	self:SetOpen(false)

	-- Print a message so we know when doors are initialized
	print("Initialized door: " .. door:GetFullName())

	return Door
end

function Door:SetOpen(isOpen)
	if isOpen then
		self.door.Transparency = 0.75
		self.door.CanCollide = false
	else
		self.door.Transparency = 0
		self.door.CanCollide = true
	end
end

function Door:OnTouch(part)
	local human = part.Parent:FindFirstChild("Humanoid")

	self.debounce = true
	self:SetOpen(true)
	task.wait(Door.OPEN_TIME)
	self:SetOpen(false)
	self.debounce = false
end

function Door:Cleanup()
	self.touchConn:disconnect()
	self.touchConn = nil
end
