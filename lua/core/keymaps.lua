local map = vim.keymap.set

local function opts(description)
	return { desc = description, noremap = true, silent = true }
end

-- local ls = require("luasnip")

-- vim.g.mapleader = " "

map("n", "<leader>qa", "<cmd>wqa!<cr>", opts("Save and quit all open files"))

local wk = require("which-key")
wk.register({
	e = {
		name = "Nvim Tree",
		f = { "<cmd>NvimTreeFocus<cr>", "Focus Nvim Tree" },
		e = { "<cmd>NvimTreeToggle<cr>", "Toggle Nvim Tree" },
	},
	t = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find files in cwd" },
		r = { "<cmd>Telescope oldfiles<cr>", "Find recent files" },
		s = { "<cmd>Telescope live_grep<cr>", "Find string in cwd" },
		c = { "<cmd>Telescope grep_string<cr>", "Find string under cursor in cwd" },
	},
	q = {
		name = "File",
		q = { "<cmd>wqa!<cr>", "Save and quit all" },
		e = { "<cmd>qa!<cr>", "Exit neovim without saving" },
		s = { "<cmd>w<cr>", "Save file" },
	},
	m = {
		name = "Misc",
		l = { "<cmd>Lazy<cr>", "Open lazy" },
		m = { "<cmd>Mason<cr>", "Open mason" },
	},
	-- k = {
	-- 	name = "Knap LaTeX",
	-- 	p = { function() require("knap").process_once() end, "Process LaTeX" },
	-- 	c = { function() require("knap").close_viewer() end, "Close LaTeX viewer" },
	-- 	a = { function() require("knap").toggle_autopreviewing() end, "Toggle LaTeX auto previewing" },
	-- 	f = { function() require("knap").forward_jump() end, "LaTeX forward fump" }
	-- },
	c = {
		name = "Cellular Automaton",
		r = { "<cmd>CellularAutomaton make_it_rain<cr>", "Make it rain" },
		l = { "<cmd>CellularAutomaton game_of_life<cr>", "Game of life" },
	},
	-- s = {
	-- 	name = "Snippets",
	-- 	f = { function() ls.jump(1) end, "Jump forward in snippet" },
	-- 	b = { function() ls.jump(-1) end, "Jump backward in snippet" },
	-- 	c = { function() if ls.choice_active then ls.change_active_choice(1) end end, "Change active choice" }
	-- }
}, { prefix = "<leader>" })

-- File
map({ "n", "i" }, "<C-s>", "<cmd>w<cr>", opts("Save file"))
map({ "n", "i" }, "<C-z>", "<cmd>undo<cr>", opts("Undo"))
map({ "n", "i" }, "<C-y>", "<cmd>redo<cr>", opts("Redo"))
map({ "n", "i" }, "<CS-z>", "<cmd>redo<cr>", opts("redo"))

-- -- Luasnip
-- map("i", "<Tab>", function()
-- 	if ls.expand_or_jumpable()
-- 		then
-- 			ls.expand_or_jump()
-- 		else
-- 			local key = vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
-- 			vim.api.nvim_feedkeys(key, "n", false)
-- 		end
-- 	end, opts("Expand or jump forward snippet"))
--
-- -- map({ "i", "s" }, "<Tab>", function() ls.jump(1) end, opts("Jump forward in snippet"))
-- map({ "i", "s" }, "<S-Tab>", function() ls.jump(-1) end, opts("Jump backward in snippet"))
-- -- map({ "i", "s" }, "<leader>sc", function() if ls.choice_active() then ls.change_active_choice(1) end end, opts("Change active choice"))

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
-- map('n','<leader>lp', function() require("knap").process_once() end, opts("Process LaTeX"))
-- map('n','<leader>lc', function() require("knap").close_viewer() end, opts("Close LaTeX Viewer"))
-- map('n','<leader>la', function() require("knap").toggle_autopreviewing() end, opts("Toggle LaTeX Auto Preview"))
-- map('n','<leader>lf', function() require("knap").forward_jump() end, opts("LaTeX Forward Jump"))
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
