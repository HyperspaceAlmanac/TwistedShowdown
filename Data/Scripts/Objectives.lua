-- API 
local API = require(script:GetCustomProperty("GameStateAPI"))

-- Sword 
local HazardBarrel = script:GetCustomProperty("HazardBarrel")
local mission1 = {
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-19250, 15550, -4200), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 1 sacred trees"
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-19250, 15550, -3000), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 2 sacred trees"
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-19250, 15550, -4200), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 3 sacred trees"
    }
    ,    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-19250, 15550, -3000), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 4 sacred trees"
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-19250, 15550, -4200), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 5 sacred trees"
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-19250, 15550, -3000), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 6 sacred trees"
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-19250, 15550, -4200), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 7 sacred trees"
    }
}

local mission2 = {
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-9850, -6350, 600), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 1 sacred trees"
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-9850, -6350, 1200), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 2 sacred trees"
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-9850, -6350, 600), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 3 sacred trees"
    }
    ,    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-9850, -6350, 1200), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 4 sacred trees"
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-9850, -6350, 600), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 5 sacred trees"
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-9850, -6350, 1200), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 6 sacred trees"
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-9850, -6350, 600), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Destroy 7 sacred trees"
    }
}

function GetTable(num)
    if num == 1 then
        return {mission1, 500}
    elseif num == 2 then
        return {mission2, 500}
    end
end

API.RegisterObjectiveCallback(GetTable)