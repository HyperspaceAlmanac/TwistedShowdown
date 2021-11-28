local API = require(script:GetCustomProperty("APITest"))

Task.Wait(3)
local g = _G
print(API.GetInfo("value"))