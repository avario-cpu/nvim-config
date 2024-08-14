-- Load required modules
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

local telescope = require("telescope.builtin")
local clipboard_utils = require("functions.clipboard_utils")

-- File Operations
map("n", "<leader>w", ":w<CR>", opts) -- Save file
map("n", "<leader>W", ":wa<CR>", opts) -- Save all files
map("n", "<leader>q", ":q<CR>", opts) -- Quit window
map("n", "<leader>Q", ":wa | qa<CR>", opts) -- Save and quit
map("n", "<leader>X", ":q!<CR>", opts) -- Quit without saving

-- File Explorer
map("n", "<leader>e", ":Neotree toggle reveal filesystem left<CR>", opts) -- Toggle NeoTree

-- Clipboard Operations
map("n", "<leader>CA", 'ggVG"+y', opts) -- Yank all to system clipboard
map("n", "<leader>CP", clipboard_utils.append_to_clipboard, opts, { desc = "Append file content to system clipboard" }) -- Append to clipboard
map("n", "<leader>+", clipboard_utils.prompt_and_swap_register, opts, { desc = "Swap register with system clipboard" })

-- LSP Functions
map("n", "K", vim.lsp.buf.hover, {}) -- Hover documentation
map("n", "gd", vim.lsp.buf.definition, {}) -- Go to definition
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Code actions
map("n", "<leader>F", vim.lsp.buf.format, {}) -- Format code

-- Telescope Functions
map("n", "<leader>fd", telescope.find_files, opts) -- Find files
map("n", "<leader>fg", telescope.live_grep, opts) -- Live grep
map("n", "<leader>fi", function()
	telescope.find_files({ hidden = true, no_ignore = true })
end, opts)
map("n", "<leader>nn", ":Telescope noice<CR>", opts) -- Live grep
map("n", "<leader>nd", ":NoiceDismiss<CR>", opts)

-- Highlighting
map("n", "<leader>hd", ":noh<CR>", opts) -- Disable highlighting

-- Spelling
map("n", "<Leader>sp", require("functions.spelling").HandleSpellingErrors, opts)

-- Set the keybinding to toggle NoNeckPain and resize
map("n", "<leader>npt", require("functions.no_neck_pain_funcs").toggle_no_neck_pain, opts)
map("n", "<leader>\\", require("functions.no_neck_pain_funcs").refresh_no_neck_pain, opts)
