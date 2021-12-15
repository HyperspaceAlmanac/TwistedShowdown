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
API.CURRENT_ARENA = 0
API.ArenaState = {}
API.Phase = 0
API.PhaseTimer = 0
API.TimeLeft = 0
API.CountDown = false
API.SpawnedObjects = {{}, {}, {}, {}}
API.MissionTable = {}
API.NumPlayers = 1
API.SpawnPoints = {}
API.MessageEvent = nil
API.StateEvent = nil
API.RewardMessage = nil
API.RewardAmount = 0
API.CountdownState = nil
API.Music = nil
API.Static = nil
API.Lives = 0
API.Triggers = {}
API.TrainingTables = {}
API.TrainingObjects = {{}, {}, {}}

API.ObjectiveCallback = nil
API.DangerCallBack = nil

function API.RegisterSpawn(spawnPoints)
    for _, spawn in ipairs(spawnPoints) do
        API.SpawnPoints[#API.SpawnPoints + 1] = spawn
    end
end

function API.RegisterObjectives(objectives)
    API.Objectives = objectives
end

function API.BroadcastDanger(dangerList) -- broadcast once
    --Events.Broadcast("Danger", dangerList, API.CURRENT_ARENA, API.NumPlayers, API.Phase)
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

function API.RegisterMusic(music)
    API.Music = music
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

function API.RegisterCancelTrigger(trigger)
    trigger.interactedEvent:Connect(API.EndMission)
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
    API.DangerCallback(0, 0)
    API.CountDown = false
    API.TimeLeft = 0
    API.Phase = 0
    API.PhaseTimer = 0
    API.CountdownState:SetCustomProperty("TimeLeft", 0)
    API.MissionTable = {}
    API.Music:SetCustomProperty("Song", 1)
    API.ClearSpawned()
    for _, obj in ipairs(API.Static:GetChildren()) do
        if Object.IsValid(obj) then
            API.Static:DestroySharedAsset(obj)
        end
    end
end

function API.StartCountDown(time)
    API.CountDown = true
    API.TimeLeft = time
    API.Phasetimer = 0
    API.CountdownState:SetCustomProperty("TimeLeft", time)
end

function API.StopCountDown()
    API.CountDown = false
    API.TimeLeft = 0
    API.CountdownState:SetCustomProperty("TimeLeft", 0)
end

function API.CountDownTick(time)
    if API.CompletedPhase() then
        API.StopCountDown()
        API.ClearSpawned()
        API.Phase = API.Phase + 1
        API.StartPhase()
    end
    if API.CountDown then
        API.TimeLeft = API.TimeLeft - time
        if API.TimeLeft <= 0 then
            API.FailMission()
        end
    end
    API.PhaseTimer = API.PhaseTimer + time
    API.CountdownState:SetCustomProperty("TimeLeft", API.TimeLeft)
end

function API.StartPhase()
    if API.Phase <= #API.MissionTable then
    	print(API.Phase)
        if API.Phase == 7 then
        	print("Finale")
            API.Music:SetCustomProperty("Song", 4)
        elseif API.Phase > 4 then
            API.Music:SetCustomProperty("Song", 3)
        end
        API.DangerCallback(API.CURRENT_ARENA, API.Phase)
        local mission = API.MissionTable[API.Phase]
        API.MessageEvent:SetCustomProperty("Message", mission.objective)
        for i=1,4 do
            for _, tbl in ipairs(mission.objects[i]) do
                local scale = tbl.scale
                local rotation = tbl.rotation
                local spawned = API.Static:SpawnSharedAsset(tbl.template, {position = tbl.position, rotation = rotation or Rotation.ZERO, scale = scale or Vector3.ONE})
                if API.NumPlayers == 1 then
                    spawned.serverUserData.health = tbl.health
                else
                    spawned.serverUserData.health = tbl.health * 2
                end
                spawned.serverUserData.maxHealth = spawned.serverUserData.health
                API.SpawnedObjects[i][spawned] = {}
            end
        end
        API.StartCountDown(mission.time)
    else
        API.MissionSuccess()
    end
end

function API.StartMission(missionNumber)
    -- don't do anything for second one if someone else starts
    if API.CURRENT_ARENA ~= 0 then
        return
    end
    API.Lives = 4
    API.NumPlayers = #Game.GetPlayers()
    API.StateEvent:SetCustomProperty("Lives", API.Lives)
    if missionNumber == 1 then
        API.CURRENT_ARENA = 1
    elseif missionNumber == 2 then
        API.CURRENT_ARENA = 2
    elseif missionNumber == 3 then
        API.CURRENT_ARENA = 4
    elseif missionNumber == 4 then
        API.CURRENT_ARENA = 4
    else
        API.CURRENT_ARENA = 1
    end
    local values = API.ObjectiveCallback(missionNumber, API.NumPlayers)
    API.MissionTable = values[1]
    API.RewardAmount = values[2]
    API.SpawnAllPlayers()
    Task.Spawn(
        function()
            API.MessageEvent:SetCustomProperty("Message", "Starting mission")
            Task.Wait(2)
            API.Music:SetCustomProperty("Song", 2)
            API.Phase = 1
            API.StartPhase()
        end
    )
end

function API.ClearSpawned()
    for i = 1, 4 do
        for key, val in pairs(API.SpawnedObjects[i]) do
            if Object.IsValid(val) then
                API.Static:DestroySharedAsset(val)
            end
        end
    end
    API.SpawnedObjects = {{}, {}, {}, {}}
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

function API.MissionSuccess()
    API.CURRENT_ARENA = 0
    Task.Spawn(
        function()
            API.MessageEvent:SetCustomProperty("Message", "Succesfully Completed the Mission!")
            API.RewardMessage:SetCustomProperty("Message", "Everyone received "..tostring(API.RewardAmount).." coins")
            for i, player in ipairs(Game.GetPlayers()) do
                if not player.isDead then
                    player:SetWorldPosition(API.SpawnPoints[1]:GetWorldPosition() - Vector3.New(0, 200 * i, 0))
                end
                local gold = player.serverUserData.resources.gold + API.RewardAmount
                player.serverUserData.resources.gold = gold
                player:SetPrivateNetworkedData("gold", gold)
            end
            Task.Wait(3)
            API.RewardMessage:SetCustomProperty("Message", "")
            API.MessageEvent:SetCustomProperty("Message", "")
        end
    )
    API.Cleanup()
end

function API.EndMission()
    if API.CURRENT_AREA == 0 then
        return -- Someone else already activated this.
    end
    API.CURRENT_ARENA = 0
    API.Cleanup()
    for i, player in ipairs(Game.GetPlayers()) do
        if not player.isDead then
            player:SetWorldPosition(API.SpawnPoints[1]:GetWorldPosition() + Vector3.New(0, 200 * i, 0))
        end
    end
    Task.Spawn(
        function()
            API.MessageEvent:SetCustomProperty("Message", "Returning to base.\nFight another day.")
            Task.Wait(3)
            API.MessageEvent:SetCustomProperty("Message", "")
        end
    )
end

function API.FailMission()
    API.CURRENT_ARENA = 0
    API.Cleanup()
    for i, player in ipairs(Game.GetPlayers()) do
        if not player.isDead then
            player:SetWorldPosition(API.SpawnPoints[1]:GetWorldPosition())
        end
    end
    Task.Spawn(
        function()
            API.MessageEvent:SetCustomProperty("Message", "Mission Failed")
            Task.Wait(3)
            API.MessageEvent:SetCustomProperty("Message", "")
        end
    )
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

function API.SpawnAllPlayers()
    local spawnPoint = API.SpawnPoints[API.CURRENT_ARENA + 1]
    for i, player in ipairs(Game.GetPlayers()) do
        if not player.isDead then
            player:Spawn(
                {
                    position = spawnPoint:GetWorldPosition() + Vector3.New(0, i * 200, 0),
                    rotation = spawnPoint:GetWorldRotation()
                }
            )
        end
    end
end

function API.GetSpawn(player)
    local offset = 0
    for i, _player in ipairs(Game.GetPlayers()) do
        if player == _player then
            offset = i * 200
        end
    end
    return {API.SpawnPoints[API.CURRENT_ARENA + 1], offset}
end

function API.PlayerDied()
    if API.CURRENT_ARENA > 0 then
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
        if API.SpawnedObjects[index][target] ~= nil then
            API.SpawnedObjects[index][target] = nil
        end
        return
    end
    if target.serverUserData.health == 0 then
        API.SpawnedObjects[index][target] = nil
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

function API.RegisterObjectiveCallback(callback)
    API.ObjectiveCallback = callback
end

function API.RegisterDangerCallback(callback)
    API.DangerCallback = callback
end

API.initializing = false
return API
