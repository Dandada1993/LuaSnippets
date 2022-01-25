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
	
	local playerGold = Instance.new("IntValue", leaderstats)
	playerGold.Name = "Gold"
	playerGold.Value = 0
end)

-- GET PLAYER FROM CHARACTER v1
local Players = game:GetService("Players") -- game.Players
local player = Players.FindFirstChild(character.Name)

-- GET PLAYER FROM CHARACTER v2
local Players = game:GetService("Players")
local player = Players:GetPlayerFromCharacter(character)

-- GET LEADERSTATS FROM PLAYER
local leaderstats = player:WaitForChild("leaderstats")
local gold = leaderstats:FindFirstChild("Gold")

-- GET LEADERSTATS FROM PLAYER
local leaderstats = player.leaderstats
local gold = leaderstats and leaderstats:FindFirstChild("Gold")
if gold then
	gold.Value += 10
end

-- SHARE A SCRIPT AMOUNT PARTS/MODELS USING TAGGING (Plugin Tag Editor needed)
local CollectionService = game:GetService("CollectionService")
local taggedParts = CollectionService.GetTagged("steps")

for _, taggedPart in pairs(taggedParts) do
	-- local tile = script.Parent
	local debounced = True -- used to limit the number of times a hit is recorded
	
	taggedPart.Touched:Connect(function(hit)
		local character = hit.Parent
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	
		if humanoid and debounced then
			debounced = False
			print('Part was touched')
		end
		wait(2)
		debounced = True
	end)
end

-- DAY/NIGHT CYCLE
local startMinutes = 12 * 60

while wait(0.01) do
	game.Lighting:SetMinutesAfterMidnight(startMinutes)
	startMinutes += 1
end

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

local answer = removeEvent.

-- server (script is ServerScriptService)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:FindFirstChild("remoteEvent")

removeEvent.OnServerEvent:Connect(function(player) 

end)


