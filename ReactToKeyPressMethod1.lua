-- The downside to using the ContextActionService is that if the user type an 'm'
-- in the Chat a marker would be dropped

local ContextActionService = game:GetService("ContextActionService")

local function DropMarker()
  local player = game:GetService("Players").LocalPlayer
  local character = player.Character or player.CharacterAdded:Wait()
  local humanoid = character:FindFirstChildWhichIsA("Humanoid")
  
  if humanoid then
    local marker = Instance.new("Part", workspace)
    marker.Name = "GameMarker"
    marker.Shape = Enum.PartType.Ball
    marker.Size = Vector3.new(1,1,1)
    marker.Anchored = true
    marker.Position = humanoid.HumanoidRootPart.Position
    marker.BrickColor = BrickColor.new("Bright Yellow")
    marker.Material = Enum.Material.Neom
  end
end

local function CreateMarker(actionName, inputState, inputObject)
  if inputState == Enum.UserInputService.Begin then
    DropMarker()
  end
end

ContextActionService:BindAction("mpressed", CreateMarker, true, Enum.KeyCode.M)
