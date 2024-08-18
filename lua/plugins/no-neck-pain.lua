return {
  {
    "shortcuts/no-neck-pain.nvim",
    branch = "feat/winlayout",
    config = function()
      require("no-neck-pain").setup({
        autocmds = {
          enableOnVimEnter = true,
        },
      })
    end,
  },
}
