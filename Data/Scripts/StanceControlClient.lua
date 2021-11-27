local Sword = script:GetCustomProperty("Sword"):WaitForObject()
local Magic = script:GetCustomProperty("Magic"):WaitForObject()
local Flower = script:GetCustomProperty("Flower"):WaitForObject()
local Equipment = script.parent.parent

function SCast(ability)
end

function MCast(ability)
end

function FCast(ability)
end

-- Hide them
function Equipped(eqp, player)
end 

Equipment.equippedEvent:Connect(Equipped)
Sword.castEvent:Connect(SCast)
Magic.castEvent:Connect(MCast)
Flower.castEvent:Connect(FCast)
