local illuminate = {
	"RRethy/vim-illuminate",
	opts = {
		providers = {
			"lsp",
			"treesitter",
			"regex",
		},
		delay = 100,
		filetype_overrides = {},
		filetypes_denylist = {
			"dirvish",
			"fugitive",
		},
	},
}

return illuminate
