local Networking = script:GetCustomProperty("Networking"):WaitForObject()
local API = require(script:GetCustomProperty("GameStateAPI"))

--Projectiles and Dangers
local Fireball = script:GetCustomProperty("Fireball")
local Explosion = script:GetCustomProperty("Explosion")


local Triggers = script:GetCustomProperty("Triggers"):WaitForObject()

local Level1 = script:GetCustomProperty("Level1"):WaitForObject()
local Level2 = script:GetCustomProperty("Level2"):WaitForObject()
local L1R1 = Level1:FindChildByName("R1")
local L1R2 = Level1:FindChildByName("R2")
local L2R1 = Level2:FindChildByName("R1")
local L2R2 = Level2:FindChildByName("R2")

local projectileTable = {}

local currentLevel = 0
local currentPhase = 0
local elapsedTime = 0
local phaseTick = 0

local level1Lanterns = {}
local level2Lanterns = {}
local testPosition = Vector3.New(-23400, 15600, -3350)

local gracePeriod = 0

function PopulateLanterns()
    for i = 2, 7 do
        level1Lanterns[i] = {}
    end
    level1Lanterns[2][1] = Vector3.New(-21800, 14600, -3450)
    level1Lanterns[2][2] = Vector3.New(-26250, 23450, -1900)
    level1Lanterns[2][3] = Vector3.New(-30000, 13200, -1350)
    level1Lanterns[4][1] = Vector3.New(-27450, 18250, 900)
    level1Lanterns[6][1] = Vector3.New(-21250, 20200, -3750)
    for i = 2, 7 do
        level2Lanterns[i] = {}
    end
    level2Lanterns[2][1] = Vector3.New(-7150, -6800, 850)
    level2Lanterns[2][2] = Vector3.New(-12850, -11100, 1200)
    level2Lanterns[2][3] = Vector3.New(-8900, -11600, 4150)
    level2Lanterns[2][4] = Vector3.New(-10300, -8900, 4500)
    level2Lanterns[4][1] = Vector3.New(-13850, -8300, 6150)
    level2Lanterns[6][1] = Vector3.New(-11500, -11250, 6950)
end

PopulateLanterns()
--	a. Impelment Fireball
--	b. Implement Spinning Hitbox
--	c. Static Triggers + Client side object display
function ResetLevels()
    L1R1:StopRotate()
    L1R2:StopRotate()
    L2R1:StopRotate()
    L2R2:StopRotate()
    L1R1.collision = Collision.FORCE_OFF
    L1R1.visibility = Visibility.FORCE_OFF
    L1R2.collision = Collision.FORCE_OFF
    L1R2.visibility = Visibility.FORCE_OFF
    L2R1.collision = Collision.FORCE_OFF
    L2R1.visibility = Visibility.FORCE_OFF
    L2R2.collision = Collision.FORCE_OFF
    L2R2.visibility = Visibility.FORCE_OFF
end



function TriggerOverlap(trigger, other)
    if gracePeriod > 0 then
        return
    end
    if currentPhase < trigger.serverUserData.phase then
        return
    end
    if Object.IsValid(other) and other:IsA("Player") and not other.isDead then
       other:ApplyDamage(Damage.New(50 + currentLevel * 50))
    end
end

function KillTrigger(trigger, other)
    if gracePeriod > 0 then
        return
    end
    if Object.IsValid(other) and other:IsA("Player") and not other.isDead then
        other:ApplyDamage(Damage.New(50 + currentLevel * 50))
     end
end

function RegisterTriggers()
    for i, folder in ipairs(Triggers:GetChildren()) do
        for _, trigger in ipairs(folder:GetChildren()) do
            trigger.beginOverlapEvent:Connect(TriggerOverlap)
            trigger.serverUserData.phase = i
        end
    end
    for _, trigger in ipairs(Level1:FindDescendantsByType("Trigger")) do
       trigger.beginOverlapEvent:Connect(KillTrigger) 
    end
    for _, trigger in ipairs(Level2:FindDescendantsByType("Trigger")) do
       trigger.beginOverlapEvent:Connect(KillTrigger) 
    end
end

RegisterTriggers()


function ImpactEvent(projectile, other, hit)
    if hit then
        World.SpawnAsset(Explosion, {position = hit:GetImpactPosition()})
    end
    if Object.IsValid(other) and other:IsA("Player") and not other.isDead then
        local damage = Damage.New(50 + currentLevel * 50)
        other:ApplyDamage(damage)
    end
end

function SpawnFireball(position, radius)
    for _, player in ipairs(Game.GetPlayers()) do
        if (player:GetWorldPosition() - position).size < radius then
            local projectile = Projectile.Spawn(Fireball, position,
                Quaternion.New(Rotation.New(position - player:GetWorldPosition(), Vector3.UP)):GetForwardVector())
            projectile.speed = 300
            projectile.gravityScale = 0
            projectile.capsuleRadius = 100
            projectile.lifeSpan = 2
            projectile.homingTarget = player
            projectileTable[projectile] = projectile.impactEvent:Connect(ImpactEvent)
            Task.Spawn(function()
                projectileTable[projectile]:Disconnect()
                projectileTable[projectile] = nil
            end, 3.5)
        end
    end
end

ResetLevels()
function UpdateState(level, phase)
    if level ~= currentLevel then
        Networking:SetCustomProperty("Level", level)
    end
    gracePeriod = gracePeriod + 1
    Task.Spawn(
        function()
            Task.Wait(3)
            gracePeriod = gracePeriod - 1
        end
    )
    currentLevel = level
    currentPhase = phase
    elapsedTime = 0
    phaseTick = 0
    if level == 1 then
        if phase == 4 then -- 4
            L1R1:RotateContinuous(Vector3.New(0, 0, 1))
            L1R1.collision = Collision.FORCE_ON
            L1R1.visibility = Visibility.INHERIT
        elseif phase == 6 then -- 6
            L1R2:RotateContinuous(Vector3.New(0, 0, -1))
            L1R2.collision = Collision.FORCE_ON
            L1R2.visibility = Visibility.INHERIT
        end
    elseif level == 2 then
        if phase == 4 then
            L2R1:RotateContinuous(Vector3.New(0, 0, 1))
            L2R1.collision = Collision.FORCE_ON
            L2R1.visibility = Visibility.INHERIT
        elseif phase == 6 then
            L2R2:RotateContinuous(Vector3.New(0, 0, -1))
            L2R2.collision = Collision.FORCE_ON
            L2R2.visibility = Visibility.INHERIT
        end
    end
    Networking:SetCustomProperty("Phase", currentPhase)
    if level == 0 then
        ResetLevels()
    end
end

API.RegisterDangerCallback(UpdateState)

function ProcessTick(level, phase, tick)
    if phase > 1 and tick % 10 == 0  then
        for i = 2, phase do
            if level == 1 then
                for _, position in pairs(level1Lanterns[i]) do
                    SpawnFireball(position, i < 4 and 500 or 250)
                end
            elseif level == 2 then
                for _, position in pairs(level2Lanterns[i]) do
                    SpawnFireball(position, i < 4 and 375 or 250)
                end
            end
        end
    end
    -- 2, 5 = fireball. Every 10 seconds? Then 5?
    -- 3, 5 = More static death triggers.
    -- 4, 6 = spinning death triggers
    -- 7 = ice traps?
end

function Tick(deltaTime)
    if currentLevel == 0 then
        return
    end
    elapsedTime = elapsedTime + deltaTime
    if elapsedTime > 1 then
        elapsedTime = elapsedTime - 1
        phaseTick = phaseTick + 1
        ProcessTick(currentLevel, currentPhase, phaseTick)
    end
end