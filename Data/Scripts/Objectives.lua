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
        objective = "We are in and have not been detected yet.\nIt will take time to dispel the invisiblity spell.\nChop down the 4 sacred trees.",
        time = 90,
        objects = {
            {
                { template = SacredTree, position = Vector3.New(-22300, 18700, -4400), scale = Vector3.New(1, 1, 1), health = 100 },
                { template = SacredTree, position = Vector3.New(-22100, 13550, -4400), scale = Vector3.New(1, 1, 1), health = 100 },
                { template = SacredTree, position = Vector3.New(-29650, 13550, -4400), scale = Vector3.New(1, 1, 1), health = 100 },
                { template = SacredTree, position = Vector3.New(-29650, 18550, -4400), scale = Vector3.New(1, 1, 1), health = 100 }
            }, {}, {}, {}
        }
    },
    {
        objective = "The lanterns are active. Watch out for fireballs!\nFireballs will fire once every 10 econd\nQuickly freeze the 3 generators!",
        time = 90,
        objects = {
            {},
            {
                { template = Generator, position = Vector3.New(-22250, 21200, -2350), scale = Vector3.New(6, 6, 6), health = 100 },
                { template = Generator, position = Vector3.New(-22500, 14100, -2350), scale = Vector3.New(6, 6, 6), health = 100 },
                { template = Generator, position = Vector3.New(-30350, 13550, -2350), scale = Vector3.New(6, 6, 6), health = 100 }
            }, {}, {}
        }
    },
    {
        objective = "I am unable to deactivate the lanterns.\nUse nature magic against the Humidifiers!\nIce traps detected and marked. Avoid them!",
        time = 90,
        objects = {
            {}, {},
            {
                { template = Humidifier, position = Vector3.New(-23950, 18950, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 100 },
                { template = Humidifier, position = Vector3.New(-24350, 12650, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 100 },
                { template = Humidifier, position = Vector3.New(-29900, 16450, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 100 }
            }, {}
        }
    },
    {
        objective = "We have activated another trap.\nSwitching to plan B.\nDestroy the new dispelled targets.",
        time = 90,
        objects = {
            {
                { template = SacredTree, position = Vector3.New(-23500,17800, -4400), scale = Vector3.New(1, 1, 1), health = 100 },
                { template = SacredTree, position = Vector3.New(-23050, 14250, -4400), scale = Vector3.New(1, 1, 1), health = 100 }
            }, {
                { template = Generator, position = Vector3.New(-25850, 12950, -2050), scale = Vector3.New(6, 6, 6), health = 100 },
                { template = Generator, position = Vector3.New(-25850, 19050, -2050), scale = Vector3.New(6, 6, 6), health = 100 }
            }, {}, {}
        }
    },
    {
        objective = "We are more than halfway through.\nKEEP GOING!",
        time = 90,
        objects = {
            {}, {
                { template = Generator, position = Vector3.New(-29000, 20100, -1800), scale = Vector3.New(6, 6, 6), health = 100 },
                { template = Generator, position = Vector3.New(-29000, 12550, -1800), scale = Vector3.New(6, 6, 6), health = 100 }
            }, {
                { template = Humidifier, position = Vector3.New(-22700, 18000, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 100 },
                { template = Humidifier, position = Vector3.New(-22700, 14850, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 100 }
            }, {}
        }
    },
    {
        objective = "We are almost there, but it is getting dangerous.\nThe 4 sacred trees have rejuvenated.\nCHOP. THEM. DOWN.",
        time = 90,
        objects = {
            {
                { template = SacredTree, position = Vector3.New(-22300, 18700, -4400), scale = Vector3.New(1, 1, 1), health = 100 },
                { template = SacredTree, position = Vector3.New(-22100, 13550, -4400), scale = Vector3.New(1, 1, 1), health = 100 },
                { template = SacredTree, position = Vector3.New(-29650, 13550, -4400), scale = Vector3.New(1, 1, 1), health = 100 },
                { template = SacredTree, position = Vector3.New(-29650, 18550, -4400), scale = Vector3.New(1, 1, 1), health = 100 }
            }, {}, {}, {}
        }
    },
    {
        objective = "I have dispelled the last illusions\nThis is the final push!\nOnwards to victory!",
        time = 180,
        objects = {
            {
                { template = SacredTree, position = Vector3.New(-22150, 21550, -4400), scale = Vector3.New(1, 1, 1), health = 100 },
                { template = SacredTree, position = Vector3.New(-22150, 11150, -4400), scale = Vector3.New(1, 1, 1), health = 100 }
            }, {
                { template = Generator, position = Vector3.New(-27000, 18550, -1800), scale = Vector3.New(6, 6, 6), health = 100 },
                { template = Generator, position = Vector3.New(-27000, 13750, -1800), scale = Vector3.New(6, 6, 6), health = 100 }
            }, {
                { template = Humidifier, position = Vector3.New(-30500, 20950, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 100 },
                { template = Humidifier, position = Vector3.New(-30500, 11650, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 100 }
            }, {}
        },
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

function GetTable(num)
    if num == 1 then
        return {mission1_1, 500}
    elseif num == 2 then
        return {mission1_2, 500}
    else
        return {mission1_1, 500}
    end
end

API.RegisterObjectiveCallback(GetTable)