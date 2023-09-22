return {
	{
		"Shatur/neovim-session-manager",
		config = function()
			require("session_manager").setup({
				autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
				autosave_last_session = true,
			})

			local config_group = vim.api.nvim_create_augroup('SessionManagerGroup', {})
			vim.api.nvim_create_autocmd({ 'User' }, {
				pattern = "SessionSavePre",
				group = config_group,
				callback = function()
					vim.cmd("NvimTreeClose")
				end,
			})
		end,
	}
}
