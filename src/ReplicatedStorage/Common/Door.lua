local Zone = require(game:GetService("ReplicatedStorage").Common.Zone)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local DoorSound = ReplicatedStorage.Sounds["Door Close"]

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
	self.door = door
	self.debounce = false
	self.doordebounce = false
	--[[
	if self.door.Size ~= nil then
		self.zone = Zone.fromRegion(CFrame.new(self.door.Position), self.door.Size + Vector3.new(5, 0, 5))
		self.zone:setDetection(1)
		print("Initialized Zone: " .. self.door:GetFullName())
		self.touchConn = self.zone.playerEntered:Connect(function()
			print("Entered")
			self:SetOpen(true)
			self.exitConn = self.zone.playerExited:Connect(function()
				self:SetOpen(false)
			end)
		end)]]
	--[[
		print("No Zone")
		self.touchConn = door.Touched:Connect(function(...)
			self:OnTouch(..., false)
		end)]]

	-- Keep track of some door properties of our own

	-- Initialize a Touched event to call a method of the door

	-- Initialize the state of the door
	local DoorClone = DoorSound:Clone()
	DoorClone.Parent = self.door
	self:SetOpen(false)

	self.proxim = Instance.new("ProximityPrompt")
	self.proxim.ActionText = "Open"
	self.proxim.Parent = self.door

	self.proxim.Triggered:Connect(function()
		if not self.doordebounce then
			self.doordebounce = true
			if not self.door.CanCollide then
				self:SetOpen(false)
				self.proxim.ActionText = "Open"
			elseif self.door.CanCollide then
				self:SetOpen(true)
				self.proxim.ActionText = "Close"
			end
			DoorClone:Play()
			task.wait(1.5)
			self.doordebounce = false
		end
	end)

	-- Print a message so we know when doors are initialized
	print("Initialized door: " .. door:GetFullName())

	return self
end

function Door:SetOpen(isOpen, play)
	if isOpen then
		self.door.Transparency = 0.75
		self.door.CanCollide = false
	else
		self.door.Transparency = 0
		self.door.CanCollide = true
	end
end

function Door:OnTouch(object, value)
	if self.debounce then
		print("Debounce")
		return
	end
	if not value then
		local human = object.Parent:FindFirstChild("Humanoid")
		if not human then
			print("No Humanoid")
			return
		end
	end
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

return Door
