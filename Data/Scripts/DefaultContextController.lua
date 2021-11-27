local Swords = script:GetCustomProperty("Swords")
local Magic = script:GetCustomProperty("AdvancedMagic")
local Flowers = script:GetCustomProperty("AdvancedFlowers")
local StanceController = script:GetCustomProperty("StanceController")

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