local HealVFX = script:GetCustomProperty("HealVFX"):WaitForObject()
local QuickCast = script:GetCustomProperty("QuickCast"):WaitForObject()
local PowerCast = script:GetCustomProperty("PowerCast"):WaitForObject()

function QuickCastEvent(ability)
    HealVFX.visibility = Visibility.INHERIT
end

function QuickExecuteEvent(ability)
    HealVFX.visibility = Visibility.FORCE_OFF
end

function PowerCastEvent(ability)
    HealVFX.visibility = Visibility.INHERIT
end

function PowerExecuteEvent(ability)
    HealVFX.visibility = Visibility.FORCE_OFF
end

QuickCast.castEvent:Connect(QuickCastEvent)
QuickCast.executeEvent:Connect(QuickExecuteEvent)
PowerCast.castEvent:Connect(PowerCastEvent)
PowerCast.executeEvent:Connect(PowerExecuteEvent)