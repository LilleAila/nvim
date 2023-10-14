return {
	-- {
	-- 	"samodostal/image.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"m00qek/baleia.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("image").setup({
	-- 			render = {
	-- 				min_padding = 5,
	-- 				show_label = true,
	-- 				show_image_dimensions = true,
	-- 				use_dither = true,
	-- 				foreground_color = true,
	-- 				background_color = true,
	-- 			},
	-- 			events = {
	-- 				update_on_nvim_resize = true,
	-- 			}
	-- 		})
	-- 	end,
	-- }
	-- { -- Uses WezTerm image preview
	-- 	"adelarsq/image_preview.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("image_preview").setup()
	-- 	end
	-- }
	{
		"3rd/image.nvim",
		config = function()
			require("image").setup({
				backend = "ueberzug",
				integrations = {
					markdown = {
						enabled = true,
						clear_in_insert_mode = true,
						download_remote_images = true,
						only_render_image_at_cursor = true,
						filetypes = { "markdown", "vimwiki" },
					}
				},
			})
		end
	}
}
