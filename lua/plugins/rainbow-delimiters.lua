return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "BufReadPost",
  config = function()
    -- Slightly brighter green
    vim.api.nvim_set_hl(0, "RainbowDelimiterEnhancedGreen", { fg = "#739c84" })

    require("rainbow-delimiters.setup").setup({
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        -- "RainbowDelimiterGreen",
        "RainbowDelimiterEnhancedGreen", -- Our slightly brighter green
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    })
  end,
}
