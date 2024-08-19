-- Enter named buffer Autocommand
local inital_nnp_resize_executed = false
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if inital_nnp_resize_executed then
      return
    end
    vim.defer_fn(function()
      local filetype = vim.bo.filetype
      local bufname = vim.fn.bufname()
      if
        bufname ~= ""
        and filetype ~= "dashboard"
        and filetype ~= "TelescopePrompt"
        and filetype ~= "neo-tree"
      then
        vim.defer_fn(function()
          vim.cmd("NoNeckPainResize 120")
          print("NoNeckPainResize auto set to 120 ")
          inital_nnp_resize_executed = true
        end, 50)
      end
    end, 50)
  end,
})

local function react_to_unsaved_quit()
  local nnp_funcs = require("functions.no_neck_pain_funcs")
  local modified_buffers = vim.tbl_filter(function(bufnr)
    return vim.api.nvim_buf_get_option(bufnr, "modified")
  end, vim.api.nvim_list_bufs())

  if #modified_buffers > 0 then
    print("auto-refreshed nnp")
    vim.defer_fn(function()
      nnp_funcs.refresh_no_neck_pain()
    end, 50)
  end
end

vim.api.nvim_create_autocmd("QuitPre", {
  group = vim.api.nvim_create_augroup("UnsavedQuitNNP", { clear = true }),
  callback = function()
    if vim.v.dying then
      react_to_unsaved_quit()
    end
  end,
})
