function FormatLuaProject()
	local handle = io.popen("fd -e lua")
	if not handle then
		print("Error: Unable to run 'fd' command")
		return
	end

	local result = handle:read("*a")
	handle:close()

	if not result then
		print("Error: No output from 'fd' command")
		return
	end

	local files = {}
	for file in result:gmatch("[^\r\n]+") do
		table.insert(files, file)
	end

	if #files == 0 then
		print("No Lua files found")
		return
	end

	for _, file in ipairs(files) do
		local success, err = pcall(function()
			vim.cmd("edit " .. vim.fn.fnameescape(file))
			vim.lsp.buf.format()
			vim.cmd("write")
			vim.cmd("bdelete")
		end)
		if not success then
			print("Error processing file: " .. file .. " - " .. tostring(err))
		end
	end

	print("Formatting complete!")
end

vim.api.nvim_create_user_command("FormatLuaProject", FormatLuaProject, {})
