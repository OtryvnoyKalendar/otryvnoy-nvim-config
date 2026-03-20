-- vim.log.levels: ERROR = 4, WARN = 3, INFO = 2, DEBUG = 1, TRACE = 0
-- We only show ERROR (4) and WARN (3), we ignore everything else.
require("notify").setup({
	level = 3,
})
