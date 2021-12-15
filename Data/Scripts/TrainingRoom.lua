-- API 
local API = require(script:GetCustomProperty("GameStateAPI"))

local SwordTraining = script:GetCustomProperty("SwordTraining"):WaitForObject()
local MagicTraining = script:GetCustomProperty("MagicTraining"):WaitForObject()
local FlowerTraining = script:GetCustomProperty("FlowerTraining"):WaitForObject()

local swordData = {
    {maxHealth = 200, defense = 0, reward = 10},
    {maxHealth = 500, defense = 13, reward = 100},
    {maxHealth = 1000, defense = 25, reward = 500},
    {maxHealth = 2000, defense = 38, reward = 2000}
}

local magicData = {
    {maxHealth = 200, defense = 0, reward = 10},
    {maxHealth = 500, defense = 13, reward = 100},
    {maxHealth = 1000, defense = 25, reward = 500},
    {maxHealth = 2000, defense = 38, reward = 2000}
}

local flowerData = {
    {maxHealth = 200, defense = 0, reward = 10},
    {maxHealth = 500, defense = 0, reward = 100},
    {maxHealth = 1000, defense = 0, reward = 500},
    {maxHealth = 2000, defense = 0, reward = 2000}
}

for i, target in ipairs(SwordTraining:GetChildren()) do
    API.RegisterSword(target, swordData[i])
end

for i, target in ipairs(MagicTraining:GetChildren()) do
    API.RegisterMagic(target, magicData[i])
end

for i, target in ipairs(FlowerTraining:GetChildren()) do
    API.RegisterFlower(target, flowerData[i])
end