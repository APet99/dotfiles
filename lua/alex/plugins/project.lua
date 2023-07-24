local project = {
	"ahmedkhalf/project.nvim",
	event = "VimEnter",
	opts = {
		exclude_dirs = { "~/Downloads", "~/Desktop" },
		detection_methods = { "pattern", "lsp" },
		ignore_lsp = {},
		silent_chdir = true,
	},
	config = function(_, opts)
		require("project_nvim").setup(opts)
	end,
}

return project
