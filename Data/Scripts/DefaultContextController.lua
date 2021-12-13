local ShopTriggers = script:GetCustomProperty("ShopTriggers"):WaitForObject()

local Swords = script:GetCustomProperty("Swords")
local AdvancedSwords2 = script:GetCustomProperty("AdvancedSwords2")

local Magic = script:GetCustomProperty("AdvancedMagic")
local Flowers = script:GetCustomProperty("AdvancedFlowers")
local StanceController = script:GetCustomProperty("StanceController")

local weaponTable = {Swords, Swords, Swords, Swords, AdvancedSwords2}
local resourceTable = {"", "s1", "s2", "s3", "s4", "", "m1", "m2", "m3", "m4", "", "f1", "f2", "f3", "f4"}

function EquipNewWeapon(player, template, type)
    for _, eqp in ipairs(player:GetEquipment()) do
        if eqp:GetCustomProperty("Type") == type then
            eqp:Unequip()
        end
    end
    local weapon = World.SpawnAsset(template)
    print(weapon.name)
    weapon:Equip(player)
end

function BuyWeapon(trigger, player, index)
    if Object.IsValid(player) and player:IsA("Player") then
        print(index)
        if not player.serverUserData.waiting then
            player.serverUserData.waiting = true
            Task.Spawn(function()
                Task.Wait(2)
                player.serverUserData.waiting = false
            end)
            local type = ""
            if index < 6 then
                type = "Sword"
            elseif index < 11 then
                type = "Magic"
            else
                type = "Flower"
            end
            EquipNewWeapon(player, weaponTable[index], type)
        end 
    end
end



for i, trigger in ipairs(ShopTriggers:GetChildren()) do
    trigger.interactedEvent:Connect(BuyWeapon, i)
end

function PlayerJoined(player)
    local swords = World.SpawnAsset(Swords)
    swords:Equip(player)
    local magic = World.SpawnAsset(Magic)
    magic:Equip(player)
    local flowers = World.SpawnAsset(Flowers)
    flowers:Equip(player)
    local stance = World.SpawnAsset(StanceController)
    stance:Equip(player)
end

function PlayerLeft(player)

end

Game.playerJoinedEvent:Connect(PlayerJoined)
Game.playerLeftEvent:Connect(PlayerLeft)