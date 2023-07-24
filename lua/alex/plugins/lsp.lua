local lsp = {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
		"jose-elias-alvarez/typescript.nvim",
	},
	config = function(_, _)
		local utils = require("alex.utils")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		local lsp_utils = require("alex.lsp_utils")
		local typescript = require("typescript")
		lsp_utils.setup()

		typescript.setup({
			server = {
				capabilities = lsp_utils.capabilities,
				on_attach = lsp_utils.on_attach,
				filetypes = { "typescript", "typescriptreact", "typescriptreact" },
			},
		})

		mason_lspconfig.setup({
			ensure_installed = utils.lsp_servers,
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					on_attach = lsp_utils.on_attach,
					capabilities = lsp_utils.capabilities,
				})
			end,
			["rust_analyzer"] = function()
				lspconfig["rust_analyzer"].setup({
					on_attach = lsp_utils.on_attach,
					capabilities = lsp_utils.capabilities,

					settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
							},
							checkOnSave = {
								allFeatures = true,
								command = "clippy",
							},
							procMacro = {
								ignored = {
									["async-trait"] = { "async_trait" },
									["napi-derive"] = { "napi" },
									["async-recursion"] = { "async_recursion" },
								},
							},
						},
					},
				})
			end,
			["pyright"] = function()
				lspconfig.pyright.setup({
					on_attach = lsp_utils.on_attach,
					capabilities = lsp_utils.capabilities,
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "off",
							},
						},
					},
				})
			end,
			["clangd"] = function()
				local capabilities_cpp = lsp_utils.capabilities
				capabilities_cpp.offsetEncoding = { "uts-16" }
				lspconfig.clangd.setup({
					on_attach = lsp_utils.on_attach,
					capabilities = capabilities_cpp,
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = lsp_utils.capabilities,
					on_attach = lsp_utils.on_attach,
					settings = { -- custom settings for lua
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								-- make language server aware of runtime files
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
						},
					},
				})
			end,
		})
	end,
}

return lsp
