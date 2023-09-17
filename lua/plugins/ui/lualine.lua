return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "catppuccin/nvim",
		after = "catppuccin/nvim",
		config = function()
			require("lualine").setup({
				options = {
					-- theme = "catppuccin",
					-- theme = "ayu",
					-- section_separators = { right = "", left = " " },
					section_separators = { right = "", left = "" },
					component_separators = { right = "", left = "" }
				},
				sections = {
					lualine_a = { { 'mode', fmt = function(str) return str:sub(1,1):upper()..str:sub(2):lower() end } }
				},
				extensions = {
					"nvim-tree"
				},
			})
		end,
	}
}
