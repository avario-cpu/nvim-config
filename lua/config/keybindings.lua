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
map("n", "U", "<C-r>")

-- File Explorer
map("n", "<leader>e", ":Neotree toggle reveal filesystem left<CR>", opts) -- Toggle NeoTree

-- Clipboard Operations
map("n", "<leader>CA", 'ggVG"+y', opts) -- Yank all to system clipboard
map("n", "<leader>CP", clipboard_utils.copy_file_to_system_register, opts, { desc = "Append file content to system clipboard" }) -- Append to clipboard
map("n", "<leader>+", clipboard_utils.append_unnamed_to_system_register, opts, { desc = "Swap register with system clipboard" })

-- LSP Functions
map("n", "K", vim.lsp.buf.hover, {}) -- Hover documentation
map("n", "gd", vim.lsp.buf.definition, {}) -- Go to definition
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Code actions
map("n", "<leader>F", vim.lsp.buf.format, {}) -- Format code
map("n", "<leader>R", vim.lsp.buf.rename, {}) -- Format code


-- Telescope Functions
map("n", "<leader>fd", telescope.find_files, opts) -- Find files
map("n", "<leader>fg", telescope.live_grep, opts) -- Live grep
map("n", "<leader>fs", telescope.lsp_workspace_symbols, opts) -- Live grep
map("n", "<leader>fa", telescope.lsp_document_symbols, opts) -- Live grep
map("n", "<leader>fi", function()
	telescope.find_files({ hidden = true, no_ignore = true })
end, opts)
map("n", "<leader>fn", ":Telescope noice<CR>", opts) -- Live grep


--Disabling stuff
map("n", "<leader>nd", ":NoiceDismiss<CR>", opts) -- Disable notifs
map("n", "<leader>nh", ":noh<CR>", opts) -- Disable highlighting

-- Spelling
map("n", "<Leader>sp", require("functions.spelling").HandleSpellingErrors, opts)

-- Set the keybinding to toggle NoNeckPain and resize
map("n", "<leader>npt", require("functions.no_neck_pain_funcs").toggle_no_neck_pain, opts)
map("n", "<leader>\\", require("functions.no_neck_pain_funcs").refresh_no_neck_pain, opts)

-- Navigation
map("n", "G", "Gzz", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-f>", "<C-f>zz", opts)
map("n", "<C-b>", "<C-b>zz", opts)
map("n", "{", "{zz", opts)
map("n", "}", "}zz", opts)
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "%", "%zz", opts)
map("n", "]", "]zz", opts)
map("n", "[", "[zz", opts)

local hp_mark = require("harpoon.mark")
local hp_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", hp_mark.add_file)
vim.keymap.set("n", "<leader>hl", hp_ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function()
	hp_ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
	hp_ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
	hp_ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>4", function()
	hp_ui.nav_file(4)
end)

-- vim.api.nvim_set_keymap('n', 'grr', '<cmd>lua require"nvim-treesitter-refactor".smart_rename.smart_rename()<CR>', opts)
