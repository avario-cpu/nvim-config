return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")

    -- Setup nvim-autopairs with optional configuration
    npairs.setup({
      check_ts = true, -- Enable treesitter integration if you use treesitter
      fast_wrap = {}, -- Fast wrap feature
    })

    -- Custom mapping for <Tab> to jump out of the pair
    vim.api.nvim_set_keymap(
      "i",
      "<Tab>",
      "v:lua.MPairs.tab()",
      { expr = true, noremap = true }
    )

    _G.MPairs = {}

    MPairs.tab = function()
      if vim.fn.pumvisible() ~= 0 then
        return npairs.esc("<C-n>")
      else
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]

        -- Check if the character to the right of the cursor is a closing pair
        if col < #line and line:sub(col + 1, col + 1):match("[%)%]%}]'\"]") then
          return npairs.esc("<Right>")
        else
          return npairs.esc("<Tab>")
        end
      end
    end
  end,
}
