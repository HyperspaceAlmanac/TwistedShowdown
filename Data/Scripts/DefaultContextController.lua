local Swords = script:GetCustomProperty("Swords")

function PlayerJoined(player)
    local swords = World.SpawnAsset(Swords)
    swords:Equip(player)
end

function PlayerLeft(player)

end

Game.playerJoinedEvent:Connect(PlayerJoined)
Game.playerLeftEvent:Connect(PlayerLeft)