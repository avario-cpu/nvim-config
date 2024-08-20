-- File: lua/plugins/telescope.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- Additional options can go here if needed
            }),
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      telescope.load_extension("ui-select")
      telescope.load_extension("notify")
      telescope.load_extension("fzf")

      -- Keybindings
      local builtin = require("telescope.builtin")
      local opts = { noremap = true, silent = true }

      vim.keymap.set("n", "<leader>fd", builtin.find_files, opts)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
      vim.keymap.set("n", "<leader>fs", builtin.lsp_workspace_symbols, opts)
      vim.keymap.set("n", "<leader>fa", builtin.lsp_document_symbols, opts)
      vim.keymap.set("n", "<leader>fi", function()
        builtin.find_files({ hidden = true, no_ignore = true })
      end, opts)
      vim.keymap.set("n", "<leader>fn", ":Telescope noice<CR>", opts)
      vim.keymap.set("n", "<leader>fh", builtin.command_history, opts)
    end,
  },
}
