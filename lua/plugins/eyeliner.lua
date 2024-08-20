return {
  "jinh0/eyeliner.nvim",
  enabled = false,
  config = function()
    require("eyeliner").setup({
      highlight_on_key = true, -- this must be set to true for dimming to work!
      dim = true,
    })
  end,
}
