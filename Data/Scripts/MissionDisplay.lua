local DETECT_1 = script:GetCustomProperty("Detect1"):WaitForObject() ---@type Trigger
local DETECT_2 = script:GetCustomProperty("Detect2"):WaitForObject() ---@type Trigger
local DETECT_3 = script:GetCustomProperty("Detect3"):WaitForObject() ---@type Trigger
local DETECT_4 = script:GetCustomProperty("Detect4"):WaitForObject() ---@type Trigger
local STATUS_1 = script:GetCustomProperty("Status1"):WaitForObject() ---@type WorldText
local STATUS_2 = script:GetCustomProperty("Status2"):WaitForObject() ---@type WorldText
local STATUS_3 = script:GetCustomProperty("Status3"):WaitForObject() ---@type WorldText
local STATUS_4 = script:GetCustomProperty("Status4"):WaitForObject() ---@type WorldText

local MAX_PLAYERS = script:GetCustomProperty("MaxPlayers")

local triggers = {DETECT_1, DETECT_2, DETECT_3, DETECT_4}
local displays = {STATUS_1, STATUS_2, STATUS_3, STATUS_4}

local red = Color.New(Vector3.New(1, 0, 0))
local white = Color.New(Vector3.New(1, 1, 1))

if MAX_PLAYERS == 1 then
    STATUS_1.text = ""
    STATUS_2.text = ""
    STATUS_3.text = ""
    STATUS_4.text = ""
end

function Tick(deltaTime)
    for i = 1, 4 do
        local ready = 0
        for _, player in ipairs(Game.GetPlayers()) do
            if triggers[i]:IsOverlapping(player) then
                ready = ready + 1
            end
        end
        displays[i].text = tostring(ready).."/"..tostring(MAX_PLAYERS) 
        if ready == MAX_PLAYERS then
            displays[i]:SetColor(white)
        else
            displays[i]:SetColor(red)
        end
    end
end