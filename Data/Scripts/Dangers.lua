local dangerMap = {}
local currentPhase = 0

-- Dangers and Obstacle types
-- 1. Fast Fireball
-- 2. Slow moving Ice ball
-- 3. Sword Slash
-- 4. Impule Zones
-- 5. Obstacles that block path
-- 6. Dangers attached to object that spins
function FireBall1(level, players)

end

function FireBall2(level, players)
    
end

function IceBall1(level, player)
end

function IceBall2(level, player)
end

function Slash1(level, players)
    
end

function Slash2(level, players)
    
end

function ImpulseZone1(level, players)
end

function ImpulseZone2(level, players)
end

function Initialize()
    dangerMap["Fireball"] = FireBall
end

function FillTable(dangers, level, players)
end

function HandleDanger(dangerList, level, players, phase)
    currentPhase = phase
    Task.Spawn(
        function()
            local phase = currentPhase
            local counter = 0
            local dangerTable = FillTable(dangerList, level, players)
            while phase == currentPhase do
                Task.Wait(1)
                counter = counter + 1
                
            end
        end
    )
end

Initialize()
Events.Connect("Danger", HandleDanger)