local Sword1 = script:GetCustomProperty("Sword1"):WaitForObject()
local Attack1 = script:GetCustomProperty("Attack1"):WaitForObject()
local Attack2 = script:GetCustomProperty("Attack2"):WaitForObject()

local originalTransform = Sword1:GetTransform()
local draw = Transform.New(originalTransform)
draw:SetPosition(Vector3.New(-50, -90, 0))
draw:SetRotation(Rotation.New(60, 50, 180))
function PlayAnimation()
    Sword1:SetTransform(draw)
    Task.Wait(1)
    Sword1:SetTransform(originalTransform)
end
function Cast(ability)
    Task.Spawn(PlayAnimation)
end
Attack2.castEvent:Connect(Cast)