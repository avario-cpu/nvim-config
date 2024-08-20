vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "TroubleNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TroubleText", { bg = "NONE" })

    vim.api.nvim_set_hl(0, "CustomSpectreSearch", {
      fg = "#FF5733", -- Bright orange-red
      bg = "#2C3E50", -- Dark blue-gray
      bold = true,
    })
    vim.api.nvim_set_hl(0, "CustomSpectreReplace", {
      fg = "#27AE60", -- Bright green
      bg = "#34495E", -- Darker blue-gray
      bold = true,
    })
  end,
})
