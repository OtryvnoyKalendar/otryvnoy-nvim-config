function is_unix_system()
	local path_separator = package.config:sub(1, 1)
	return not (path_separator == "\\")
end

-- function is_unix_system()
-- 	return not (os.getenv("HOME") == nil)
-- end

