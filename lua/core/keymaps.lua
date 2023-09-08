local map = vim.keymap.set

local function opts(description)
	return { desc = description, noremap = true, silent = true }
end

vim.g.mapleader = " "

map("n", "<leader>qa", "<cmd>wqa!<cr>", opts("Save and quit all open files"))

map("n", "<leader>pv", "<cmd>NvimTreeFocus<cr>", opts("Focus Nvim Tree"))
map("n", "<leader>pt", "<cmd>NvimTreeToggle<cr>", opts("Toggle Nvim Tree"))

map('n','<leader>lp', function() require("knap").process_once() end, opts("Process LaTeX"))
map('n','<leader>lc', function() require("knap").close_viewer() end, opts("Close LaTeX Viewer"))
map('n','<leader>la', function() require("knap").toggle_autopreviewing() end, opts("Toggle LaTeX Auto Preview"))
map('n','<leader>lf', function() require("knap").forward_jump() end, opts("LaTeX Forward Jump"))
