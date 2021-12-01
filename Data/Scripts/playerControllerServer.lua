local Target = nil
local playerListeners = {}
local prevShot = 0

local statTable = {}

function Tick(deltaTime)
    for _, player in ipairs(Game.GetPlayers()) do
        if player.isFlying == false then
            player:ActivateFlying()
        end
        local rotation = player:GetWorldRotation()
        if player:GetPrivateNetworkedData("LockedOn") == false then
            --raycast
            local rotation = Quaternion.New(player:GetLookWorldRotation())
            --local hitResult = World.Raycast(player:GetWorldPosition() + cameraOffset, player:GetWorldPosition() + rotation:GetForwardVector() * 10000,
            local hitResult = World.Raycast(player:GetViewWorldPosition(), player:GetWorldPosition() + rotation:GetForwardVector() * 10000,
                {ignorePlayers = {player} } --shouldDebugRender = true
            )
            local other = hitResult and hitResult.other or nil
            --print(other)
            if other ~= nil and Object.IsValid(other) and other:IsA("StaticMesh") and other:GetCustomProperty("Tag") ~= nil then
                Target = other
                player.serverUserData.target = Target
                player:SetPrivateNetworkedData("Target", other)
            else
                player.serverUserData.target = nil
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

function UpdateStats()
	while true do
	    for _, player in ipairs(Game.GetPlayers()) do
	        local stats = statTable[player]
            local casting = player.serverUserData.casting
	        if stats and stats.initialized and player.isDead == false then
	            if player.hitPoints > 0 then
                    if stats.stance ~= "Flower" or casting == false then
    	                player.hitPoints = math.min(player.maxHitPoints, player.hitPoints + stats.health2)
                    end
                    if stats.stance ~= "Sword" or casting == false then
	                    stats.stamina = math.min(stats.maxStamina, stats.stamina + stats.stamina2)
	                    player.serverUserData.stamina = stats.stamina
	                    player:SetPrivateNetworkedData("stamina", stats.stamina)
	                end
                    if stats.stance ~= "Magic" or casting == false then
                        stats.magic = math.min(stats.maxMagic, stats.magic + stats.magic2)
    	                player.serverUserData.magic = stats.magic
    	                player:SetPrivateNetworkedData("magic", stats.magic)
                    end
	            end
	        end
	    end
    	Task.Wait(2)
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

function DataChanged(player, key)
    if key == "maxStamina" then
        statTable[player]["maxStamina"] = player:GetPrivateNetworkedData(key)
    elseif key == "maxMagic" then
        statTable[player]["maxStamina"] = player:GetPrivateNetworkedData(key)
    elseif key == "stamina2" then
        statTable[player]["stamina5"] = player:GetPrivateNetworkedData(key)
    elseif key == "magic2" then
        statTable[player]["magic2"] = player:GetPrivateNetworkedData(key)
    elseif key == "health2" then
        statTable[player]["health2"] = player:GetPrivateNetworkedData(key)
    elseif key == "stamina" then
        player.serverUserData.stamina = player:GetPrivateNetworkedData(key)
        statTable[player]["stamina"] = player.serverUserData.stamina
    elseif key == "magic" then
        player.serverUserData.magic = player:GetPrivateNetworkedData(key)
        statTable[player]["magic"] = player.serverUserData.magic
    elseif key == "stance" then
        player.serverUserData.stance = player:GetPrivateNetworkedData(key)
        statTable[player]["stance"] = player.serverUserData.stance
    end
end

function PlayerJoined(player)
    player:ActivateFlying()
    player:SetPrivateNetworkedData("LockedOn", false)
    player:SetPrivateNetworkedData("Target", nil)
    playerListeners[player] = {}
    playerListeners[player]["binding_released"] = player.bindingReleasedEvent:Connect(BindingReleased)
    playerListeners[player]["dataChanged"] = player.privateNetworkedDataChangedEvent:Connect(DataChanged)
    statTable[player] ={maxStamina = 100, stamina = 100,
        maxMagic = 100, magic = 100, stance = "Sword",
        stamina2 = 10, magic2 = 10, health2 = 5, initialized = false}
    for key, val in pairs(statTable[player]) do
        player:SetPrivateNetworkedData(key, val)
    end
    player.serverUserData.stamina = 100
    player.serverUserData.magic = 100
    player.serverUserData.stance = "Sword"
    player.serverUserData.casting = false
    statTable[player]["initialized"] = true
    print("On player join")
end

function PlayerLeft(player)
    playerListeners[player]["binding_released"]:Disconnect()
    playerListeners[player]["dataChanged"]:Disconnect()
    playerListeners[player] = nil
    statTable[player] = nil
end

Task.Spawn(UpdateStats)
Game.playerJoinedEvent:Connect(PlayerJoined)
Game.playerLeftEvent:Connect(PlayerLeft)