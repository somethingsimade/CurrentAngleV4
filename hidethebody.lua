 --[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz

if not replicatesignal then
    error("Function 'replicatesignal' not present, aborting.")
    return
end
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
	TextLabel_2.Text = "Version made for Hide the body"
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

local plr = game:GetService("Players").LocalPlayer

workspace.CurrentCamera.CameraSubject = plr.Character:FindFirstChildOfClass('Humanoid')
workspace.CurrentCamera.CameraType = "Custom"
plr.CameraMinZoomDistance = 0.5
plr.CameraMaxZoomDistance = 400
plr.CameraMode = "Classic"

local char = plr.Character
char["DragSystem"]:Destroy()
char.Archivable = true
local clone = char:Clone()
plr.Character = clone
clone.Parent = workspace
replicatesignal(plr.ConnectDiedSignalBackend)
wait(game:GetService("Players").RespawnTime + 0.65)
replicatesignal(plr.Kill)

local accs = {}
local accsfake = {}

for i, v in ipairs(char:GetDescendants()) do
	if v:IsA("Accessory") or v:IsA("Hat") then --// 0.0000000001% chance it is a hat but still
		accs[v] = v
		accsfake[v] = clone[tostring(v)]
	end
end

for i, v in pairs(accs) do
	v.Handle.Anchored = true
end

wait(1.5)

local drag = game:GetService("ReplicatedStorage"):WaitForChild("DragRequest")

drag:InvokeServer(char.Head, true)
drag:InvokeServer(char.Torso, true)
drag:InvokeServer(char["Left Arm"], true)
drag:InvokeServer(char["Right Arm"], true)
drag:InvokeServer(char["Left Leg"], true)
drag:InvokeServer(char["Right Leg"], true)
drag:InvokeServer(char.HumanoidRootPart, true)
for i, v in pairs(accs) do
	v.Handle.Anchored = false
end
for i, v in pairs(accs) do
	drag:InvokeServer(v.Handle, true)
end

local realhead = char.Head
local realtorso = char.Torso
local realrightarm = char["Right Arm"]
local realleftarm = char["Left Arm"]
local realrightleg = char["Right Leg"]
local realleftleg = char["Left Leg"]

local fakehead = clone.Head
local faketorso = clone.Torso
local fakerightarm = clone["Right Arm"]
local fakeleftarm = clone["Left Arm"]
local fakerightleg = clone["Right Leg"]
local fakeleftleg = clone["Left Leg"]

local vector3zero = Vector3.zero

local function movepart(from, to) --// Yes slower but doesn't matter much, also makes the code cleaner
	gameNewIndex(from, "CFrame", gameIndex(to, "CFrame"))
	gameNewIndex(from, "Velocity", vector3zero)
	gameNewIndex(from, "RotVelocity", vector3zero)
end

game:GetService("RunService").RenderStepped:Connect(function()
	movepart(realhead, fakehead)
	movepart(realtorso, faketorso)
	movepart(realrightarm, fakerightarm)
	movepart(realleftarm, fakeleftarm)
	movepart(realrightleg, fakerightleg)
	movepart(realleftleg, fakeleftleg)

	for i, v in pairs(accs) do
		movepart(gameIndex(v, "Handle"), gameIndex(accsfake[v], "Handle"))
	end
end)
