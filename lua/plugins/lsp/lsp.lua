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

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			lsp.ensure_installed({
				"lua_ls"
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
