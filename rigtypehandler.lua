--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2026 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz
local R6 = Enum.HumanoidRigType.R6
local R15 = Enum.HumanoidRigType.R15

local LocalPlayer = game:GetService("Players").LocalPlayer

if not LocalPlayer then
  return nil
end

if not LocalPlayer.Character then
	LocalPlayer.CharacterAdded:Wait()
end
task.wait(0.1)
if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == R15 then
	return R15
else
	return R6 --// This check could be better... but what else would the rig type be?
end
