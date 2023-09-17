return {
	"catppuccin/nvim",
	"Shatur/neovim-ayu",
	"folke/tokyonight.nvim",
	"nyoom-engineering/oxocarbon.nvim",
	"bluz71/vim-nightfly-colors",
	"bluz71/vim-moonfly-colors",
	"savq/melange-nvim",
	"rmehri01/onenord.nvim",
	"AlexvZyl/nordic.nvim",
	"shaunsingh/nord.nvim",
	"Mofiqul/vscode.nvim",
	"projekt0n/github-nvim-theme",
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				-- toggle_style_key = "<leader>od", -- This does not work well with multiple themes installed
				style = "deep"
			})
		end,
	},
	{
		"zaldih/themery.nvim",
		priority = 1000,
		config = function()
			vim.opt.background = "dark"
			require("themery").setup({
				-- themes = { "catppuccin", "ayu" },
				themes = {
					{ name = "Ayu mirage", colorscheme = "ayu-mirage", after = [[vim.cmd("hi NvimTreeLineNr guifg=white")]] },
					{ name = "Ayu dark", colorscheme = "ayu-dark" },
					{ name = "Catppuccin mocha", colorscheme = "catppuccin-mocha" },
					{ name = "Catppuccin macchiato", colorscheme = "catppuccin-macchiato" },
					{ name = "Catppuccin frappe", colorscheme = "catppuccin-frappe" },
					{ name = "Tokyonight storm", colorscheme = "tokyonight-storm" },
					{ name = "Tokyonight night", colorscheme = "tokyonight-night" },
					{ name = "Tokyonight moon", colorscheme = "tokyonight-moon" },
					{ name = "Oxocarbon", colorscheme = "oxocarbon", before = [[vim.opt.background = "dark"]] },
					{ name = "Nightfly", colorscheme = "nightfly" },
					{ name = "Moonfly", colorscheme = "moonfly" },
					{ name = "Melange", colorscheme = "melange" },
					{ name = "OneNord", colorscheme = "onenord" },
					{ name = "Nordic", colorscheme = "nordic" },
					{ name = "Nord", colorscheme = "nord" },
					{ name = "VSCode", colorscheme = "vscode" },
					{ name = "Onedark", colorscheme = "onedark" },
					{ name = "Github dark", colorscheme = "github_dark" },
					{ name = "Github dark dimmed", colorscheme = "github_dark_dimmed" },
					{ name = "Github dark high contrast", colorscheme = "github_dark_high_contrast" },
				},
				themeConfigFile = "~/.config/nvim/lua/core/theme.lua",
				livePreview = true,
			})
		end,
	},
}
