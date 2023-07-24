local mason = {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	lazy = false,
	opts = {
		pip = {
			upgrade_pip = true,
		},
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
	config = function()
		require("mason").setup()
	end,
}

return mason
