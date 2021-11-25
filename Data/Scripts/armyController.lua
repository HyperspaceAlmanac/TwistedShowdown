local Army = script:GetCustomProperty("Army"):WaitForObject()
local Target = nil
local lockedOn = fales
local ForwardCamera = script:GetCustomProperty("ForwardCamera"):WaitForObject()
local Reticle = script:GetCustomProperty("Reticle"):WaitForObject()
local targetName = Reticle:GetCustomProperty("TargetName"):WaitForObject()
local Targetting = script:GetCustomProperty("Targetting"):WaitForObject()

local player = Game.GetLocalPlayer()
local soldiers = {}
local moving = false
for index, soldier in ipairs(Army:GetChildren()) do
    soldiers[index] = soldier
    soldiers[index].visibility = Visibility.FORCE_OFF
end

function PlayerMovement(player, params)
    moving = params.direction ~= Vector3.ZERO
end

function Tick(deltaTime)
    local forwardVector = player:GetWorldTransform():GetForwardVector()
    local needToMove = (soldiers[1]:GetWorldPosition() - (player:GetWorldPosition() + forwardVector * 300)).size > 20
    soldiers[1]:MoveTo(player:GetWorldPosition() + forwardVector * 300, 0.1)
    soldiers[1]:SetRotation(player:GetWorldRotation())
    soldiers[2]:MoveTo(player:GetWorldPosition() - forwardVector * 300, 0.1)
    soldiers[2]:SetRotation(player:GetWorldRotation())
    soldiers[3]:MoveTo(player:GetWorldPosition() + Rotation.New(0, 0, 90) * forwardVector * 300, 0.1)
    soldiers[3]:SetRotation(player:GetWorldRotation())
    soldiers[4]:MoveTo(player:GetWorldPosition() + Rotation.New(0, 0, -90) * forwardVector * 300, 0.1)
    soldiers[4]:SetRotation(player:GetWorldRotation())
    for i = 1, 4 do
        if moving or needToMove then
            soldiers[i].animationStance = "unarmed_run_forward"
        else
            soldiers[i].animationStance = "unarmed_idle_ready"
        end
    end

    if lockedOn and Target then
        local rotation = Rotation.New(Target:GetWorldPosition() - player:GetWorldPosition(), player:GetWorldTransform():GetUpVector())
        player:SetLookWorldRotation(rotation)
        ForwardCamera:SetRotation(rotation)
        ForwardCamera.rotationMode = RotationMode.CAMERA
    else
        ForwardCamera.rotationMode = RotationMode.LOOK_ANGLE
    end

    --local playerPos = player:GetWorldPosition()
    --playerPos.z = 300
    --LockonCam:SetWorldPosition(playerPos)
    --LockonCam:LookAt(Target:GetWorldPosition())

    --Raycast and targetting
end

function Other()
    if player:IsBindingPressed("ability_secondary") and Target ~= nil then
        local rotation = Rotation.New(Target:GetWorldPosition() - player:GetWorldPosition(), player:GetWorldTransform():GetUpVector())
        local difference = rotation - player:GetLookWorldRotation()
        player:SetLookWorldRotation(rotation)
        ForwardCamera:SetRotation(rotation)
        ForwardCamera.rotationMode = RotationMode.CAMERA
        --player:SetOverrideCamera(LockonCam)
    elseif player:IsBindingPressed("ability_secondary") == false then
        --player:ClearOverrideCamera()
        ForwardCamera.rotationMode = RotationMode.LOOK_ANGLE

        local hitResult = World.Raycast(player:GetWorldPosition() + 50, player:GetWorldPosition() + Quaternion.New(player:GetLookWorldRotation()):GetForwardVector() * 10000,
        {ignorePlayers = {player}}
        )
        local other = hitResult and hitResult.other or nil
        --print(other)
        if other ~= nil and Object.IsValid(other) and other:IsA("StaticMesh") and other:GetCustomProperty("Tag") ~= nil then
            Target = other
            targetName.text = other:GetCustomProperty("Tag")
            Reticle.visibility = Visibility.FORCE_ON
            Targetting.visibility = Visibility.FORCE_OFF
        else
            Reticle.visibility = Visibility.FORCE_OFF
            Targetting.visibility = Visibility.FORCE_ON
            Target = nil
        end
    end
end

function UpdateStatus(player, key)
    print(key)
    if key == "LockedOn" then
        lockedOn = player:GetPrivateNetworkedData(key)
    elseif key == "Target" then
        Target = player:GetPrivateNetworkedData(key)
        if Target then
            targetName.text = Target:GetCustomProperty("Tag")
            Reticle.visibility = Visibility.FORCE_ON
            Targetting.visibility = Visibility.FORCE_OFF
        else
            Reticle.visibility = Visibility.FORCE_OFF
            Targetting.visibility = Visibility.FORCE_ON
            Target = nil
        end
    end
end

player.movementHook:Connect(PlayerMovement)
player.privateNetworkedDataChangedEvent:Connect(UpdateStatus)