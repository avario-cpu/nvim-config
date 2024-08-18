return {
  "loctvl842/monokai-pro.nvim",
  enable = true,
  config = function()
    require("monokai-pro").setup({
      filter = "octagon",
    })
    -- vim.cmd("colorscheme monokai-pro")
    --
    -- 		vim.cmd([[
    --   highlight Normal ctermbg=none guibg=none
    --   highlight NonText ctermbg=none guibg=none
    --   highlight LineNr ctermbg=none guibg=none
    --   highlight Folded ctermbg=none guibg=none
    --   highlight EndOfBuffer ctermbg=none guibg=none
    --   highlight StatusLineNC ctermbg=none guibg=none
    -- ]])
  end,
}
