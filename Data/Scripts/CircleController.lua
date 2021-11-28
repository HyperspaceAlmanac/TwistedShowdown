local circle = script.parent
local eqp = script:FindAncestorByType("Equipment")

function Tick(deltaTime)
    circle:SetWorldPosition(eqp:GetWorldPosition() + Vector3.New(0, 0, 125))
    circle:SetWorldRotation(Rotation.ZERO)
end