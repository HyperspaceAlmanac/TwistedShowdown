local Swords = script:GetCustomProperty("Swords"):WaitForObject()
local Sword1 = script:GetCustomProperty("Sword1"):WaitForObject()
local Blade1 = Sword1:GetCustomProperty("Blade"):WaitForObject()
local Sword2 = script:GetCustomProperty("Sword2"):WaitForObject()
local Blade2 = Sword2:GetCustomProperty("Blade"):WaitForObject()
local Sword3 = script:GetCustomProperty("Sword3"):WaitForObject()
local Blade3 = Sword3:GetCustomProperty("Blade"):WaitForObject()
local QuickSlash = script:GetCustomProperty("QuickSlash"):WaitForObject()
local PowerSlash = script:GetCustomProperty("PowerSlash"):WaitForObject()

local originalTransform1 = Sword1:GetTransform()
local originalTransform2 = Sword2:GetTransform()
local originalTransform3 = Sword3:GetTransform()

local b1_pos = Blade1:GetPosition()
local b1_rot = Blade1:GetRotation()
local b2_pos = Blade2:GetPosition()
local b2_rot = Blade2:GetRotation()
local b3_pos = Blade3:GetPosition()
local b3_rot = Blade3:GetRotation()

local weapon = script.parent.parent
local local_player = Game.GetLocalPlayer()

function PlayQuickAnimation()
    Blade1:MoveTo(Vector3.New(0, 0, 86), 0.1, true)
    Task.Wait(0.1)
    --Blade1:RotateTo(Rotation.New(-50, 50, 180), 0.2, true)
    --Blade1:MoveTo(Vector3.New(-65, 30, 60), 0.2, true)
    Blade1:RotateTo(Rotation.New(-72.4, 50, 124.7), 0.2, true)
    Blade1:MoveTo(Vector3.New(-48.7, 38.6, 77.8), 0.2, true)
    Sword1:MoveTo(Vector3.New(-75, -75, 0), 0.2, true)
    Task.Wait(0.2)
    --Blade1:SetRotation(Rotation.New(0, 0, 0))
    Sword1:MoveTo(Vector3.New(-75, 75, 0), 0.2, true)
    Sword2:MoveTo(Vector3.New(-125, -75, 0), 0.2, true)
    Sword3:MoveTo(Vector3.New(-100, 0, 0), 0.2, true)
    --Blade1:RotateTo(Rotation.New(-45, 0, -90), 0.2, true)
    --Blade1:MoveTo(Vector3.New(-90, 0, 60), 0.2, true)
    --Blade1:MoveTo(Vector3.New(-30, -20, 30), 0.2, true)
    --Blade1:RotateTo(Rotation.New(-50, -50, -75), 0.2, true)
    Blade1:MoveTo(Vector3.New(-90, -30, -30), 0.2, true)
    Blade1:RotateTo(Rotation.New(-70, -50, -65), 0.2, true)
    Task.Wait(0.2)
    Blade1:MoveTo(Vector3.New(0, 0, 86), 0.2, true)
    Blade1:RotateTo(b1_rot, 0.2, true)
    Task.Wait(0.2)
    Blade1:MoveTo(b1_pos, 0.1, true)
    Task.Wait(0.1)
    Sword1:SetTransform(originalTransform1)
    Sword2:SetTransform(originalTransform2)
    Sword3:SetTransform(originalTransform3)
end
function PlayPowerAnimation()
    Blade3:MoveTo(Vector3.New(0, 0, 86), 0.2, true)
    Task.Wait(0.2)

    Sword3:MoveTo(Vector3.New(-100, -75, 0), 0.2, true)
    Sword2:MoveTo(Vector3.New(-100, 75, 0), 0.2, true)
    Sword1:MoveTo(Vector3.New(-125, 0, 0), 0.2, true)
    --Blade3:MoveTo(Vector3.New(-100, -70, 60), 0.2, true)
    --Blade3:RotateTo(Rotation.New(60, 0, 90), 0.2, true)
    Blade3:MoveTo(Vector3.New(-99, -100, 164.1), 0.2, true)
    Blade3:RotateTo(Rotation.New(79.6, 36.3, 156), 0.2, true)
    Task.Wait(0.2)

    Blade2:MoveTo(Vector3.New(0, 0, 86), 0.2, true)
    Task.Wait(0.2)

    Sword3:MoveTo(Vector3.New(-125, -75, 0), 0.2, true)
    Sword2:MoveTo(Vector3.New(-100, 0, 0), 0.2, true)
    Sword1:MoveTo(Vector3.New(-75, 75, 0), 0.2, true)
    --Blade2:MoveTo(Vector3.New(-140, -70, 40), 0.2, true)
    --Blade2:RotateTo(Rotation.New(60, 0, 90), 0.2, true)
    Blade2:MoveTo(Vector3.New(-109.6, -58.3, 74.4), 0.2, true)
    Blade2:RotateTo(Rotation.New(79.6, 36.3, 156), 0.2, true)
    Task.Wait(0.2)

    Blade1:MoveTo(Vector3.New(0, 0, 86), 0.2, true)
    Task.Wait(0.2)
    
    --Blade1:MoveTo(Vector3.New(-180, -70, 20), 0.2, true)
    --Blade1:RotateTo(Rotation.New(60, 0, 90), 0.2, true)
    Blade1:MoveTo(Vector3.New(-120.3, -16.8, -15.4), 0.3, true)
    Blade1:RotateTo(Rotation.New(79.6, 36.3, 156), 0.3, true)
    Task.Wait(0.2)
    Blade3:MoveTo(Vector3.New(-99, -100, 64.1), 0.2, true)
    Blade2:MoveTo(Vector3.New(-109.6, -58.3, 24.3), 0.2, true)
    Task.Wait(0.2)
    --Blade3:MoveTo(Vector3.New(-100, 30, 60), 0.2, true)
    --Blade2:MoveTo(Vector3.New(-140, 70, 60), 0.2, true)
    --Blade1:MoveTo(Vector3.New(-180, 110, 60), 0.2, true)
    --Blade3:RotateTo(Rotation.New(70, -30, 30), 0.2, true)
    --Blade2:RotateTo(Rotation.New(70, -30, 30), 0.2, true)
    --Blade1:RotateTo(Rotation.New(70, -30, 30), 0.2, true)

    Blade3:MoveTo(Vector3.New(-52.7, 50.4, 55.8), 0.2, true)
    Blade2:MoveTo(Vector3.New(-63.4, 92, 16.1), 0.2, true)
    Blade1:MoveTo(Vector3.New(-73.9, 130.4, -24.1), 0.2, true)


    Blade3:RotateTo(Rotation.New(90, -30, -10), 0.2, true)
    Blade2:RotateTo(Rotation.New(90, -30, -10), 0.2, true)
    Blade1:RotateTo(Rotation.New(90, -30, -10), 0.2, true)

    Task.Wait(0.2)
    Blade3:MoveTo(Vector3.New(0, 0, 86), 0.2, true)
    Blade3:RotateTo(b3_rot, 0.2, true)
    Sword3:MoveTo(Vector3.New(-100, -75, 0), 0.2, true)
    Task.Wait(0.2)
    Blade3:MoveTo(b1_pos, 0.1, true)
    Task.Wait(0.1)

    Blade2:MoveTo(Vector3.New(0, 0, 86), 0.2, true)
    Blade2:RotateTo(b2_rot, 0.2, true)

    Sword3:MoveTo(Vector3.New(-100, 75, 0), 0.2, true)
    Sword1:MoveTo(Vector3.New(-125, 0, 0), 0.2, true)
    Sword2:MoveTo(Vector3.New(-100, -75, 0), 0.2, true)
    Task.Wait(0.2)

    Blade2:MoveTo(b2_pos, 0.1, true)
    Task.Wait(0.1)

    Blade1:MoveTo(Vector3.New(0, 0, 86), 0.2, true)
    Blade1:RotateTo(b1_rot, 0.2, true)

    Sword1:MoveTo(Vector3.New(-125, -75, 0), 0.2, true)
    Sword2:MoveTo(Vector3.New(-100, 0, 0), 0.2, true)
    Task.Wait(0.2)
    
    Blade1:MoveTo(b1_pos, 0.1, true)
    Task.Wait(0.1)
end
function QuickSlashAnimation(ability)
    Task.Spawn(PlayQuickAnimation)
end
function PowerSlashAnimation(ability)
    Task.Spawn(PlayPowerAnimation)
end

function Tick(deltaTime)
    if weapon.owner ~= nil then
        if weapon.owner == local_player then
            Swords:SetWorldRotation(weapon.owner:GetViewWorldRotation())
        else
            Swords:SetWorldRotation(weapon.owner:GetWorldRotation())
        end
    end
end
QuickSlash.castEvent:Connect(QuickSlashAnimation)
PowerSlash.castEvent:Connect(PowerSlashAnimation)