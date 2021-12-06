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
API.GAME_STATE = "Waiting"
API.CURRENT_ARENA = ""
API.ArenaState = {}
API.TimeLeft = 0

function API.RegisterObjects(folder)

end

function API.Reset()

end

function API.ExportState()
end

function API.StartMission()

end

function API.EndMission()
end

function API.FailMission()
end

function API.FreezeHit()
end

function API.SwordHit()
end

function API.HealTarget()
end

function API.ValidTargets()
end

function API.Hello()
    print("Hello")
end
API.initializing = false
return API
