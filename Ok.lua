local function deleteExcessiveBoxHandleAdornments(parent)
    local boxHandleAdornmentCount = 0
    local boxHandleAdornments = {}

    local function collectBoxHandleAdornments(guiObject)
        for _, child in ipairs(guiObject:GetChildren()) do
            if child:IsA("BoxHandleAdornment") then
                boxHandleAdornmentCount = boxHandleAdornmentCount + 1
                table.insert(boxHandleAdornments, child)
            end
            collectBoxHandleAdornments(child)
        end
    end

    collectBoxHandleAdornments(parent)

    if boxHandleAdornmentCount > 3 then
        for _, adornment in ipairs(boxHandleAdornments) do
            adornment:Destroy()
        end
    end
end

local CoreGui = game:GetService("CoreGui")
deleteExcessiveBoxHandleAdornments(CoreGui)
