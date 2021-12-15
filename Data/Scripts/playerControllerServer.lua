-- API 
local API = require(script:GetCustomProperty("GameStateAPI"))

local Hideout = script:GetCustomProperty("Hideout"):WaitForObject()
local Level1 = script:GetCustomProperty("Level1"):WaitForObject()
local Level2 = script:GetCustomProperty("Level2"):WaitForObject()

local MainStorage = script:GetCustomProperty("MainStorage")

local Target = nil
local playerListeners = {}

local statTable = {}
local resourceNames = {"gold", "s1", "s2", "s3", "s4", "m1", "m2", "m3", "m4", "f1", "f2", "f3", "f4"}

function Tick(deltaTime)
    for _, player in ipairs(Game.GetPlayers()) do
        if player.isFlying == false then
            player:ActivateFlying()
        end
        local prevHealth = statTable[player]["prevHealth"]
        local rotation = player:GetWorldRotation()
        if player.serverUserData.lockedOn == false then
            --raycast
            local rotation = Quaternion.New(player:GetLookWorldRotation())
            --local hitResult = World.Raycast(player:GetWorldPosition() + cameraOffset, player:GetWorldPosition() + rotation:GetForwardVector() * 10000,
            local hitResult = World.Raycast(player:GetViewWorldPosition(), player:GetViewWorldPosition() + rotation:GetForwardVector() * 5000,
                {ignorePlayers = {player}} --shouldDebugRender = true
            )
            local other = hitResult and hitResult.other or nil
            --print(other)
            local gameTarget, trainingTarget = API.ValidTarget(player, other), API.ValidTrainingTarget(player, other)
            if gameTarget or trainingTarget then
                Target = other
                player.serverUserData.target = Target
                local position = hitResult:GetImpactPosition()
                player.serverUserData.targetPosition = position
                player:SetPrivateNetworkedData("Target", other)
                player:SetPrivateNetworkedData("TargetPosition", position)
                local newHealth = 0
                if gameTarget then
                    newHealth = gameTarget[1] / gameTarget[2]
                else
                    newHealth = trainingTarget[1] / trainingTarget[2]
                end
                if newHealth ~= prevHealth then
                    statTable[player]["prevHealth"] = newHealth
                    player:SetPrivateNetworkedData("targetHealth", newHealth)
                end
            else
                player.serverUserData.target = nil
                player.serverUserData.targetPosition = nil
                player:SetPrivateNetworkedData("TargetPosition", nil)
                player:SetPrivateNetworkedData("Target", nil)
            end
        else
            if not Object.IsValid(Target) then
                player.serverUserData.lockedOn = false
                player:SetPrivateNetworkedData("LockedOn", false)
                player.serverUserData.target = nil
                player.serverUserData.targetPosition = nil
                player:SetPrivateNetworkedData("Target", nil)
                player:SetPrivateNetworkedData("TargetPosition", nil)
                player:SetWorldRotation(rotation)
                return
            end
            local distance = (Target:GetWorldPosition() - player:GetWorldPosition()).size
            local gameTarget, trainingTarget = API.ValidTarget(player, Target), API.ValidTrainingTarget(player, Target)
            if distance > 5500 then
                player.serverUserData.lockedOn = false
                player:SetPrivateNetworkedData("LockedOn", false)
                player.serverUserData.target = nil
                player.serverUserData.targetPosition = nil
                player:SetPrivateNetworkedData("Target", nil)
                player:SetPrivateNetworkedData("TargetPosition", nil)
            elseif gameTarget or trainingTarget then
                local newHealth = 0
                if gameTarget then
                    newHealth = gameTarget[1] / gameTarget[2]
                else
                    newHealth = trainingTarget[1] / trainingTarget[2]
                end
                if newHealth ~= prevHealth then
                    statTable[player]["prevHealth"] = newHealth
                    player:SetPrivateNetworkedData("targetHealth", newHealth)
                end
            else
                player.serverUserData.lockedOn = false
                player:SetPrivateNetworkedData("LockedOn", false)
                player.serverUserData.target = nil
                player.serverUserData.targetPosition = nil
                player:SetPrivateNetworkedData("Target", nil)
                player:SetPrivateNetworkedData("TargetPosition", nil)
            end
        end
        player:SetWorldRotation(rotation)
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
        local lockedOn = player.serverUserData.lockedOn
        local target = player.serverUserData.target
        if lockedOn then
            player.serverUserData.lockedOn = false
            player:SetPrivateNetworkedData("LockedOn", false)
        else
            if target then
                player.serverUserData.lockedOn = true
                player:SetPrivateNetworkedData("LockedOn", true)
            end
        end
    end
end

function DataChanged(player, key)
    if key == "maxStamina" then
        statTable[player]["maxStamina"] = player:GetPrivateNetworkedData(key)
    elseif key == "maxMagic" then
        statTable[player]["maxMagic"] = player:GetPrivateNetworkedData(key)
    elseif key == "stamina2" then
        statTable[player]["stamina2"] = player:GetPrivateNetworkedData(key)
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

local changeableParams = {"maxStamina", "maxMagic", "stamina2", "magic2", "health2", "stamina", "magic", "stance"}
-- Equip script happens before other scripts.
function InitializeValues(player)
    for _, key in ipairs(changeableParams) do
        local val = player:GetPrivateNetworkedData(key)
        if val ~= nil then
            statTable[player][key] = val
            if key == "stamina" or key == "magic" or key == "stance" then
                player.serverUserData[key] = val
            end
        else
            player:SetPrivateNetworkedData(key, statTable[player][key])
        end
    end
end

function PlayerDied(player, dmg)
    API.PlayerDied()
    for _, ik in ipairs(player:GetIKAnchors()) do
        ik:Deactivate()
    end
    if player.serverUserData.lockedOn then
        player.serverUserData.lockedOn = false
        player:SetPrivateNetworkedData("LockedOn", false)
    end
    Task.Spawn(function()
        Task.Wait(2)
        local values = API.GetSpawn(player)
        local spawn = values[1]
        local offset = values[2]
        player:Spawn({rotation = spawn:GetWorldRotation(),
            position = spawn:GetWorldPosition() + Vector3.New(0, offset, 0)
        })
    end)
end

function PlayerJoined(player)
    player:SetPrivateNetworkedData("LockedOn", false)
    player:SetPrivateNetworkedData("Target", nil)
    player:SetPrivateNetworkedData("targetHealth", 0)
    player.serverUserData.lockedOn = false
    player.serverUserData.target = nil
    player.serverUserData.targetPosition = nil
    playerListeners[player] = {}
    playerListeners[player]["binding_released"] = player.bindingReleasedEvent:Connect(BindingReleased)
    playerListeners[player]["dataChanged"] = player.privateNetworkedDataChangedEvent:Connect(DataChanged)
    playerListeners[player]["died"] = player.diedEvent:Connect(PlayerDied)
    statTable[player] ={maxStamina = 100, stamina = 100,
        maxMagic = 100, magic = 100, stance = "Sword",
        stamina2 = 10, magic2 = 10, health2 = 5,
        prevHealth = 0, initialized = false}
    player.serverUserData.stamina = 100
    player.serverUserData.magic = 100
    player.serverUserData.stance = "Sword"
    player.serverUserData.casting = false
    statTable[player]["initialized"] = true
    InitializeValues(player)
    player:Spawn({position = Hideout:GetWorldPosition() + Vector3.New(0, (#Game.GetPlayers() - 1) * 200, 0), rotation = Hideout:GetWorldRotation()})

    -- Resource
    -- DEBUG override storage
    local persistentTable = Storage.GetSharedPlayerData(MainStorage, player)
    --local customTable = { gold = 100000 }
    player.serverUserData.resources = {}
    for _, key in ipairs(resourceNames) do
        local value = persistentTable[key]
        --local value = customTable[key]
        if key == "gold" then
            player:SetPrivateNetworkedData(key, value or 0)
            player.serverUserData.resources[key] = value or 0
        else
            player:SetPrivateNetworkedData(key, value or false)
            player.serverUserData.resources[key] = value or false
        end
    end
    API.PlayerJoined(player)
end

function PlayerLeft(player)
    API.PlayerLeft(player)
    playerListeners[player]["binding_released"]:Disconnect()
    playerListeners[player]["dataChanged"]:Disconnect()
    playerListeners[player]["died"]:Disconnect()
    playerListeners[player] = nil
    statTable[player] = nil

    local persistentTable = Storage.GetSharedPlayerData(MainStorage, player)
    for key, value in pairs(player.serverUserData.resources) do
        persistentTable[key] = value
    end
    Storage.SetSharedPlayerData(MainStorage, player, persistentTable)
end

Task.Spawn(UpdateStats)
Game.playerJoinedEvent:Connect(PlayerJoined)
Game.playerLeftEvent:Connect(PlayerLeft)