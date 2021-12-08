local Message = script:GetCustomProperty("Message"):WaitForObject()
local Reward = script:GetCustomProperty("Reward"):WaitForObject()

local MessageUI = script:GetCustomProperty("MessageUI"):WaitForObject()
local RewardsUI = script:GetCustomProperty("RewardsUI"):WaitForObject()

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

MessageHandler(Message, "Message")
RewardHandler(Reward, "Message")
Message.customPropertyChangedEvent:Connect(MessageHandler)
Reward.customPropertyChangedEvent:Connect(RewardHandler)
