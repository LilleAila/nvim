return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"lervag/vimtex", -- VimTeX is used in snippet files
		},
		config = function()
			local cmp = require("cmp")
			local ls = require("luasnip")

			-- ls.setup({
			-- 	update_events = "TextChanged,TextChangedI",
			-- })

			ls.config.set_config({
				update_events = "TextChanged,TextChangedI",
				store_selection_keys = "<Tab>",
				delete_check_events = "TextChanged",
				enable_autosnippets = true,
				history = false,
			})

			require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"}) -- Probably does not work on wandos becus path
			require("luasnip.loaders.from_vscode").lazy_load()

			-------- Below code probably works but just turned off history instead
			-- vim.api.nvim_create_autocmd('ModeChanged', {
			-- 	pattern = '*',
			-- 	callback = function()
			-- 		if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
			-- 				and ls.session.current_nodes[vim.api.nvim_get_current_buf()]
			-- 				and not ls.session.jump_active
			-- 		then
			-- 			ls.unlink_current()
			-- 		end
			-- 	end
			-- })

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				snippet = {
					expand = function(args)
						ls.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),

					-- Keymaps for luasnip
					["<Tab>"] = cmp.mapping(function(fallback)
						if ls.expand_or_jumpable() then
							ls.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if ls.jumpable(-1) then
							ls.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" })
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end
	}
}
