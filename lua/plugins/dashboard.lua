vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#ebab17" })
    -- vim.api.nvim_set_hl(0, "DashboardHeader", { link = "String" })
  end,
})

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  enabled = true,
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            desc = "󰊳 Update",
            group = "@property",
            action = "Lazy update",
            key = "u",
          },
          {
            icon = " ",
            icon_hl = "@variable",
            desc = "Navigate files",
            group = "Label",
            action = "Telescope find_files",
            key = "n",
          },
          {
            desc = " dotfiles",
            group = "Number",
            action = "Telescope dotfiles",
            key = "d",
          },
        },
        project = { enable = false },
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
