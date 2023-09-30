return {
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = "zaldih/themery.nvim",
		after = "zaldih/themery.nvim",
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append "space:⋅"
			vim.opt.listchars:append "eol:↴"

			require("indent_blankline").setup({
				show_current_context = true,
				show_current_context_start = false,
				-- space_char_blankline = " ",
				show_end_of_line = true,
				-- char = "▎",
			})
		end,
	},
}
