return {
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				map_cr = true,
				map_complete = true,
				auto_select = true,
			})
		end,
	}
}
