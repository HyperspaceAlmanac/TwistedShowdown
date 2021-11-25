local ForwardCamera = script:GetCustomProperty("ForwardCamera"):WaitForObject()
local OtherCamera = script:GetCustomProperty("OtherCamera"):WaitForObject()
OtherCamera:RotateContinuous(Rotation.New(0, 0, 10))
local Target = script:GetCustomProperty("Humanoid1Rig"):WaitForObject()

local player = Game.GetLocalPlayer()

function MovementHook(player, params)
    if player:IsBindingPressed("ability_primary") then
        local rotation = player:GetLookWorldRotation()
        params.direction =  rotation * Vector3.FORWARD
    elseif player:IsBindingPressed("ability_secondary") then
        --local rotation = player:GetLookWorldRotation()
        --params.direction =  rotation * -Vector3.FORWARD
        player:SetOverrideCamera(OtherCamera)
    end
end

--local capture = OtherCamera:Capture(CameraCaptureResolution.MEDIUM)
--CameraUI:SetCameraCapture(capture)
function Tick(deltaTime)
    
end

player.movementHook:Connect(MovementHook)

