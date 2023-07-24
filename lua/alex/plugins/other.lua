local other = {
	"kyazdani42/nvim-web-devicons",
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },
	"tpope/vim-fugitive",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	"tpope/vim-surround",
}

return other
