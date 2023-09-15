return {
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	version = "*",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		require("bufferline").setup({
	-- 			options = {
	-- 				style_preset = require("bufferline").style_preset.minimal,
	-- 				-- separator_style = "slope",
	-- 				diagnostics = "nvim_lsp",
	-- 				diagnostics_indicator = function(count, level)
	-- 					local icon = level:match("error") and " " or " "
	-- 					return " " .. icon .. count
	-- 				end,
	-- 				-- indicator = {
	-- 				-- 	style = "underline"
	-- 				-- },
	-- 				offsets = {
	-- 					{
	-- 						filetype = "NvimTree",
	-- 						text = "File Explorer",
	-- 						highlight = "Directory",
	-- 						separator = true
	-- 					},
	-- 				},
	-- 				hover = {
	-- 					enabled = true,
	-- 					delay = 200,
	-- 					reveal = { "close" },
	-- 				}
	-- 			},
	-- 		})
	-- 	end,
	-- }
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		config = function()
			require("barbar").setup({
				icons = {
					-- Configure the base icons on the bufferline.
					-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
					buffer_index = "superscript",
					buffer_number = false,
					button = "",
					-- Enables / disables diagnostic symbols
					diagnostics = {
						[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
						[vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
						[vim.diagnostic.severity.INFO] = { enabled = true, icon = " " },
						[vim.diagnostic.severity.HINT] = { enabled = false },
					},
					modified = { button = "" },
					pinned = { button = "󰐃", filename = true },

					-- preset = "powerline",
					separator_at_end = false,
				},
				sidebar_filetypes = {
					NvimTree = true,
				},
			})
		end,
	}
}
