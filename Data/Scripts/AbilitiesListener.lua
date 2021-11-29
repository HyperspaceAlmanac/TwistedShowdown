local weapon = script.parent.parent
local fastCost = weapon:GetCustomProperty("Fast")
local powerCost = weapon:GetCustomProperty("Power")
local dodgeCost = weapon:GetCustomProperty("Dodge")
local QuickSlash = script:GetCustomProperty("QuickSlash"):WaitForObject()
local Dodge = script:GetCustomProperty("Dodge"):WaitForObject()
local PowerSlash = script:GetCustomProperty("PowerSlash"):WaitForObject()

function RecoveryPower(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    player:SetPrivateNetworkedData("stamina", player.serverUserData.stamina - powerCost)
end

function RecoveryFast(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    player:SetPrivateNetworkedData("stamina", player.serverUserData.stamina - fastCost)
end

function ExecuteDodge(ability)
    local player = ability.owner
    player.serverUserData.casting = true
    local transform = Quaternion.New(player:GetViewWorldRotation())
    if player:IsBindingPressed("ability_extra_30") then
        player:AddImpulse(transform:GetRightVector() * player.mass * -3000)
    elseif player:IsBindingPressed("ability_extra_32") then
        player:AddImpulse(transform:GetRightVector() * player.mass * 3000)
    elseif player:IsBindingPressed("ability_extra_31") then
        player:AddImpulse(transform:GetForwardVector() * player.mass * -3000)
    else
        player:AddImpulse(transform:GetForwardVector() * player.mass * 3000)
    end
end

function RecoveryDodge(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    player:SetPrivateNetworkedData("stamina", player.serverUserData.stamina - dodgeCost)
end

function Tick(deltaTime)
    if weapon.owner then
        local player = weapon.owner
        if player.serverUserData.stance == "Sword" then
            local stamina = player.serverUserData.stamina
            if stamina < fastCost then
                QuickSlash.isEnabled = false
            else
                QuickSlash.isEnabled = true
            end

            if stamina < powerCost then
                PowerSlash.isEnabled = false
            else
                PowerSlash.isEnabled = true
            end

            if stamina < dodgeCost then
                Dodge.isEnabled = false
            else
                Dodge.isEnabled = true
            end

        end
    end
end

PowerSlash.castEvent:Connect(function(ability)
    ability.owner:ResetVelocity()
    ability.owner.serverUserData.casting = true
end)
QuickSlash.castEvent:Connect(function(ability)
    ability.owner.serverUserData.casting = true
end)
PowerSlash.recoveryEvent:Connect(RecoveryPower)
QuickSlash.recoveryEvent:Connect(RecoveryFast)
Dodge.castEvent:Connect(function(ability)
    ability.owner.serverUserData.casting = true
end)
Dodge.executeEvent:Connect(ExecuteDodge)
Dodge.recoveryEvent:Connect(RecoveryDodge)