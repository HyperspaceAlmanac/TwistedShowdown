local QuickCast = script:GetCustomProperty("QuickCast"):WaitForObject()
local PowerCast = script:GetCustomProperty("PowerCast"):WaitForObject()
local Meditate = script:GetCustomProperty("Meditate"):WaitForObject()
local weapon = script:FindAncestorByType("Equipment")

local API = require(script:GetCustomProperty("GameStateAPI"))

local qCost, qPower = weapon:GetCustomProperty("Cost1"), QuickCast:GetCustomProperty("Power")
local pCost, pPower = weapon:GetCustomProperty("Cost2"), PowerCast:GetCustomProperty("Power")

local lockedOn = false

function CanCast()
    if Object.IsValid(weapon) and weapon.owner and Object.IsValid(weapon.owner) then
        if weapon.owner.stance == "Flower" then
            return true
        end
    end
    return false
end

function GetValidTarget(player, target)
    if not Object.IsValid(target) then return nil end

    if API.ValidTarget(player, target) then
        return target
    elseif API.ValidTrainingTarget(player, target) then
        return target
    else
        return nil
    end
end

function ApplyHeal(player, target, amount)
    if Object.IsValid(player) and Object.IsValid(target) then
        local result = GetValidTarget(player, target)
        if result then
            API.HealTarget(player, target, amount)
        end
    end
end

function HandleInterrupt(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", false)
    end
    player.lookControlMode = LookControlMode.RELATIVE
end

function CastEvent(ability)
    ability.owner.lookControlMode = LookControlMode.NONE
    lockedOn = ability.owner:GetPrivateNetworkedData("LockedOn")
    
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", true)
    end
    ability.owner.serverUserData.casting = true
end

function QuickExecuteEvent(ability)
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", false)
    end
    ability.owner:ApplyDamage(Damage.New(qCost))
    local player = ability.owner
    ApplyHeal(player, player.serverUserData.target, qPower)
end

function PowerExecuteEvent(ability)
    if lockedOn == false then
        ability.owner:SetPrivateNetworkedData("LockedOn", false)
    end
    ability.owner:ApplyDamage(Damage.New(pCost))
    local player = ability.owner
    ApplyHeal(player, player.serverUserData.target, pPower)
end

function MeditateExecuteEvent(ability)
    Task.Spawn(
        function()
            local player = ability.owner
            local maxHitPoints = ability.owner.maxHitPoints
            local amount = weapon:GetCustomProperty("HealthPer2") * 2
            for i = 1, 7 do
                if player.isDead == false then
                    player.hitPoints = math.min(maxHitPoints, player.hitPoints + amount)
                else
                    return
                end
                if i < 7 then
                    Task.Wait(1)
                end
            end
        end
    )
end

function Tick(deltaTime)
    if weapon.owner then
        local player = weapon.owner
        if player.serverUserData.stance == "Flower" then
            if player.serverUserData.target == nil then
                QuickCast.isEnabled = false
                PowerCast.isEnabled = false
            else
                QuickCast.isEnabled = true
                PowerCast.isEnabled = true
            end
        end
    end
end

QuickCast.interruptedEvent:Connect(HandleInterrupt)
QuickCast.castEvent:Connect(CastEvent)
QuickCast.executeEvent:Connect(QuickExecuteEvent)
QuickCast.recoveryEvent:Connect(function(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    player.lookControlMode = LookControlMode.RELATIVE
end)
PowerCast.interruptedEvent:Connect(HandleInterrupt)
PowerCast.castEvent:Connect(CastEvent)
PowerCast.executeEvent:Connect(PowerExecuteEvent)
PowerCast.recoveryEvent:Connect(function(ability)
    local player = ability.owner
    player.serverUserData.casting = false
    player.lookControlMode = LookControlMode.RELATIVE
end)
Meditate.interruptedEvent:Connect(HandleInterrupt)
Meditate.castEvent:Connect(function(ability)
    ability.owner.serverUserData.casting = true
end)
Meditate.executeEvent:Connect(MeditateExecuteEvent)
Meditate.recoveryEvent:Connect(function(ability)
    local player = ability.owner
    player.serverUserData.casting = false
end)

