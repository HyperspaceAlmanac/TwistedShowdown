-- API 
local API = require(script:GetCustomProperty("GameStateAPI"))

-- Sword 
local HazardBarrel = script:GetCustomProperty("HazardBarrel")

-- Objectives
local SacredTree = script:GetCustomProperty("SacredTree") -- 
local Generator = script:GetCustomProperty("Generator")
local Humidifier = script:GetCustomProperty("Humidifier")
local Stabilizer = script:GetCustomProperty("Stabilizer")

local mission1_1 = {
    {
        time = 120,
        objects = {
            {
                { template = SacredTree, position = Vector3.New(-19250, 15550, -4200), scale = Vector3.New(1, 1, 1), health = 30 }
            }, {
                { template = Generator, position = Vector3.New(-19250, 15000, -4200), scale = Vector3.New(3, 3, 3), health = 30 }
            }, {
                { template = Humidifier, position = Vector3.New(-19250, 15550, -4200), scale = Vector3.New(5, 5, 5), health = 30 }
            }, {}
        },
        dangers = {},
        objective = "We are in and have not been detected yet.\nIt will take time to dispel the invisiblity spell.\nChop down the 4 sacred trees."
    },
    {
        time = 120,
        objects = {
            {},
            {
                { template = Generator, position = Vector3.New(-19250, 15000, -4200), scale = Vector3.New(3, 3, 3), health = 30 }
            }, {}, {}
        },
        dangers = {},
        objective = "The lanterns are active. Watch out for fireballs!\nQuickly freeze the 3 generators."
    },
    {
        time = 120,
        objects = {
            {}, {},
            {
                { template = Humidifier, position = Vector3.New(-19250, 15550, -4200), scale = Vector3.New(5, 5, 5), health = 30 }
            }, {}
        },
        dangers = {},
        objective = "We are unable to deactivate the lanterns.\nUse nature magic against the Humidifier!\nIce traps detected and marked. Avoid them!"
    }
    ,    {
        time = 120,
        objects = {
            {
                { template = Stabilizer, position = Vector3.New(-19250, 15000, -4200), scale = Vector3.New(5, 5, 5), health = 30 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "We have activated another trap.\nSwitching to plan B.\nDestroy the target that I have dispelled."
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-19250, 15550, -4200), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "We are more than halfway through.\nKEEP GOING!"
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-19250, 15550, -3000), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "We are almost there, but it is getting dangerous.\nReturn to base if needed."
    },
    {
        time = 120,
        objects = {
            {
                { template = HazardBarrel, position = Vector3.New(-19250, 15550, -4200), health = 10 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "I have dispelled the last illusions\nThis is the final push!\nOnwards to victory!"
    }
}

local mission1_2 = {
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

function GetTable(num, numPlayers)
    if numPlayers == 1 then
        if num == 1 then
            return {mission1_1, 500}
        elseif num == 2 then
            return {mission1_2, 500}
        else
            return {mission1_1, 500}
        end
    else

    end
end

API.RegisterObjectiveCallback(GetTable)