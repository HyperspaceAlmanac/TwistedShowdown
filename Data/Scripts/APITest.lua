local API = {}

if _G.testAPI == nil then
    _G.testAPI = {}
end

function API.SaveInfo(value)
    _G.testAPI.value = value
end

function API.GetInfo(value)
    return _G.testAPI[value]
end

return API