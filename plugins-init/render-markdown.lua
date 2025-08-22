require('render-markdown').setup({
	-- render_modes = { 'n', 'c', 't' },
	render_modes = true,
    completions = { lsp = { enabled = true } },
    code = {
		sign = false,
		position = 'left',
        width = 'block',
        min_width = 40,
        border = 'thick',
    },
	heading = {
		sign = false,
		enabled = true,
        width = 'block',
		min_width = 30,
        left_pad = 1,
	},
})
