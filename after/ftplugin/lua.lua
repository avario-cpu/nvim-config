vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

-- Keep expandtab false to use actual tabs
vim.bo.expandtab = false

-- -- Optional: Map Tab to move cursor by 2 spaces
-- vim.api.nvim_buf_set_keymap(0, "n", "<Tab>", "2l", { noremap = true, silent = true })
-- vim.api.nvim_buf_set_keymap(0, "v", "<Tab>", "2l", { noremap = true, silent = true })
