local Networking = script:GetCustomProperty("Networking"):WaitForObject()
local Objects = script:GetCustomProperty("Objects"):WaitForObject()
local Triggers = script:GetCustomProperty("Triggers"):WaitForObject()
local IceVFX = script:GetCustomProperty("IceVFX")
local IceSound = script:GetCustomProperty("IceSound")

local Level1SealFolder = script:GetCustomProperty("1"):WaitForObject()
local Level2SealFolder = script:GetCustomProperty("2"):WaitForObject()

local L1Seal = {}
local L2Seal = {}
local phaseMap = {}
local listeners = {}
local currentPhase = 0

function OnOverlap(trigger, obj, phase)
    if currentPhase >= phase and Object.IsValid(obj) and obj:IsA("Player") then
        print("Spawned")
        World.SpawnAsset(IceVFX, {position = obj:GetWorldPosition()})
        World.SpawnAsset(IceSound, {position = obj:GetWorldPosition()})
    end
end

function Initialize()
    for i, phaseFolder in ipairs(Objects:GetChildren()) do
        phaseMap[i] = phaseFolder
    end

    for i, seal in ipairs(Level1SealFolder:GetChildren()) do
        L1Seal[i] = seal
    end

    for i, seal in ipairs(Level2SealFolder:GetChildren()) do
        L2Seal[i] = seal
    end
    for i, folder in ipairs(Triggers:GetChildren()) do
        for _, trigger in ipairs(folder:GetChildren()) do
            listeners[trigger] = trigger.beginOverlapEvent:Connect(OnOverlap, i)
        end
    end
end
Initialize()

function UpdateState(obj, key)
    local value = obj:GetCustomProperty(key)
    if key == "Level" then
        for i, val in ipairs(phaseMap) do
            val.visibility = Visibility.FORCE_OFF
        end
    elseif key == "Phase" then
        currentPhase = value
        if value > 0 then
            phaseMap[value].visibility = Visibility.INHERIT
        else
            for i, val in ipairs(phaseMap) do
                val.visibility = Visibility.FORCE_OFF
            end
        end
        if value == 0 then
            Level1SealFolder:StopRotate()
            Level2SealFolder:StopRotate()
        end
        if value == 1 then
            Level1SealFolder:RotateContinuous(Rotation.New(0, 0, 30))
            Level2SealFolder:RotateContinuous(Rotation.New(0, 0, 30))
        end
        for i = 1, 7 do
            if i >= value then
                L1Seal[i].visibility = Visibility.INHERIT
                L2Seal[i].visibility =  Visibility.INHERIT
            else
                L1Seal[i].visibility =  Visibility.FORCE_OFF
                L2Seal[i].visibility =  Visibility.FORCE_OFF
            end
        end
    end
end

function OnDestroyed(obj)
    for key, listener in pairs(listeners) do
        listener:Disconnect()
        listeners[key] = nil
    end
    listeners = nil
end
script.destroyEvent:Connect(OnDestroyed)
UpdateState(Networking, "Level")
UpdateState(Networking, "Phase")
Networking.customPropertyChangedEvent:Connect(UpdateState)