local M = {}

function M.append_to_clipboard()
  vim.cmd('normal! ggVG"my')
  local current_clipboard = vim.fn.getreg("+")
  local m_register = vim.fn.getreg("m")
  vim.fn.setreg("+", current_clipboard .. m_register)
end

function M.swap_register_with_clipboard(register)
  local reg_content = vim.fn.getreg(register)
  local clipboard_content = vim.fn.getreg("+")
  vim.fn.setreg(register, clipboard_content)
  vim.fn.setreg("+", reg_content)
end

function M.prompt_and_swap_register()
  local register = vim.fn.input("Register: ")
  M.swap_register_with_clipboard(register)
end

return M
