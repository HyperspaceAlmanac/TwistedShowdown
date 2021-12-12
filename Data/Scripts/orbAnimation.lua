local Orbs = script:GetCustomProperty("Orbs"):WaitForObject()
local Orb1 = script:GetCustomProperty("Orb1"):WaitForObject()
local Orb2 = script:GetCustomProperty("Orb2"):WaitForObject()
local Orb3 = script:GetCustomProperty("Orb3"):WaitForObject()
local PowerCast = script:GetCustomProperty("PowerCast"):WaitForObject()
local QuickCast = script:GetCustomProperty("QuickCast"):WaitForObject()
local Shield = script:GetCustomProperty("Shield"):WaitForObject()

local IceballAFX = script:GetCustomProperty("IceballAFX")
local IcePowerCast = script:GetCustomProperty("IcePowerCast")
local weapon = script.parent.parent

local originalPosition = Orbs:GetPosition()
--2, 1
function HideOrb(ability)
    Orb1.visibility = Visibility.FORCE_OFF
end

function ShowOrb(ability)
    Orb1.visibility = Visibility.INHERIT
end

function CastPower(ability)
    World.SpawnAsset(IcePowerCast, {position = weapon:GetWorldPosition()})
    Orbs:MoveTo(Vector3.New(100, 0, 0), 0.3, true)
    Task.Wait(0.3)
    Orb1:MoveTo(Vector3.New(100, 0, 130), 0.3, true)
    Orb2.visibility = Visibility.INHERIT
    Orb3.visibility = Visibility.INHERIT
    Orb2:MoveTo(Vector3.New(100, -150, -130), 0.3, true)
    Orb3:MoveTo(Vector3.New(100, 150, -130), 0.3, true)
    Task.Wait(0.3)
    Orb1:MoveTo(Vector3.New(100, -150, -130), 0.3, true)
    Orb2:MoveTo(Vector3.New(100, 150, -130), 0.3, true)
    Orb3:MoveTo(Vector3.New(100, 0, 130), 0.3, true)
    Task.Wait(0.3)
    Orb1:MoveTo(Vector3.New(100, 150, -130), 0.3, true)
    Orb2:MoveTo(Vector3.New(100, 0, 130), 0.3, true)
    Orb3:MoveTo(Vector3.New(100, -150, -130), 0.3, true)
    Task.Wait(0.3)
    Orb1:MoveTo(Vector3.New(100, 0, 130), 0.3, true)
    Orb2:MoveTo(Vector3.New(100, -150, -130), 0.3, true)
    Orb3:MoveTo(Vector3.New(100, 150, -130), 0.3, true)
    Task.Wait(0.3)
    Orb1:MoveTo(Vector3.New(100, 0, 173.2), 0.3, true)
    Orb2:MoveTo(Vector3.New(100, -200, -173.2), 0.3, true)
    Orb3:MoveTo(Vector3.New(100, 200, -173.2), 0.3, true)
    Task.Wait(0.9)
    Orb1:MoveTo(Vector3.New(0, 0, 0), 0.3, true)
    Orb2:MoveTo(Vector3.New(0, 0, 0), 0.3, true)
    Orb3:MoveTo(Vector3.New(0, 0, 0), 0.3, true)
    Task.Wait(0.3)
    Orb2.visibility = Visibility.FORCE_OFF
    Orb3.visibility = Visibility.FORCE_OFF
    Orbs:MoveTo(originalPosition, 0.3, true)
    Task.Wait(0.3)
   
end

function RecoveryPower(ability)
end
QuickCast.executeEvent:Connect(
    function(ability)
        World.SpawnAsset(IceballAFX, {position = weapon:GetWorldPosition()})
    end
)
PowerCast.castEvent:Connect(CastPower)
PowerCast.recoveryEvent:Connect(RecoveryPower)
PowerCast.executeEvent:Connect(
    function()
        World.SpawnAsset(IceballAFX, {position = weapon:GetWorldPosition()})
    end
)
Shield.executeEvent:Connect(HideOrb)
Shield.recoveryEvent:Connect(ShowOrb)