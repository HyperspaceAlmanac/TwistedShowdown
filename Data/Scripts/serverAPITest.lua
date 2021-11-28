local API = require(script:GetCustomProperty("APITest"))

API.SaveInfo("Hello World")

Task.Wait(3)
print(API.GetInfo("value"))