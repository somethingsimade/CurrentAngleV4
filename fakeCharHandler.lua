--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz

return (function(...)
	local args = { ... }
	local fakeCharacter = nil
	local realChar = args[1] or game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
	local willClone = args[2]
	local rigType = args[3]
	local realCharCFrame = realChar.HumanoidRootPart.CFrame
	
	local Players = game:GetService("Players")
	
	if willClone then
		local value = realChar.Archivable
		realChar.Archivable = true
		fakeCharacter = realChar:Clone()
		realChar.Archivable = value
		fakeCharacter.HumanoidRootPart.CFrame = realCharCFrame
		return fakeCharacter
	else
		fakeCharacter = Players:CreateHumanoidModelFromDescription(realChar.Humanoid:FindFirstChild("HumanoidDescription") or Instance.new("HumanoidDescription"), rigType)
		fakeCharacter.HumanoidRootPart.CFrame = realCharCFrame
		return fakeCharacter
	end
end)(...)
