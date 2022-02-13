-- DEFINING A MODULE
local sampleVariable = "World!"

local moduleName = {}

function moduleName.example() 
  print("Hello "..sampleVariable)
end

return moduleName

-- USING A MODULE
local moduleName = require(game.ServerScriptService.moduleName)

moduleName.example()
-- will print Hello World!
