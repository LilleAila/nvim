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
		ft = { "tex" },
		after = "folke/which-key",
		config = function()
			local g = vim.g
			-- :VimtexCompileSS -- compile single shot
			-- :VimtexCompile -- toggle continuous compiling
			-- :VimtexStop -- stop continuous compiling
			-- :VimtexStatus
			-- :VimtexInfo -- Check if compiler is running
			-- :VimtexErrors
			-- :VimtexClean
			--
			-- :VimtexView -- View output -- Install viewerrun first: brew tap zegervdv/zathura
			-- g.maplocalleader = "'"
			-- Tectonic is easier to install, but latexmk can continuously compile
			g.vimtex_compiler_method = "latexmk" -- latexmk, tectonic
			-- g.vimtex_compilet_tectonic = {
			-- 	options = {
			-- 		"-X", "watch",
			-- 		"--keep-logs",
			-- 		"--synctex",
			-- 	}
			-- }
			g.vimtex_view_method = "skim" -- zathura, skim, general
		end,
	}
}
