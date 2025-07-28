
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
