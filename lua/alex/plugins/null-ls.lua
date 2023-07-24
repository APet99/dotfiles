-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local null_ls = {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		local utils = require("alex.utils")
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics

		require("mason-null-ls").setup({
			ensure_installed = utils.mason_formatters,
			automatic_installation = true,
			handlers = {},
		})

		null_ls.setup({
			sources = {
				formatting.prettier.with({
					filetypes = {
						"javascript",
						"typescript",
						"css",
						"scss",
						"html",
						"json",
						"yaml",
						"markdown",
						"graphql",
						"md",
						"txt",
					},
					only_local = "node_modules/.bin",
				}), -- js/ts formatter
				formatting.stylua, -- lua formatter
				formatting.rustfmt, -- rust formatter
				diagnostics.eslint_d.with({ -- js/ts linter
					-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
					condition = function(utils)
						return utils.root_has_file(".eslintrc.json") or utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
					end,
				}),
			},
		})
	end,
}

return null_ls
