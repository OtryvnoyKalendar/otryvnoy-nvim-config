vim.lsp.config('rust_analyzer', {
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true,
				experimental = {
					enable = true,
				},
			},
			cargo = { allFeatures = true },
			procMacro = { enable = true },
		},
	},
})

vim.lsp.enable('rust_analyzer')


-- recognize *.ixx as a c++ file
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = "*.ixx",
	command = "set filetype=cpp"
})

vim.lsp.config['clnagd'] = {
	cmd = { "clangd", "--clang-tidy", "--background-index", "--offset-encoding=utf-8" },
	filetypes = { 'cxx', "ixx", "c++", "cpp", "c", "h", "hpp" },
	root_markers = { ".clangd", "compile_commands.json", ".clang-format", "Makefile",
		"meson.build", "meson_options.txt", "CMakeLists.txt" },
	settings = {},
}
vim.lsp.enable('clnagd')

vim.lsp.enable('cssls')
vim.lsp.enable('golangci_lint_ls')
vim.lsp.enable('ruff')

