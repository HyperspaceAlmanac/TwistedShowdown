local Orb1 = script:GetCustomProperty("Orb1"):WaitForObject()
local Orb2 = script:GetCustomProperty("Orb2"):WaitForObject()
local Orb3 = script:GetCustomProperty("Orb3"):WaitForObject()
local PowerCast = script:GetCustomProperty("PowerCast"):WaitForObject()
local Shield = script:GetCustomProperty("Shield"):WaitForObject()

function HideOrb(ability)
    Orb1.visibility = Visibility.FORCE_OFF
end

function ShowOrb(ability)
    Orb1.visibility = Visibility.INHERIT
end

function CastPower(ability)
end

function CooldownPower(ability)
end

PowerCast.castEvent:Connect(CastPower)
PowerCast.cooldownEvent:Connect(CooldownPower)
Shield.executeEvent:Connect(HideOrb)
Shield.cooldownEvent:Connect(ShowOrb)