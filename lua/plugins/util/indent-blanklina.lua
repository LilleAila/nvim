return {
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = "zaldih/themery.nvim",
		after = "zaldih/themery.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = {
					-- char = "▍",
					smart_indent_cap = true,
				},
				scope = {
					enabled = true,
					show_start = false,
					show_end = false,
				}
			})
		end,
	},
}
