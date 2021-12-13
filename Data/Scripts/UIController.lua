local Target = nil
local targetPosition = nil
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
local RewardAudio = script:GetCustomProperty("RewardAudio")

local local_player = Game.GetLocalPlayer()

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
        local position = nil
        if targetPosition then
            position = targetPosition
        else
            position = Target:GetWorldPosition()
        end
        local rotation = Rotation.New(position - local_player:GetViewWorldPosition(), local_player:GetWorldTransform():GetUpVector())
        local_player:SetLookWorldRotation(rotation)
        ForwardCamera:SetRotation(rotation)
        ForwardCamera.rotationMode = RotationMode.CAMERA
    else
        ForwardCamera.rotationMode = RotationMode.LOOK_ANGLE
    end

    HealthBar.progress = local_player.hitPoints / local_player.maxHitPoints
    HealthText.text = tostring(local_player.hitPoints).." / "..tostring(local_player.maxHitPoints)
    StaminaBar.progress = stamina / maxStamina
    StaminaText.text = tostring(stamina).." / "..tostring(maxStamina)
    MagicBar.progress = magic / maxMagic
    MagicText.text = tostring(magic).." / "..tostring(maxMagic)
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

function UpdateHealthDisplay()
    targetHealth = local_player:GetPrivateNetworkedData("targetHealth")
    local_player.clientUserData.targetHealth = targetHealth

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
        else
            Reticle.visibility = Visibility.FORCE_OFF
            Targetting.visibility = Visibility.FORCE_ON
            Target = nil
        end
        UpdateHealthDisplay()
    elseif key == "TargetPosition" then
        targetPosition = player:GetPrivateNetworkedData(key)
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
        UpdateHealthDisplay()
    elseif player.clientUserData.resources[key] ~= nil then
        local value = player:GetPrivateNetworkedData(key)
        player.clientUserData.resources[key] = value
        if key == "gold" then
            if GoldAmountDisplay.text ~= "" then
                World.SpawnAsset(RewardAudio, {position = local_player:GetWorldPosition()})
            end
            GoldAmountDisplay.text = GoldDisplay(value)
        end
    end
end

function InitializeResources()
	local_player.clientUserData.resources = {}
	for _, key in ipairs(resources) do
	    if key == "gold" then
	        local_player.clientUserData.resources[key] = 0
	    else
	        local_player.clientUserData.resources[key] = false
	    end
	end
end

InitializeResources()

maxStamina = local_player:GetPrivateNetworkedData("maxStamina") or 100
maxMagic = local_player:GetPrivateNetworkedData("maxMagic") or 100
stamina = local_player:GetPrivateNetworkedData("stamina") or 100
magic = local_player:GetPrivateNetworkedData("magic") or 100
stance = local_player:GetPrivateNetworkedData("Sword") or "Sword"
targetHealth = local_player:GetPrivateNetworkedData("targetHealth") or 0
local_player.clientUserData.stance = stance
local l1 = local_player.privateNetworkedDataChangedEvent:Connect(UpdateStatus)

local client_listeners = {}
function PlayerJoined(player)
    client_listeners[player] = {}
end

function PlayerLeft(player)
    client_listeners[player] = nil
end
local l2 = Game.playerJoinedEvent:Connect(PlayerJoined)
local l3 = Game.playerLeftEvent:Connect(PlayerLeft)

script.destroyEvent:Connect(
    function(obj)
        l1:Disconnect()
        l1 = nil
        l2:Disconnect()
        l2 = nil
        l3:Disconnect()
        l3 = nil
    end
)