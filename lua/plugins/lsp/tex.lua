return {
	-- {
	-- 	"f3fora/nvim-texlabconfig",
	-- 	config = function()
	-- 		require("texlabconfig").setup()
	-- 	end,
	-- 	ft = { "tex", "bib" },
	-- 	build = "go build"
	-- }
	{
		"lervag/vimtex",
		-- ft = { "tex" },
		-- after = "folke/which-key",
		config = function()
			local g = vim.g
			-- g.maplocalleader = "'"
			-- Tectonic is easier to install, but latexmk can continuously compile
			g.vimtex_compiler_method = "latexmk" -- latexmk, tectonic
			g.vimtex_view_enabled = 1
			g.vimtex_view_method = "skim" -- zathura (linux), skim (macos), general (cross-platform)
			g.vimtex_view_skim_activate = 1 -- Switch to skim on :VimtexView

			-- local function TexFocusNvim()
			-- 	vim.fn.system("open -a iTerm") -- alacritty, iTerm, wezterm etc.
			-- 	vim.cmd("redraw!")
			-- end
			--
			-- vim.api.nvim_create_augroup("vimtex_event_focus", { clear = true })
			-- vim.api.nvim_create_autocmd("VimtexEventViewReverse", {
			-- 	group = "vimtex_event_focus",
			-- 	callback = TexFocusNvim,
			-- })

			-- The above lua code does not work
			-- Idk wai
			vim.cmd([[
				function! s:TexFocusVim() abort
					" Replace `TERMINAL` with the name of your terminal application
					" Example: execute "!open -a iTerm"  
					" Example: execute "!open -a Alacritty"
					silent execute "!open -a iTerm"
					redraw!
				endfunction

				augroup vimtex_event_focus
					au!
					au User VimtexEventViewReverse call s:TexFocusVim()
				augroup END
			]])
		end,
	}
}
