-- API 
local API = require(script:GetCustomProperty("GameStateAPI"))

-- Sword 
local HazardBarrel = script:GetCustomProperty("HazardBarrel")
local mission1 = {
    {
        time = 5,
        objects = {
            {
                {template = HazardBarrel,
                    position = Vector3.New(-19250, 15550, -4200),
                    rotation = Rotation.ZERO, health = 200
                }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 4 sacred trees"
    }
}
function GetTable(num)
    return {mission1, 100}
end

API.registerCallBack(GetTable)