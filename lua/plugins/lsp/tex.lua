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
			-- g.vimtex_compiler_latexmk = {
			-- 	["options"] = {
			-- 		"-shell-escape",
			-- 		"-verbose",
			-- 		"-file-line-error",
			-- 		"-synctex=1",
			-- 		"-interaction=nonstopmode",
			-- 	}
			-- }
			g.vimtex_compiler_latexmk_engines = {
				["_"] = "-pdf",
				["pdf_escaped"] = '-pdf -pdflatex="pdflatex -shell-escape %O %S"',
			}
			g.vimtex_view_enabled = 1
			-- g.vimtex_view_method = "skim" -- zathura (linux), skim (macos), general (cross-platform)
			-- g.vimtex_view_skim_activate = 1 -- Switch to skim on :VimtexView
			-- g.vimtex_view_method = "zathura_simple"
			-- g.vimtex_view_zathura_activate = 1

			local platform = vim.loop.os_uname().sysname

			if platform == "Darwin" then
				g.vimtex_view_method = "skim"
				g.vimtex_view_skin_activate = 1

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
			elseif platform == "Linux" then
				g.vimtex_view_method = "zathura_simple"
				g.vimtex_view_zathura_activata = 1
			else
				g.vimtex_view_method = "generic"
			end

		end,
	}
}
