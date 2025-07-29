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
	TextLabel_2.Text = "Version made for Jujutsu Shenanigans"
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextSize = 28.000

	UIStroke_3.Parent = TextLabel_2
	task.delay(5, function()
		ScreenGui:Destroy()
	end)
end

LoadUi()

--// Messy code, redo later

local lp = game.Players.LocalPlayer

game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)

local cre = game.Players:CreateHumanoidModelFromDescription(game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription, Enum.HumanoidRigType.R6)
cre.Parent = workspace
cre.HumanoidRootPart.CFrame = lp.Character.HumanoidRootPart.CFrame

local camr = workspace.CurrentCamera

if not getrawmetatable then
	getrawmetatable = function()
		return {
			__newindex = function(a, b, c)
				a[b] = c
			end,
		}
	end
end

local newindex = getrawmetatable(game).__newindex
local hum = cre.Humanoid

if hookmetamethod then
	local old
	old = hookmetamethod(game, "__newindex", function(self, key, set)
		if checkcaller() then return old(self, key, set) end
		if self == workspace.CurrentCamera and key == "CameraSubject" then
			return old(self, key, workspace.CurrentCamera.CameraSubject)
		end
		return old(self, key, set)
	end)
end

local once
once = function(c)
	newindex(camr, "CameraSubject", hum)

	wait(0.178)
	spawn(function()

		game:GetService("ReplicatedStorage"):WaitForChild("Knit"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("JoinService"):WaitForChild("RE"):WaitForChild("Reset"):FireServer()
		c:WaitForChild("Torso").CFrame = cre.Torso.CFrame
	end)
	lp.Character = cre

	local a = lp.CharacterAdded:Once(once)

	if getconnections then
		local connections = getconnections(lp.CharacterAdded)

		for _, connection in ipairs(connections) do
			if connection.Function ~= once then
				connection:Disable()
			end
		end

		local connections = getconnections(lp.CharacterRemoving)

		for _, connection in ipairs(connections) do
			if connection.Function ~= once then
				connection:Disable()
			end
		end
	end


	local ostime = os.time()

	for i, v in ipairs(c:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end
	end

	c:WaitForChild("Torso")
	local start = c["HumanoidRootPart"].CFrame 

	local conn
	conn = game:GetService("RunService").Stepped:Connect(function()
		if os.time() - ostime >= game.Players.RespawnTime + 0.65 then workspace.CurrentCamera.CameraSubject = cre.Humanoid
			conn:Disconnect() end
		for i, v in ipairs(c:GetDescendants()) do
			if v:IsA("BasePart") then 
				v.CanCollide = false
			end
		end
	end)
	wait(0.2)
	while task.wait() do
		if os.time() - ostime >= game.Players.RespawnTime + 0.65 then workspace.CurrentCamera.CameraSubject = cre.Humanoid
			break end
		c["HumanoidRootPart"].CFrame = start
		
		c["Torso"].CFrame = cre.Torso.CFrame
		c["Head"].CFrame = cre.Head.CFrame
		c["Left Arm"].CFrame = cre["Left Arm"].CFrame
		c["Right Arm"].CFrame = cre["Right Arm"].CFrame
		c["Left Leg"].CFrame = cre["Left Leg"].CFrame
		c["Right Leg"].CFrame = cre["Right Leg"].CFrame

		c["Torso"].Velocity = Vector3.new(0, 0, 0)
		c["Torso"].RotVelocity = Vector3.new(0, 0, 0)
		c["Head"].Velocity = Vector3.new(0, 0, 0)
		c["Head"].RotVelocity = Vector3.new(0, 0, 0)
		c["Left Arm"].Velocity = Vector3.new(0, 0, 0)
		c["Left Arm"].RotVelocity = Vector3.new(0, 0, 0)
		c["Right Arm"].Velocity = Vector3.new(0, 0, 0)
		c["Right Arm"].RotVelocity = Vector3.new(0, 0, 0)
		c["Left Leg"].Velocity = Vector3.new(0, 0, 0)
		c["Left Leg"].RotVelocity = Vector3.new(0, 0, 0)
		c["Right Leg"].Velocity = Vector3.new(0, 0, 0)
		c["Right Leg"].RotVelocity = Vector3.new(0, 0, 0)
	end
end
lp.CharacterAdded:Once(once)

game:GetService("ReplicatedStorage"):WaitForChild("Knit"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("JoinService"):WaitForChild("RE"):WaitForChild("Reset"):FireServer()

game:GetService("RunService").PostSimulation:Connect(function()
	newindex(camr, "CameraSubject", hum)
end)
