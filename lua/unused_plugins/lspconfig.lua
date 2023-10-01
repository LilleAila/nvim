return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			"folke/which-key.nvim"
		},
		after = "folke/which-key.nvim",
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local on_attach = function(_, bufnr)
				require("which-key").register({
					l = {
						name = "LSP",
						r = { "<cmd>Telescope lsp_references<cr>", "Show references" },
						c = { vim.lsp.buf.declaration, "Go to declaration" },
						d = { "<cmd>Telescope lsp_definitions<cr>", "Show definitions" },
						i = { "<cmd>Telescope lsp_implementations<cr>", "Show implementations" },
						t = { "<cmd>Telescope lsp_type_definitions<cr>", "Show type definitions" },
						a = { vim.lsp.buf.code_action, "See available code actions" },
						R = { vim.lsp.buf.rename, "Smart rename" },
						D = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Show buffer diagnostics" },
						l = { vim.diagnostic.open_float, "Show line diagnostics" },
						p = { vim.diagnostic.goto_prev, "Go to previous diagnostic" },
						n = { vim.diagnostic.goto_next, "Go to next diagnostic" },
						K = { vim.lsp.buf.hover, "Show documentation at cursor" },
						S = { "<cmd>LspRestart<cr>", "Restart LSP" },
						I = { "<cmd>LspInfo<cr>", "LSP info" },
					},
				}, {
					prefix = "<leader>",
					buffer = bufnr
				})
			end

			local capabilities = cmp_nvim_lsp.default_capabilities()

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			lspconfig["html"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["tsserver"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["cssls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["tailwindcss"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["emmet_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
			})

			lspconfig["pyright"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

				end,
	}
}
