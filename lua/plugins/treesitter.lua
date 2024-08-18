return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "cpp", "python", "lua", "javascript" }, -- specify the parsers you want to install
        highlight = {
          enable = true,                                              -- `false` will disable the whole extension
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          colors = {
            "#EBBCBA",     -- Rose
            "#F6C177",     -- Gold
            "#31748F",     -- Moss
            "#9CCFD8",     -- Pine
            "#C4A7E7",     -- Iris
            "#9CCFD8",     -- Foam
            "#E1A0C1",     -- Love
          },
          -- termcolors = {} -- table of colour name strings
        },
      })
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
    after = "nvim-treesitter", -- Ensure this runs after nvim-treesitter
  },
}
