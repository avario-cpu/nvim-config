-- Create a group for the yank highlight
local yank_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Delete temp shadas (from dashbroad plugins)
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local shada_path = vim.fn.expand("C:\\Users\\ville\\AppData\\Local\\nvim-data\\shada\\main.shada.tmp*")
		vim.fn.system("del /Q " .. shada_path)
	end,
})
