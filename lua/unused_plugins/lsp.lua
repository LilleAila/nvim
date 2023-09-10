return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			{
				"williamboman/mason.nvim",
				build = ":MasonUpdate",
				dependencies = "williamboman/mason-lspconfig.nvim",
			},

			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",

			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		after = "L3MON4D3/LuaSnip",
		config = function()
			local lsp = require("lsp-zero").preset({})

			lsp.on_attach(function(_, bufnr)
				lsp.default_keymaps({ buffer = bufnr })

				local map = vim.keymap.set
				local function opts(description)
					return { desc = description, noremap = true, silent = true, buffer = bufnr }
				end

				map("n", "gR", "<cmd>Telescope lsp_references<cr>", opts("Show LSP references"))
				map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
				map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts("Show LSP definitions"))
				map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts("Show LSP implementations"))
				map("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts("Show LSP type definitions"))
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("See available code actions"))
				map("n", "<leader>rn", vim.lsp.buf.rename, opts("Smart rename"))
				map("n", "<leader>D", "<cmd>Telescope diagnoatics bufnr=0<cr>", opts("Show buffer diagnostics"))
				map("n", "<leader>d", vim.diagnostics.open_float, opts("Show line diagnostics"))
				map("n", "dp", vim.diagnostic.goto_prev, opts("Go to previous diagnostic"))
				map("n", "dn", vim.diagnostic.goto_next, opts("Go to next diagnostic"))
				map("n", "K", vim.lsp.buf.hover, opts("Show documentation for what is under cursor"))
				map("n", "<leader>rs", "<cmd>LspRestart<cr>", opts("Restart LSP"))
			end)

			lsp.ensure_installed({
				"lua_ls"
			})

			lsp.configure("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						}
					}
				}
			})

			lsp.set_sign_icons({
				error = " ",
				warn = " ",
				hint = "󰘥 ",
				info = " "
			})

			lsp.setup()
		end,
	}
}
