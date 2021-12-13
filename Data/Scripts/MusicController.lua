local Music = script:GetCustomProperty("Music"):WaitForObject()
local HideOut = script:GetCustomProperty("HideOut"):WaitForObject()
local Mission1 = script:GetCustomProperty("Mission1"):WaitForObject()
local Mission2 = script:GetCustomProperty("Mission2"):WaitForObject()
local Mission3 = script:GetCustomProperty("Mission3"):WaitForObject()

local musicTable = {HideOut, Mission1, Mission2, Mission3}
local current = 1
function MusicHandler(obj, key)
    print("Playing")
    if key == "Song" then
        musicTable[current]:Stop()
        current = obj:GetCustomProperty(key)
        musicTable[current]:Play()
    end
end
MusicHandler(Music, "Song")
local listener = Music.customPropertyChangedEvent:Connect(MusicHandler)
function OnDestroyed(obj)
    listener:Disconnect()
    listener = nil
end
script.destroyEvent:Connect(OnDestroyed)