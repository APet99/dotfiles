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
		local code_actions = null_ls.builtins.code_actions

		require("mason-null-ls").setup({
			ensure_installed = utils.mason_formatters,
			automatic_installation = true,
			handlers = {},
		})

		null_ls.setup({
			sources = {
				formatting.prettier.with({
					condition = function(utils)
						return utils.has_file(".prettierrc.js")
							or utils.has_file(".prettierrc.json")
							or utils.has_file(".prettierrc")
					end,
				}), -- js/ts formatter

				formatting.stylua, -- lua formatter
				formatting.autopep8,
				formatting.rustfmt, -- rust formatter
				diagnostics.eslint_d.with({ -- js/ts linter
					-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
					condition = function(utils)
						return utils.root_has_file(".eslintrc.json") or utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
					end,
				}),
				diagnostics.pylint.with({
					-- diagnostics_format = getDiagnosticsFormat("pylint"),
				}),
				code_actions.gitsigns,
			},
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}

return null_ls
