function has_arg(arg)
  for _, v in ipairs(vim.v.argv) do
    if v == arg then
      return true
    end
  end
  return false
end

-- Disable the plugin if 'nn' argument is passed (to avoid the entry error messages disappearing annoyance)
local enable_noice = not has_arg("-nn") or has_arg("--nn")

return {
  {
    "folke/noice.nvim",
    -- version = "v4.4.7", -- Downgrade to version 4.4.7
    enabled = enable_noice,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      if enable_noice then
        require("noice").setup({
          -- Configuration for noice.nvim goes here
          notify = {
            enabled = true, -- Enable nvim-notify integration
          },
        })

        -- Set up nvim-notify as the default notification handler
        vim.notify = require("notify")

        -- Configure nvim-notify with transparency
        require("notify").setup({
          background_colour = "FloatShadow",
          -- background_colour = "#000000", -- Set transparency by using the terminal's background color
          -- fps = 144,
          stages = "static",
        })
      end
    end,
  },
}
