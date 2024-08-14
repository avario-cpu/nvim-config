local M = {}

function M.toggle_no_neck_pain()
    vim.cmd("NoNeckPain")
end


function M.refresh_no_neck_pain()
	-- Send 'gg' to go to the top of the file
	-- vim.api.nvim_feedkeys("gg", "n", true)
		require("no-neck-pain").disable()
		require("no-neck-pain").enable()
		require("no-neck-pain").resize(120)
		-- Send '``' to jump back to the previous cursor position
		-- vim.api.nvim_feedkeys("``", "n", true)
end

return M
