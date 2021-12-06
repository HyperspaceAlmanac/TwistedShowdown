local Ik = script:GetCustomProperty("ik"):WaitForObject()
local Abilities = script:GetCustomProperty("abilities"):WaitForObject()
local BodyAnchor = script:GetCustomProperty("BodyAnchor")
local Equipment = script.parent.parent


local AbilitiesTable = {}
local LOCAL_PLAYER = Game.GetLocalPlayer()
local tempBodyAnchor = {}

function OnReady(ability)
    local prevIK = AbilitiesTable[ability.name]["recovery"]
    if prevIK ~= nil then
        if Equipment.owner == LOCAL_PLAYER then
            for _, anchor in ipairs(prevIK) do
                if anchor[2] ~= "body" then
                    anchor[1]:Deactivate()
                end
            end
        end
        if tempBodyAnchor[1] ~= nil then
            tempBodyAnchor[1]:Deactivate()
            tempBodyAnchor[1]:Destroy()
            tempBodyAnchor[1] = nil
        end
    end
    for _, anchor in ipairs(ability.owner:GetIKAnchors()) do
        anchor:Deactivate()
    end
end

function OnCast(ability)
    local currentIK = AbilitiesTable[ability.name]["cast"]
    if currentIK == nil then
        return
    end
    if tempBodyAnchor[1] ~= nil then
        tempBodyAnchor[1]:Deactivate()
        tempBodyAnchor[1]:Destroy()
        tempBodyAnchor[1] = nil
    end
    if Equipment.owner == LOCAL_PLAYER then
        for _, anchor in ipairs(currentIK) do
            if anchor[2] == "body" then
                tempBodyAnchor[1] = World.SpawnAsset(BodyAnchor, {transform = anchor[1]:GetWorldTransform()})
                tempBodyAnchor[1]:Activate(LOCAL_PLAYER)
            else
                anchor[1]:Activate(LOCAL_PLAYER)
            end
        end
    end
end

function OnExecute(ability)
    local prevIK = AbilitiesTable[ability.name]["cast"]
    if prevIK ~= nil then
        if Equipment.owner == LOCAL_PLAYER then
            for _, anchor in ipairs(prevIK) do
                if anchor[2] ~= "body" then
                    anchor[1]:Deactivate()
                end
            end
        end
        if tempBodyAnchor[1] ~= nil then
            tempBodyAnchor[1]:Deactivate()
            tempBodyAnchor[1]:Destroy()
            tempBodyAnchor[1] = nil
        end
    end
    local currentIK = AbilitiesTable[ability.name]["execute"]
    if currentIK == nil then
        return
    end
    if Equipment.owner == LOCAL_PLAYER then
        for _, anchor in ipairs(currentIK) do
            if anchor[2] == "body" then
                tempBodyAnchor[1] = World.SpawnAsset(BodyAnchor, {transform = anchor[1]:GetWorldTransform()})
                tempBodyAnchor[1]:Activate(LOCAL_PLAYER)
            else
                anchor[1]:Activate(LOCAL_PLAYER)
            end
        end
    end
end

function OnRecovery(ability)
    local prevIK = AbilitiesTable[ability.name]["execute"]
    if prevIK ~= nil then
        if Equipment.owner == LOCAL_PLAYER then
            for _, anchor in ipairs(prevIK) do
                if anchor[2] ~= "body" then
                    anchor[1]:Deactivate()
                end
            end
        end
        if tempBodyAnchor[1] ~= nil then
            tempBodyAnchor[1]:Deactivate()
            tempBodyAnchor[1]:Destroy()
            tempBodyAnchor[1] = nil
        end
    end
    local currentIK = AbilitiesTable[ability.name]["recovery"]
    if currentIK == nil then
        return
    end
    if Equipment.owner == LOCAL_PLAYER then
        for _, anchor in ipairs(currentIK) do
            if anchor[2] == "body" then
                tempBodyAnchor[1] = World.SpawnAsset(BodyAnchor, {transform = anchor[1]:GetWorldTransform()})
                tempBodyAnchor[1]:Activate(LOCAL_PLAYER)
            else
                anchor[1]:Activate(LOCAL_PLAYER)
            end
        end
    end
end

for _, ability in ipairs(Abilities:GetChildren()) do
    ability.readyEvent:Connect(OnReady)
    ability.castEvent:Connect(OnCast)
    ability.executeEvent:Connect(OnExecute)
    ability.recoveryEvent:Connect(OnRecovery)
    AbilitiesTable[ability.name] = {}
end

for _, ik in ipairs(Ik:GetChildren()) do
    local name = ""
    local phase = ""
    local i = 1
    for val in string.gmatch(ik.name, "[^_]+") do
        if i ==  1 then
            if AbilitiesTable[val] == nil then
                AbilitiesTable[val] = {}
            end
            name = val
        elseif i == 2 then
            if AbilitiesTable[name][val] == nil then
                AbilitiesTable[name][val] = {}
            end
            phase = val
        else
            table.insert(AbilitiesTable[name][phase], {ik, val})
        end
        i = i + 1
    end
end


