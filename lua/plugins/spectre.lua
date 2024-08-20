return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("spectre").setup({
      highlight = {
        ui = "String",
        search = "CustomSpectreSearch", -- defined in colorscheme autocmd file
        replace = "CustomSpectreReplace",
      },
      mapping = {

        ["send_to_qf"] = {
          map = "<leader>sq",
          cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
          desc = "send all items to quickfix",
        },
      },
    })
  end,

  vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre",
  }),
  vim.keymap.set(
    "n",
    "<leader>sw",
    '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
    {
      desc = "Search current word",
    }
  ),
  vim.keymap.set(
    "v",
    "<leader>sw",
    '<esc><cmd>lua require("spectre").open_visual()<CR>',
    {
      desc = "Search current word",
    }
  ),
  vim.keymap.set(
    "n",
    "<leader>sp",
    '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
    {
      desc = "Search on current file",
    }
  ),
}
