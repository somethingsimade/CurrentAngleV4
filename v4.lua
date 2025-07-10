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
}

local supportedplace = true
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

if supportedplace and supportedplaceid == 5846386835 then
  
end
