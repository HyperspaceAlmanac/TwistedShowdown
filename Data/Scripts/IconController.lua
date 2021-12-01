local BottomIcons = script:GetCustomProperty("BottomIcons"):WaitForObject()
local Icon1 = script:GetCustomProperty("Icon1"):WaitForObject()
local Icon2 = script:GetCustomProperty("Icon2"):WaitForObject()
local Icon3 = script:GetCustomProperty("Icon3"):WaitForObject()
local MainIcon = script:GetCustomProperty("MainIcon"):WaitForObject()
local Cost1 = script:GetCustomProperty("Cost1"):WaitForObject()
local Cost2 = script:GetCustomProperty("Cost2"):WaitForObject()
local Cost3 = script:GetCustomProperty("Cost3"):WaitForObject()

local M_3 = script:GetCustomProperty("M_3")
local M_Main = script:GetCustomProperty("M_Main")
local M_1 = script:GetCustomProperty("M_1")
local M_2 = script:GetCustomProperty("M_2")
local S_1 = script:GetCustomProperty("S_1")
local S_Main = script:GetCustomProperty("S_Main")
local S_2 = script:GetCustomProperty("S_2")
local S_3 = script:GetCustomProperty("S_3")
local F_1 = script:GetCustomProperty("F_1")
local F_3 = script:GetCustomProperty("F_3")
local F_Main = script:GetCustomProperty("F_Main")
local F_2 = script:GetCustomProperty("F_2")


local player = Game.GetLocalPlayer()

function Tick(deltaTime)
    if player.clientUserData.stance == "Sword" then
        MainIcon.visibility = Visibility.INHERIT
        BottomIcons.visibility = Visibility.INHERIT
        MainIcon:SetImage(S_Main)
        Icon1:SetImage(S_1)
        Icon2:SetImage(S_2)
        Icon3:SetImage(S_3)
        if player.clientUserData.s1 ~= nil then
            Cost1.text = tostring(player.clientUserData.s1).." stamina"
            Cost2.text = tostring(player.clientUserData.s2).." stamina"
            Cost3.text = tostring(player.clientUserData.s3).." stamina"
        end
    elseif player.clientUserData.stance == "Magic" then
        MainIcon.visibility = Visibility.INHERIT
        BottomIcons.visibility = Visibility.INHERIT
        MainIcon:SetImage(M_Main)
        Icon1:SetImage(M_1)
        Icon2:SetImage(M_2)
        Icon3:SetImage(M_3)
        if player.clientUserData.m1 ~= nil then
            Cost1.text = tostring(player.clientUserData.m1).." mana"
            Cost2.text = tostring(player.clientUserData.m2).." mana"
            Cost3.text = tostring(player.clientUserData.m3).." mana"
        end
    elseif player.clientUserData.stance == "Flower" then
        MainIcon.visibility = Visibility.INHERIT
        BottomIcons.visibility = Visibility.INHERIT
        MainIcon:SetImage(F_Main)
        Icon1:SetImage(F_1)
        Icon2:SetImage(F_2)
        Icon3:SetImage(F_3)
        if player.clientUserData.f1 ~= nil then
            Cost1.text = tostring(player.clientUserData.f1).." health"
            Cost2.text = tostring(player.clientUserData.f2).." health"
            Cost3.text = "heal "..tostring(player.clientUserData.f3)
        end
    else
        MainIcon.visibility = Visibility.FORCE_OFF
        BottomIcons.visibility = Visibility.FORCE_OFF
    end
end
