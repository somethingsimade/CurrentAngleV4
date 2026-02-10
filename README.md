# Update: Rest in peace instant respawn, February 2025 - February 2026

⚠️ Warning: when using the `fling` function, setting the amount of time it will attempt to fling for to longer than 3.5 seconds can break the reanimate ⚠️

The official place where it will be hosted.

# Why skip to v4 and not v3?
Because v3 was an (unfunny) joke version.

# V4 Main and only original place:
```lua
--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz
if not game:IsLoaded() then
	game.Loaded:Wait()
end

--// Check configdoc.md for settings documentation

--// Below are the settings
-- SETTINGS --
local oldsettings = settings --// This is a default Roblox function, to prevent it from breaking we replace it with the function again at the end
local settings = _G

settings["Use default animations"] = true
settings["Local character transparency level"] = 1
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true
--//settings["Instant respawn"] = false // Patched by roblox
settings["Hide HumanoidRootPart"] = false
settings["PermaDeath fake character"] = true
settings["R15 Reanimate"] = false
settings["Click Fling"] = false
settings["Anti-Fling"] = true
settings["Hide RootPart Distance"] = CFrame.new(255, 255, 0)
settings["Allow tool equipping"] = false --// Placeholder
settings["Client sided display mode"] = 1 --// If you will see the fake character, or the real character, 1 = real character (default), 2 = fake character
settings["Fallback prompt"] = true --// Enable or disable the annoying fallback prompt if your game is not whitelisted
settings["Respawn mode"] = "BreakJoints"

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
--// Settings end

settings = oldsettings

loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
```

# How to use?
Just enter a game, our script will automatically detect if the game you are in is supported, and execute the respective version. If the game is not in the list, it will prompt you to run the semi-universal version.

# Games supported
### 1. Retro Studio (soon)
### 2. Car Crushers 2 (R6 only)
### 3. Mic Up (R15 only)
### 4. something evil will happen
### 5. Ragdoll Engine (Place Id 5683833663)
### 6. Advanced Euphoria Ragdoll
### 7. Circuit Board (Place Id 112399477218954)
### 8. Hide the body (Place Id 81239378558719)

# Can't find your game in the list?
Open an [issue](https://github.com/somethingsimade/CurrentAngleV4/issues) and request the game. Note that games that modify the character too much will be much harder to port, unless it contains a custom mechanic that allows limb movement (e.g ragdolling)

# Older versions

## Currentangle v2/v2.5
```lua
-- SETTINGS --
local oldsettings = settings --// This is a default Roblox function, to prevent it from breaking we replace it with the function again at the end
local settings = _G

--// Check configdoc.md for settings documentation

settings["Use default animations"] = true
settings["Fake character transparency level"] = 1
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true
--//settings["Instant respawn"] = false // Patched by roblox

settings["Hide HumanoidRootPart"] = false
settings["PermaDeath fake character"] = true
settings["R15 Reanimate"] = false
settings["Click Fling"] = false

settings["Hide RootPart Distance"] = CFrame.new(255, 255, 0)

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
(function() if getgenv then return getgenv() else return _G end end)().fling = nil
local finished = false

task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/currentanglev2.5.lua"))()
end)

repeat task.wait() until finished

settings = oldsettings

-- USAGE: getgenv().fling(character, time, yield) if you dont have getgenv: _G.fling(character, time, yield)
-- or just fling(character, time, yield)

-- time is for how much time in seconds it will fling
-- the character

-- yield is if the fling function will yield

-- you can put your converted script under here
```

## CurrentAngle v1 (first version)
```lua
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- SETTINGS --
local settings = _G

settings["Use default animations"] = true
settings["Fake character transparency level"] = 1 -- 0 to disable
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true --[[ only should be disabled if
your character havent played ANY animations, otherwise it breaks the reanimate ]]
--settings["Instant respawn"] = false --[[
*PATCHED*

Instant respawns the
character, it will still wait the respawn time, but your character wont be dead.
Requires: replicatesignal function
Enable if you want the feature
]]

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
(function() if getgenv then return getgenv() else return _G end end)().fling = nil
local finished = false

task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/currentangle-reanimate/refs/heads/main/main"))()
end)

repeat task.wait() until finished

-- USAGE: getgenv().fling(character, time, yield) if you dont have getgenv: _G.fling(character, time, yield)
-- or just fling(character, time, yield)

-- time is for how much time in seconds it will fling
-- the character

-- yield is if the fling function will yield

-- you can put your converted script under here

```

# Settings that I use (currentangle v4)
```lua
settings["Use default animations"] = true
settings["Fake character transparency level"] = 1
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true
settings["Hide HumanoidRootPart"] = true
settings["PermaDeath fake character"] = true
settings["R15 Reanimate"] = false
settings["Click Fling"] = false
settings["Anti-Fling"] = true
settings["Hide RootPart Distance"] = CFrame.new(255, 255, 0)
settings["Client sided display mode"] = 2
settings["Fallback prompt"] = false
settings["Respawn mode"] = "Kill"
```
