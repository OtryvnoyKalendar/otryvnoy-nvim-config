local highlight = {
	"RainbowDarkGrey1",
	-- "RainbowDarkGrey2",
	-- "RainbowDarkGrey3",
}

local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowDarkGrey1", { fg = "#404040" })
	vim.api.nvim_set_hl(0, "RainbowDarkGrey2", { fg = "#4d4d4d" })
	vim.api.nvim_set_hl(0, "RainbowDarkGrey3", { fg = "#515251" })
end)

require("ibl").setup {
	indent = { highlight = highlight },
	scope = {
		enabled = true,
		show_start = false,
	},
}

