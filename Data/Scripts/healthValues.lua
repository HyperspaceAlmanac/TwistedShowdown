local GameObjects = script:GetCustomProperty("GameObjects"):WaitForObject()
local C6 = script:GetCustomProperty("C6"):WaitForObject()

for i, obj in ipairs(GameObjects:GetChildren()) do
    obj.serverUserData.health = i * 10
    obj.serverUserData.maxHealth = 100
end

C6.serverUserData.health = 60
C6.serverUserData.maxHealth = 100