local weapon = script.parent
local fastCost = weapon:GetCustomProperty("Cost1")
local powerCost = weapon:GetCustomProperty("Cost2")
local shieldCost = weapon:GetCustomProperty("Cost3")
local QuickCast = script:GetCustomProperty("QuickCast"):WaitForObject()
local PowerCast = script:GetCustomProperty("PowerCast"):WaitForObject()
local Shield = script:GetCustomProperty("Shield"):WaitForObject()
local ShieldObj = script:GetCustomProperty("ShieldObj"):WaitForObject()

local FastProjectile = script:GetCustomProperty("IceShard")
local PowerProjectile = script:GetCustomProperty("IceShardLarge")
local damageFast = QuickCast:GetCustomProperty("Damage")
local damagePower = QuickCast:GetCustomProperty("Damage")

local IceExplosion = script:GetCustomProperty("IceExplosion")

local API = require(script:GetCustomProperty("GameStateAPI"))

local projectileTable = {}
local lockedOn = false

function GetValidTarget(player, target)
    if not Object.IsValid(target) then return nil end

    if API.ValidTrainingTarget(player, target) then
        return target
    elseif API.ValidTrainingTarget(player, target) then
        return target
    else
        return nil
    end
end

function ImpactEventFast(projectile, other, hit)
    if hit then
        World.SpawnAsset(IceExplosion, {position = hit:GetImpactPosition()})
    end
    if Object.IsValid(weapon) and Object.IsValid(weapon.owner) then
        local result = GetValidTarget(weapon.owner, other)
        if result then
            API.FreezeHit(weapon.owner, other, damageFast)
        end
    end
end
function ImpactEventPower(projectile, other, hit)
    if hit then
        World.SpawnAsset(IceExplosion, {position = hit:GetImpactPosition()})
    end
    if Object.IsValid(weapon) and Object.IsValid(weapon.owner) then
        local result = GetValidTarget(weapon.owner, other)
        if result then
            API.FreezeHit(weapon.owner, other, damagePower)
        end
    end
end

function SpawnProjectile(ability, fast)
    local player = ability.owner
    local playerTransform = player:GetWorldTransform()
    local projectile = nil
    if fast then
        local offset = playerTransform:GetForwardVector() * 100 + playerTransform:GetRightVector() * 100 + playerTransform:GetUpVector() * 100
        projectile = Projectile.Spawn(FastProjectile, player:GetWorldPosition() + offset, playerTransform:GetForwardVector())
    else
        local offset = playerTransform:GetForwardVector() * 200
        projectile = Projectile.Spawn(PowerProjectile, player:GetWorldPosition() + offset, playerTransform:GetForwardVector())
    end
    if projectile == nil then
        return
    end
    if fast then
        projectile.speed = 3000
    else
        projectile.speed = 2000
    end
    projectile.gravityScale = 0
    projectile.lifeSpan = 2
    projectile.homingTarget = player.serverUserData.target
    if fast then
        projectileTable[projectile] = projectile.impactEvent:Connect(ImpactEventFast)
    else
        projectileTable[projectile] = projectile.impactEvent:Connect(ImpactEventPower)
    end
    Task.Spawn(function()
        projectileTable[projectile]:Disconnect()
        projectileTable[projectile] = nil
    end, 2.5)
end

function HandleInterrupt(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", false)
    end
end

function CastPower(ability)
    ability.owner:ResetVelocity()
    ability.owner.serverUserData.casting = true
    lockedOn = ability.owner:GetPrivateNetworkedData("LockedOn")
    
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", true)
    end
end
function ExecutePower(ability)
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", false)
    end
    SpawnProjectile(ability, false)
end
function RecoveryPower(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    player:SetPrivateNetworkedData("magic", player.serverUserData.magic - powerCost)
end

function CastFast(ability)
    ability.owner:ResetVelocity()
    ability.owner.serverUserData.casting = true
    lockedOn = ability.owner:GetPrivateNetworkedData("LockedOn")
    
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", true)
    end
end

function ExecuteFast(ability)
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", false)
    end
    SpawnProjectile(ability, true)
end


function RecoveryFast(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    player:SetPrivateNetworkedData("magic", player.serverUserData.magic - fastCost)
end

function ExecuteShield(ability)
    ability.owner:ResetVelocity()
    ShieldObj.visibility = Visibility.INHERIT
    ShieldObj.collision = Collision.FORCE_ON
end

function RecoveryShield(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    player:SetPrivateNetworkedData("magic", player.serverUserData.magic - shieldCost)
    ShieldObj.visibility = Visibility.FORCE_OFF
    ShieldObj.collision = Collision.FORCE_OFF
end

function Tick(deltaTime)
    if weapon.owner then
        local player = weapon.owner
        if player.serverUserData.stance == "Magic" then
            local magic = player.serverUserData.magic
            local target = player.serverUserData.target
            if magic < fastCost or target == nil then
                QuickCast.isEnabled = false
            else
                QuickCast.isEnabled = true
            end

            if magic < powerCost or target == nil then
                PowerCast.isEnabled = false
            else
                PowerCast.isEnabled = true
            end

            if magic < shieldCost then
                Shield.isEnabled = false
            else
                Shield.isEnabled = true
            end
        end
    end
end

PowerCast.interruptedEvent:Connect(HandleInterrupt)
PowerCast.castEvent:Connect(CastPower)
PowerCast.executeEvent:Connect(ExecutePower)
PowerCast.recoveryEvent:Connect(RecoveryPower)

QuickCast.interruptedEvent:Connect(HandleInterrupt)
QuickCast.castEvent:Connect(CastFast)
QuickCast.executeEvent:Connect(ExecuteFast)
QuickCast.recoveryEvent:Connect(RecoveryFast)

Shield.interruptedEvent:Connect(HandleInterrupt)
Shield.castEvent:Connect(function(ability)
    ability.owner.serverUserData.casting = true
end)
Shield.executeEvent:Connect(ExecuteShield)
Shield.recoveryEvent:Connect(RecoveryShield)