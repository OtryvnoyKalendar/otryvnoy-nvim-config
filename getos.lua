function is_unix_system()
	local handle = io.popen("uname")
	local result = handle:read("*a")
	handle:close()
	if result == nil or result == "" then
		return false
	else
		return true
	end
end
