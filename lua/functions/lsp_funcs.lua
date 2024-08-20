local M = {}
function M.lsp_references()
  local telescope_opts = {
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "bottom",
      width = 0.8,
      height = 0.9,
    },
    sorting_strategy = "ascending",
    ignore_filename = false,
    initial_mode = "normal",
    path_display = { "smart" },
  }
  require("telescope.builtin").lsp_references(telescope_opts)
end

return M
