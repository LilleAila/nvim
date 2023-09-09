return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "luadoc", "luap", "vim" },
				auto_install = true,
				autotag = {
					enable = true,
					auto_rename_tag = true,
					filetypes = { "html", "xml", "javascriptreact", "typescriptreact" },
				},
			})
		end,
	}
}
