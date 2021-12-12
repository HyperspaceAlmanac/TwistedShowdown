-- BG
local MessageBG = script:GetCustomProperty("MessageBG"):WaitForObject()
local RewardBG = script:GetCustomProperty("RewardBG"):WaitForObject()
local TimerBG = script:GetCustomProperty("TimerBG"):WaitForObject()

-- Networking 
local CountDown = script:GetCustomProperty("CountDown"):WaitForObject()
local Message = script:GetCustomProperty("Message"):WaitForObject()
local Reward = script:GetCustomProperty("Reward"):WaitForObject()

-- Custom 
local MessageUI = script:GetCustomProperty("MessageUI"):WaitForObject()
local RewardsUI = script:GetCustomProperty("RewardsUI"):WaitForObject()
local TimeLeft = script:GetCustomProperty("TimeLeft"):WaitForObject()

function MessageHandler(obj, key)
    if key == "Message" then
        local message = obj:GetCustomProperty(key)
        if message == "" then
            MessageUI.text = ""
            MessageBG.visibility = Visibility.FORCE_OFF
        else
            MessageUI.text = message
            MessageBG.visibility = Visibility.INHERIT
        end
    end
end

function RewardHandler(obj, key)
    if key == "Message" then
        local message = obj:GetCustomProperty(key)
        if message == "" then
            RewardsUI.text = ""
            RewardBG.visibility = Visibility.FORCE_OFF
        else
            RewardsUI.text = message
            RewardBG.visibility = Visibility.INHERIT
        end
    end
end

function CountdownHandler(obj, key)
    if key == "TimeLeft" then
        local time = CoreMath.Round(obj:GetCustomProperty(key), 2)
        if time == 0 then
            TimerBG.visibility = Visibility.FORCE_OFF
        else
            TimeLeft.text = tostring(time)
            TimerBG.visibility = Visibility.INHERIT
        end
    end
end

MessageHandler(Message, "Message")
RewardHandler(Reward, "Message")
local l1 = Message.customPropertyChangedEvent:Connect(MessageHandler)
local l2 = Reward.customPropertyChangedEvent:Connect(RewardHandler)
local l3 = CountDown.customPropertyChangedEvent:Connect(CountdownHandler)

script.destroyEvent:Connect(
    function(obj)
        l1:Disconnect()
        l1 = nil
        l2:Disconnect()
        l2 = nil
        l3:Disconnect()
        l3 = nil
    end
)
