 --[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz


local UI = (gethui and gethui()) or (cloneref and cloneref(game:GetService("CoreGui"))) or (pcall(function() return game:GetService("CoreGui").Parent end) and game:GetService("CoreGui")) or game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui")

local function LoadUi()
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIGradient = Instance.new("UIGradient")
	local UIStroke = Instance.new("UIStroke")
	local UIStroke_2 = Instance.new("UIStroke")
	local UIStroke_3 = Instance.new("UIStroke")
	local TextLabel = Instance.new("TextLabel")
	local TextLabel_2 = Instance.new("TextLabel")
	ScreenGui.IgnoreGuiInset = true

	ScreenGui.Parent = UI
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Size = UDim2.new(0, 429, 0, 79)
	Frame.Position = UDim2.new(0.5, -Frame.Size.X.Offset/2, 0.01, 0)
	UIStroke.Parent = Frame

	UIStroke_2.Color = Color3.fromRGB(65, 65, 65)
	UIStroke_3.Color = Color3.fromRGB(65, 65, 65)

	UICorner.Parent = Frame

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(79, 173, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 127, 179))}
	UIGradient.Rotation = 40
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.07, 0.13), NumberSequenceKeypoint.new(1.00, 0.00)}
	UIGradient.Parent = Frame

	UIStroke_3.Thickness = 0.7

	TextLabel.Parent = Frame
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.265734255, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 200, 0, 50)
	TextLabel.Font = Enum.Font.BuilderSans
	TextLabel.Text = "MrY7zz's CurrentAngle V4 REANIMATE BY MrY7zz"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 20.000
	UIStroke_2.Parent = TextLabel

	TextLabel_2.Parent = Frame
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(-0.08, 0, 0.367088616, 0)
	TextLabel_2.Size = UDim2.new(0, 500, 0, 50)
	TextLabel_2.Font = Enum.Font.BuilderSans
	TextLabel_2.Text = "Version made for Car Crushers 2"
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextSize = 28.000

	UIStroke_3.Parent = TextLabel_2
	task.delay(5, function()
		ScreenGui:Destroy()
	end)
end

LoadUi()

local usedefaultanims = _G["Use default animations"] or false
local transparency_level = _G["Fake character transparency level"] or 1
local disablescripts = _G["Disable character scripts"] or true
local fakecollisions = _G["Fake character should collide"] or true
local nametoexcludefromtransparency = _G["Names to exclude from transparency"] or {}
local parentrealchartofakechar = _G["Parent real character to fake character"] or false
--local respawncharacter = (function() if _G["Respawn character"] == nil then return true else return _G["Respawn character"] end end)()
--local instantrespawn = (function() if _G["Instant respawn"] == nil then return false else return _G["Instant respawn"] end end)()
local hiderootpart = (function() if _G["Hide HumanoidRootPart"] == nil then return false else return _G["Hide HumanoidRootPart"] end end)()
local permadeathcharacter = (function() if _G["PermaDeath fake character"] == nil then return true else return _G["PermaDeath fake character"] end end)()
--local r15rig = (function() if _G["R15 Reanimate"] == nil then return false else return _G["R15 Reanimate"] end end)()
local clickfling = (function() if _G["Click Fling"] == nil then return false else return _G["Click Fling"] end end)()
--local poscache = (function() if _G["Hide RootPart Distance"] == nil then return CFrame.new(255, 255, 0) else return _G["Hide RootPart Distance"] end end)()

local newIndex
local Index

--// Extracting __newindex
xpcall(function()
	game[{}] = {}
end, function()
	newIndex = debug.info(2, "f")
end)

--// Extracting __index
xpcall(function()
	return game[{}]
end, function()
	Index = debug.info(2, "f")
end)

local game = game
local debug = debug
local debug_info = debug.info

local gameIndex
local gameNewIndex

local getrawmetatableworks = false
local isindexsupported = false

if getrawmetatable then
	local s, r = pcall(getrawmetatable, game)
	if s then  
		if r.__index then
			gameIndex = r.__index
			gameNewIndex = r.__newindex
			getrawmetatableworks = true
		end
	end
end

if not getrawmetatableworks then
	xpcall(function()
		return game[{}]
	end, function()
		gameIndex = debug_info(2, "f")
	end)

	xpcall(function()
		game[{}] = {}
	end, function()
		gameNewIndex = debug_info(2, "f")
	end)
end

local successtest, err = pcall(function()
	return gameIndex(game:GetService("Workspace"), "Parent")
end)

if not successtest then
	if string.find(err:lower(), "instance expected") then
		isindexsupported = false
	else
		isindexsupported = true
	end
else
	isindexsupported = true
end

if not gameIndex then
	gameIndex = function(self, key)
		return self[key]
	end
end

if not gameNewIndex then
	gameNewIndex = function(self, key, new)
		self[key] = new
	end
end

local plrchar = game:GetService("Players").LocalPlayer.Character
plrchar.Archivable = true
local clone = plrchar:Clone()
if parentrealchartofakechar then
	plrchar.Parent = clone
end

if disablescripts then
	task.spawn(function()
		for _, obj in ipairs(clone:GetChildren()) do
			if obj:IsA("LocalScript") then
				obj.Enabled = false
			end
		end
	end)
end

plrchar.Archivable = false

clone.Name = clone.Name .. "_Fake"

for _, part in ipairs(clone:GetDescendants()) do
	if part:IsA("BasePart") or part:IsA("Decal") then
		if not nametoexcludefromtransparency[tostring(part)] then
			part.Transparency = transparency_level
		end
	end
end

clone.Parent = workspace

game:GetService("Players").LocalPlayer.Character = clone
game:GetService("ReplicatedStorage"):WaitForChild("rE"):WaitForChild("Player"):WaitForChild("Ragdoll"):WaitForChild("SetState"):FireServer(true)

game:GetService("ReplicatedStorage"):WaitForChild("rE"):WaitForChild("Player"):WaitForChild("Ragdoll"):WaitForChild("SetState"):Destroy()

local GetDescendants = game.GetDescendants

game:GetService("RunService").Stepped:Connect(function()
	for i, v in ipairs(plrchar:GetDescendants()) do
		if v:isA("BasePart") then
			gameNewIndex(v, "CanCollide", false)
		end
	end
end)

local task_wait = task.wait

local realRootPart = plrchar["HumanoidRootPart"]
local realHead = plrchar["Head"]
local realTorso = plrchar["Torso"]
local realRightArm = plrchar["Right Arm"]
local realRightLeg = plrchar["Right Leg"]
local realLeftArm = plrchar["Left Arm"]
local realLeftLeg = plrchar["Left Leg"]

local fakeRootPart = clone["HumanoidRootPart"]
local fakeHead = clone["Head"]
local fakeTorso = clone["Torso"]
local fakeRightArm = clone["Right Arm"]
local fakeRightLeg = clone["Right Leg"]
local fakeLeftArm = clone["Left Arm"]
local fakeLeftLeg = clone["Left Leg"]

local vector3zero = Vector3.zero

task.spawn(function()
	while task_wait() do
		gameNewIndex(realRootPart, "CFrame", gameIndex(fakeRootPart, "CFrame"))

		gameNewIndex(realRootPart, "Velocity", vector3zero)
		gameNewIndex(realRootPart, "RotVelocity", vector3zero)

		gameNewIndex(realHead, "CFrame", gameIndex(fakeHead, "CFrame"))

		gameNewIndex(realTorso, "CFrame", gameIndex(fakeTorso, "CFrame"))

		gameNewIndex(realRightArm, "CFrame", gameIndex(fakeRightArm, "CFrame"))

		gameNewIndex(realLeftArm, "CFrame", gameIndex(fakeLeftArm, "CFrame"))

		gameNewIndex(realRightLeg, "CFrame", gameIndex(fakeRightLeg, "CFrame"))

		gameNewIndex(realLeftLeg, "CFrame", gameIndex(fakeLeftLeg, "CFrame"))
	end
end)

local function disableCollisions()
	pcall(function()
		for _, char in ipairs({ clone }) do
			for _, obj in ipairs(char:GetDescendants()) do
				if obj:IsA("BasePart") then
					obj.CanCollide = false
					obj.Massless = true
				end
			end
		end
	end)
end

local function disableCollisionsWithFakeChar()
	pcall(function()
		for _, char in ipairs({ plrchar, clone }) do
			for _, obj in ipairs(char:GetDescendants()) do
				if obj:IsA("BasePart") then
					obj.CanCollide = false
					obj.Massless = true
				end
			end
		end
	end)
end

local RunService = game:GetService("RunService")

if fakecollisions then
	disableCollisionConnection = RunService.PreSimulation:Connect(disableCollisions)
else
	disableCollisionConnection = RunService.PreSimulation:Connect(disableCollisionsWithFakeChar)
end

if not permadeathcharacter then
	clone.Humanoid.Died:Once(function()
		disableCollisionConnection:Disconnect()

		clone:Destroy()
		game:GetService("Players").LocalPlayer.Character = plrchar
		plrchar:BreakJoints()
	end)
end

if usedefaultanims then
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/anims"))()
	end)
end
