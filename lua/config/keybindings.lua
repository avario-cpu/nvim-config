-- Load required modules
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

local telescope = require("telescope.builtin")
local clipboard_utils = require("functions.clipboard_utils")
local escape_pairs = require("functions.escape_pairs")

-- File Operations
map("n", "<leader>w", ":w<CR>", opts) -- Save file
map("n", "<leader>W", ":wa<CR>", opts) -- Save all files
map("n", "<leader>q", ":q<CR>", opts) -- Quit window
map("n", "<leader>Q", ":wq | qa<CR>", opts) -- Save and quit

-- File Explorer
map("n", "<leader>e", ":Neotree toggle reveal filesystem left<CR>", opts) -- Toggle NeoTree

-- Clipboard Operations
map("n", "<leader>CA", 'ggVG"+y', opts) -- Yank all to system clipboard
map("n", "<leader>CP", clipboard_utils.append_to_clipboard, opts, { desc = "Append file content to system clipboard" }) -- Append to clipboard
map("n", "<leader>+", clipboard_utils.prompt_and_swap_register, opts, { desc = "Swap register with system clipboard" })

-- Custom motions
map("i", "<M-l>", escape_pairs.EscapePair, opts, { desc = "Escape the pairs containing the cursor" })

-- LSP Functions
map("n", "K", vim.lsp.buf.hover, {}) -- Hover documentation
map("n", "gd", vim.lsp.buf.definition, {}) -- Go to definition
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Code actions
map("n", "<leader>F", vim.lsp.buf.format, {}) -- Format code
-- Telescope Functions
map("n", "<leader>fd", telescope.find_files, opts) -- Find files
map("n", "<leader>fg", telescope.live_grep, opts) -- Live grep
map("n", "<leader>fi", function() telescope.find_files({hidden=true, no_ignore=true}) end, opts)
map("n", "<leader>nn", ":Telescope noice<CR>", opts) -- Live grep
map("n", "<leader>nd", ":NoiceDismiss<CR>", opts)

-- Highlighting
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
