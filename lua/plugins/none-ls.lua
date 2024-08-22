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
          -- null_ls.builtins.formatting.isort,
          -- null_ls.builtins.formatting.black,
          -- null_ls.builtins.diagnostics.mypy,
          -- null_ls.builtins.diagnostics.flake8,
          -- null_ls.builtins.diagnostics.pylint,
        },
        autostart = true,
      })
    end,
  },
}
