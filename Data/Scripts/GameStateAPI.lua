local API = {}
if _G["GameStateAPI"] == nil then
    _G["GameStateAPI"] = API
    API.initializng = true
else
    while API.initializing do
        Task.Wait()
    end
    return _G["GameStateAPI"]
end
API.GAME_STATE = "Waiting"
API.CURRENT_ARENA = 0
API.ArenaState = {}
API.TimeLeft = 0
API.CountDown = false
API.SpawnedObjects = {{}, {}, {}, {}}
API.NumPlayers = 1
API.SpawnPoints = {}
API.MessageEvent = nil
API.StateEvent = nil
API.RewardMessage = nil
API.CountdownState = nil
API.Static = nil
API.Lives = 0
API.Triggers = {}
API.TrainingTables = {}
API.TrainingObjects = {{}, {}, {}}

function API.RegisterSpawn(spawnPoints)
    for _, spawn in ipairs(spawnPoints) do
        API.SpawnPoints[#API.SpawnPoints + 1] = spawn
    end
end

function API.RegisterMessage(networkedObj)
    API.MessageEvent = networkedObj
end

function API.RegisterState(networkedObj)
    API.StateEvent = networkedObj
end

function API.RegisterReward(networkedObj)
    API.RewardMessage = networkedObj
end

function API.RegisterCountdown(networkedObj)
    API.CountdownState = networkedObj
end

function API.RegisterStatic(static)
    API.Static = static
end

function API.RegisterTrigger(trigger)
    API.Triggers[#API.Triggers + 1] = trigger
end

function API.DisableTriggers()
    for _, trigger in API.triggers do
        trigger.isEnabled = false
    end
end

function API.EnableTriggers()
    for _, trigger in API.triggers do
        trigger.isEnabled = true
    end
end

function API.Cleanup()
    API.Lives = 0
    API.StateEvent:SetCustomProperty("Lives", API.Lives)

end

function API.StartMission(missionNumber)
    API.Lives = 3
    API.NumPlayers = #Game.GetPlayers()
    if missionNumber == 1 then
        API.CURRENT_ARENA = 1
    elseif missionNumber == 2 then
        API.CURRENT_ARENA = 2
    end
end

function API.CompletedPhase()
    local result = false
    for i = 1, 3 do
        for key, val in pairs(API.SpawnedObjects[i]) do
            return false
        end
    end
    return true
end

function API.EndMission()
    API.CURRENT_ARENA = 0
    API.Cleanup()
end

function API.FailMission()
    API.CURRENT_ARENA = 0
    API.Cleanup()
end

-- Training Objects
function API.RegisterSword(target, data)
    local temp = API.TrainingObjects[1]
    temp[target] = {}
    for key, val in pairs(data) do
        temp[target][key] = val
    end
    temp[target].health = temp[target].maxHealth
end

function API.RegisterMagic(target, data)
    local temp = API.TrainingObjects[2]
    temp[target] = {}
    for key, val in pairs(data) do
        temp[target][key] = val
    end
    temp[target].health = temp[target].maxHealth
end

function API.RegisterFlower(target, data)
    local temp = API.TrainingObjects[3]
    temp[target] = {}
    for key, val in pairs(data) do
        temp[target][key] = val
    end
    temp[target].health = temp[target].maxHealth
end

function API.PlayerJoined(player)
    API.TrainingTables[player] = {{}, {}, {}}
    local trainingTable = API.TrainingTables[player]
    for type, trainingObjects in pairs(API.TrainingObjects) do 
        for object, params in pairs(trainingObjects) do
            trainingTable[type][object] = {}
            for key, value in pairs(params) do
                trainingTable[type][object][key] = value
            end
        end
    end
end

function API.PlayerLeft(player)
    API.TrainingTables[player] = nil
end

function API.PlayerDied()
    if API.GAME_STATE ~= "Mission" then
        API.Lives = API.Lives - 1
        if API.Lives <= 0 then
            API.FailMission()
        else
            API.StateEvent:SetCustomProperty("Lives", API.Lives)
        end 
    end
end

function API.StanceToNumber(stance)
    if stance == "Sword" then
        return 1
    elseif stance == "Magic" then
        return 2
    elseif stance == "Flower" then
        return 3
    end
end

function API.SwordHit(player, target, damage)
    local hit = API.ValidTarget(player, target)
    if hit then
        API.ApplyDamage(target, damage, 1)
    end
    hit = API.ValidTrainingTarget(player, target)
    if hit then
        API.TrainingDamage(player, target, damage, 1)
    end
end

function API.FreezeHit(player, target, damage)
    local hit = API.ValidTarget(player, target)
    if hit then
        API.ApplyDamage(target, damage, 2)
    end
    hit = API.ValidTrainingTarget(player, target)
    if hit then
        API.TrainingDamage(player, target, damage, 2)
    end
end

function API.HealTarget(player,target, damage)
    local hit = API.ValidTarget(player, target)
    if hit then
        API.ApplyDamage(target, damage, 3)
    end
    hit = API.ValidTrainingTarget(player, target)
    if hit then
        API.TrainingDamage(player, target, damage, 3)
    end
end

function API.ApplyDamage(target, damage, index)
    if Object.IsValid(target) then
        target.serverUserData.health = math.max(0, target.serverUserData.health - damage)
    else
        if API.SpawnedObjects[3][target] ~= nil then
            API.SpawnedObjects[3][target] = nil
        end
        return
    end
    if target.serverUserData.health == 0 then
        API.SpawnedObjects[3][target] = nil
        API.Static:DestroySharedAsset(target)
    end
end

function API.TrainingDamage(player, target, damage, index)
    local trainingTable = API.TrainingTables[player][index][target]
    local mitigatedDamage = math.max(0, damage - trainingTable.defense)
    local health = math.max(0, trainingTable.health - mitigatedDamage)
    if health == 0 then
        trainingTable.health = trainingTable.maxHealth
        local newAmount = player.serverUserData.resources.gold + trainingTable.reward
        player.serverUserData.resources.gold = newAmount
        player:SetPrivateNetworkedData("gold", newAmount)
    else
    	trainingTable.health = health
    end
end

function API.ValidTrainingTarget(player, target)
    local index = API.StanceToNumber(player.serverUserData.stance)
    if API.TrainingObjects[index][target] ~= nil then
        local health = API.TrainingTables[player][index][target].health
        local maxHealth = API.TrainingObjects[index][target].maxHealth
        return {health, maxHealth, target.name}
    end
    return nil
end

function API.ValidTarget(player, target)
    local index = API.StanceToNumber(player.serverUserData.stance)
    if API.SpawnedObjects[index][target] ~= nil then
        return {target.serverUserData.health, target.serverUserData.maxHealth, target.name}
    end
    return nil
end

function API.Hello()
    print("Hello")
end
API.initializing = false
return API
