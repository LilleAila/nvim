return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"folke/which-key.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")

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

			require("mason").setup({
				ui = {
					icons = {
						package_installed = "",
						package_pending = "",
						package_uninstalled = "",
					},
				},
			})
			mason_lspconfig.setup({
				ensure_installed = {
					"tsserver",
					"html",
					"cssls",
					"tailwindcss",
					"svelte",
					"lua_ls",
					"emmet_ls",
					"pyright",
				},
				automatic_installation = true,
			})

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- All other LSPs are auto-configured with default options
			local configs = {
				["lua_ls"] = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								}
							},
						}
					}
				},
				["emmet_ls"] = {
					filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
				}
			}

			local handlers = {
				function (server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
			}

			for name, cfg in pairs(configs) do
				cfg["capabilities"] = capabilities
				cfg["on_attach"] = on_attach
				handlers[name] = function()
					lspconfig[name].setup(cfg)
				end
			end

			mason_lspconfig.setup_handlers(handlers)
		end,
	}
}
