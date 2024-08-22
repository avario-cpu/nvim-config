return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    enabled = true,
    config = function()
      -- Basic CoC configuration
      vim.g.coc_global_extensions = { "coc-pyright" }

      -- Key mappings
      local keyset = vim.keymap.set
      keyset("n", "<leader>ca", "<Plug>(coc-codeaction)", { silent = true })
    end,
  },
}
