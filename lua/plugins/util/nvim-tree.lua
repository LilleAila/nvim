return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                update_cwd = true,
								view = {
									width = 40,
									relativenumber = true,
								},
								renderer = {
									indent_markers = {
										enable = true,
									},
									icons = {
										glyphs = {
											folder = {
												arrow_closed = "",
												arrow_open = "",
											}
										},
									},
								},
								filters = {
									custom = { ".DS_Store" },
								},
								git = {
									ignore = false,
								},
            })

						-- vim.cmd("hi NvimTreeLineNr guifg=white")
						-- vim.cmd("hi NvimTreeOpenedFolderIcon guifg=white")
        end,
    }
}
