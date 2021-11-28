local weapon = script.parent.parent
local fastCost = weapon:GetCustomProperty("Fast")
local powerCost = weapon:GetCustomProperty("Power")
local dodgeCost = weapon:GetCustomProperty("Dodge")
local QuickSlash = script:GetCustomProperty("QuickSlash"):WaitForObject()
local Dodge = script:GetCustomProperty("Dodge"):WaitForObject()
local PowerSlash = script:GetCustomProperty("PowerSlash"):WaitForObject()

function ActivatePower(ability)
    local player = ability.owner
    player:SetPrivateNetworkedData("stamina", player.serverUserData.stamina - powerCost)
end

function ActivateFast(ability)
    local player = ability.owner
    player:SetPrivateNetworkedData("stamina", player.serverUserData.stamina - fastCost)
end

function ActivateDodge(ability)
    local player = ability.owner
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

PowerSlash.castEvent:Connect(function(ability) ability.owner:ResetVelocity() end)
PowerSlash.cooldownEvent:Connect(ActivatePower)
QuickSlash.cooldownEvent:Connect(ActivateFast)
Dodge.cooldownEvent:Connect(ActivateDodge)