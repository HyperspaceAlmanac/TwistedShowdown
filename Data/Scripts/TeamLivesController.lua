local UIPanel = script:GetCustomProperty("UIPanel"):WaitForObject()
local H1 = script:GetCustomProperty("H1"):WaitForObject()
local H2 = script:GetCustomProperty("H2"):WaitForObject()
local H3 = script:GetCustomProperty("H3"):WaitForObject()
local H4 = script:GetCustomProperty("H4"):WaitForObject()

local State = script:GetCustomProperty("State"):WaitForObject()

local red = Color.New(1, 0, 0)
local white = Color.New(0, 0, 0)

function LivesHandler(obj, key)
    if key == "Lives" then
        local health = obj:GetCustomProperty(key)
        if health == 0 then
            UIPanel.visibility = Visibility.FORCE_OFF
        else
            UIPanel.visibility = Visibility.INHERIT
            H1:SetColor(health > 0 and red or white)
            H2:SetColor(health > 1 and red or white)
            H3:SetColor(health > 2 and red or white)
            H4:SetColor(health > 3 and red or white)
        end
    end
end

LivesHandler(State, "Lives")
State.customPropertyChangedEvent:Connect(LivesHandler)