return {
	{
		"seandewar/killersheep.nvim",
		cmd = "KillKillKill",
		config = function()
			require("killersheep").setup({
				gore = true,
				keymaps = {
					move_left = "h",
					move_right = "l",
					shoot = "<Space>",
				}
			})
		end,
	}
}
