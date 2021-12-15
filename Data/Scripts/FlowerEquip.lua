--[[
Copyright 2020 Manticore Games, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]

-- Internal custom properties
local EQUIPMENT = script:FindAncestorByType('Equipment')
if not EQUIPMENT:IsA('Equipment') then
    error(script.name .. " should be part of Equipment object hierarchy.")
end

-- User Exposed Variables
local EQUIPMENT_STANCE = EQUIPMENT:GetCustomProperty("EquipmentStance")

-- Internal variables
local originalStance = "unarmed_stance"

-- nil OnEquipped(Equipment, Player)
function OnEquipped(equipment, player)
    player.maxHitPoints = equipment:GetCustomProperty("Health")
    player.hitPoints = math.min(player.maxHitPoints, player.hitPoints)
    local maxMagic = equipment:GetCustomProperty("Magic")
    local maxStamina = equipment:GetCustomProperty("Stamina")
    local currentMagic = player:GetPrivateNetworkedData("magic") or maxMagic
    local currentStamina = player:GetPrivateNetworkedData("stamina") or maxStamina
    player:SetPrivateNetworkedData("maxStamina", maxStamina)
    player:SetPrivateNetworkedData("maxMagic", maxMagic)
    player:SetPrivateNetworkedData("stamina", currentStamina)
    player:SetPrivateNetworkedData("magic", currentMagic)
    player:SetPrivateNetworkedData("stamina2", equipment:GetCustomProperty("StaminaPer2"))
    player:SetPrivateNetworkedData("magic2", equipment:GetCustomProperty("MagicPer2"))
    player:SetPrivateNetworkedData("health2", equipment:GetCustomProperty("HealthPer2"))
    if player and Object.IsValid(player) then
        if player.serverUserData.stance ~= "Flower" then
            for _, ability in ipairs(equipment:FindDescendantsByType("Ability")) do
                ability.isEnabled = false
            end
            equipment.visibility = Visibility.FORCE_OFF
        end
    end
end

-- nil OnUnequipped(Equipment, Player)
function OnUnequipped(equipment, player)
    player.animationStance = originalStance
    EQUIPMENT:Destroy()
end

if EQUIPMENT.owner ~= nil then
    EQUIPMENT:OnEquipped(EQUIPMENT, EQUIPMENT.owner)
end

-- Initialize
EQUIPMENT.equippedEvent:Connect(OnEquipped)
EQUIPMENT.unequippedEvent:Connect(OnUnequipped)