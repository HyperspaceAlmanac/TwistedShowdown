--API
local API = require(script:GetCustomProperty("GameStateAPI"))

-- Networking 
local CountDown = script:GetCustomProperty("CountDown"):WaitForObject()
local Static = script:GetCustomProperty("Static"):WaitForObject()
local State = script:GetCustomProperty("State"):WaitForObject()
local Reward = script:GetCustomProperty("Reward"):WaitForObject()
local Message = script:GetCustomProperty("Message"):WaitForObject()
local Music = script:GetCustomProperty("Music"):WaitForObject()

-- Levels 
local S_Hideout = script:GetCustomProperty("Hideout"):WaitForObject()
local S_Level1 = script:GetCustomProperty("Level1"):WaitForObject()
local S_Level2 = script:GetCustomProperty("Level2"):WaitForObject()

local DETECT_1 = script:GetCustomProperty("Detect1"):WaitForObject() ---@type Trigger
local DETECT_2 = script:GetCustomProperty("Detect2"):WaitForObject() ---@type Trigger
local DETECT_3 = script:GetCustomProperty("Detect3"):WaitForObject() ---@type Trigger
local DETECT_4 = script:GetCustomProperty("Detect4"):WaitForObject() ---@type Trigger

-- Cancel Level
local Escape1 = script:GetCustomProperty("Escape1"):WaitForObject()
local Escape2 = script:GetCustomProperty("Escape2"):WaitForObject()

-- Custom 
local MaxPlayers = script:GetCustomProperty("MaxPlayers")

function Initialize()
    local spawns = {S_Hideout, S_Level1, S_Level2, S_Level1, S_Level2}
    API.RegisterSpawn(spawns)
    API.RegisterMessage(Message)
    API.RegisterState(State)
    API.RegisterReward(Reward)
    API.RegisterCountdown(CountDown)
    API.RegisterStatic(Static)
    API.RegisterMusic(Music)
    API.NumPlayers = MaxPlayers
end

function StartLevel(trigger, onePlayer, level)
    if not onePlayer.serverUserData.waiting then
        onePlayer.serverUserData.waiting = true
        Task.Spawn(
            function()
                Task.Wait(1)
                onePlayer.serverUserData.waiting = false
            end
        )
        if MaxPlayers > 1 then
            if #Game.GetPlayers() < MaxPlayers then
                Task.Spawn(
                    function()
                        Message:SetCustomProperty("Message", "Need "..tostring(MaxPlayers).." players to do the mission")
                        Task.Wait(2)
                        Message:SetCustomProperty("Message", "")
                    end
                )
                return
            end
            for _, player in ipairs(Game.GetPlayers()) do
                if not trigger:IsOverlapping(player) then
                    Task.Spawn(
                        function()
                            Message:SetCustomProperty("Message", "Can only start mission if all players are here")
                            Task.Wait(2)
                            Message:SetCustomProperty("Message", "")
                        end
                    )
                    return
                end
            end
        end
        API.StartMission(level)
    end
end

function Tick(deltaTime)
    if API.CountDown then
        API.CountDownTick(deltaTime)
    end
end

API.RegisterCancelTrigger(Escape1)
API.RegisterCancelTrigger(Escape2)

Initialize()
DETECT_1.interactedEvent:Connect(StartLevel, 1)
DETECT_2.interactedEvent:Connect(StartLevel, 2)
DETECT_3.interactedEvent:Connect(StartLevel, 3)
DETECT_4.interactedEvent:Connect(StartLevel, 4)