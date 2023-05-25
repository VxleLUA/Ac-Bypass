local function deleteExcessiveBoxHandleAdornments(parent)
    local boxHandleAdornmentCount = 0
    local boxHandleAdornments = {}

    local function collectBoxHandleAdornments(guiObject)
        for _, child in ipairs(guiObject:GetDescendants()) do
            if child:IsA("BoxHandleAdornment") then
                boxHandleAdornmentCount = boxHandleAdornmentCount + 1
                table.insert(boxHandleAdornments, child)
            end
        end
    end

    collectBoxHandleAdornments(parent)

    if boxHandleAdornmentCount > 3 then
        for _, adornment in ipairs(boxHandleAdornments) do
            adornment:Destroy()
        end
    end
end

-- Load and run the first script
local firstScript = coroutine.create(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
end)
coroutine.resume(firstScript)

-- Delay for 2 seconds
wait(2)

-- Load and run the second script
local secondScript = coroutine.create(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VxleLUA/Ac-Bypass/main/Ok.lua", true))()
end)
coroutine.resume(secondScript)

-- Perform actions after both scripts have executed (if needed)
