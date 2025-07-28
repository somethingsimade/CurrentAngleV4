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
	TextLabel_2.Text = [[F3X BTools reanimate]]
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextSize = 28.000

	UIStroke_3.Parent = TextLabel_2
	task.delay(5, function()
		ScreenGui:Destroy()
	end)
end

LoadUi()

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local lp = game:GetService("Players").LocalPlayer
local realCharacter = lp.Character
local pos = realCharacter.HumanoidRootPart.CFrame

realCharacter.HumanoidRootPart.CFrame = CFrame.new(10000, 10000, 10000)
task.wait(0.1)
realCharacter.HumanoidRootPart.Anchored = true

local char = game.Players:CreateHumanoidModelFromDescription(realCharacter.Humanoid.HumanoidDescription, Enum.HumanoidRigType.R6)
char.Parent = workspace
char.Name = realCharacter.Name .. "_Fake"

workspace.CurrentCamera.CameraSubject = char.Humanoid

char.HumanoidRootPart.CFrame = pos

local tool

for i, v in ipairs(lp.Backpack:GetChildren()) do
	if v:FindFirstChild("SyncAPI") then
		tool = v
		tool.Parent = realCharacter
		task.wait(0.1)
		tool.Parent = realCharacter.Humanoid
		lp.Character = char
		tool.Handle.Anchored = true
		break
	end
end

if not tool and lp.Character then
	local v = lp.Character:FindFirstChildWhichIsA("Tool")
	if v and v:FindFirstChild("SyncAPI") then
		tool = v
		tool.Parent = realCharacter
		task.wait(0.1)
		tool.Parent = realCharacter.Humanoid
		lp.Character = char
		tool.Handle.Anchored = true
	end
end

local endpoint = tool.SyncAPI.ServerEndpoint

local function create(type, cf)
	return endpoint:InvokeServer("CreatePart", type or "Normal", cf or CFrame.new(0, 0, 0), workspace)
end

local function resize(part, size)
	spawn(function()
		return endpoint:InvokeServer("SyncResize", {{Part = part, Size = size, CFrame = part.CFrame}})
	end)

end

local function move(part, cf)
	spawn(function()
		return endpoint:InvokeServer("SyncMove", {{Part = part, CFrame = cf}})
	end)
end

local function mesh(part, meshId)
	endpoint:InvokeServer("CreateMeshes", {
		{Part = part, MeshType = Enum.MeshType.FileMesh}
	})
	endpoint:InvokeServer("SyncMesh", {{
		Part = part,
		MeshType = Enum.MeshType.FileMesh,
		MeshId = meshId,
		Scale = Vector3.new(1, 1, 1)
	}})
end

local function parent(instance)
	spawn(function()
		local group = endpoint:InvokeServer("CreateGroup", "Model", workspace.Terrain, {})
		endpoint:InvokeServer("SetName", {group}, string.rep("\n", 500))

		endpoint:InvokeServer("SetParent", {instance}, group)
	end)
end

local _CFrame = CFrame.new(0, 10, 0)
local Head = create("Normal", _CFrame)
local Torso = create("Normal", _CFrame)
local LeftArm = create("Normal", _CFrame)
local RightArm = create("Normal", _CFrame)
local LeftLeg = create("Normal", _CFrame)
local RightLeg = create("Normal", _CFrame)

resize(Head, Vector3.new(2, 1, 1))
resize(Torso, Vector3.new(2, 2, 1))
resize(LeftArm, Vector3.new(1, 2, 1))
resize(RightArm, Vector3.new(1, 2, 1))
resize(LeftLeg, Vector3.new(1, 2, 1))
resize(RightLeg, Vector3.new(1, 2, 1))

parent(Head)
parent(Torso)
parent(LeftArm)
parent(RightArm)
parent(LeftLeg)
parent(RightLeg)

Head.CanCollide = false
Torso.CanCollide = false
LeftArm.CanCollide = false
RightArm.CanCollide = false
LeftLeg.CanCollide = false
RightLeg.CanCollide = false

mesh(LeftArm, "rbxasset:///avatar/meshes/leftarm.mesh")
mesh(RightArm, "rbxasset:///avatar/meshes/rightarm.mesh")
mesh(LeftLeg, "rbxasset:///avatar/meshes/leftleg.mesh")
mesh(RightLeg, "rbxasset:///avatar/meshes/rightleg.mesh")

mesh(Torso, "rbxasset:///avatar/meshes/torso.mesh")

task.spawn(function()
	endpoint:InvokeServer("CreateTextures", {
		{Part = Head, TextureType = "Decal", Face = Enum.NormalId.Front}
	})
	endpoint:InvokeServer("SyncTexture", {
		{Part = Head, TextureType = "Decal", Face = Enum.NormalId.Front, Texture = "rbxasset://textures/face.png"}
	})
end)

Head.Transparency = 0.5
Torso.Transparency = 0.5
LeftArm.Transparency = 0.5
RightArm.Transparency = 0.5
LeftLeg.Transparency = 0.5
RightLeg.Transparency = 0.5

local realHead = lp.Character["Head"]
local realTorso = lp.Character["Torso"]
local realLeftArm = lp.Character["Left Arm"]
local realRightArm = lp.Character["Right Arm"]
local realLeftLeg = lp.Character["Left Leg"]
local realRightLeg = lp.Character["Right Leg"]

spawn(function() --// Optimize next update
	while task.wait() do
		move(Head, realHead.CFrame)
		move(Torso, realTorso.CFrame)
		move(LeftArm, realLeftArm.CFrame)
		move(RightArm, realRightArm.CFrame)
		move(LeftLeg, realLeftLeg.CFrame)
		move(RightLeg, realRightLeg.CFrame)
	end
end)
