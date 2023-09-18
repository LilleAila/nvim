local if_nil = vim.F.if_nil
local leader = "SPC"

local function button(sc, icon, txt, keybind, keybind_opts)
	local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 3,
		width = 50,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
	}
	if keybind then
		keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = icon .. "  " .. txt,
		on_press = on_press,
		opts = opts,
	}
end

local padding = { type = "padding", val = 2 }

return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", {
			"MaximilianLloyd/ascii.nvim",
			dependencies = "MunifTanjim/nui.nvim"
		}},
		config = function()
			local ascii = require("ascii")

			local header = {
					type = "text",
					-- val = ascii.get_random("text", "neovim"),
					val = ascii.art.planets.planets.saturn_plus,
					-- val = ascii.art.gaming.doom.logo,
					opts = {
							position = "center",
							hl = "Type",
					},
			}

			-- require("alpha").setup(require("alpha.themes.dashboard").config)
			require("alpha").setup({
				layout = {
					padding,
					header,
					padding,
					{
						type = "group",
						val = {
							button("n", "", "New file", "<cmd>ene<cr>"),
							button("SPC e e", "", "File browser"),
							button("SPC e t", "󰙅", "Nvim Tree"),
							button("SPC s c", "󱦺", "Load cwd session"),
							button("SPC s l", "󰥔", "Load last session"),
							button("SPC s o", "", "Pick session"),
							button("SPC m c", "", "Change color scheme"),
						},
						opts = {
							spacing = 1,
						}
					},
				},
				opts = {
					margin = 5,
				},
			})
		end,
	}
}
