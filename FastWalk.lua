-- SHIFT TO SPEED WALK
-- Add this to StarterPlayer->StarterPlayerScripts

local UserInputService = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local FAST_WALK = 32
local NORMAL_WALK = 16

local function OnInputBegan(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
		humanoid.WalkSpeed = FAST_WALK -- character.Humanoid.WalkSpeed = FAST_WALK
	end
end

local function OnInputEnded(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
		humanoid.WalkSpeed = NORMAL_WALK -- character.Humanoid.WalkSpeed = NORMAL_WALK
	end
end

UserInputService.InputBegan:Connect(OnInputBegan)
UserInputService.InputEnded:Connect(OnInputEnded)
