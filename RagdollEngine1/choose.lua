--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz

local _version = 1

local rig = loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/rigtypehandler.lua"))()

local function loadragdoll(ver)
  return loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/RagdollEngine1/" .. ver .. ".lua"))()
end

if rig == Enum.HumanoidRigType.R6 then
    return loadragdoll("R6")
else
    return loadragdoll("R15")
end
