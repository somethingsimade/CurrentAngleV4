--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz

local supportedplaces = {
  ["1818"] = true, --// CrossRoads
  ["5846386835"] = true, --// RetroStudio
  ["654732683"] = true, --// Car Crushers 2
  ["6884319169"] = true, --// MIC UP
  ["16991287194"] = true, --// something evil will happen
  ["5683833663"] = true, --// Ragdoll Engine (i named it Ragdoll1 since i want to add multiple of the clones later too)
  ["16647175522"] --// Advanced Euphoria Ragdoll
}

local supportedplace = false
local supportedplaceid = nil

for k, v in pairs(supportedplaces) do
   if k == tostring(game.PlaceId) then
      supportedplace = true
      supportedplaceid = tostring(game.PlaceId)
  end
end

local PlrScripts = game:GetService("StarterPlayer").StarterPlayerScripts

local function getretrostudiover()
	if PlrScripts:FindFirstChild("_RetroStudio") then
		for i, v in ipairs(PlrScripts:GetDescendants()) do
			if v:IsA("Folder") and tostring(v) == "2013" then
				return "2013"
			end
		end
	end
end

local function loadstr(str)
	return loadstring(str)()
end

if not supportedplace then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/gamefallback.lua"))
	return
end

if supportedplace and supportedplaceid == "5846386835" then
  --// SOON
end

if supportedplace and supportedplaceid == "654732683" then
  loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/CC2.lua"))
  return
end

if supportedplace and supportedplaceid == "6884319169" then
  loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/MIC_UP.lua"))
  return
end

if supportedplace and supportedplaceid == "16991287194" then
  loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/SEWH.lua"))
  return
end

if supportedplace and supportedplaceid == "5683833663" then
  loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/RagdollEngine1/choose.lua"))
  return
end

if supportedplace and supportedplaceid == "16647175522" then
  loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/RagdollEngine1/choose2.lua"))
  return
end

