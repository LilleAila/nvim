local map = vim.keymap.set

local function opts(description)
	return { desc = description, noremap = true, silent = true }
end

-- vim.g.mapleader = " "

map("n", "<leader>qa", "<cmd>wqa!<cr>", opts("Save and quit all open files"))

local ls = require("luasnip")
local undo_snippet = function()
	local buf = vim.api.nvim_get_current_buf()
	local snip = ls.session.current_nodes[buf].parent.snippet
	local trig = snip.trigger
	local reg = snip:get_buf_position()
	vim.api.nvim_buf_set_text(
		buf,
		reg.from_position[1], reg.from_position[2],
		reg.to_position[1], reg.to_position[2],
		trig
	)
end

local paste_img = function()
	vim.ui.input({ prompt = "Image name (saved to ./images/): " }, function(input) vim.fn.system({ "pngpaste", "./images/" .. input .. ".png" }) end)
end

local wk = require("which-key")
wk.register({
	e = {
		name = "Explorer",
		e = { "<cmd>Telescope file_browser<cr>", "Telescope file browser (?)" },
		f = { "<cmd>NvimTreeFocus<cr>", "Focus Nvim Tree" },
		t = { "<cmd>NvimTreeToggle<cr>", "Toggle Nvim Tree" },
		r = { function() require("ranger-nvim").open(true) end, "Open ranger" },
	},
	t = {
		name = "Telescope",
		t = { "<cmd>Telescope find_files<cr>", "Find files in cwd" }, -- Most used
		r = { "<cmd>Telescope oldfiles<cr>", "Find recent files" },
		s = { "<cmd>Telescope live_grep<cr>", "Find string in cwd" },
		c = { "<cmd>Telescope grep_string<cr>", "Find string under cursor in cwd" },
		n = { function() require("telescope").extensions.notify.notify() end, "Show notifications" },
		u = { function() require("telescope").extensions.undo.undo() end, "Show undo tree" },
	},
	s = {
		name = "Sessions",
		o = { "<cmd>SessionManager load_session<cr>", "Open session" },
		l = { "<cmd>SessionManager load_last_session<cr>", "Load last session" },
		c = { "<cmd>SessionManager load_current_dir_session<cr>", "Load session in cwd" },
		d = { "<cmd>SessionManager delete_session<cr>", "Delete sessions" },
		s = { "<cmd>SessionManager save_current_session<cr>", "Save session" },
	},
	q = {
		name = "File",
		q = { "<cmd>wqa!<cr>", "Save and quit all" },
		e = { "<cmd>qa!<cr>", "Exit neovim without saving" },
		s = { "<cmd>w<cr>", "Save file" },
	},
	m = {
		name = "Misc",
		u = { undo_snippet, "Undo snippet completion" },
		p = { paste_img, "Paste image from clipboard" },
		c = { "<cmd>Themery<cr>", "Change colorscheme" },
		l = { "<cmd>Lazy<cr>", "Open lazy" },
		m = { "<cmd>Mason<cr>", "Open mason" },
		s = { function() require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" }) end, "Reload snippets" },
		a = { "<cmd>Alpha<cr>", "Open dashboard" },
		A = { function() require("ascii").preview() end, "Preview ascii" },
	},
	k = {
		name = "LaTeX", -- TODO: Make this only work for .tex buffers
		c = { "<cmd>VimtexCompile<cr>", "Toggle compiling" },
		v = { "<cmd>VimtexView<cr>", "View output" },
		s = { "<cmd>VimtexStop<cr>", "Stop compiling" },
		e = { "<cmd>VimtexErrors<cr>", "Show errors" },
		S = { "<cmd>VimtexStatus<cr>", "Show status" },
		i = { "<cmd>VimtexInfo<cr>", "Show info" },
		C = { "<cmd>VimtexClean<cr>", "Clean files" },
		o = { "<cmd>VimtexCompileSS<cr>", "Compile once" },
	},
	c = {
		name = "Cellular Automaton",
		r = { "<cmd>CellularAutomaton make_it_rain<cr>", "Make it rain" },
		l = { "<cmd>CellularAutomaton game_of_life<cr>", "Game of life" },
	},
	h = {
		name = "Hop", --BC, AC, CurrentLine suffixes
		h = {
			name = "Anywhere",
			h = { "<cmd>HopWord<cr>", "Hop word" },
			c = { "<cmd>HopCamelCase<cr>", "Hop camelCase" },
			C = { "<cmd>HopChar1<cr>", "Hop character" },
			l = { "<cmd>HopLine<cr>", "Hop line" },
			L = { "<cmd>HopLineStart<cr>", "Hop line start" },
			a = { "<cmd>HopAnywhere<cr>", "Hop anywhere" },
		},
		b = {
			name = "Before Cursor",
			h = { "<cmd>HopWordBC<cr>", "Hop word" },
			c = { "<cmd>HopCamelCaseBC<cr>", "Hop camelCase" },
			C = { "<cmd>HopChar1BC<cr>", "Hop character" },
			l = { "<cmd>HopLineBC<cr>", "Hop line" },
			L = { "<cmd>HopLineStartBC<cr>", "Hop line start" },
			a = { "<cmd>HopAnywhereBC<cr>", "Hop anywhere" },
		},
		a = {
			name = "After Cursor",
			h = { "<cmd>HopWordAC<cr>", "Hop word" },
			c = { "<cmd>HopCamelCaseAC<cr>", "Hop camelCase" },
			C = { "<cmd>HopChar1AC<cr>", "Hop character" },
			l = { "<cmd>HopLineAC<cr>", "Hop line" },
			L = { "<cmd>HopLineStartAC<cr>", "Hop line start" },
			a = { "<cmd>HopAnywhereAC<cr>", "Hop anywhere" },
		},
		c = {
			name = "Current Line",
			h = { "<cmd>HopWordCurrentLine<cr>", "Hop word" },
			c = { "<cmd>HopCamelCaseCurrentLine<cr>", "Hop camelCase" },
			C = { "<cmd>HopChar1CurrentLine<cr>", "Hop character" },
			l = { "<cmd>HopLineCurrentLine<cr>", "Hop line" },
			L = { "<cmd>HopLineStartCurrentLine<cr>", "Hop line start" },
			a = { "<cmd>HopAnywhereCurrentLine<cr>", "Hop anywhere" },
		},
	}
}, { prefix = "<leader>" })

-- File
map({ "n", "i" }, "<C-s>", "<cmd>w<cr>", opts("Save file"))
map({ "n", "i" }, "<C-z>", "<cmd>undo<cr>", opts("Undo"))
map({ "n", "i" }, "<C-y>", "<cmd>redo<cr>", opts("Redo"))
map({ "n", "i" }, "<CS-z>", "<cmd>redo<cr>", opts("redo"))

-- Move.nvim
vim.keymap.set({ "n", "i" }, "<A-j>", ":MoveLine(1)<CR>", opts("Move line down"))
vim.keymap.set({ "n", "i" }, "<A-k>", ":MoveLine(-1)<CR>", opts("Move line up"))
vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", opts("Move Char Left"))
vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", opts("Move char right"))
vim.keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts("Move word right"))
vim.keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts("Move word left"))

vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", opts("Move block down"))
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", opts("Move block up"))
vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts("Move block left"))
vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", opts("Move block right"))

-- Luasnip is configured in lua/plugins/lsp/cmp.lua

-- Buffers Barbar
map("n", "<M-c>", "<cmd>BufferClose<cr>", opts("Close buffer"))
map("n", "<M-p>", "<cmd>BufferPin<cr>", opts("Pin buffer"))
map("n", "<C-p>", "<cmd>BufferPick<cr>", opts("Pick buffer"))
map("n", "<M-,>", "<cmd>BufferPrevious<cr>", opts("Go to previous buffer"))
map("n", "<M-.>", "<cmd>BufferNext<cr>", opts("Go to next buffer"))
map("n", "<C-,>", "<cmd>BufferMovePrevious<cr>", opts("Move buffer right"))
map("n", "<C-.>", "<cmd>BufferMoveNext<cr>", opts("Move buffer left"))

-- -- NvimTree
-- map("n", "<leader>tf", "<cmd>NvimTreeFocus<cr>", opts("Focus Nvim Tree"))
-- map("n", "<leader>tt", "<cmd>NvimTreeToggle<cr>", opts("Toggle Nvim Tree"))
--
-- -- Knap LaTeX
-- map("n","<leader>lp", function() require("knap").process_once() end, opts("Process LaTeX"))
-- map("n","<leader>lc", function() require("knap").close_viewer() end, opts("Close LaTeX Viewer"))
-- map("n","<leader>la", function() require("knap").toggle_autopreviewing() end, opts("Toggle LaTeX Auto Preview"))
-- map("n","<leader>lf", function() require("knap").forward_jump() end, opts("LaTeX Forward Jump"))
--
-- -- Cellular Automaton
-- map("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<cr>")
-- map("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<cr>")
--
-- -- Telescope
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts("Fuzzy find files in cwd"))
-- map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts("Fuzzy find recent files"))
-- map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts("Find string in cwd"))
-- map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts("Find string under cursor in cwd"))
