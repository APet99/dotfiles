local other = {
	"kyazdani42/nvim-web-devicons",
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },
	"tpope/vim-fugitive",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"sindrets/diffview.nvim",
		name = "diffview",
		dependencies = "nvim-lua/plenary.nvim",
		event = "BufRead",
		config = function()
			require("diffview").setup()
		end,
	},
	"tpope/vim-surround",
}

return other
