-- set lua files path
local stdpath = vim.fn.stdpath("config")
package.path = stdpath .. "/?.lua;" .. package.path

-- base neovim settings
require('base.mappings')
require('base.theme')

-- install lazy 
require("lazy.plugins")

-- preinit
require('plugins-preinit.web-devicons')
require('plugins-preinit.treesitter')
require('plugins-preinit.lsp')
require('plugins-preinit.cmp-and-spell')

-- init plugins
local files = vim.fn.readdir(stdpath .. "/plugins-init/")
for _, file in ipairs(files) do
	local name = file:gsub("%.lua$", "")
	require("plugins-init." .. name)
end

-- plugin mappings
require("plugins-postinit.plugin-colorscheme")
require("plugins-postinit.plugin-keys")

