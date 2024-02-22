local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- buffer navigation
keymap("n", "<Leader>b", ":buffers<CR>:buffer<Space>", opts)

-- netrw
keymap("n", "<Leader>e", ":Explore<CR>", opts)
keymap("n", "<Leader>t", ":!", opts)

-- window navigations
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- insert
keymap("i", "]]", "<ESC>", opts)
