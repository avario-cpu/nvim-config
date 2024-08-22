return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      -- Basic CoC configuration
      vim.g.coc_global_extensions = { "coc-pyright" }

      -- Key mappings
      local keyset = vim.keymap.set
      -- keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
      -- keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
      -- keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
      -- keyset("n", "gr", "<Plug>(coc-references)", { silent = true })
      -- keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
      keyset("n", "<leader>ca", "<Plug>(coc-codeaction)", { silent = true })

      -- Use Tab for trigger completion with characters ahead and navigate
      local opts =
        { silent = true, noremap = true, expr = true, replace_keycodes = false }
      keyset(
        "i",
        "<TAB>",
        'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
        opts
      )
      keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

      -- Make <CR> auto-select the first completion item
      keyset(
        "i",
        "<cr>",
        [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
        opts
      )
    end,
  },
}
