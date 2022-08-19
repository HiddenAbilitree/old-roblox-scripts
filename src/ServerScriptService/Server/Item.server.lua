local CollectionService = game:GetService("CollectionService")
local EToPickUp = require(game:GetService("ReplicatedStorage").Common.EToPickUp)
local EToPickUps = {}

local EToPickUpAddedSignal = CollectionService:GetInstanceAddedSignal(EToPickUp.TAG_NAME)
local EToPickUpRemovedSignal = CollectionService:GetInstanceRemovedSignal(EToPickUp.TAG_NAME)

local function onEToPickUpAdded(item)
	EToPickUps[item] = EToPickUp.new(item)
end

local function onEToPickUpRemoved(item)
	if EToPickUps[item] then
		EToPickUps[item]:Cleanup()
		EToPickUps[item] = nil
	end
end

for _, inst in pairs(CollectionService:GetTagged(EToPickUp.TAG_NAME)) do
	onEToPickUpAdded(inst)
end
EToPickUpAddedSignal:Connect(onEToPickUpAdded)
--EToPickUpRemovedSignal:Connect(onEToPickUpRemoved)
