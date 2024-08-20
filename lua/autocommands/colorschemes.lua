vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "TroubleNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TroubleText", { bg = "NONE" })
  end,
})
