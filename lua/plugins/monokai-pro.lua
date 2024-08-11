return {

  "loctvl842/monokai-pro.nvim",
  config = function()
    require("monokai-pro").setup({
      -- Add your customization options here
    })
    vim.cmd("colorscheme monokai-pro") -- Apply the theme
  end,
}
