--API
local API = require(script:GetCustomProperty("GameStateAPI"))

-- Networking 
local CountDown = script:GetCustomProperty("CountDown"):WaitForObject()
local Static = script:GetCustomProperty("Static"):WaitForObject()
local State = script:GetCustomProperty("State"):WaitForObject()
local Reward = script:GetCustomProperty("Reward"):WaitForObject()
local Message = script:GetCustomProperty("Message"):WaitForObject()

-- Levels 
local S_Hideout = script:GetCustomProperty("Hideout"):WaitForObject()
local S_Level1 = script:GetCustomProperty("Level1"):WaitForObject()
local S_Level2 = script:GetCustomProperty("Level2"):WaitForObject()


-- Custom 
local Level1Trigger = script:GetCustomProperty("Level1Trigger"):WaitForObject()
local Level2Trigger = script:GetCustomProperty("Level2Trigger"):WaitForObject()
local MaxPlayers = script:GetCustomProperty("MaxPlayers")

function Initialize()
    local spawns = {S_Hideout, S_Level1, S_Level2}
    API.RegisterSpawn(spawns)
    API.RegisterMessage(Message)
    API.RegisterState(State)
    API.RegisterReward(Reward)
    API.RegisterCountdown(CountDown)
    API.RegisterStatic(Static)
    API.NumPlayers = MaxPlayers
end

function StartLevelOne(trigger, player)
    for _, player in ipairs(Game.GetPlayers()) do

    end
end

function StartLevelTwo(trigger, player)

end

Initialize()
Level1Trigger.interactedEvent:Connect(StartLevelOne)
Level2Trigger.interactedEvent:Connect(StartLevelTwo)