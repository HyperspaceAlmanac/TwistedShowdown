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

function API.Initialize()
    
end

function API.RegisterObjects(folder)

end

function API.Reset()
end

function API.ReadState()
end

API.initialize()
API.initializing = false
return API