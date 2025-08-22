-- enable 24-bit colour
vim.opt.termguicolors = true

-- tabs and spaces
vim.opt.tabstop = 4        -- Number of spaces that a tab displays
vim.opt.shiftwidth = 4     -- Width of indentation when using >> and <<
vim.opt.expandtab = false  -- Replaces tab character with spaces
vim.opt.smartindent = true -- Automatically sets indentation in the right places

-- moving to a new line | wrap lines
vim.opt.wrap = true
vim.opt.showbreak = "" -- ">"
vim.opt.linebreak = true

-- relative line numbers
vim.opt.relativenumber = false
vim.opt.number = true

-- use treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99 -- Folding level to the maximum value

-- incremental search
vim.api.incsearch = true

-- spell checking with language setting
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "ru_yo" }

-- choose shell
vim.o.shell = "/usr/bin/fish"
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- make the search case insensitive
vim.opt.ignorecase = true

