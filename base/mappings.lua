-- SETTINGS
-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- copying to the clipboard
vim.opt.clipboard = "unnamedplus"


-- SHORTCUTS
local opts = { noremap = true, silent = true }
-- shortcut to switch to normal mode
vim.keymap.set("i", "jj", "<esc>", { desc = "Switch to normal mode" })
vim.keymap.set("i", "jk", "<esc>", { desc = "Switch to normal mode" })

-- semicolon and other
-- this mappings use p register
vim.keymap.set("n", "<leader>;", "mpA;<esc>`p", { desc = "Put ; at the end" })
vim.keymap.set("n", "<leader>:", "mpA:<esc>`p", { desc = "Put : at the end" })
vim.keymap.set("n", "<leader>,", "mpA,<esc>`p", { desc = "Put , at the end" })
vim.keymap.set("n", "<leader>{", "mpA {}<esc>`p", { desc = "Put {} at the end" })
vim.keymap.set("n", "<leader><tab>", "mpI	<esc>`p", { desc = "Put <tab> at the beginning" })

-- navigating through the displayed (moved) rows
vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', 'k', 'gk', opts)
vim.keymap.set('n', '$', 'g$', opts)
vim.keymap.set('n', '0', 'g0', opts)

-- change buffers
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = "Go to the bottom buffer" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = "Go to the top buffer" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = "Go to the right buffer" })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = "Go to the left buffer" })
-- in terminal mode:
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)

-- leave terminal
vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { desc = "Leave terminal" })

-- resize buffers with arrows
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = "Resize buffer to up" })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = "Resize buffer to down" })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize +2<CR>', { desc = "Resize buffer to left" })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize -2<CR>', { desc = "Resize buffer to right" })
-- in terminal mode:
vim.keymap.set('t', '<C-Up>', '<C-\\><C-n><cmd>resize +2<CR>', opts)
vim.keymap.set('t', '<C-Down>', '<C-\\><C-n><cmd>resize -2<CR>', opts)
vim.keymap.set('t', '<C-Left>', '<C-\\><C-n><cmd>vertical resize +2<CR>', opts)
vim.keymap.set('t', '<C-Right>', '<C-\\><C-n><cmd>vertical resize -2<CR>', opts)

-- close all
vim.keymap.set("n", "<leader>q", '<cmd>qa<CR>', { desc = "Close all" })

-- no highlight
vim.keymap.set("n", "<leader>n", '<cmd>noh<CR>', { desc = "No highlight" })

-- hints
vim.keymap.set("n", "<leader>r", vim.diagnostic.open_float, { desc = "Open float diagnostics" })

