--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz

local getdescendants = game.GetDescendants
local isa = game.isA

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
	TextLabel_2.Text = "Version made for Ragdoll Engine"
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextSize = 28.000

	UIStroke_3.Parent = TextLabel_2
	task.delay(5, function()
		ScreenGui:Destroy()
	end)
end

LoadUi()

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

local vector3zero = Vector3.zero

local plr = game:GetService("Players").LocalPlayer
local newChar = plr.Character
local newCharHumanoid = newChar["Humanoid"]
newCharHumanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
local newCharRoot = newChar["HumanoidRootPart"]

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RagdollState"):FireServer(true)

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RagdollState"):Destroy()

local fakeChar = game:GetService("Players"):CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6)
fakeChar.Name = fakeChar.Name .. "_Fake"
fakeChar.Parent = workspace

local fakeCharTorso = fakeChar["Torso"]
local fakeCharRoot = fakeChar["HumanoidRootPart"]

fakeCharRoot.CFrame = newCharRoot.CFrame

local fakeHumanoid = fakeChar:WaitForChild("Humanoid")
fakeHumanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None

workspace.CurrentCamera.CameraSubject = fakeHumanoid

plr.Character = fakeChar
fakeChar.Parent = workspace

for i, v in ipairs(getdescendants(fakeChar)) do
	if isa(v, "Decal") or isa(v, "BasePart") then
		gameNewIndex(v, "Transparency", 1)
	end
end

local LeftArm = newChar["Left Arm"]
local RightArm = newChar["Right Arm"]

local LeftLeg = newChar["Left Leg"]
local RightLeg = newChar["Right Leg"]

local Torso = newChar["Torso"]

local Head = newChar["Head"]

local LeftArmFake = fakeChar["Left Arm"]
local RightArmFake = fakeChar["Right Arm"]
local LeftLegFake = fakeChar["Left Leg"]
local RightLegFake = fakeChar["Right Leg"]
local FakeHead = fakeChar["Head"]

game:GetService("RunService").Heartbeat:Connect(function()
	gameNewIndex(LeftArm, "CFrame", gameIndex(LeftArmFake, "CFrame"))
	gameNewIndex(RightArm, "CFrame", gameIndex(RightArmFake, "CFrame"))

	gameNewIndex(LeftLeg, "CFrame", gameIndex(LeftLegFake, "CFrame"))
	gameNewIndex(RightLeg, "CFrame", gameIndex(RightLegFake, "CFrame"))

	gameNewIndex(Torso, "CFrame", gameIndex(fakeCharTorso, "CFrame"))
	gameNewIndex(Head, "CFrame", gameIndex(FakeHead, "CFrame"))
end)

game:GetService("RunService").Stepped:Connect(function()
	for i, v in ipairs(getdescendants(newChar)) do
		if isa(v, "BasePart") then
			gameNewIndex(v, "CanCollide", false)
			gameNewIndex(v, "Velocity", vector3zero)
			gameNewIndex(v, "RotVelocity", vector3zero)
		end
	end
end)

--// Done.
