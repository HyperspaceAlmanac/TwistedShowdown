local Target = nil
local lockedOn = false
local ForwardCamera = script:GetCustomProperty("ForwardCamera"):WaitForObject()
local Reticle = script:GetCustomProperty("Reticle"):WaitForObject()
local targetName = Reticle:GetCustomProperty("TargetName"):WaitForObject()
local Targetting = script:GetCustomProperty("Targetting"):WaitForObject()
local Progress = Reticle:GetCustomProperty("Progress"):WaitForObject()

local HealthBar = script:GetCustomProperty("Health"):WaitForObject()
local StaminaBar = script:GetCustomProperty("Stamina"):WaitForObject()
local MagicBar = script:GetCustomProperty("Magic"):WaitForObject()
local HealthText = script:GetCustomProperty("HealthText"):WaitForObject()
local StaminaText = script:GetCustomProperty("StaminaText"):WaitForObject()
local MagicText = script:GetCustomProperty("MagicText"):WaitForObject()

local GoldAmountDisplay = script:GetCustomProperty("GoldAmount"):WaitForObject()

local player = Game.GetLocalPlayer()

local stamina = 100
local magic = 100
local maxStamina = 100
local maxMagic = 100
local stance = "Sword"
local targetHealth = 0

local green = Color.New(0, 1, 0)
local cyan = Color.New(0, 1, 1)
local white = Color.New(1, 1, 1)
local red = Color.New(1, 0, 0)
local brown = Color.New(0.59, 0.3, 0)

local resources = {"gold", "s1", "s2", "s3", "m1", "m2", "m3", "f1", "f2", "f3"}

function Tick(deltaTime)

    if lockedOn and Target then
        local rotation = Rotation.New(Target:GetWorldPosition() - player:GetWorldPosition(), player:GetWorldTransform():GetUpVector())
        player:SetLookWorldRotation(rotation)
        ForwardCamera:SetRotation(rotation)
        ForwardCamera.rotationMode = RotationMode.CAMERA
    else
        ForwardCamera.rotationMode = RotationMode.LOOK_ANGLE
    end

    HealthBar.progress = player.hitPoints / player.maxHitPoints
    HealthText.text = tostring(player.hitPoints).." / "..tostring(player.maxHitPoints)
    StaminaBar.progress = stamina / maxStamina
    StaminaText.text = tostring(stamina).." / "..tostring(maxStamina)
    MagicBar.progress = magic / maxMagic
    MagicText.text = tostring(magic).." / "..tostring(maxMagic)
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
            -- Handle logic for health display
        else
            Reticle.visibility = Visibility.FORCE_OFF
            Targetting.visibility = Visibility.FORCE_ON
            Target = nil
        end
    end
end

function GoldDisplay(amount)
    if amount < 1000 then
        return tostring(amount)
    elseif amount / 1000 < 1000 then
        return tostring(CoreMath.Round(amount / 1000, 2)) .. "K"
    elseif amount / 1000000 < 1000 then
        return tostring(CoreMath.Round(amount / 1000000, 2)) .. "M"
    elseif amount / 1000000000 < 1000 then
        return tostring(CoreMath.Round(amount / 1000000000, 2)) .. "B"
    elseif amount / 1000000000000 < 1000 then
        return tostring(CoreMath.Round(amount / 1000000000, 2)) .. "T"
    end
end

function UpdateStatus(player, key)
    if key == "LockedOn" then
        lockedOn = player:GetPrivateNetworkedData(key)
        player.clientUserData.lockedOn = lockedOn
    elseif key == "Target" then
        Target = player:GetPrivateNetworkedData(key)
        if Target then
            targetName.text = Target.name
            Reticle.visibility = Visibility.FORCE_ON
            Targetting.visibility = Visibility.FORCE_OFF

            if stance == "Sword" then
                Progress.progress = targetHealth
                Progress:SetFillColor(green)
                Progress:SetBackgroundColor(red)
            elseif stance == "Magic" then
                Progress.progress = 1 - targetHealth
                Progress:SetFillColor(cyan)
                Progress:SetBackgroundColor(white)
            elseif stance == "Flower" then
                Progress.progress = 1 - targetHealth
                Progress:SetFillColor(green)
                Progress:SetBackgroundColor(brown)
            end
        else
            Reticle.visibility = Visibility.FORCE_OFF
            Targetting.visibility = Visibility.FORCE_ON
            Target = nil
        end
    elseif key == "maxStamina" then
        maxStamina = player:GetPrivateNetworkedData(key)
    elseif key == "maxMagic" then
        maxMagic = player:GetPrivateNetworkedData(key)
    elseif key == "stamina" then
        stamina = player:GetPrivateNetworkedData(key)
    elseif key == "magic" then
        magic = player:GetPrivateNetworkedData(key)
    elseif key == "stance" then
        stance = player:GetPrivateNetworkedData(key)
        player.clientUserData.stance = stance
    elseif key == "targetHealth" then
        targetHealth = player:GetPrivateNetworkedData(key)
        player.clientUserData.targetHealth = targetHealth
    elseif resources[key] ~= nil then
        local value = player:GetPrivateNetworkedData(key)
        player.clientUserData.resources[key] = value
        if key == "gold" then
            GoldAmountDisplay.text = GoldDisplay(value)
        end
    end
end

maxStamina = player:GetPrivateNetworkedData("maxStamina") or 100
maxMagic = player:GetPrivateNetworkedData("maxMagic") or 100
stamina = player:GetPrivateNetworkedData("stamina") or 100
magic = player:GetPrivateNetworkedData("magic") or 100
stance = player:GetPrivateNetworkedData("Sword") or "Sword"
targetHealth = player:GetPrivateNetworkedData("targetHealth") or 0
player.clientUserData.stance = stance
player.privateNetworkedDataChangedEvent:Connect(UpdateStatus)

local client_listeners = {}
function PlayerJoined(player)
    client_listeners[player] = {}
    client_listeners[player]["died"] = player.diedEvent:Connect(function(player, dmg)
        for _, ik in ipairs(player:GetIKAnchors()) do
            ik:Deactivate()
        end
    end)
end

function PlayerLeft(player)
    client_listeners[player]["died"]:Disconnect()
    client_listeners[player] = nil
end
Game.playerJoinedEvent:Connect(PlayerJoined)
Game.playerLeftEvent:Connect(PlayerLeft)