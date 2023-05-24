local function deleteExcessiveBoxHandleAdornments(parent)
    local boxHandleAdornmentCount = 0
    local boxHandleAdornments = {}

    for _, child in ipairs(parent:GetDescendants()) do
        if child:IsA("BoxHandleAdornment") then
            boxHandleAdornmentCount = boxHandleAdornmentCount + 1
            table.insert(boxHandleAdornments, child)
        end
    end

    if boxHandleAdornmentCount > 3 then
        for _, adornment in ipairs(boxHandleAdornments) do
            adornment:Destroy()
        end
    end
end

local CoreGui = game:GetService("CoreGui")
for _, child in ipairs(CoreGui:GetChildren()) do
    deleteExcessiveBoxHandleAdornments(child)
end
