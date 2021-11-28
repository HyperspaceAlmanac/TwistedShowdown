local QuickCast = script:GetCustomProperty("QuickCast"):WaitForObject()
local PowerCast = script:GetCustomProperty("PowerCast"):WaitForObject()
local weapon = script:FindAncestorByType("Equipment")

local qCost, qPower = QuickCast:GetCustomProperty("Cost"), QuickCast:GetCustomProperty("Power")
local pCost, pPower = PowerCast:GetCustomProperty("Cost"), PowerCast:GetCustomProperty("Power")

local lockedOn = false

function QuickCastEvent(ability)
    lockedOn = ability.owner:GetPrivateNetworkedData("LockedOn")
    
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", true)
    end
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
end

function PowerExecuteEvent(ability)
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", false)
    end
    ability.owner:ApplyDamage(Damage.New(pCost))
    lockedOn = false
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
PowerCast.castEvent:Connect(PowerCastEvent)
PowerCast.executeEvent:Connect(PowerExecuteEvent)

