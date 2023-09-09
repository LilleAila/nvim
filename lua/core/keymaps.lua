local map = vim.keymap.set

local function opts(description)
	return { desc = description, noremap = true, silent = true }
end

vim.g.mapleader = " "

map("n", "<leader>qa", "<cmd>wqa!<cr>", opts("Save and quit all open files"))

-- local wk = require("which-key")
-- wk.register({
-- 	t = {
-- 		name = "Nvim Tree",
-- 		f = { "<cmd>NvimTreeFocus<cr>", "Focus Nvim Tree" },
-- 		t = { "<cmd>NvimTreeToggle<cr>", "Toggle Nvim Tree" },
-- 	},
-- }, { prefix = "<leader>" })

-- NvimTree
map("n", "<leader>tf", "<cmd>NvimTreeFocus<cr>", opts("Focus Nvim Tree"))
map("n", "<leader>tt", "<cmd>NvimTreeToggle<cr>", opts("Toggle Nvim Tree"))

-- Knap LaTeX
map('n','<leader>lp', function() require("knap").process_once() end, opts("Process LaTeX"))
map('n','<leader>lc', function() require("knap").close_viewer() end, opts("Close LaTeX Viewer"))
map('n','<leader>la', function() require("knap").toggle_autopreviewing() end, opts("Toggle LaTeX Auto Preview"))
map('n','<leader>lf', function() require("knap").forward_jump() end, opts("LaTeX Forward Jump"))

-- Cellular Automaton
map("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<cr>")
map("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<cr>")

-- Buffers Barbar
map("n", "<A-c>", "<cmd>BufferClose<cr>", opts("Close buffer"))
map("n", "<A-p>", "<cmd>BufferPin<cr>", opts("Pin buffer"))
map("n", "<C-p>", "<cmd>BufferPick<cr>", opts("Pick buffer"))
map("n", "<A-,>", "<cmd>BufferPrevious<cr>", opts("Go to previous buffer"))
map("n", "<A-.>", "<cmd>BufferNext<cr>", opts("Go to next buffer"))
map("n", "<C-,>", "<cmd>BufferMovePrevious<cr>", opts("Move buffer right"))
map("n", "<C-.>", "<cmd>BufferMoveNext<cr>", opts("Move buffer left"))
