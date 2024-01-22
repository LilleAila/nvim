return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		config = function()
			local ls = require("luasnip")

			ls.config.set_config({
				update_events = "TextChanged,TextChangedI",
				store_selection_keys = "<Tab>",
				delete_check_events = "TextChanged",
				enable_autosnippets = true,
				history = false,
			})

			require("luasnip.loaders.from_lua").load({paths = vim.fn.stdpath("config") .. "/LuaSnip/"})
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })

			-------- Below code probably works but just turned off history instead
			vim.api.nvim_create_autocmd('ModeChanged', {
				pattern = '*',
				callback = function()
					if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
							and ls.session.current_nodes[vim.api.nvim_get_current_buf()]
							and not ls.session.jump_active
					then
						ls.unlink_current()
					end
				end
			})
		end
	},

	{
		"chrisgrieser/nvim-scissors",
		dependencies = "nvim-telescope/telescope.nvim",
		config = function()
			require("scissors").setup({
				snippetDir = vim.fn.stdpath("config") .. "/snippets",
				editSnippetPopup = {
					height = 0.4,
					width = 0.6,
					border = "rounded",
					keymaps = {
						cancel = "q",
						saveChanges = "<BC>", -- or :w
						goBackToSearch = "<BS>",
						delete = "<C-BS>",
						openInFile = "<C-o>",
						insertNextToken = "<C-t>", -- Both with in both modes
						jumpBetweenBodyAndPrefix = "<Tab>",
					},
				},
				jsonFormatter = "yq" -- "yq", "jq" or "none", they have to be installed on system
			})
		end
	}
}
