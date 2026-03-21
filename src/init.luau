local Library = require("@self/library")

local window = Library:CreateWindow({
	Title = "Auto catch",
	Center = true,
	AutoShow = true,
	TabPadding = 8,
	MenuFadeTime = 0.2,
})

local tab = window:AddTab("Main")
local tabGroup = tab:AddLeftGroupbox("Groupbox")

tabGroup:AddToggle("AutoCatchToggle", {
	Text = "Auto catch",
	Default = false,
	Tooltip = "enabled/disabled auto catch",
	Callback = function(enabled)
		print(enabled)
	end,
})

tabGroup:AddDivider()

local rarities = { "Common", "Rare", "Epic", "Legendary", "Mythical", "Exclusive", "Secret", "Boss" }
tabGroup:AddDropdown("RaritiesToCapture", {
	Values = table.clone(rarities),
	Default = 1,
	Multi = true,
	Text = "Capture rarities",
	Tooltip = "select rarities to capture",
	Callback = function(selected)
		print(selected)
	end,
})

local RaritiesPets = require("@self/pets")
for i, v in rarities do
	local pets = RaritiesPets[v]
	if not pets then
		continue
	end

	tabGroup:AddDropdown(`PetToCapture{v}`, {
		Values = pets,
		Default = 1,
		Multi = true,
		Text = "Capture pet's",
		Tooltip = "select pets to capture",
		Callback = function(selected)
			print(selected)
		end,
	})
end
