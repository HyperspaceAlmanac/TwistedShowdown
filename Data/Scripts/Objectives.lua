-- API 
local API = require(script:GetCustomProperty("GameStateAPI"))

-- Sword 
local HazardBarrel = script:GetCustomProperty("HazardBarrel")

-- Objectives
local SacredTree = script:GetCustomProperty("SacredTree") -- 
local Generator = script:GetCustomProperty("Generator")
local Humidifier = script:GetCustomProperty("Humidifier")
local Stabilizer = script:GetCustomProperty("Stabilizer")
local Harmonizer = script:GetCustomProperty("Harmonizer")

local mission1 = {
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

local mission2 = {
    {
        time = 90,
        objects = {
            {
                { template = Stabilizer, position = Vector3.New(-10400, -5900, 1800), scale = Vector3.New(10, 10, 10), health = 180},
                { template = Stabilizer, position = Vector3.New(-10400, -11750, 1800), scale = Vector3.New(10, 10, 10), health = 180 },
                { template = Stabilizer, position = Vector3.New(-13200, -8950, 1800), scale = Vector3.New(10, 10, 10), health = 180 },
                { template = Stabilizer, position = Vector3.New(-7150, -8950, 1800), scale = Vector3.New(10, 10, 10), health = 180 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "We are in. Proceed with caution.\nDestroy the stabilizers."
    },
    {
        time = 90,
        objects = {
            {}, {
                { template = Generator, position = Vector3.New(-8200, -5550, 1300), scale = Vector3.New(6, 6, 6), health = 180 },
                { template = Generator, position = Vector3.New(-12600, -11250, 2500), scale = Vector3.New(6, 6, 6), health = 180 },
                { template = Generator, position = Vector3.New(-12500, -7700, 4600), scale = Vector3.New(6, 6, 6), health = 180 }
            }, {}, {}
        },
        dangers = {},
        objective = "Wait, don't destroy that stab...\nLantern defense system activated!\nQuickly, go for the generators!"
    },
    {
        time = 90,
        objects = {
            {}, {}, {
                { template = Harmonizer, position = Vector3.New(-7050, -6250, 2350), rotation = Rotation.New(90, 0, 52), scale = Vector3.New(10, 10, 10), health = 225 },
                { template = Harmonizer, position = Vector3.New(-7050, -9200, 5800), rotation = Rotation.New(90, 0, -167.42), scale = Vector3.New(10, 10, 10), health = 225 },
                { template = Harmonizer, position = Vector3.New(-11300, -13700, 1600), rotation = Rotation.New(90, 0, 56), scale = Vector3.New(10, 10, 10), health = 225 }
            }, {}
        },
        dangers = {},
        objective = "How did they fit this entire\ndefense system in here???\nFocus the harmonizers."
    },
    {
        time = 120,
        objects = {
            {}, {
                { template = Generator, position = Vector3.New(-9900, -11050, 2850), scale = Vector3.New(6, 6, 6), health = 180 },
                { template = Generator, position = Vector3.New(-10000, -7100, 3700), scale = Vector3.New(6, 6, 6), health = 180 }
            }, {
                { template = Harmonizer, position = Vector3.New(-9300, -5900, 5600), rotation = Rotation.New(90, 0, 33.9), scale = Vector3.New(10, 10, 10), health = 225 },
                { template = Harmonizer, position = Vector3.New(-13450, -10550, 4400), rotation = Rotation.New(90, 0, 51.8), scale = Vector3.New(10, 10, 10), health = 225 }
            }, {}
        },
        dangers = {},
        objective = "More defense systems online.\nFocus the marked high priority targets!"
    },
    {
        time = 90,
        objects = {
            {
                { template = Stabilizer, position = Vector3.New(-12150, -10850, 3850), scale = Vector3.New(10, 10, 10), health = 180 },
                { template = Stabilizer, position = Vector3.New(-8100, -10850, 2150), scale = Vector3.New(10, 10, 10), health = 180 },
                { template = Stabilizer, position = Vector3.New(-9650, -6800, 3550), scale = Vector3.New(10, 10, 10), health = 180 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "I will try to do what I can to slow it down.\nKeep going!"
    },
    {
        time = 120,
        objects = {
            {
                { template = Stabilizer, position = Vector3.New(-8400, -5950, 1500), scale = Vector3.New(10, 10, 10), health = 180 },
                { template = Stabilizer, position = Vector3.New(-9600, -12350, 2550), scale = Vector3.New(10, 10, 10), health = 180 }
            },
            {
                { template = Generator, position = Vector3.New(-12750, -6650, 2450), scale = Vector3.New(6, 6, 6), health = 180 },
                { template = Generator, position = Vector3.New(-7600, -9550, 1350), scale = Vector3.New(6, 6, 6), health = 180 }
            }, {
                { template = Harmonizer, position = Vector3.New(-8800, -5600, 5700), rotation = Rotation.New(90, 0, 39), scale = Vector3.New(10, 10, 10), health = 225 },
                { template = Harmonizer, position = Vector3.New(-11032, -12235, 1735), rotation = Rotation.New(90, 0, 132.4), scale = Vector3.New(10, 10, 10), health = 225 }
            }, {}
        },
        dangers = {},
        objective = "I am getting close to tracking down the\nmain control unit."
    },
    {
        time = 120,
        objects = {
            {
                { template = Stabilizer, position = Vector3.New(-10950, -5950, 5900), scale = Vector3.New(10, 10, 10), health = 180 },
                { template = Stabilizer, position = Vector3.New(-11200, -12200, 2050), scale = Vector3.New(10, 10, 10), health = 180 }
            },
            {
                { template = Generator, position = Vector3.New(-6800, -7350, 3750), scale = Vector3.New(6, 6, 6), health = 180 },
                { template = Generator, position = Vector3.New(-10450, -10350, 4950), scale = Vector3.New(6, 6, 6), health = 180 }
            }, {
                { template = Harmonizer, position = Vector3.New(-13550, -10700, 4450), rotation = Rotation.New(90, 0, 55.5), scale = Vector3.New(10, 10, 10), health = 225 },
                { template = Harmonizer, position = Vector3.New(-14850, -9200, 1800), rotation = Rotation.New(90, 0, -8), scale = Vector3.New(10, 10, 10), health = 225 }
            }, {}
        },
        dangers = {},
        objective = "Got it! Destory these targets\nto shut down the system!\nGO GO GO!"
    }
}

local mission3 = {
    {
        objective = "I have a plan to disable the defense systems.\nChop down the sacred trees again.",
        time = 90,
        objects = {
            {
                { template = SacredTree, position = Vector3.New(-22300, 18700, -4400), scale = Vector3.New(1, 1, 1), health = 250 },
                { template = SacredTree, position = Vector3.New(-22100, 13550, -4400), scale = Vector3.New(1, 1, 1), health = 250 },
                { template = SacredTree, position = Vector3.New(-29650, 13550, -4400), scale = Vector3.New(1, 1, 1), health = 250 },
                { template = SacredTree, position = Vector3.New(-29650, 18550, -4400), scale = Vector3.New(1, 1, 1), health = 250 }
            }, {}, {}, {}
        }
    },
    {
        objective = "So far so good.\nLantern defense system activated.\nDestroy the generators.",
        time = 90,
        objects = {
            {},
            {
                { template = Generator, position = Vector3.New(-22250, 21200, -2350), scale = Vector3.New(6, 6, 6), health = 250 },
                { template = Generator, position = Vector3.New(-22500, 14100, -2350), scale = Vector3.New(6, 6, 6), health = 250 },
                { template = Generator, position = Vector3.New(-30350, 13550, -2350), scale = Vector3.New(6, 6, 6), health = 250 }
            }, {}, {}
        }
    },
    {
        objective = "Ice traps activated.\nStill going according to plan.\nDestroy the Humidifiers.",
        time = 90,
        objects = {
            {}, {},
            {
                { template = Humidifier, position = Vector3.New(-23950, 18950, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 300 },
                { template = Humidifier, position = Vector3.New(-24350, 12650, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 300 },
                { template = Humidifier, position = Vector3.New(-29900, 16450, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 300 }
            }, {}
        }
    },
    {
        objective = "Wait, no not that one.\nUh oh, it was rigged.\nThe full defense system is coming up.",
        time = 90,
        objects = {
            {
                { template = SacredTree, position = Vector3.New(-23500,17800, -4400), scale = Vector3.New(1, 1, 1), health = 250 },
                { template = SacredTree, position = Vector3.New(-23050, 14250, -4400), scale = Vector3.New(1, 1, 1), health = 250 }
            }, {
                { template = Generator, position = Vector3.New(-25850, 12950, -2050), scale = Vector3.New(6, 6, 6), health = 250 },
                { template = Generator, position = Vector3.New(-25850, 19050, -2050), scale = Vector3.New(6, 6, 6), health = 250 }
            }, {}, {}
        }
    },
    {
        objective = "I will try to see if I can find a weakness in the sytem\nKeep going.",
        time = 90,
        objects = {
            {}, {
                { template = Generator, position = Vector3.New(-29000, 20100, -1800), scale = Vector3.New(6, 6, 6), health = 250 },
                { template = Generator, position = Vector3.New(-29000, 12550, -1800), scale = Vector3.New(6, 6, 6), health = 250 }
            }, {
                { template = Humidifier, position = Vector3.New(-22700, 18000, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 300 },
                { template = Humidifier, position = Vector3.New(-22700, 14850, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 300 }
            }, {}
        }
    },
    {
        objective = "That's not good...\nHow did they plant so many sacred trees???",
        time = 90,
        objects = {
            {
                { template = SacredTree, position = Vector3.New(-22300, 18700, -4400), scale = Vector3.New(1, 1, 1), health = 250 },
                { template = SacredTree, position = Vector3.New(-22100, 13550, -4400), scale = Vector3.New(1, 1, 1), health = 250 },
                { template = SacredTree, position = Vector3.New(-29650, 13550, -4400), scale = Vector3.New(1, 1, 1), health = 250 },
                { template = SacredTree, position = Vector3.New(-29650, 18550, -4400), scale = Vector3.New(1, 1, 1), health = 250 }
            }, {}, {}, {}
        }
    },
    {
        objective = "Our recon team has got a lot to explain.\nDon't die.",
        time = 180,
        objects = {
            {
                { template = SacredTree, position = Vector3.New(-22150, 21550, -4400), scale = Vector3.New(1, 1, 1), health = 250 },
                { template = SacredTree, position = Vector3.New(-22150, 11150, -4400), scale = Vector3.New(1, 1, 1), health = 250 }
            }, {
                { template = Generator, position = Vector3.New(-27000, 18550, -1800), scale = Vector3.New(6, 6, 6), health = 250 },
                { template = Generator, position = Vector3.New(-27000, 13750, -1800), scale = Vector3.New(6, 6, 6), health = 250 }
            }, {
                { template = Humidifier, position = Vector3.New(-30500, 20950, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 300 },
                { template = Humidifier, position = Vector3.New(-30500, 11650, -3910), scale = Vector3.New(7, 7, 7), rotation = Rotation.New(180, 0, 0), health = 300 }
            }, {}
        },
    }
}

local mission4 = {
    {
        time = 90,
        objects = {
            {
                { template = Stabilizer, position = Vector3.New(-10400, -5900, 1800), scale = Vector3.New(10, 10, 10), health = 450},
                { template = Stabilizer, position = Vector3.New(-10400, -11750, 1800), scale = Vector3.New(10, 10, 10), health = 450 },
                { template = Stabilizer, position = Vector3.New(-13200, -8950, 1800), scale = Vector3.New(10, 10, 10), health = 450 },
                { template = Stabilizer, position = Vector3.New(-7150, -8950, 1800), scale = Vector3.New(10, 10, 10), health = 450 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "Based on our previous mission here,\nI have a plan.\nDestory the stabilizers."
    },
    {
        time = 90,
        objects = {
            {}, {
                { template = Generator, position = Vector3.New(-8200, -5550, 1300), scale = Vector3.New(6, 6, 6), health = 450 },
                { template = Generator, position = Vector3.New(-12600, -11250, 2500), scale = Vector3.New(6, 6, 6), health = 450 },
                { template = Generator, position = Vector3.New(-12500, -7700, 4600), scale = Vector3.New(6, 6, 6), health = 450 }
            }, {}, {}
        },
        dangers = {},
        objective = "I found a weaknes in their sytem,\nall you have to do is...\nWait, our base is under attack!"
    },
    {
        time = 90,
        objects = {
            {}, {}, {
                { template = Harmonizer, position = Vector3.New(-7050, -6250, 2350), rotation = Rotation.New(90, 0, 52), scale = Vector3.New(10, 10, 10), health = 600 },
                { template = Harmonizer, position = Vector3.New(-7050, -9200, 5800), rotation = Rotation.New(90, 0, -167.42), scale = Vector3.New(10, 10, 10), health = 600 },
                { template = Harmonizer, position = Vector3.New(-11300, -13700, 1600), rotation = Rotation.New(90, 0, 56), scale = Vector3.New(10, 10, 10), health = 600 }
            }, {}
        },
        dangers = {},
        objective = "I am needed else where.\nI think you can handle it.\nDon't die."
    },
    {
        time = 120,
        objects = {
            {}, {
                { template = Generator, position = Vector3.New(-9900, -11050, 2850), scale = Vector3.New(6, 6, 6), health = 450 },
                { template = Generator, position = Vector3.New(-10000, -7100, 3700), scale = Vector3.New(6, 6, 6), health = 450 }
            }, {
                { template = Harmonizer, position = Vector3.New(-9300, -5900, 5600), rotation = Rotation.New(90, 0, 33.9), scale = Vector3.New(10, 10, 10), health = 600 },
                { template = Harmonizer, position = Vector3.New(-13450, -10550, 4400), rotation = Rotation.New(90, 0, 51.8), scale = Vector3.New(10, 10, 10), health = 600 }
            }, {}
        },
        dangers = {},
        objective = "..."
    },
    {
        time = 90,
        objects = {
            {
                { template = Stabilizer, position = Vector3.New(-12150, -10850, 3850), scale = Vector3.New(10, 10, 10), health = 450 },
                { template = Stabilizer, position = Vector3.New(-8100, -10850, 2150), scale = Vector3.New(10, 10, 10), health = 450 },
                { template = Stabilizer, position = Vector3.New(-9650, -6800, 3550), scale = Vector3.New(10, 10, 10), health = 450 }
            }, {}, {}, {}
        },
        dangers = {},
        objective = "......"
    },
    {
        time = 120,
        objects = {
            {
                { template = Stabilizer, position = Vector3.New(-8400, -5950, 1500), scale = Vector3.New(10, 10, 10), health = 450 },
                { template = Stabilizer, position = Vector3.New(-9600, -12350, 2550), scale = Vector3.New(10, 10, 10), health = 450 }
            },
            {
                { template = Generator, position = Vector3.New(-12750, -6650, 2450), scale = Vector3.New(6, 6, 6), health = 450 },
                { template = Generator, position = Vector3.New(-7600, -9550, 1350), scale = Vector3.New(6, 6, 6), health = 450 }
            }, {
                { template = Harmonizer, position = Vector3.New(-8800, -5600, 5700), rotation = Rotation.New(90, 0, 39), scale = Vector3.New(10, 10, 10), health = 600 },
                { template = Harmonizer, position = Vector3.New(-11032, -12235, 1735), rotation = Rotation.New(90, 0, 132.4), scale = Vector3.New(10, 10, 10), health = 600 }
            }, {}
        },
        dangers = {},
        objective = "We have repelled the enemy's attack.\nLooks like you got this under control."
    },
    {
        time = 120,
        objects = {
            {
                { template = Stabilizer, position = Vector3.New(-10950, -5950, 5900), scale = Vector3.New(10, 10, 10), health = 450 },
                { template = Stabilizer, position = Vector3.New(-11200, -12200, 2050), scale = Vector3.New(10, 10, 10), health = 450 }
            },
            {
                { template = Generator, position = Vector3.New(-6800, -7350, 3750), scale = Vector3.New(6, 6, 6), health = 450 },
                { template = Generator, position = Vector3.New(-10450, -10350, 4950), scale = Vector3.New(6, 6, 6), health = 450 }
            }, {
                { template = Harmonizer, position = Vector3.New(-13550, -10700, 4450), rotation = Rotation.New(90, 0, 55.5), scale = Vector3.New(10, 10, 10), health = 600 },
                { template = Harmonizer, position = Vector3.New(-14850, -9200, 1800), rotation = Rotation.New(90, 0, -8), scale = Vector3.New(10, 10, 10), health = 600 }
            }, {}
        },
        dangers = {},
        objective = "Same thing as before. Destroy these last few targets."
    }
}

function GetTable(num)
    if num == 1 then
        return {mission1, 150}
    elseif num == 2 then
        return {mission2, 375}
    elseif num == 3 then
        return {mission3, 1500}
    elseif num == 4 then
        return {mission4, 3750}
    else
        return {mission1, 500}
    end
end

API.RegisterObjectiveCallback(GetTable)