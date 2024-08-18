local function print_setting(setting)
  local value = vim.api.nvim_get_option(setting)
  print(setting .. " = " .. tostring(value))
end

print("Current Vim settings:")
print_setting("expandtab")
print_setting("tabstop")
print_setting("softtabstop")
print_setting("shiftwidth")

print("\nCurrent buffer settings:")
print_setting("fileformat")
print_setting("filetype")

print("\nTo see hidden characters:")
print("Run :set list in command mode")
