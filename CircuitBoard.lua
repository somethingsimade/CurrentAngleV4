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
	TextLabel_2.Text = "Version made for Circuit Board"
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
local Mul

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

--// Extracting __mul (i think)
xpcall(function()
	return CFrame.new(0, 0, 0) * 9
end, function()
	Mul = debug.info(2, "f")
end)

local game = game
local debug = debug
local debug_info = debug.info

local gameIndex
local gameNewIndex
local CFrameMul

local getrawmetatableworks = false
local isindexsupported = false

if getrawmetatable then
	local s, r = pcall(getrawmetatable, game)
	local success, result = pcall(getrawmetatable, CFrame.new())
	if s then  
		if r.__index then
			gameIndex = r.__index
			gameNewIndex = r.__newindex
			getrawmetatableworks = true
		end
	end
	if success then  
		if result.__mul then
			CFrameMul = result.__mul
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

	xpcall(function()
		return CFrame.new(0, 0, 0) * 9
	end, function()
		CFrameMul = debug_info(2, "f")
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

if not CFrameMul then
	CFrameMul = function(a, b)
		return a * b
	end
end

local counter = workspace:WaitForChild("PaletteParts"):WaitForChild("DATA"):WaitForChild("COUNTER"):WaitForChild("Gate")
local copypart = game:GetService("ReplicatedStorage"):WaitForChild("CopyPart")
local movepart = game:GetService("ReplicatedStorage"):WaitForChild("MovePart")
local FireServer = movepart.FireServer
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character

local modelsFake = {}
local Larm = copypart:InvokeServer(counter)
local Rarm = copypart:InvokeServer(counter)
local Lleg = copypart:InvokeServer(counter)
local Rleg = copypart:InvokeServer(counter)

local TorsoFake = copypart:InvokeServer(counter)
local HeadFake = copypart:InvokeServer(counter)

table.insert(modelsFake, Larm)
table.insert(modelsFake, Rarm)
table.insert(modelsFake, Lleg)
table.insert(modelsFake, Rleg)
table.insert(modelsFake, TorsoFake)
table.insert(modelsFake, HeadFake)

for i, v in ipairs(modelsFake) do
	for a, b in ipairs(v:GetDescendants()) do
		if b:IsA("BasePart") or b:IsA("Decal") then
			b.Transparency = 0.5--transparency_level
			b.CanCollide = false
		end
	end
end

local origpos = Character.HumanoidRootPart.CFrame

local clone = Players:CreateHumanoidModelFromDescription(Character.Humanoid.HumanoidDescription, Enum.HumanoidRigType.R6)
clone.Parent = workspace

if parentrealchartofakechar then
	Character.Parent = clone
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

for _, part in ipairs(clone:GetDescendants()) do
	if part:IsA("BasePart") or part:IsA("Decal") then
		if not nametoexcludefromtransparency[tostring(part)] then
			--part.Transparency = --transparency_level
		end
	end
end

clone.HumanoidRootPart.CFrame = origpos


workspace.CurrentCamera.CameraSubject = clone.Humanoid

LocalPlayer.Character = clone

LocalPlayer.Backpack:ClearAllChildren()

local LeftArm = clone["Left Arm"]
local LeftLeg = clone["Left Leg"]
local RightArm = clone["Right Arm"]
local RightLeg = clone["Right Leg"]

local Torso = clone["Torso"]
local Head = clone["Head"]


Character.HumanoidRootPart.CFrame = CFrame.new(100, 100, 100)
wait(0.1)
Character.HumanoidRootPart.Anchored = true

--// OFFSETS DOWN HERE
local LeftArmOffset = CFrame.Angles(math.rad(-90), math.rad(0), math.rad(90))
local RightArmOffset = CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90))

local LeftLegOffset = CFrame.Angles(math.rad(-90), math.rad(0), math.rad(90))
local RightLegOffset = CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90))

local TorsoOffset = CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))
local HeadOffset = CFrame.Angles(math.rad(-90), math.rad(180), math.rad(0))

local Vectorzero = vector.create(0, 0, 0)

--// OFFSETS NOT DOWN HERE (offsets end)

game:GetService("RunService").PreSimulation:Connect(function() --// Heard it is better
	--// Left Arm
	FireServer(movepart, Larm, Vectorzero, CFrameMul(gameIndex(LeftArm, "CFrame"), LeftArmOffset))

	--// Right Arm
	FireServer(movepart, Rarm, Vectorzero, CFrameMul(gameIndex(RightArm, "CFrame"), RightArmOffset))

	--// Left Leg
	FireServer(movepart, Lleg, Vectorzero, CFrameMul(gameIndex(LeftLeg, "CFrame"), LeftLegOffset))

	--// Right Leg
	FireServer(movepart, Rleg, Vectorzero, CFrameMul(gameIndex(RightLeg, "CFrame"), RightLegOffset))

	--// Torso
	FireServer(movepart, TorsoFake, Vectorzero, CFrameMul(gameIndex(Torso, "CFrame"), TorsoOffset))

	--// Head
	FireServer(movepart, HeadFake, Vectorzero, CFrameMul(gameIndex(Head, "CFrame"), HeadOffset))
end)

local function disableCollisions()
	pcall(function()
		for _, char in ipairs({ Character }) do
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
		for _, char in ipairs({ Character, clone }) do
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
		game:GetService("Players").LocalPlayer.Character = clone
		clone:BreakJoints()
	end)
end

if usedefaultanims then
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV2/refs/heads/main/anims"))()
	end)
end
