local MagicShot = script:GetCustomProperty("Projectile")
local Target = script:GetCustomProperty("Target"):WaitForObject()
local playerListeners = {}
local prevShot = 0

local projectileTable = {}

function Tick(deltaTime)
    for _, player in ipairs(Game.GetPlayers()) do
        if player.isFlying == false then
            player:ActivateFlying()
        end
        local rotation = player:GetWorldRotation()
        if player:IsBindingPressed("ability_extra_20") then

        elseif player:IsBindingPressed("ability_primary") then
            if prevShot == 0 then
                local forwardVector = player:GetWorldTransform():GetForwardVector()
                local projectile = Projectile.Spawn(MagicShot, player:GetWorldPosition() + forwardVector * 100, forwardVector)
                projectile.speed = 2000
                projectile.gravityScale = 0
                projectile.lifeSpan = 2
                projectile.homingTarget = Target
                prevShot = 0.1
                projectileTable[projectile] = projectile.lifeSpanEndedEvent:Connect(
                    function()
                        projectileTable[projectile]:Disconnect()
                        projectileTable[projectile] = nil
                    end
                )
            end
        end
        if player:GetPrivateNetworkedData("LockedOn") == false then
            --raycast
            local rotation = Quaternion.New(player:GetLookWorldRotation())
            local cameraOffset = rotation:GetRightVector() * 60 + Vector3.New(0, 0, 100)
            --local hitResult = World.Raycast(player:GetWorldPosition() + cameraOffset, player:GetWorldPosition() + rotation:GetForwardVector() * 10000,
            local hitResult = World.Raycast(player:GetViewWorldPosition(), player:GetWorldPosition() + rotation:GetForwardVector() * 10000,
                {ignorePlayers = {player}}
            )
            local other = hitResult and hitResult.other or nil
            --print(other)
            if other ~= nil and Object.IsValid(other) and other:IsA("StaticMesh") and other:GetCustomProperty("Tag") ~= nil then
                Target = other
                player:SetPrivateNetworkedData("Target", other)
            else
                player:SetPrivateNetworkedData("Target", nil)
            end
        end
        player:SetWorldRotation(rotation)
        if prevShot > 0.5 then
            prevShot = 0
        elseif prevShot > 0 then
            prevShot = prevShot + deltaTime
        end
    end
end

function BindingReleased(player, key)
    if key == "ability_extra_23" then
        local lockedOn = player:GetPrivateNetworkedData("LockedOn")
        local target = player:GetPrivateNetworkedData("Target")
        if lockedOn then
            player:SetPrivateNetworkedData("LockedOn", false)
        else
            if target then
                player:SetPrivateNetworkedData("LockedOn", true)
            end
        end
    end
end

function PlayerJoined(player)
    player:ActivateFlying()
    player:SetPrivateNetworkedData("LockedOn", false)
    player:SetPrivateNetworkedData("Target", nil)
    playerListeners[player] = {}
    playerListeners[player]["binding_released"] = player.bindingReleasedEvent:Connect(BindingReleased)
    print("On player join")
end

function PlayerLeft(player)
    playerListeners[player]["binding_released"]:Disconnect()
    playerListeners[player] = nil
end

Game.playerJoinedEvent:Connect(PlayerJoined)
Game.playerLeftEvent:Connect(PlayerLeft)