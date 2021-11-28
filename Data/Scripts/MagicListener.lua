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
function CooldownPower(ability)
    local player = ability.owner
    player:SetPrivateNetworkedData("magic", player.serverUserData.stamina - powerCost)
end

function CastFast(ability)
    ability.owner:ResetVelocity()
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


function CooldownFast(ability)
    local player = ability.owner
    player:SetPrivateNetworkedData("magic", player.serverUserData.stamina - fastCost)
end

function ExecuteShield(ability)
    ability.owner:ResetVelocity()
    ShieldObj.visibility = Visibility.INHERIT
    ShieldObj.collision = Collision.FORCE_ON
end

function CooldownShield(ability)
    local player = ability.owner
    player:SetPrivateNetworkedData("magic", player.serverUserData.stamina - shieldCost)
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
PowerCast.cooldownEvent:Connect(CooldownPower)
QuickCast.castEvent:Connect(CastFast)
QuickCast.executeEvent:Connect(ExecuteFast)
QuickCast.cooldownEvent:Connect(CooldownFast)
Shield.executeEvent:Connect(ExecuteShield)
Shield.cooldownEvent:Connect(CooldownShield)