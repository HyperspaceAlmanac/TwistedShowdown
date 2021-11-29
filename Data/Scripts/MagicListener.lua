local weapon = script.parent.parent
local fastCost = weapon:GetCustomProperty("Fast")
local powerCost = weapon:GetCustomProperty("Power")
local shieldCost = weapon:GetCustomProperty("Shield")
local QuickCast = script:GetCustomProperty("QuickCast"):WaitForObject()
local PowerCast = script:GetCustomProperty("PowerCast"):WaitForObject()
local Shield = script:GetCustomProperty("Shield"):WaitForObject()
local ShieldObj = script:GetCustomProperty("ShieldObj"):WaitForObject()

local lockedOn = false

function CastPower(ability)
    ability.owner:ResetVelocity()
    ability.owner.serverUserData.casting = true
    lockedOn = ability.owner:GetPrivateNetworkedData("LockedOn")
    
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", true)
    end
end
function ExecutePower(ability)
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", false)
    end
    lockedOn = false
end
function RecoveryPower(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    player:SetPrivateNetworkedData("magic", player.serverUserData.magic - powerCost)
end

function CastFast(ability)
    ability.owner:ResetVelocity()
    ability.owner.serverUserData.casting = true
    lockedOn = ability.owner:GetPrivateNetworkedData("LockedOn")
    
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", true)
    end
end

function ExecuteFast(ability)
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", false)
    end
    lockedOn = false
end


function RecoveryFast(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    player:SetPrivateNetworkedData("magic", player.serverUserData.magic - fastCost)
end

function ExecuteShield(ability)
    ability.owner:ResetVelocity()
    ShieldObj.visibility = Visibility.INHERIT
    ShieldObj.collision = Collision.FORCE_ON
end

function RecoveryShield(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    player:SetPrivateNetworkedData("magic", player.serverUserData.magic - shieldCost)
    ShieldObj.visibility = Visibility.FORCE_OFF
    ShieldObj.collision = Collision.FORCE_OFF
end

function Tick(deltaTime)
    if weapon.owner then
        local player = weapon.owner
        if player.serverUserData.stance == "Magic" then
            local magic = player.serverUserData.magic
            local target = player.serverUserData.target
            if magic < fastCost or target == nil then
                QuickCast.isEnabled = false
            else
                QuickCast.isEnabled = true
            end

            if magic < powerCost or target == nil then
                PowerCast.isEnabled = false
            else
                PowerCast.isEnabled = true
            end

            if magic < shieldCost then
                Shield.isEnabled = false
            else
                Shield.isEnabled = true
            end
        end
    end
end

PowerCast.castEvent:Connect(CastPower)
PowerCast.executeEvent:Connect(ExecutePower)
PowerCast.recoveryEvent:Connect(RecoveryPower)
QuickCast.castEvent:Connect(CastFast)
QuickCast.executeEvent:Connect(ExecuteFast)
QuickCast.recoveryEvent:Connect(RecoveryFast)
Shield.castEvent:Connect(function(ability)
    ability.owner.serverUserData.casting = true
end)
Shield.executeEvent:Connect(ExecuteShield)
Shield.recoveryEvent:Connect(RecoveryShield)