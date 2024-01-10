local opt = vim.opt
local g = vim.g
local diagnostic = vim.diagnostic
local cmd = vim.cmd

g.mapleader = " "
g.tex_flavor = "latex"
opt.conceallevel = 2 -- For conceal in vimtex

-- opt.guifont = "JetBrainsMono Nerd Font:h12"
opt.encoding = "UTF-8"
opt.mousemoveevent = true
opt.hidden = true
g.code_action_menu_window_border = "single"
opt.ch = 0
opt.pumheight = 10
opt.winminwidth = 10
opt.fileencoding = "utf-8"
opt.splitbelow = true
opt.list = true
opt.splitright = true
opt.termguicolors = true
opt.showtabline = 3
opt.tabline = " "
opt.showmode = false
opt.backup = false
opt.number = true
opt.relativenumber = true
opt.numberwidth = 3
opt.ruler = false
opt.writebackup = false
opt.updatetime = 250
opt.timeoutlen = 100
opt.clipboard = "unnamedplus"
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 0
opt.sidescrolloff = 5
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.mouse = "a"
opt.cursorline = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true
-- opt.signcolumn = "number"
opt.signcolumn = "yes"
opt.fillchars:append("eob: ")
opt.listchars:append("space: ")
-- cmd("set lazyredraw")
cmd("set nolist")
opt.laststatus = 0
diagnostic.config({ signs = false })
opt.shadafile = "NONE"
opt.shadafile = ""
opt.swapfile = false
opt.shortmess:append("sI")
opt.undofile = true
opt.undolevels = 10000

local builtins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"matchparen",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"logipat",
	"matchit",
	"tutor",
	"rplugin",
	"syntax",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
	"archlinux",
	"fzf",
	"tutor_mode_plugin",
	"sleuth",
	"vimgrep"
}

for _, plugin in ipairs(builtins) do
	g["loaded_" .. plugin] = 1
end
