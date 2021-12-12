local HealVFX = script:GetCustomProperty("HealVFX"):WaitForObject()
local QuickCast = script:GetCustomProperty("QuickCast"):WaitForObject()
local PowerCast = script:GetCustomProperty("PowerCast"):WaitForObject()

local HealCloud = script:GetCustomProperty("HealCloud"):WaitForObject()
local Meditate = script:GetCustomProperty("Meditate"):WaitForObject()

local LongFlowerAudio = script:GetCustomProperty("LongFlowerAudio")
local FastFlowerAudio = script:GetCustomProperty("FastFlowerAudio")

local weapon = script.parent.parent

function QuickCastEvent(ability)
    HealVFX.visibility = Visibility.INHERIT
    World.SpawnAsset(FastFlowerAudio, {position = weapon:GetWorldPosition()})
end

function QuickExecuteEvent(ability)
    HealVFX.visibility = Visibility.FORCE_OFF
end

function PowerCastEvent(ability)
    HealVFX.visibility = Visibility.INHERIT
    World.SpawnAsset(LongFlowerAudio, {position = weapon:GetWorldPosition()})
end

function PowerExecuteEvent(ability)
    HealVFX.visibility = Visibility.FORCE_OFF
end

function MeditateExecute(ability)
    HealCloud.visibility = Visibility.INHERIT
    World.SpawnAsset(LongFlowerAudio, {position = weapon:GetWorldPosition()})
end

function MeditateRecovery(ability)
    HealCloud.visibility = Visibility.FORCE_OFF
end

QuickCast.interruptedEvent:Connect(
    function()
        HealVFX.visibility = Visibility.FORCE_OFF
    end
)
QuickCast.castEvent:Connect(QuickCastEvent)
QuickCast.executeEvent:Connect(QuickExecuteEvent)

PowerCast.interruptedEvent:Connect(
    function()
        HealVFX.visibility = Visibility.FORCE_OFF
    end
)
PowerCast.castEvent:Connect(PowerCastEvent)
PowerCast.executeEvent:Connect(PowerExecuteEvent)

Meditate.interruptedEvent:Connect(
    function()
        HealCloud.visibility = Visibility.FORCE_OFF
    end
)
Meditate.executeEvent:Connect(MeditateExecute)
Meditate.recoveryEvent:Connect(MeditateRecovery)