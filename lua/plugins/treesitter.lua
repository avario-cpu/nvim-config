-- vim.g.treesitter_parser_install_debug = true

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
      -- require("nvim-treesitter.install").compilers = { "gcc" }
      -- require("nvim-treesitter.install").prefer_git = false
      require("nvim-treesitter.configs").setup({

        ensure_installed = { "python", "lua" }, -- specify the parsers you want to install
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
    end,
  },
}
