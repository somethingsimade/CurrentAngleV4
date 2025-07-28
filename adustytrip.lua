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
	TextLabel_2.Text = [[Version made for A dusty trip]]
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextSize = 28.000

	UIStroke_3.Parent = TextLabel_2
	task.delay(5, function()
		ScreenGui:Destroy()
	end)
end

LoadUi()

local vector3zero = Vector3.zero

local game = game
local debug = debug
local debug_info = debug.info

local gameIndex
local gameNewIndex
local CFrameIndex
local CFrameMul
local CFrameAdd
local Vector3Mul

local emptyCFrame = CFrame.new()

local getrawmetatableworks = false
local isindexsupported = false

if getrawmetatable then
	local s, r = pcall(getrawmetatable, game)
	local success, res = pcall(getrawmetatable, emptyCFrame)

	if s then  
		if r.__index then
			gameIndex = r.__index
			gameNewIndex = r.__newindex
			getrawmetatableworks = true
		end
	end
	if success and s then
		if res.__index then
			CFrameIndex = res.__index
			CFrameMul = res.__mul
			CFrameAdd = res.__add
            Vector3Mul = getrawmetatable(vector3zero).__mul
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
		return emptyCFrame[{}]
	end, function()
		CFrameIndex = debug_info(2, "f")
	end)
	
	xpcall(function()
		return emptyCFrame * 9
	end, function()
		CFrameMul = debug_info(2, "f")
	end)
	
	xpcall(function()
		return emptyCFrame + 9
	end, function()
		CFrameAdd = debug_info(2, "f")
	end)

    xpcall(function()
		return vector3zero * 9
	end, function()
		Vector3Mul = debug_info(2, "f")
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

if not CFrameIndex then
	CFrameIndex = function(self, key, new)
		self[key] = new
	end
end

if not CFrameMul then
	CFrameMul = function(a, b)
		return a * b
	end
end

if not CFrameAdd then
	CFrameAdd = function(a, b)
		return a + b
	end
end

if not Vector3Mul then
	Vector3Mul = function(a, b)
		return a * b
	end
end

local player = game.Players.LocalPlayer
local newChar = player.Character
newChar.Archivable = true
local fakeChar = newChar:Clone()
fakeChar.Parent = workspace

player.Character = fakeChar

newChar:BreakJoints()

player.PlayerGui:ClearAllChildren()

local function move(part1, part2) --// No excuses for this one
	gameNewIndex(part1, "CFrame", gameIndex(part2, "CFrame"))
	gameNewIndex(part1, "Velocity", vector3zero)
	gameNewIndex(part1, "RotVelocity", vector3zero)
end

local LeftArm = newChar["Left Arm"]
local RightArm = newChar["Right Arm"]
local LefLeg = newChar["Left Leg"]
local RightLeg = newChar["Right Leg"]

local Head = newChar["Head"]
local Torso = newChar["Torso"]
local HumanoidRootPart = newChar["HumanoidRootPart"]

--// Fake
local fakeLeftArm = fakeChar["Left Arm"]
local fakeRightArm = fakeChar["Right Arm"]
local fakeLeftLeg = fakeChar["Left Leg"]
local fakeRightLeg = fakeChar["Right Leg"]

local fakeHead = fakeChar["Head"]
local fakeTorso = fakeChar["Torso"]
local fakeHumanoidRootPart = fakeChar["HumanoidRootPart"]

spawn(function()
while task.wait() do
	move(LeftArm, fakeLeftArm)
	move(RightArm, fakeRightArm)
	move(LefLeg, fakeLeftLeg)
	move(RightLeg, fakeRightLeg)
	
	move(Head, fakeHead)
	move(Torso, fakeTorso)
	move(HumanoidRootPart, fakeHumanoidRootPart)

end

end)


player.PlayerScripts:ClearAllChildren()
workspace.CurrentCamera:Destroy()
wait(0.1)

workspace.CurrentCamera:Destroy()
wait(0.1)

workspace.CurrentCamera.CameraSubject = fakeChar:FindFirstChildOfClass('Humanoid')
workspace.CurrentCamera.CameraType = "Custom"
player.CameraMinZoomDistance = 0.5
player.CameraMaxZoomDistance = 400
player.CameraMode = "Classic"
player.Character.Head.Anchored = false
player.DevEnableMouseLock = true

newChar.Head.face.Transparency = 1

--// Fixing camera dragging etc.

local annoyingactions = {
	"Q_Input",
	"E_Input",
	"Weld",
	"F_Input",
	"Crouch",
	"RotateDraggingObject",
	"InventoryKey",
}

for i, v in ipairs(annoyingactions) do
	pcall(function()
		game:GetService("ContextActionService"):UnbindAction(v)
	end)
end

--workspace:WaitForChild("CowboySong"):Destroy() --// Remove death song
game:GetService("UserInputService").MouseIconEnabled = true
