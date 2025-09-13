require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"lua", "go", "javascript", "rust", "markdown",
		"c", "cpp", "bash", "cmake"
	},

	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
}

