local map = vim.keymap.set

local function opts(description)
    return { desc = description, noremap = true, silent = true }
end

vim.g.mapleader = " "

map("n", "<leader>qa", "<cmd>wqa!<cr>", opts("Save and quit all open files"))