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
	Tooltip = "select rarities to capture (all pets)",
	Callback = function(selected)
		print(selected)
	end,
})

tabGroup:AddDivider()

local RaritiesPets = require("@self/pets")
for i, v in rarities do
	local pets = RaritiesPets[v]
	if not pets then
		continue
	end

	table.sort(pets, function(a, b)
		return string.lower(tostring(a)) < string.lower(tostring(b))
	end)

	tabGroup:AddDropdown(`PetToCapture{v}`, {
		Values = pets,
		Default = 1,
		Multi = true,
		Text = `Capture ${v}`,
		Tooltip = "select pets to capture by rarity",
		Callback = function(selected)
			print(selected)
		end,
	})
end
