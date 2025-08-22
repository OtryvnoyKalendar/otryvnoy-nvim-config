local opts = {noremap = true, silent = true }

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- shortcut to switch to normal mode
vim.api.nvim_set_keymap("i", "jj", "<esc>", opts)
vim.api.nvim_set_keymap("i", "jk", "<esc>", opts)

-- semicolon and other
-- this mappings use p register
vim.keymap.set("n", "<leader>;", "mpA;<esc>`p")
vim.keymap.set("n", "<leader>:", "mpA:<esc>`p")
vim.keymap.set("n", "<leader>{", "mpA {}<esc>`p")
vim.keymap.set("n", "<leader><tab>", "mpI	<esc>`p")

-- copying to the clipboard
vim.opt.clipboard = "unnamedplus"

-- navigating through the displayed (moved) rows
vim.api.nvim_set_keymap('n', 'j', 'gj', opts)
vim.api.nvim_set_keymap('n', 'k', 'gk', opts)
vim.api.nvim_set_keymap('n', '$', 'g$', opts)
vim.api.nvim_set_keymap('n', '0', 'g0', opts)

-- change buffers
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)

-- leave terminal
vim.api.nvim_set_keymap('t', '<C-x>', '<C-\\><C-n>', opts)

vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)

-- resize buffers with arrows
vim.api.nvim_set_keymap('n', '<C-Up>', '<cmd>resize +2<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Down>', '<cmd>resize -2<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Left>', '<cmd>vertical resize +2<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Right>', '<cmd>vertical resize -2<CR>', opts)

vim.api.nvim_set_keymap('t', '<C-Up>', '<C-\\><C-n><cmd>resize +2<CR>', opts)
vim.api.nvim_set_keymap('t', '<C-Down>', '<C-\\><C-n><cmd>resize -2<CR>', opts)
vim.api.nvim_set_keymap('t', '<C-Left>', '<C-\\><C-n><cmd>vertical resize +2<CR>', opts)
vim.api.nvim_set_keymap('t', '<C-Right>', '<C-\\><C-n><cmd>vertical resize -2<CR>', opts)

-- close all
vim.api.nvim_set_keymap("n", "<leader>q", '<cmd>qa<CR>', opts)

-- no highlight
vim.api.nvim_set_keymap("n", "<leader>n", '<cmd>noh<CR>', opts)

