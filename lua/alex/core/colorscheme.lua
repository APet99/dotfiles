-- [[
-- Themes should first be added to plugins/themes.lua, and the name
-- should be added to the list below to be selected from.
-- ]]
local themes = {
	"catppuccin",
	"kanagawa",
	"rose-pine",
	"tokyonight",
	"bluloco",
	"poimandres",
}

local desiredTheme = themes[2] -- theme you want to be loaded
local desiredTransparency = false -- should the background be transparent?

local function getThemes()
	return themes
end

local function getDesiredTheme()
	return desiredTheme
end

local function getDesiredTransparency()
	return desiredTransparency
end

-- [[ Set the Theme to desiredTheme, and set background transparency based
-- on desiredTransparency.]]
function SetColorScheme()
	local theme = getDesiredTheme()
	if theme == nil then
		vim.notify("Please specify a valid theme to load: " .. theme, vim.log.levels.ERROR)
	end

	vim.cmd.colorscheme(theme)

	if getDesiredTransparency() then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
end

SetColorScheme()
