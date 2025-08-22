local opts = { noremap = true, silent = true }

-- focus nvim-tree
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', opts)

-- cd for nvim-tree
local nvim_tree_api = require('nvim-tree.api')

vim.api.nvim_create_autocmd("DirChanged", {
	callback = function()
		nvim_tree_api.tree.change_root(vim.loop.cwd())
	end,
})

-- toggle term
vim.o.splitright = true
vim.o.splitbelow = true

local function create_horizontal_terminal()
	local dir = vim.fn.expand('%:p:h')
	vim.cmd('split')
	vim.cmd('lcd ' .. dir)
	vim.cmd('terminal')
	vim.cmd('resize -6')
	vim.cmd('startinsert')
end

vim.keymap.set('n', '<leader>h', create_horizontal_terminal, opts)
vim.keymap.set("n", "<leader>v", "<cmd>ToggleTerm dir=%:p:h direction=vertical size=30<CR>", opts)

-- move code
-- Normal-mode commands
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
-- vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts) -- doesn't work
-- vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
-- vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
-- vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

-- markdown preview in browser
vim.keymap.set('n', '<leader>m', '<cmd>MarkdownPreview<CR>', opts)
-- vim.keymap.set('n', '<leader>m', '<cmd>MarkdownPreviewStop<CR>', opts)
-- vim.keymap.set('n', '<leader>m', '<cmd>MarkdownPreviewToggle<CR>', opts)

-- telescope mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
vim.keymap.set('n', 'gr', builtin.lsp_references,
               {noremap = true, silent = true})
vim.keymap.set('n', 'gd', builtin.lsp_definitions,
               {noremap = true, silent = true})

-- 1. <leader>f
-- all telescope mappings
--
-- 2. h / s / b / l
-- search in the $HOME directory / search starting from "/" directory
-- / search in open buffers / search in an open local directory
--
-- 3. f / d / t / a
-- file name / directory name / text / all

-- text 
vim.api.nvim_set_keymap('n', '<leader>fht',
[[<cmd>lua require('telescope.builtin').live_grep({ search_dirs = { os.getenv("HOME") } })<cr>]],
opts)

vim.api.nvim_set_keymap('n', '<leader>flt',
[[<cmd>lua require('telescope.builtin').live_grep({ search_dirs = { os.getenv("PWD") } })<cr>]],
opts)

vim.api.nvim_set_keymap('n', '<leader>fst',
[[<cmd>lua require('telescope.builtin').live_grep({ search_dirs = { "/" } })<cr>]],
opts)

-- files
vim.api.nvim_set_keymap('n', '<leader>fhf',
[[<cmd>lua require('telescope.builtin').find_files({ search_dirs = { os.getenv("HOME") } })<CR>]],
opts)

vim.api.nvim_set_keymap('n', '<leader>flf',
[[<cmd>lua require('telescope.builtin').find_files({ search_dirs = { os.getenv("PWD") } })<CR>]],
opts)

vim.api.nvim_set_keymap('n', '<leader>fsf',
[[<cmd>lua require('telescope.builtin').find_files({ search_dirs = { "/" } })<CR>]],
opts)

-- directories
vim.api.nvim_set_keymap('n', '<leader>fhd',
[[<cmd>lua require('telescope.builtin').find_directories({ search_dirs = { os.getenv("HOME") } })<CR>]],
opts)

vim.api.nvim_set_keymap('n', '<leader>flf',
[[<cmd>lua require('telescope.builtin').find_files({ search_dirs = { os.getenv("PWD") } })<CR>]],
opts)

vim.api.nvim_set_keymap('n', '<leader>fsf',
[[<cmd>lua require('telescope.builtin').find_files({ search_dirs = { "/" } })<CR>]],
opts)

-- vim.api.nvim_set_keymap('n', '<leader>fhf',
-- [[<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand("$HOME") })<CR>]],
-- opts)

-- comment toggle
vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>CommentToggle<CR>', opts)

