return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua.with({
            extra_args = {
              "--indent-type",
              "Spaces",
              "--indent-width",
              "2",
              "--column-width",
              "88", -- Adjust this value as needed
            },
          }),
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
        },
        autostart = true,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.lua",
        callback = function()
          vim.lsp.buf.format({ name = "null-ls" })
        end,
      })
    end,
  },
}
