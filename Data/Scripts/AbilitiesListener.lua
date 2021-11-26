local PowerSlash = script:GetCustomProperty("PowerSlash"):WaitForObject()

function StopMovement(ability)
    if ability.owner then
        ability.owner:ResetVelocity()
    end
end

PowerSlash.castEvent:Connect(StopMovement)