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

			-- local map = vim.keymap.set
			-- local function opts(description, bufnr)
			-- 	return { desc = description, noremap = true, silent = true, buffer = bufnr }
			-- end
			-- local wk = require("which-key")

			local on_attach = function(_, bufnr)
				-- map("n", "gR", "<cmd>Telescope lsp_references<cr>", opts("Show LSP references", bufnr))
				-- map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration", bufnr))
				-- map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts("Show LSP definitions", bufnr))
				-- map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts("Show LSP implementations", bufnr))
				-- map("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts("Show LSP type definitions", bufnr))
				-- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("See available code actions", bufnr))
				-- map("n", "<leader>rn", vim.lsp.buf.rename, opts("Smart rename", bufnr))
				-- map("n", "<leader>D", "<cmd>Telescope diagnoatics bufnr=0<cr>", opts("Show buffer diagnostics", bufnr))
				-- map("n", "<leader>d", vim.diagnostics.open_float, opts("Show line diagnostics", bufnr))
				-- map("n", "dp", vim.diagnostic.goto_prev, opts("Go to previous diagnostic", bufnr))
				-- map("n", "dn", vim.diagnostic.goto_next, opts("Go to next diagnostic", bufnr))
				-- map("n", "K", vim.lsp.buf.hover, opts("Show documentation for what is under cursor", bufnr))
				-- map("n", "<leader>rs", "<cmd>LspRestart<cr>", opts("Restart LSP", bufnr))

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

			-- lspconfig["texlab"].setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = function(_, bufnr)
			-- 		require("which-key").register({
			-- 			k = {
			-- 				name = "Knap LaTeX",
			-- 				p = { function() require("knap").process_once() end, "Process LaTeX" },
			-- 				c = { function() require("knap").close_viewer() end, "Close LaTeX viewer" },
			-- 				a = { function() require("knap").toggle_autopreviewing() end, "Toggle LaTeX auto previewing" },
			-- 				f = { function() require("knap").forward_jump() end, "LaTeX forward fump" }
			-- 			},
			-- 		}, {
			-- 			prefix = "<leader>",
			-- 			buffer = bufnr
			-- 		})
			-- 		on_attach(_, bufnr)
			-- 	end,
			-- 	setting = {
			-- 		build = {
			-- 			onSave = true,
			-- 			forwardSearchAfter = true,
			-- 			executable = "tectonic",
			-- 			args = {
			-- 				"-X",
			-- 				"compile",
			-- 				"%f",
			-- 				"--synctex",
			-- 				"--keep-logs",
			-- 				"--keep-intermediates"
			-- 			}
			-- 		},
			-- 		texlab = {
			-- 			forwardSearch = {
			-- 				executable = "sioyek",
			-- 				args = {
			-- 					"--reuse-window",
			-- 					"--execute-command", "toggle_synctex",
			-- 					"--inverse-search",
			-- 					[[/Users/olaisolsvik/.local/share/nvim/lazy/nvim-texlabconfig/nvim-texlabconfig -file %%%1 -line %%%2 -server]] .. vim.v.servername,
			-- 					"--forward-search-file", "%f",
			-- 					"--forward-search-line", "%l", "%p",
			-- 				}
			-- 			}
			-- 		},
			-- 	}
			-- })

		-- 	lspconfig["ltex"].setup({
		-- 		capabilities = capabilities,
		-- 		on_attach = function(_, bufnr)
		-- 			require("which-key").register({
		-- 				k = {
		-- 					name = "Knap LaTeX",
		-- 					p = { function() require("knap").process_once() end, "Process LaTeX" },
		-- 					c = { function() require("knap").close_viewer() end, "Close LaTeX viewer" },
		-- 					a = { function() require("knap").toggle_autopreviewing() end, "Toggle LaTeX auto previewing" },
		-- 					f = { function() require("knap").forward_jump() end, "LaTeX forward fump" }
		-- 				},
		-- 			}, {
		-- 				prefix = "<leader>",
		-- 				buffer = bufnr
		-- 			})
		-- 			on_attach(_, bufnr)
		-- 		end,
		-- 		settings = {
		-- 			language = "en-US",
		-- 			-- dictionary = {
		-- 			-- 	"en-US" == { "oppg", "oppgaver" }
		-- 			-- }
		-- 			disabledRules = {
		-- 				["en-US"] = {
		-- 					"MORFOLOGIK_RULE_EN_US",
		-- 					"UPPERCASE_SENTENCE_START",
		-- 					"ER",
		-- 					"LIGATURES",
		-- 				}
		-- 			},
		-- 		}
		-- 	})
		end,
	}
}
