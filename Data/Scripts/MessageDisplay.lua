
-- Networking 
local CountDown = script:GetCustomProperty("CountDown"):WaitForObject()
local Message = script:GetCustomProperty("Message"):WaitForObject()
local Reward = script:GetCustomProperty("Reward"):WaitForObject()

-- Custom 
local MessageUI = script:GetCustomProperty("MessageUI"):WaitForObject()
local RewardsUI = script:GetCustomProperty("RewardsUI"):WaitForObject()
local Timer = script:GetCustomProperty("Timer"):WaitForObject()
local TimeLeft = script:GetCustomProperty("TimeLeft"):WaitForObject()

function MessageHandler(obj, key)
    if key == "Message" then
        local message = obj:GetCustomProperty(key)
        if message == "" then
            MessageUI.text = ""
            MessageUI.visibility = Visibility.FORCE_OFF
        else
            MessageUI.text = message
            MessageUI.visibility = Visibility.INHERIT
        end
    end
end

function RewardHandler(obj, key)
    if key == "Message" then
        local message = obj:GetCustomProperty(key)
        if message == "" then
            RewardsUI.text = ""
            RewardsUI.visibility = Visibility.FORCE_OFF
        else
            RewardsUI.text = message
            RewardsUI.visibility = Visibility.INHERIT
        end
    end
end

function CountdownHandler(obj, key)
    if key == "TimeLeft" then
        local time = CoreMath.Round(obj:GetCustomProperty(key), 2)
        if time == 0 then
            Timer.visibility = Visibility.FORCE_OFF
        else
            TimeLeft.text = tostring(time)
            Timer.visibility = Visibility.INHERIT
        end
    end
end

MessageHandler(Message, "Message")
RewardHandler(Reward, "Message")
Message.customPropertyChangedEvent:Connect(MessageHandler)
Reward.customPropertyChangedEvent:Connect(RewardHandler)
CountDown.customPropertyChangedEvent:Connect(CountdownHandler)
