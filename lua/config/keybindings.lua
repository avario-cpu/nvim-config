-- Load required modules
local opts = { noremap = true, silent = true }
local telescope = require("telescope.builtin")
local map = vim.keymap.set
-- File Operations
map("n", "<leader>w", ":w<CR>", opts)  -- Save file
map("n", "<leader>W", ":wa<CR>", opts) -- Save all files
map("n", "<leader>q", ":q<CR>", opts)  -- Quit window
map("n", "<leader>Q", ":wq<CR>", opts) -- Save and quit

-- File Explorer
map("n", "<leader>e", ":Neotree toggle reveal filesystem left<CR>", opts) -- Toggle NeoTree

-- Clipboard Operations
map("n", "<leader>CA", 'ggVG"+y', opts) -- Yank all to system clipboard

local function append_to_clipboard()
  vim.cmd('normal! ggVG"my')
  local current_clipboard = vim.fn.getreg("+")
  local m_register = vim.fn.getreg("m")
  vim.fn.setreg("+", current_clipboard .. m_register)
end

map("n", "<leader>CP", append_to_clipboard, opts, { desc = "Append file content to system clipboard" }) -- Append to clipboard

-- LSP Functions
map("n", "K", vim.lsp.buf.hover, {})                         -- Hover documentation
map("n", "gd", vim.lsp.buf.definition, {})                   -- Go to definition
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Code actions
map("n", "<leader>F", vim.lsp.buf.format, {})                -- Format code

-- Telescope Functions
map("n", "<leader>f", telescope.find_files, opts)   -- Find files
map("n", "<leader>g", telescope.live_grep, opts)    -- Live grep
map("n", "<leader>nn", ":Telescope noice<CR>", opts) -- Live grep
map("n", "<leader>nd", ":NoiceDismiss<CR>", opts)

-- Visuals
map("n", "<leader>hd", ":noh<CR>", opts) -- Disable highlighting

-- Spelling
map("n", "<Leader>sp", require("functions.spelling").HandleSpellingErrors, { noremap = true, silent = true })

-- Navigation
if os.getenv("TMUX") then
  map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
end
