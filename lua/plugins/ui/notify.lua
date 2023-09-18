return {
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				timeout = 1500,
				minimum_width = 30,
				max_width = 70,
				render = "compact",
				fps = 60,
				top_down = true,
				stages = "fade",
				level = 1,
      })
			vim.notify = require("notify")
		end,
	}
}
