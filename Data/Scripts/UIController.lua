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
local RewardAudio = script:GetCustomProperty("RewardAudio"):WaitForObject()

local LockonSound = script:GetCustomProperty("LockonSound"):WaitForObject()
local LockonOffSound = script:GetCustomProperty("LockonOffSound"):WaitForObject()

local ShopTriggers = script:GetCustomProperty("ShopTriggers"):WaitForObject()
local ShopBG = script:GetCustomProperty("ShopBG"):WaitForObject()
local ShopUI = script:GetCustomProperty("ShopUI"):WaitForObject()

local EquipSound = script:GetCustomProperty("Equip"):WaitForObject()
local ErrorSound = script:GetCustomProperty("Error"):WaitForObject()

local CostsFolder = script:GetCustomProperty("Costs"):WaitForObject()
local WORLD_TEXT = script:GetCustomProperty("WorldText"):WaitForObject()

local TrainingText = {}
for _, text in ipairs(WORLD_TEXT:GetChildren()) do
    TrainingText[#TrainingText + 1] = text
end

local CostUITable = {}
for i, cost in ipairs(CostsFolder:GetChildren()) do
    CostUITable[i] = cost
end

local local_player = Game.GetLocalPlayer()
local_player.clientUserData.resources = {}
local_player.clientUserData.casting = false
local_player.clientUserData.waiting = false

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

local resources = {"gold", "s1", "s2", "s3", "s4", "m1", "m2", "m3", "m4", "f1", "f2", "f3", "f4"}
local weapons = {"", "s1", "s2", "s3", "s4", "", "m1", "m2", "m3", "m4", "", "f1", "f2", "f3", "f4"}
local costTable = {0, 500, 2000, 5000, 10000}

function DefaultWeapon(index)
    return index == 1 or index == 6 or index == 11
end

function ShopEvent(trigger, player, index)
    if player == local_player then
        if not local_player.clientUserData.waiting then
            local_player.clientUserData.waiting = true

			print(weapons[index])
            if player.clientUserData.resources[weapons[index]] or DefaultWeapon(index) then
                ShopUI.text = "Sucessfully equipped weapon"
                ShopBG.visibility = Visibility.INHERIT
                EquipSound:Play()
                Task.Spawn(
                    function()
                        Task.Wait(2)
                        ShopBG.visibility = Visibility.FORCE_OFF
                        ShopUI.text = ""
                        local_player.clientUserData.waiting = false
                    end
                )
            else
                Task.Spawn(
                    function()
                        Task.Wait(0.3)
                        if not player.clientUserData.resources[weapons[index]] then
                            ShopBG.visibility = Visibility.INHERIT
                            ShopUI.text = "Not enough gold to purchase weapon"
                        end
                        ErrorSound:Play()
                        Task.Wait(1.7)
                        ShopBG.visibility = Visibility.FORCE_OFF
                        ShopUI.text = ""
                        local_player.clientUserData.waiting = false
                    end
                )
            end
        end
    end
end

function GoldDisplay(amount)
	if amount == nil then
		return ""
	end
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
        --[[
        if GoldAmountDisplay.text ~= "" and not player.clientUserData.casting then
            if lockedOn then
                LockonSound:Play()
            else
                LockonOffSound:Play()
            end
        end
        ]]
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
        if value == nil then
        	return
        end
        player.clientUserData.resources[key] = value
        if key == "gold" then
            if GoldAmountDisplay.text ~= "" then
                RewardAudio:Play()
            end
            GoldAmountDisplay.text = GoldDisplay(value)
        end
    end
end

function InitializeResources()
	for _, key in ipairs(resources) do
		if key == "gold" then
			local_player.clientUserData.resources[key] = 0
		else
			local_player.clientUserData.resources[key] = false
		end
		local temp = local_player.clientUserData[key]
		UpdateStatus(local_player, key)
	end
end

maxStamina = local_player:GetPrivateNetworkedData("maxStamina") or 100
maxMagic = local_player:GetPrivateNetworkedData("maxMagic") or 100
stamina = local_player:GetPrivateNetworkedData("stamina") or 100
magic = local_player:GetPrivateNetworkedData("magic") or 100
stance = local_player:GetPrivateNetworkedData("Sword") or "Sword"
targetHealth = local_player:GetPrivateNetworkedData("targetHealth") or 0
local_player.clientUserData.stance = stance

InitializeResources()
local l1 = local_player.privateNetworkedDataChangedEvent:Connect(UpdateStatus)

local green = Color.New(Vector3.New(0, 1, 0))
local white = Color.New(Vector3.New(1, 1, 1))
local red = Color.New(Vector3.New(1, 0, 0))

function TrainingObjDisplay()
    for _, display in ipairs(TrainingText) do
        display:SetWorldRotation(Rotation.New(local_player:GetViewWorldPosition() - display:GetWorldPosition(), Vector3.UP))
    end
end

function UpdateCostDisplay()
    if not local_player.clientUserData.resources then
        return
    end
    for i, key in ipairs(weapons) do
        if key == "" or local_player.clientUserData.resources[key] then
            CostUITable[i]:SetColor(green)
            CostUITable[i].text = "Purchased"
        else
            local gold = local_player.clientUserData.resources.gold or 0
            local costIndex = i
            if i > 10 then
                costIndex = i - 10
            elseif i > 5 then
                costIndex = i - 5
            else
                costIndex = i
            end
            CostUITable[i].text = tostring(costTable[costIndex])
            if gold >= costTable[costIndex] then
                CostUITable[i]:SetColor(white)
            else
                CostUITable[i]:SetColor(red)
            end
        end
    end
end

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
    UpdateCostDisplay()
    TrainingObjDisplay()
end

local client_listeners = {}
function PlayerJoined(player)
    if player == local_player then
        client_listeners = {}
        for i, trigger in ipairs(ShopTriggers:GetChildren()) do
            client_listeners[i] = trigger.interactedEvent:Connect(ShopEvent, i)
        end 
    end
end

function PlayerLeft(player)
    for i, listener in ipairs(client_listeners) do
        listener:Disconnect()
        client_listeners[listener] = nil
    end
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