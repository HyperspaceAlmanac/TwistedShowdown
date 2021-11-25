local Attack1 = script:GetCustomProperty("Attack1"):WaitForObject()
local Attack2 = script:GetCustomProperty("Attack2"):WaitForObject()
local Dodge = script:GetCustomProperty("Dodge"):WaitForObject()
local BladeProjectile = script:GetCustomProperty("BladeProjectile")

function BladeAttack(ability)
    local target = ability.owner:GetPrivateNetworkedData("Target")
    if target ~= nil then
        local forwardVector = ability.owner:GetWorldTransform():GetForwardVector()
        print("Spawned")
        local projectile = Projectile.Spawn(BladeProjectile, ability.owner:GetWorldPosition() + forwardVector * 300, Vector3.UP)
        projectile.speed = 300
        projectile.gravityScale = 0
        projectile.lifeSpan = 2
        projectile.homingTarget = target
    end
end

Attack1.executeEvent:Connect(BladeAttack)