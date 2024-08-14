vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Path for Windows
    local shada_path = vim.fn.expand("C:\\Users\\ville\\AppData\\Local\\nvim-data\\shada\\main.shada.tmp*")
    vim.fn.system("del /Q " .. shada_path)
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- Get the current buffer's filetype
    vim.defer_fn(function()
      local filetype = vim.bo.filetype
      -- Get the buffer name
      local bufname = vim.fn.bufname()

      -- Check for dashboard having a name and not being Telescope or Dashboard
      if
          bufname ~= ""
          and filetype ~= "dashboard"
          and not bufname:match("dashboard")
          and filetype ~= "TelescopePrompt"
          and filetype ~= "neo-tree"
      then
        -- Set the width using the NoNeckPainResize command
        vim.defer_fn(function()
          vim.cmd("NoNeckPainResize 120")

          -- Print a message when entering the buffer
          print("NoNeckPainResize set 120 (auto)")
        end, 50)
      end
    end, 50)
  end,
  once = true,
})

-- Create a group for the yank highlight autocmd
local yank_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

-- Create the autocmd within the YankHighlight group
vim.api.nvim_create_autocmd("TextYankPost", {
  group = yank_group, -- Use the variable 'yank_group' instead of a string
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
