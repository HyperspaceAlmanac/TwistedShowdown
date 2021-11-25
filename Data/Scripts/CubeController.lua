local Cube = script:GetCustomProperty("Cube"):WaitForObject()
local Target = script:GetCustomProperty("Target"):WaitForObject()   

local start = Cube:GetWorldPosition()
local destination = Target:GetWorldPosition()
local current = Vector3.New(start)
local ref1 = nil
local ref2 = nil

local currentTime = 0
local active = false

function Bezier(start, p2, p3, endPos, time)
    return (1 - time)^3 * start + 3 * (1 - time)^2*time*p2 + 3 * (1- time)^2*time^2*p3 + time^3*endPos
end

function Tick(deltaTime)
    for _, player in ipairs(Game.GetPlayers()) do
        if player:IsBindingPressed("ability_primary") then
            current = Vector3.New(start)
            local distance = (start - destination).size
            local forwardVector = player:GetWorldTransform():GetForwardVector()
            ref1 = Vector3.New(0, 0, distance /4) + player:GetWorldPosition() + Rotation.New(0, 0, -90) * forwardVector * distance / 4
            ref2 = ref1 + forwardVector * distance / 2
            currentTime = 0
            destination = Target:GetWorldPosition()
            start = player:GetWorldPosition()
            active = true
        end
        Cube:LookAt(Target:GetWorldPosition())
        if active then
            local newPosition = Bezier(start, ref1, ref2, destination, currentTime)
            
            Cube:SetWorldPosition(newPosition)
            currentTime = currentTime + deltaTime
            if currentTime > 1 then
                active = false
                currentTime = 0
            end
        end
    end
end
