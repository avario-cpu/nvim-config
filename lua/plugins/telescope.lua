return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local ok, telescope = pcall(require, 'telescope.builtin')
      if not ok then
        return
      end
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>f', telescope.find_files, opts)
      vim.keymap.set('n', '<leader>g', telescope.live_grep, opts)
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
}
