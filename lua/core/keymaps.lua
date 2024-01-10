local map = vim.keymap.set

local function opts(description)
	return { desc = description, noremap = true, silent = true }
end

-- vim.g.mapleader = " "

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})

-- map("n", "<leader>qa", "<cmd>wqa!<cr>", opts("Save and quit all open files"))

-- local ls = require("luasnip")
-- local undo_snippet = function()
-- 	local buf = vim.api.nvim_get_current_buf()
-- 	local snip = ls.session.current_nodes[buf].parent.snippet
-- 	local trig = snip.trigger
-- 	local reg = snip:get_buf_position()
-- 	vim.api.nvim_buf_set_text(
-- 		buf,
-- 		reg.from_position[1], reg.from_position[2],
-- 		reg.to_position[1], reg.to_position[2],
-- 		trig
-- 	)
-- end

-- local paste_img = function()
-- 	vim.ui.input({ prompt = "Image name (saved to ./images/): " }, function(input) vim.fn.system({ "pngpaste", "./images/" .. input .. ".png" }) end)
-- end

-- This should probably be done in separate files for each of th eplugins
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
		b = { "<cmd>Telescope buffers<cr>", "Open buffers with telescope" },
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
		-- u = { undo_snippet, "Undo snippet completion" },
		-- p = { paste_img, "Paste image from clipboard" },
		p = { "<cmd>PasteImage<cr>", "Paste image from clipboard" },
		c = { "<cmd>Themery<cr>", "Change colorscheme" },
		l = { "<cmd>Lazy<cr>", "Open lazy" },
		m = { "<cmd>Mason<cr>", "Open mason" },
		s = { function() require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" }) end, "Reload snippets" },
		a = { "<cmd>Alpha<cr>", "Open dashboard" },
		A = { function() require("ascii").preview() end, "Preview ascii" },
		F = { function() vim.fn.system({ "open", "steam://run/427520//" }) end, "Start factorio through steam" },
		-- f = { function() vim.cmd("!/Users/olaisolsvik/Library/Application\\ Support/Steam/steamapps/common/Factorio/factorio.app/Contents/MacOS/factorio --mod-directory /Users/olaisolsvik/Projects/Code/factorio_mods > /dev/null 2>&1") end, "Start factorio with custom mods folder" }
		f = { function() vim.cmd("!/Applications/factorio.app/Contents/MacOS/factorio --mod-directory /Users/olaisolsvik/Projects/Code/factorio_mods > /dev/null 2>&1") end, "Start factorio with custom mods folder" }
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
	},
	n = {
		name = "Snippets",
		a = { function() require("scissors").addNewSnippet() end, "Add snippet" },
		e = { function() require("scissors").editSnippet() end, "Edit snippets"},
	},
}, { prefix = "<leader>", mode = "n" })

wk.register({
	n = {
		name = "Snippets",
		a = { function() require("scissors").addNewSnippet() end, "Add snippet" },
	},
}, { prefix = "<leader>", mode = "x" })

-- File
-- map({ "n", "i" }, "<C-s>", "<cmd>w<cr>", opts("Save file"))
-- map({ "n", "i" }, "<C-z>", "<cmd>undo<cr>", opts("Undo"))
-- map({ "n", "i" }, "<C-y>", "<cmd>redo<cr>", opts("Redo"))
-- map({ "n", "i" }, "<CS-z>", "<cmd>redo<cr>", opts("redo"))

-- Move.nvim
map({ "n", "i" }, "<CS-j>", ":MoveLine(1)<CR>", opts("Move line down"))
map({ "n", "i" }, "<CS-k>", ":MoveLine(-1)<CR>", opts("Move line up"))
-- map("n", "<A-h>", ":MoveHChar(-1)<CR>", opts("Move Char Left"))
-- map("n", "<A-l>", ":MoveHChar(1)<CR>", opts("Move char right"))
-- map("n", "<leader>wf", ":MoveWord(1)<CR>", opts("Move word right"))
-- map("n", "<leader>wb", ":MoveWord(-1)<CR>", opts("Move word left"))

map("v", "<CS-j>", ":MoveBlock(1)<CR>", opts("Move block down"))
map("v", "<CS-k>", ":MoveBlock(-1)<CR>", opts("Move block up"))
-- map("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts("Move block left"))
-- map("v", "<A-l>", ":MoveHBlock(1)<CR>", opts("Move block right"))

-- Buffers Barbar
map("n", "<C-c>", "<cmd>BufferClose<cr>", opts("Close buffer"))
map("n", "<C-p>", "<cmd>BufferPin<cr>", opts("Pin buffer"))
map("n", "<CS-p>", "<cmd>BufferPick<cr>", opts("Pick buffer"))
map("n", "<C-,>", "<cmd>BufferPrevious<cr>", opts("Go to previous buffer"))
map("n", "<C-.>", "<cmd>BufferNext<cr>", opts("Go to next buffer"))
map("n", "<CS-h>", "<cmd>BufferMovePrevious<cr>", opts("Move buffer right"))
map("n", "<CS-l>", "<cmd>BufferMoveNext<cr>", opts("Move buffer left"))
