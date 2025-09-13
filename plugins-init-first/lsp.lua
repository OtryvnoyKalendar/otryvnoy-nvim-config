local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lspconfig = require('lspconfig')

lspconfig.clangd.setup{
	on_attach = function(client, bufnr)
		-- Disable diagnostics only for this client
		client.handlers["textDocument/publishDiagnostics"] = function() end
	end,
}

lspconfig.cssls.setup {
    capabilities = capabilities
}

lspconfig.golangci_lint_ls.setup {}

lspconfig.rust_analyzer.setup {
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true,
				experimental = {
					enable = true,
				},
			},
		},
	},
}

lspconfig.ruff.setup({
	capabilities = capabilities,
})

