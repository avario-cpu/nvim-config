-- Load required modules
local telescope = require("telescope.builtin")
local opts = { noremap = true, silent = true }

-- File Operations
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)  -- Save file
vim.keymap.set("n", "<leader>S", ":wa<CR>", opts) -- Save all files
vim.keymap.set("n", "<leader>q", ":q<CR>", opts)  -- Quit window
vim.keymap.set("n", "<leader>Q", ":wq<CR>", opts) -- Save and quit

-- File Explorer
vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal filesystem left<CR>", opts) -- Toggle NeoTree

-- Clipboard Operations
vim.keymap.set("n", "<leader>CA", 'ggVG"+y', opts) -- Yank all to system clipboard

local function append_to_clipboard()
  vim.cmd('normal! ggVG"my')
  local current_clipboard = vim.fn.getreg("+")
  local m_register = vim.fn.getreg("m")
  vim.fn.setreg("+", current_clipboard .. m_register)
end

vim.keymap.set("n", "<leader>CP", append_to_clipboard, opts, { desc = "Append file content to system clipboard" }) -- Append to clipboard

-- LSP Functions
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})                         -- Hover documentation
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})                   -- Go to definition
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Code actions
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, {})                -- Format code

-- Telescope Functions
vim.keymap.set("n", "<leader>f", telescope.find_files, opts) -- Find files
vim.keymap.set("n", "<leader>g", telescope.live_grep, opts)  -- Live grep
