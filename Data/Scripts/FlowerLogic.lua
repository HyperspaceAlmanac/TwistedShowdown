local QuickCast = script:GetCustomProperty("QuickCast"):WaitForObject()
local PowerCast = script:GetCustomProperty("PowerCast"):WaitForObject()
local Meditate = script:GetCustomProperty("Meditate"):WaitForObject()
local weapon = script:FindAncestorByType("Equipment")

local qCost, qPower = QuickCast:GetCustomProperty("Cost"), QuickCast:GetCustomProperty("Power")
local pCost, pPower = PowerCast:GetCustomProperty("Cost"), PowerCast:GetCustomProperty("Power")

local lockedOn = false

function QuickCastEvent(ability)
    lockedOn = ability.owner:GetPrivateNetworkedData("LockedOn")
    
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", true)
    end
    ability.owner.serverUserData.casting = true
end

function QuickExecuteEvent(ability)
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", false)
    end
    ability.owner:ApplyDamage(Damage.New(qCost))
    lockedOn = false
end

function PowerCastEvent(ability)
    lockedOn = ability.owner:GetPrivateNetworkedData("LockedOn")

    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", true)
    end
    ability.owner.serverUserData.casting = true
end

function PowerExecuteEvent(ability)
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", false)
    end
    ability.owner:ApplyDamage(Damage.New(pCost))
    lockedOn = false
end

function MeditateExecuteEvent(ability)
    Task.Spawn(
        function()
            local player = ability.owner
            local maxHitPoints = ability.owner.maxHitPoints
            local amount = weapon:GetCustomProperty("HealthPer2") * 2
            for i = 1, 7 do
                if player.isDead == false then
                    player.hitPoints = math.min(maxHitPoints, player.hitPoints + amount)
                else
                    return
                end
                if i < 7 then
                    Task.Wait(1)
                end
            end
        end
    )
end

function Tick(deltaTime)
    if weapon.owner then
        local player = weapon.owner
        if player.serverUserData.stance == "Flower" then
            if player.serverUserData.target == nil then
                QuickCast.isEnabled = false
                PowerCast.isEnabled = false
            else
                QuickCast.isEnabled = true
                PowerCast.isEnabled = true
            end
        end
    end
end

QuickCast.castEvent:Connect(QuickCastEvent)
QuickCast.executeEvent:Connect(QuickExecuteEvent)
QuickCast.recoveryEvent:Connect(function(ability)
    local player = ability.owner
    player.serverUserData.casting = false
end)
PowerCast.castEvent:Connect(PowerCastEvent)
PowerCast.executeEvent:Connect(PowerExecuteEvent)
PowerCast.recoveryEvent:Connect(function(ability)
    local player = ability.owner
    player.serverUserData.casting = false
end)
Meditate.castEvent:Connect(function(ability)
    ability.owner.serverUserData.casting = true
end)
Meditate.executeEvent:Connect(MeditateExecuteEvent)
Meditate.recoveryEvent:Connect(function(ability)
    local player = ability.owner
    player.serverUserData.casting = false
end)

