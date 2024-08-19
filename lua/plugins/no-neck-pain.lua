return {
  {
    "shortcuts/no-neck-pain.nvim",
    branch = "feat/winlayout",
    enabled = true,
    config = function()
      require("no-neck-pain").setup({
        autocmds = {
          enableOnVimEnter = true,
        },
      })
    end,
  },
}
