require("alex.core.options") -- vim settings / options. Should always be first
require("alex.lazy") -- aquires packages with lazy
require("alex.core.colorscheme") -- set color theme

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("alex.core.autocmds")
		require("alex.core.keymaps")
	end,
})
