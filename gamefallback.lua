local UI = (gethui and gethui()) or (cloneref and cloneref(game:GetService("CoreGui"))) or (pcall(function() return game:GetService("CoreGui").Parent end) and game:GetService("CoreGui")) or game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui")

-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local no = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local yes = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = UI
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, -214, 0.009999956, 0)
Frame.Size = UDim2.new(0, 429, 0, 156)

UICorner.Parent = Frame

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(79, 173, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(85, 127, 179))}
UIGradient.Rotation = 40
UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.07, 0.13), NumberSequenceKeypoint.new(1.00, 0.00)}
UIGradient.Parent = Frame

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.265734255, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.BuilderSans
TextLabel.Text = "Your game isn't on the list!"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 35.000

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(-0.0846620202, 0, 0.238277137, 0)
TextLabel_2.Size = UDim2.new(0, 500, 0, 50)
TextLabel_2.Font = Enum.Font.BuilderSans
TextLabel_2.Text = "Would you like to run CurrentAngle V2 (semi-universal)?"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 20.000
TextLabel_2.TextWrapped = true

no.Name = "no"
no.Parent = Frame
no.BackgroundColor3 = Color3.fromRGB(51, 40, 180)
no.BorderColor3 = Color3.fromRGB(0, 0, 0)
no.BorderSizePixel = 0
no.Position = UDim2.new(0.533999979, -5, 0.56099999, 0)
no.Size = UDim2.new(0, 200, 0, 50)
no.Font = Enum.Font.BuilderSans
no.Text = "No" --tostring(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://naas.isalman.dev/no")).reason) .. " (No)"
no.TextColor3 = Color3.fromRGB(255, 255, 255)
no.TextScaled = true
no.TextWrapped = true

UICorner_2.Parent = no

yes.Name = "yes"
yes.Parent = Frame
yes.BackgroundColor3 = Color3.fromRGB(51, 40, 180)
yes.BorderColor3 = Color3.fromRGB(0, 0, 0)
yes.BorderSizePixel = 0
yes.Position = UDim2.new(0, 5, 0.56099999, 0)
yes.Size = UDim2.new(0, 200, 0, 50)
yes.Font = Enum.Font.BuilderSans
yes.Text = "Take me there"
yes.TextColor3 = Color3.fromRGB(255, 255, 255)
yes.TextSize = 27.000

UICorner_3.Parent = yes

-- Scripts:

local function SYBDR_fake_script() -- no.LocalScript 
	no.MouseButton1Click:Connect(function()
		ScreenGui:Destroy()
	end)
end
coroutine.wrap(SYBDR_fake_script)()
local function HWVBO_fake_script() -- yes.LocalScript 
	yes.MouseButton1Click:Connect(function()
		ScreenGui:Destroy()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/currentanglev2.5.lua"))()
	end)
end
coroutine.wrap(HWVBO_fake_script)()
