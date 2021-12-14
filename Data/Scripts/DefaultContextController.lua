-- Flower 
local AdvancedFlowers = script:GetCustomProperty("AdvancedFlowers")
local AdvancedFlowers2 = script:GetCustomProperty("AdvancedFlowers2")
local AdvancedFlowers3 = script:GetCustomProperty("AdvancedFlowers3")
local AdvancedFlowers4 = script:GetCustomProperty("AdvancedFlowers4")
local AdvancedFlowers5 = script:GetCustomProperty("AdvancedFlowers5")

-- Magic 
local AdvancedMagic = script:GetCustomProperty("AdvancedMagic")
local AdvancedMagic2 = script:GetCustomProperty("AdvancedMagic2")
local AdvancedMagic3 = script:GetCustomProperty("AdvancedMagic3")
local AdvancedMagic4 = script:GetCustomProperty("AdvancedMagic4")
local AdvancedMagic5 = script:GetCustomProperty("AdvancedMagic5")

-- Swords 
local AdvancedSwords = script:GetCustomProperty("Swords")
local AdvancedSwords2 = script:GetCustomProperty("AdvancedSwords2")
local AdvancedSwords3 = script:GetCustomProperty("AdvancedSwords3")
local AdvancedSwords4 = script:GetCustomProperty("AdvancedSwords4")
local AdvancedSwords5 = script:GetCustomProperty("AdvancedSwords5")

-- Custom 
local StanceController = script:GetCustomProperty("StanceController")
local ShopTriggers = script:GetCustomProperty("ShopTriggers"):WaitForObject()

local weaponTable = {AdvancedSwords, AdvancedSwords2, AdvancedSwords3, AdvancedSwords4, AdvancedSwords5,
    AdvancedMagic, AdvancedMagic2, AdvancedMagic3, AdvancedMagic4, AdvancedMagic5,
    AdvancedFlowers, AdvancedFlowers2, AdvancedFlowers3, AdvancedFlowers4, AdvancedFlowers5}
local resourceTable = {"", "s1", "s2", "s3", "s4", "", "m1", "m2", "m3", "m4", "", "f1", "f2", "f3", "f4"}
local costTable = {0, 500, 2000, 5000, 10000}

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
            local cost = 0
            if resourceTable[index] == "" then
                if index == 1 then
                    type = "Sword"
                elseif index == 6 then 
                    type = "Magic"
                else
                    type = "Flower"
                end
            else
                if index > 10 then
                    type = "Flower"
                    cost = costTable[index - 10]
                elseif index > 6 then
                    type = "Magic"
                    cost = costTable[index - 5]
                else
                    type = "Sword"
                    cost = costTable[index]
                end
                if not player.serverUserData.resources[resourceTable[index]] then
                    print(player.serverUserData.resources.gold)
                    if player.serverUserData.resources.gold >= cost then
                        player.serverUserData.resources.gold = player.serverUserData.resources.gold - cost
                        player.serverUserData.resources[resourceTable[index]] = true
                        player:SetPrivateNetworkedData("gold", player.serverUserData.resources.gold)
                        player:SetPrivateNetworkedData(resourceTable[index], true)
                    else
                        return
                    end
                end
            end
            EquipNewWeapon(player, weaponTable[index], type)
        end 
    end
end



for i, trigger in ipairs(ShopTriggers:GetChildren()) do
    trigger.interactedEvent:Connect(BuyWeapon, i)
end

function PlayerJoined(player)
    player.serverUserData.stance = "Sword"
    local swords = World.SpawnAsset(AdvancedSwords)
    swords:Equip(player)
    local magic = World.SpawnAsset(AdvancedMagic)
    magic:Equip(player)
    local flowers = World.SpawnAsset(AdvancedFlowers)
    flowers:Equip(player)
    local stance = World.SpawnAsset(StanceController)
    stance:Equip(player)
end

function PlayerLeft(player)

end

Game.playerJoinedEvent:Connect(PlayerJoined)
Game.playerLeftEvent:Connect(PlayerLeft)