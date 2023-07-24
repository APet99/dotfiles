local themes = {
	{ "catppuccin/nvim", name = "catppuccin", opts = { flavour = "frappe" } },
	{ "rebelot/kanagawa.nvim", name = "kanagawa" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		opts = function()
			local colors = require("alex.utils").git_colors
			return {
				style = "moon",
				-- hide_inactive_statusline = true,
				on_highlights = function(hl, c)
					hl.GitSignsAdd = {
						fg = colors.GitAdd,
					}
					hl.GitSignsChange = {
						fg = colors.GitChange,
					}
					hl.GitSignsDelete = {
						fg = colors.GitDelete,
					}
				end,
			}
		end,
		config = function(_, opts)
			local tokyonight = require("tokyonight")
			tokyonight.setup(opts)
			tokyonight.load()
		end,
	},
	{
		"uloco/bluloco.nvim",
		name = "bluloco",
		dependencies = { "rktjmp/lush.nvim" },
		opts = {
			style = "dark",
		},
	},
	{
		"olivercederborg/poimandres.nvim",
		name = "poimandres",
	},
}

return themes
