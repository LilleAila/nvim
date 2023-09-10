return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
					vim.o.timeout = true
					vim.o.timeoutlen = 200
					require("which-key").setup()
        end,
    }
}
