local Sword = script:GetCustomProperty("Sword"):WaitForObject()
local Magic = script:GetCustomProperty("Magic"):WaitForObject()
local Flower = script:GetCustomProperty("Flower"):WaitForObject()
local Equipment = script.parent.parent

function Activate(activatedType, player)
    for _, eqp in ipairs(player:GetEquipment()) do
        local type = eqp:GetCustomProperty("Type")
        if type ~= nil then
            if type == activatedType then
                eqp.visibility = Visibility.FORCE_ON
                for _, ability in ipairs(eqp:GetAbilities()) do
                    ability.isEnabled = true
                end
            else
                eqp.visibility = Visibility.FORCE_OFF
                for _, ability in ipairs(eqp:GetAbilities()) do
                    ability.isEnabled = false
                end
            end
        end
    end
end

function DisableThenEnable(sword, magic, flower)
    Sword.isEnabled = false
    Magic.isEnabled = false
    Flower.isEnabled = false
    Task.Wait(1)
    Sword.isEnabled = sword
    Magic.isEnabled = magic
    Flower.isEnabled = flower
end

function SCast(ability)
    Activate("Sword", ability.owner)
    Task.Spawn(function()
        DisableThenEnable(false, true, true)
    end)
    ability.owner:SetPrivateNetworkedData("stance", "Sword")
end

function MCast(ability)
    Activate("Magic", ability.owner)
    Task.Spawn(function()
        DisableThenEnable(true, false, true)
    end)
    ability.owner:SetPrivateNetworkedData("stance", "Magic")
end

function FCast(ability)
    Activate("Flower", ability.owner)
    Task.Spawn(function()
        DisableThenEnable(true, true, false)
    end)
    ability.owner:SetPrivateNetworkedData("stance", "Flower")
end

-- Enable Magic and Flower forms
Sword.isEnabled = false
Magic.isEnabled = true
Flower.isEnabled = true

-- Hide them
function Equipped(eqp, player)
    for _, eqp in ipairs(player:GetEquipment()) do
        local type = eqp:GetCustomProperty("Type")
        if type ~= nil then
            if type == "Magic" or type == "Flower" then
                eqp.visibility = Visibility.FORCE_OFF
                for _, ability in ipairs(eqp:GetAbilities()) do
                    ability.isEnabled = false
                end
            end
        end
    end
    player:SetPrivateNetworkedData("stance", "Sword")
end

if Equipment.owner ~= nil then
    Equipped(Equipment, Equipment.owner)
end
Equipment.equippedEvent:Connect(Equipped)
Sword.castEvent:Connect(SCast)
Magic.castEvent:Connect(MCast)
Flower.castEvent:Connect(FCast)
