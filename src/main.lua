local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StudioService = game:GetService("StudioService")

local SuiteToolbar = plugin:CreateToolbar("SnapCreate")

local serverScriptButton = SuiteToolbar:CreateButton("Create Server Script", "Server Script", "rbxassetid://23447020")
local localScriptButton = SuiteToolbar:CreateButton("Create Local Script", "Local Script", "rbxassetid://413366777")
local moduleScriptButton = SuiteToolbar:CreateButton("Create Module", "Module Script", "rbxassetid://5168594673")

local cachedUsername = nil

function createModule(moduleType, usernameField, dateField)
	local newScript = Instance.new(moduleType)
	newScript.Source = "--[[\n	" .. usernameField .. "\n	" .. tostring(dateField) ..  "\n]]--"
	newScript.Parent = ReplicatedStorage
	
	print(moduleType .. " Initialized in ReplicatedStorage")
end

serverScriptButton.Click:Connect(function()
	local Date = os.date("%x", os.time())

	local studioUserId = StudioService:GetUserId()

	if (cachedUsername ~= nil) then
		createModule("Script", cachedUsername, Date)
	else
		local success, value = pcall(function()
			local studioUsername = Players:GetNameFromUserIdAsync(studioUserId)
			return studioUsername
		end)

		if (success) then
			cachedUsername = value
			createModule("Script", cachedUsername, Date)
		else	
			createModule("Script", "Failed to load username", Date)
			warn("There was an issue trying to retrieve your username.")
		end
	end
end)

localScriptButton.Click:Connect(function()
	local Date = os.date("%x", os.time())

	local studioUserId = StudioService:GetUserId()

	if (cachedUsername ~= nil) then
		createModule("LocalScript", cachedUsername, Date)
	else
		local success, value = pcall(function()
			local studioUsername = Players:GetNameFromUserIdAsync(studioUserId)
			return studioUsername
		end)

		if (success) then
			cachedUsername = value
			createModule("LocalScript", cachedUsername, Date)
		else	
			createModule("LocalScript", "Failed to load username", Date)
			warn("There was an issue trying to retrieve your username.")
		end
	end
end)

moduleScriptButton.Click:Connect(function()
	local Date = os.date("%x", os.time())
	
	local studioUserId = StudioService:GetUserId()
	
	if (cachedUsername ~= nil) then
		createModule("ModuleScript", cachedUsername, Date)
	else
		local success, value = pcall(function()
			local studioUsername = Players:GetNameFromUserIdAsync(studioUserId)
			return studioUsername
		end)

		if (success) then
			cachedUsername = value
			createModule("ModuleScript", cachedUsername, Date)
		else	
			createModule("ModuleScript", "Failed to load username", Date)
			warn("There was an issue trying to retrieve your username.")
		end
	end
end)