local lualine = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-web-devicons", lazy = false },
	event = { "BufRead", "BufNewFile", "VimEnter" },
	config = function()
		require("lualine").setup({
			theme = "ayu_mirage",
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "location" },
				lualine_z = { "branch" },
			},
		})
	end,
}

return lualine
