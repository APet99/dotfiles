local lualine = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-web-devicons", lazy = false },
	event = { "BufRead", "BufNewFile", "VimEnter" },
	config = function()
		require("lualine").setup({
			theme = "ayu_mirage",
		})
	end,
}

return lualine
