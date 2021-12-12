-- API 
local API = require(script:GetCustomProperty("GameStateAPI"))

local SwordTraining = script:GetCustomProperty("SwordTraining"):WaitForObject()
local MagicTraining = script:GetCustomProperty("MagicTraining"):WaitForObject()
local FlowerTraining = script:GetCustomProperty("FlowerTraining"):WaitForObject()

local swordData = {
    {maxHealth = 100, defense = 0, reward = 5},
    {maxHealth = 500, defense = 50, reward = 100},
    {maxHealth = 1000, defense = 100, reward = 1000},
    {maxHealth = 10000, defense = 200, reward = 10000},
    {maxHealth = 50000, defense = 300, reward = 50000}
}

local magicData = {
    {maxHealth = 100, defense = 0, reward = 5},
    {maxHealth = 500, defense = 50, reward = 50},
    {maxHealth = 1000, defense = 100, reward = 1000},
    {maxHealth = 10000, defense = 200, reward = 10000},
    {maxHealth = 50000, defense = 300, reward = 50000}
}

local flowerData = {
    {maxHealth = 100, defense = 0, reward = 5},
    {maxHealth = 500, defense = 50, reward = 50},
    {maxHealth = 2000, defense = 100, reward = 1000},
    {maxHealth = 10000, defense = 200, reward = 10000},
    {maxHealth = 50000, defense = 300, reward = 50000}
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