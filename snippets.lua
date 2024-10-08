-- GET PLAYER AND CHARACTER (ServerScriptService)
local Players = game:GetService("Players")
Players.PlayerAdded:Connect(function(player)
	print(player.Name.." player has been added")
	player.CharacterAdded:Connect(function(character)
		print(character.Name.." character has been added")
	end)
end)

-- LEADERBOARD SCRIPT (ServerScriptService)
local Players = game:GetService("Players")
Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder", player)
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
		
	local playerGold = Instance.new("IntValue", leaderstats)
	playerGold.Name = "Gold"
	playerGold.Value = 0
end)

-- GET PLAYER FROM CHARACTER v1
local Players = game:GetService("Players") -- game.Players
local player = Players:FindFirstChild(character.Name)

-- GET PLAYER FROM CHARACTER v2
local Players = game:GetService("Players")
local player = Players:GetPlayerFromCharacter(character)

-- GET LEADERSTATS FROM PLAYER
local leaderstats = player:WaitForChild("leaderstats")
local gold = leaderstats:FindFirstChild("Gold")

-- GET LEADERSTATS FROM PLAYER
local leaderstats = player.leaderstats
local gold = leaderstats and leaderstats:FindFirstChild("Gold")

-- TWEENING A GUI
bar:TweenSize(UDim2.new(0, oxygenLevel/MAXOXYGENLEVEL * 146, 0, 10))
if gold then
	gold.Value += 10
end

-- SHARE A SCRIPT AMOUNT PARTS/MODELS USING TAGGING (Plugin Tag Editor needed)
local CollectionService = game:GetService("CollectionService")
local taggedParts = CollectionService:GetTagged("steps")

for _, taggedPart in pairs(taggedParts) do
	-- local tile = script.Parent
	local isTouched = false -- used to limit the number of times a hit is recorded
	
	taggedPart.Touched:Connect(function(hit)
		local character = hit.Parent
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	
		if humanoid and not isTouched then
			isTouched = true
			print('Part was touched')
      wait(2)
		  isTouched = false
		end
	end)
end

-- DAY/NIGHT CYCLE
local RunService = game:GetService("RunService")

local currentTime = 14.5 * 60 -- 24 hour clock, .5 is 30 minutes, 2:30PM
game.Lighting:SetMinutesAfterMidnight(currentTime)
RunService.Heartbeat:Connect(function(dt)
	currentTime += 5 * dt
	game.Lighting:SetMinutesAfterMidnight(currentTime)
end)

-- DIFFERENTIATE A HUMANOID AS PLAYERS VS NPC
local Players = game:GetService("Players")
if target:IsA("Humanoid") and Players:GetPlayerFromCharacter(target.Parent) then
end

-- KILL WHEN PLAYER TOUCHES A PART
local part = script.Parent
local debounced = true

part.Touched:Connect(function(other)
  local character = other.Parent
  local humanoid = character:FindFirstChildWhichIsA("Humanoid")
  
  if humanoid and debounced then
    debounced = false
    humanoid.BreakJointsOnDeath = true
    humanoid.Health = 0
  end
end)


-- LOADING A SERVERSCRIPTSERVICE module
local moduleName = require(game.ServerScriptService.moduleName)

-- HOW TO STOP AUTO REGEN ON A CHARACTERS HEALTH
-- simply add a script to teh StarterCharacterScripts named 'Health'

-- HOW TO DAMAGE A CHARACTER
local part = script.Parent
local debounced = true
local damageAmount = 5

part.Touched:Connect(function(other)
  local character = other.Parent
  local humanoid = character:FindFirstChildWhichIsA("Humanoid")
  if humanoid and debounced then
    debounced = False
    humanoid:TakeDamage(damageAmount)
    wait(2)
    debounced = True
  end
end)

-- HOW TO HEAL A CHARACTER
local part = script.Parent
local debounced = true
local healAmount = 5

part.Touched:Connect(function(other)
  local character = other.Parent
  local humanoid = character:FindFirstChildWhichIsA("Humanoid")
  if humanoid and debounced then
    debounced = false
    humanoid.Heath += healAmount
    wait(2)
    debounced = true
  end
end)

-- CHARACTER HEALTH CHANGED EVENT
character.Humanoid.HealthChanged:Connect(function()
  -- do something
end)

-- CHANGE SHIRT FOR A CHARACTER
character.Shirt.ShirtTemplate = ...

-- CHANGE PANTS FOR A CHARACTER
character.Pants.PantsTemplate = ...

-- GET CURRENT SHIRT AND PANTS FOR A CHARACTER
local shirt = character.FindFirstChild("Shirt")
local pants = character.FindFirstChild("Pants")

-- REMOVE EVENTS are used to send a message between the client (localScript) and the server
-- NO INFORMATION CAN BE SENT BACK TO THE CLIENT
-- FIRST CREATE a REMOTE EVENT in REPLICATEDSTORAGE (for example removeEvent)

-- client (localScript)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:FindFirstChild("remoteEvent")

removeEvent:FireServer()

-- server (script is ServerScriptService)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:FindFirstChild("remoteEvent")

removeEvent.OnServerEvent:Connect(function(player) 

end)

-- REMOVE FUNCTIONS are used to send a message between the client (localScript) and the server
-- INFORMATION CAN BE RETURNED TO THE CLIENT
-- FIRST CREATE a REMOTE FUNCTION in REPLICATEDSTORAGE (for example removeFunction)

-- client (localScript)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteFunction = ReplicatedStorage:FindFirstChild("remoteFunction")

local answer = removeFunction:InvokeServer(...)

-- server (script is ServerScriptService)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteFunction = ReplicatedStorage:FindFirstChild("remoteFunction")

removeFunction.OnServerInvoke = ... -- name of some function

-- CREATING A TRAIL
-- ADD A TRAIL TO SERVERSTORAGE

local ServerStorage = game:GetService("ServerStorage")
local trail = ServerStorage:FindFirstChild("Trail")
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
  player.CharacterAdded:Connect(function(character)
    local trailCopy = trail:Clone()
    local attachment0 = Instance.new("Attachment", character.Head)
    attachment0.Name = "attachment0"
    local attachment1 = Instance.new("Attachment", character.HumanoidRootPart)
    attachment1.Name = "attachment1"
    trailCopy.Attachment0 = attachment0
    trailCopy.Attachment1 = attachment1
    trailCopy.Parent = character.Head
    trailCopy.Enabled = true
  end)
end)

-- GET A PET (PART) to follow
-- add a part with a StringValue called Owner, the script is attached ot the part
local pet = script.Parent
pet.CanCollide = false
pet.Anchored = false

-- BodyPosition has been superseded by AlignPosition
local petBodyPosition = Instance.new("BodyPosition", pet)
-- BodyGyro has been superseded by AngularOrientation 
local petBodyGyro = Instance.new("BodyGyro", pet)
petBodyGyro.MaxTorque = Vector3.new(900000, 900000, 900000)
local owner = pet.Owner.Value -- owner is a StringValue added to the pet/part
local followPosition = Vector3.new(2, 2, 0)

while wait(1) do
  local ownerObj = workspace:WaitForChild(owner)
  local player = game:GetService("Players"):FindFirstChild(ownerObj)
  local ownerPos = ownerObj.HumanoidRootPart.Position
  local stopAt = ((ownerPos - pet.Position).magnitude - 1) * 1000
  petPos.P = stopAt
  petBodyPosition.Position = ownerPos + followPosition
  petBodyGyro.CFrame = ownerObj.HumanoidRootPart.CFrame
end

-- Waiting for a character in a local script
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- STOP PLAYERS FROM COLLIDING
-- Script placed in ServerScriptService
local PhysicsService = game:GetService("PhysicsService")
local Players = game:GetService("Players")
 
local playerCollisionGroupName = "Players"
PhysicsService:CreateCollisionGroup(playerCollisionGroupName)
PhysicsService:CollisionGroupSetCollidable(playerCollisionGroupName, playerCollisionGroupName, false)
 
local previousCollisionGroups = {}
 
local function setCollisionGroup(object)
  if object:IsA("BasePart") then
    previousCollisionGroups[object] = object.CollisionGroupId
    PhysicsService:SetPartCollisionGroup(object, playerCollisionGroupName)
  end
end
 
local function setCollisionGroupRecursive(object)
  setCollisionGroup(object)
 
  for _, child in ipairs(object:GetChildren()) do
    setCollisionGroupRecursive(child)
  end
end
 
local function resetCollisionGroup(object)
  local previousCollisionGroupId = previousCollisionGroups[object]
  if not previousCollisionGroupId then return end 
 
  local previousCollisionGroupName = PhysicsService:GetCollisionGroupName(previousCollisionGroupId)
  if not previousCollisionGroupName then return end
 
  PhysicsService:SetPartCollisionGroup(object, previousCollisionGroupName)
  previousCollisionGroups[object] = nil
end
 
local function onCharacterAdded(character)
  setCollisionGroupRecursive(character)
 
  character.DescendantAdded:Connect(setCollisionGroup)
  character.DescendantRemoving:Connect(resetCollisionGroup)
end
 
local function onPlayerAdded(player)
  player.CharacterAdded:Connect(onCharacterAdded)
end
 
Players.PlayerAdded:Connect(onPlayerAdded)

-- USE DEBRIS SERVICE TO REMOVE GAME OBJECT NO LONGER REQUIRED
local Debris = game:GetService("Debris")
Debris:AddItem(projectile, 3)

-- CONVEYOR BELT
-- Make sure the part is anchored, add a script with the following
local part = script.Parent
part.Velocity = Vector3.new(20, 0, 0) -- gives a velocity in the X direction

-- DISABLE DEFAULT LEADERSTATS
-- place the following into a LocalScript in StarterPlayerScripts
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)

-- Other default Gui items
Enum.CoreGuiType.Health
Enum.CoreGuiType.Backpack
Enum.CoreGuiType.Chat
Enum.CoreGuiType.All

-- ADD AN ACCESSORY TO A PLAYER
humanoid:AddAsserory(accessory) -- accessory is a model e.g. a helmet

-- DAMAGE A PLAYER
humanoid:TakeDamage(damage) -- damage is a number

-- GETPROPERTYCHANGEDSIGNAL
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local status = ReplicatedStorage:FindFirstChild("status")

status:GetPropertyChangedSignal("Value"):Connection(function() 
  -- do something
end)

-- WAYS TO EXECUTE CODE ON A NEW THREAD
spawn()
delay()
coroutine.wrap()

-- TELEPORT A PLAYER WITHIN A PLACE
-- part is the part you want to teleport the player to
character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 5, 0) -- the vector is to raise the player up
-- Alternatively, you can try something like this. This will teleport with the same orientation as the part 
-- you're teleporting to, and always on top regardless of part/character height. 
-- Just make sure the part has it's top face up or it won't work right.
character.HumanoidRootPart.CFrame = part.CFrame * CFrame.new(0, part.Size.Y / 2 + character:GetExtentsSize().Y, 0)

-- PLAYING ANIMATION DIRECTLY IN LOCAL SCRIPT
local Players = game:GetService("Players")
 
local player = Players.LocalPlayer
local character = player.Character
if not character or not character.Parent then
	character = player.CharacterAdded:Wait()
end
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")
 
-- Create new "Animation" instance
local kickAnimation = Instance.new("Animation")
-- Set its "AnimationId" to the corresponding animation asset ID
kickAnimation.AnimationId = "rbxassetid://2515090838"
 
-- Load animation onto the animator
local kickAnimationTrack = animator:LoadAnimation(kickAnimation)
 
-- Play animation track
kickAnimationTrack:Play()
 
-- If a named event was defined for the animation, connect it to "GetMarkerReachedSignal()"
kickAnimationTrack:GetMarkerReachedSignal("KickEnd"):Connect(function(paramString)
	print(paramString)
end)

-- Bind Action when tool equiped. LocalScript parented to the tool
local ContextActionService = game:GetService("ContextActionService")
 
local ACTION_RELOAD = "Reload"
 
local tool = script.Parent
 
local function handleAction(actionName, inputState, inputObject)
	if actionName == ACTION_RELOAD and inputState == Enum.UserInputState.Begin then
		print("Reloading!")
	end
end
 
tool.Equipped:Connect(function ()
	ContextActionService:BindAction(ACTION_RELOAD, handleAction, true, Enum.KeyCode.R)
end)
 
tool.Unequipped:Connect(function ()
	ContextActionService:UnbindAction(ACTION_RELOAD)
end)

-- ACCESSING A CHARACTER UNDER STARTERGUI or STARTERPACK
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character
if not character or not character.Parent then
    character = player.CharacterAdded:wait()
end

-- ROTATE A PART ABOUT IT's CENTER
local part = script.Parent
part.CFrame *= CFrame.Angles(0, math.rad(5), 0)

-- MOVING PLATFORM
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local part = script.Parent
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, -1, true)

local tween = TweenService:Create(part, tweenInfo, {
	CFrame = part.CFrame * CFrame.new(0, 0, -10)
})

tween:Play()

local lastPosition = part.Position

RunService.Stepped:Connect(function(_, dt)
	local currentPosition = part.Position
	local deltaPosition = currentPosition - lastPosition
	local velocity = deltaPosition / dt
	part.AssemblyLinearVelocity = velocity
	lastPosition = currentPosition
end)
