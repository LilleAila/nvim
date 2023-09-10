return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local map = vim.keymap.set
			local function opts(description, bufnr)
				return { desc = description, noremap = true, silent = true, buffer = bufnr }
			end

			local on_attach = function(_, bufnr)
				map("n", "gR", "<cmd>Telescope lsp_references<cr>", opts("Show LSP references", bufnr))
				map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration", bufnr))
				map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts("Show LSP definitions", bufnr))
				map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts("Show LSP implementations", bufnr))
				map("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts("Show LSP type definitions", bufnr))
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("See available code actions", bufnr))
				map("n", "<leader>rn", vim.lsp.buf.rename, opts("Smart rename", bufnr))
				map("n", "<leader>D", "<cmd>Telescope diagnoatics bufnr=0<cr>", opts("Show buffer diagnostics", bufnr))
				map("n", "<leader>d", vim.diagnostics.open_float, opts("Show line diagnostics", bufnr))
				map("n", "dp", vim.diagnostic.goto_prev, opts("Go to previous diagnostic", bufnr))
				map("n", "dn", vim.diagnostic.goto_next, opts("Go to next diagnostic", bufnr))
				map("n", "K", vim.lsp.buf.hover, opts("Show documentation for what is under cursor", bufnr))
				map("n", "<leader>rs", "<cmd>LspRestart<cr>", opts("Restart LSP", bufnr))
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
