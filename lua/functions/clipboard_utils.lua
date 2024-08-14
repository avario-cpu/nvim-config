local M = {}

function M.copy_file_to_system_register()
	vim.cmd('normal! ggVG"my')
	local current_clipboard = vim.fn.getreg("+")
	local m_register = vim.fn.getreg("m")
	vim.fn.setreg("+", current_clipboard .. m_register)
end

function M.append_unnamed_to_system_register()
	-- Get the contents of the unnamed register
	local unnamed_register = vim.fn.getreg('"')
	-- Get the current contents of the system clipboard
	local system_register = vim.fn.getreg("+")
	-- Concatenate the contents of both registers
	local new_register_content = system_register .. unnamed_register
	-- Set the concatenated result back to the system clipboard
	vim.fn.setreg("+", new_register_content)
end

function M.prompt_and_swap_register()
	local register = vim.fn.input("Register: ")
	M.swap_register_with_clipboard(register)
end

return M
