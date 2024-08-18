-- Enter named buffer Autocommand
local no_neck_pain_executed = false
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if no_neck_pain_executed then
			return
		end
		vim.defer_fn(function()
			local filetype = vim.bo.filetype
			local bufname = vim.fn.bufname()
			if
				bufname ~= ""
				and filetype ~= "dashboard"
				and not bufname:match("dashboard")
				and filetype ~= "TelescopePrompt"
				and filetype ~= "neo-tree"
			then
				vim.defer_fn(function()
					vim.cmd("NoNeckPainResize 120")
					print("NoNeckPainResize set 120 (auto)")
					no_neck_pain_executed = true
				end, 50)
			end
		end, 50)
	end,
})

-- CheckUnsavedChanges autocmd
local group = vim.api.nvim_create_augroup("CheckUnsavedChanges", { clear = true })
-- Autocommand to check for unsaved changes before quitting or leaving a buffer
vim.api.nvim_create_autocmd({ "QuitPre", "BufLeave" }, {
	group = group,
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		if vim.api.nvim_buf_get_option(bufnr, "modified") then
			-- if vim.bo.modified then
			-- print("Buffer has unsaved changes!")
		end
	end,
})
