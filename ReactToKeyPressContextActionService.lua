-- LocalScript
local ContextActionService = game:GetService("ContextActionService")

local ACTION_NAME = "mpressed"

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
  if actionName = ACTION_NAME and inputState == Enum.UserInputState.Begin then
    DropMarker()
  end
end

ContextActionService:BindAction(ACTION_NAME, CreateMarker, true, Enum.KeyCode.M)
