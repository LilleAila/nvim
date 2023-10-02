return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"debugloop/telescope-undo.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
				pickers = {
					colorscheme = {
						enable_preview = true,
					}
				},
				extensions = {
					file_browser = {
						hijack_netrw = true,
					},
					undo = {
						use_delta = true,
						side_by_side = true,
						time_format = "%H:%M",
						layout_strategy = "vertical",
						layout_config = {
							preview_height = 0.8
						},
					},
				}
			})

			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")
			telescope.load_extension("undo")
			-- telescope.load_extension("projects")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
}
