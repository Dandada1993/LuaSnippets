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
		local humanoid = character:FindFirstChild("Humanoid")
	
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
  local humanoid = character:FindFirstChild("Humanoid")
  
  if humanoid and debounced then
    debounced = false
    humanoid.BreakJointsOnDeath = true
    humanoid.Health = 0
  end
end)
