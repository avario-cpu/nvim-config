local M = {}

function M.toggle_no_neck_pain()
	vim.cmd("NoNeckPain")
end

function M.refresh_no_neck_pain()
	pcall(function()
		require("no-neck-pain").disable()
		require("no-neck-pain").enable()
		require("no-neck-pain").resize(120)
	end)
end

return M
