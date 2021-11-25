local Cube = script.parent.parent
local Curve = script:GetCustomProperty("Curve")

local current = 0
function Tick(deltaTime)
    Cube:SetWorldPosition(Vector3.New(300, Curve:GetValue(current), 500))
    current = (current + deltaTime) % 6
end