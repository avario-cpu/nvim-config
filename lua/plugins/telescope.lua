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
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

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

      -- Custom function to select directory and grep
      local function dir_select_and_grep()
        builtin.find_files({
          prompt_title = "Select Directory to Grep",
          find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" },
          attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              builtin.live_grep({ search_dirs = { selection.value } })
            end)
            return true
          end,
        })
      end

      -- Custom function to select file and grep
      local function file_select_and_grep()
        builtin.find_files({
          prompt_title = "Select File to Grep",
          attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              builtin.live_grep({ search_dirs = { selection.value } })
            end)
            return true
          end,
        })
      end

      -- Keybindings
      local opts = { noremap = true, silent = true }
      local map = vim.keymap.set
      map("n", "<leader>sf", builtin.find_files, opts)
      map("n", "<leader>ssa", builtin.lsp_workspace_symbols, opts)
      map("n", "<leader>ssf", builtin.lsp_document_symbols, opts)
      map("n", "<leader>si", function()
        builtin.find_files({ hidden = true, no_ignore = true })
      end, opts)
      map("n", "<leader>sn", ":Telescope noice<CR>", opts)
      map("n", "<leader>sh", builtin.command_history, opts)
      -- Grepping
      map("n", "<leader>sga", builtin.live_grep, opts)
      map("n", "<leader>sgd", dir_select_and_grep, opts)
      map("n", "<leader>sgf", file_select_and_grep, opts)
    end,
  },
}
