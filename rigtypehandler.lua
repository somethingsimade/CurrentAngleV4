--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz
local LocalPlayer = game:GetService("Players").LocalPlayer

if not LocalPlayer then
  return nil
end

if not LocalPlayer.Character then
	LocalPlayer.CharacterAdded:Wait()
end
task.wait(0.1)
return LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType
