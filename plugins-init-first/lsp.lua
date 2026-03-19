vim.lsp.config('rust_analyzer', {
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = false,
				experimental = {
					enable = false,
				},
			},
			cargo = { enable = false, allFeatures = false },
			procMacro = { enable = false },
		},
	},
})

vim.api.nvim_create_autocmd('LspAttach', {
group = vim.api.nvim_create_augroup('my.lsp', {}),
callback = function(args)
  local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

  -- Auto-format ("lint") on save.
  -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
  if not client:supports_method('textDocument/willSaveWaitUntil')
		and client:supports_method('textDocument/formatting')
  then
	 vim.api.nvim_create_autocmd('BufWritePre', {
		group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
		buffer = args.buf,
		callback = function()
		  vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000, async = false, })
		end,
	 })
  end
end,
})

vim.lsp.enable('rust_analyzer')

-- recognize *.ixx as a c++ file
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = "*.ixx",
	command = "set filetype=cpp"
})

vim.lsp.config['clnagd'] = {
	-- cmd = { "clangd", "--clang-tidy", "--background-index", "--offset-encoding=utf-8" },
	cmd = { "clangd" },
	filetypes = { 'cxx', "ixx", "c++", "cpp", "c", "h", "hpp" },
	root_markers = { ".clangd", "compile_commands.json", ".clang-format", "Makefile",
		"meson.build", "meson_options.txt", "CMakeLists.txt" },
	settings = {
	},
	capabilities = {
		textDocument = {
			false,
		}
	},
}
-- vim.lsp.enable('clnagd')

vim.lsp.enable('cssls')
vim.lsp.enable('golangci_lint_ls')
vim.lsp.enable('ruff')

