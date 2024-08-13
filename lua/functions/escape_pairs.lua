local M = {}

function M.EscapePair()
	local closers = { ")", "]", "}", ">", "'", '"', "`", "," }
  print("EscapePair function called!")
	local line = vim.api.nvim_get_current_line()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local after = line:sub(col + 1, -1)

	-- Initialize with a large value
	local closer_col = #after + 1
	local closer_i = nil

	for _, closer in ipairs(closers) do
		local cur_index = after:find(closer, 1, true)
		if cur_index and cur_index < closer_col then
			closer_col = cur_index
			closer_i = closer
		end
	end

	if closer_i then
		vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
	else
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
	end
end

return M
