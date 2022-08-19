local CollectionService = game:GetService("CollectionService")
local Door = require(game:GetService("ReplicatedStorage").Common.Door)
local doors = {}

local doorAddedSignal = CollectionService:GetInstanceAddedSignal(Door.TAG_NAME)
local doorRemovedSignal = CollectionService:GetInstanceRemovedSignal(Door.TAG_NAME)

local function onDoorAdded(door)
	if door:IsA("BasePart") then
		-- Create a new Door object and save it
		-- The door class will take over from here!
		doors[door] = Door.new(door)
	end
end

local function onDoorRemoved(door)
	if doors[door] then
		-- Clean up an already-existing door
		doors[door]:Cleanup()
		doors[door] = nil
	end
end

-- Listen for existing tags, tag additions and tag removals for the door tag
for _, inst in pairs(CollectionService:GetTagged(Door.TAG_NAME)) do
	onDoorAdded(inst)
end
doorAddedSignal:Connect(onDoorAdded)
doorRemovedSignal:Connect(onDoorRemoved)
