-- set lua files path
local stdpath = vim.fn.stdpath("config")
package.path = stdpath .. "/?.lua;" .. package.path

require("getos")

local function load_modules_from_path(path)
	local files = vim.fn.readdir(stdpath .. "/" .. path .. "/")
	for _, file in ipairs(files) do
		local name = file:gsub("%.lua$", "")
		require(path .. "." .. name)
	end
end

-- base neovim settings
load_modules_from_path("base")

-- install lazy 
require("lazy.plugins")

-- preinit
load_modules_from_path("plugins-init-first")

-- init plugins
load_modules_from_path("plugins-init-sys-all")
if is_unix_system() then
	load_modules_from_path("plugins-init-sys-unix")
end

-- plugin mappings
load_modules_from_path("plugins-init-after")

