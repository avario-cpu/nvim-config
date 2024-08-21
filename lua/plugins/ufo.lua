return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  config = function()
    local ufo = require("ufo")

    vim.o.foldcolumn = "0"
    vim.o.foldlevel = 99 -- Using ufo provider need a large value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Using ufo provider need remap `zR` and `zM`
    vim.keymap.set("n", "zR", ufo.openAllFolds)
    vim.keymap.set("n", "zM", ufo.closeAllFolds)

    -- Set treesitter as the provider
    ufo.setup({
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    })
  end,
}
