return {
	-- {
	-- 	"HiPhish/nvim-ts-rainbow2",
	-- 	dependencies = "nvim-treesitter/nvim-treesitter",
	-- 	after = "nvim-treesitter/nvim-treesitter",
	-- 	config = function()
	-- 		require('nvim-treesitter.configs').setup({
	-- 			rainbow = {
	-- 				enable = true,
	-- 				query = 'rainbow-parens',
	-- 				strategy = require('ts-rainbow').strategy.global,
	-- 			}
	-- 		})
	-- 	end,
	-- }
	{
		"HiPhish/rainbow-delimiters.nvim",
		after = "nvim-treesitter/nvim-treesitter",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			require("rainbow-delimiters.setup").setup({
				strategy = {
						[''] = rainbow_delimiters.strategy['global'],
						vim = rainbow_delimiters.strategy['local'],
				},
				query = {
						[''] = 'rainbow-delimiters',
						lua = 'rainbow-blocks',
				},
				priority = {
						[''] = 110,
						lua = 210,
				},
				highlight = {
						'RainbowDelimiterRed',
						'RainbowDelimiterYellow',
						'RainbowDelimiterBlue',
						'RainbowDelimiterOrange',
						'RainbowDelimiterGreen',
						'RainbowDelimiterViolet',
						'RainbowDelimiterCyan',
				},
			})
		end,
	}
}
