local tree = {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})
	end,
	opts = {
		renderer = {
			icons = {
				glyphs = {
					folder = {
						arrow_closed = "",
						arrow_open = "",
					},
				},
			},
		},
		actions = {
			open_file = {
				window_picker = {
					enable = false,
				},
			},
		},
	},
}
return tree
