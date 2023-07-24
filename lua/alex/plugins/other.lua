local other = {
	"kyazdani42/nvim-web-devicons",
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },
	"tpope/vim-fugitive",
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	"tpope/vim-surround",
}

return other
