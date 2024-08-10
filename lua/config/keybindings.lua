-- Keybindings
local opts = { noremap = true, silent = true }


-- Open file explorer
vim.keymap.set('n', '<leader>E', ':Lexplore<CR>', opts)

-- Yank all to system clipboard
vim.keymap.set('n', '<leader>CA', 'ggVG"+y', opts)

-- Files
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>S', ':wa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Q', ':wq<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>%', ':source %<CR>', { noremap = true, silent = true })
