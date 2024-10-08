-- Load required modules
local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local clipboard_utils = require("functions.clipboard_utils")
local lsp_funcs = require("functions.lsp_funcs")

-- File Operations
map("n", "<leader>w", ":w<CR>", opts) -- Save file
map("n", "<leader>W", ":wa<CR>", opts) -- Save all files
map("n", "<leader>q", ":q<CR>", opts) -- Quit window
map("n", "<leader>Q", ":wa | qa<CR>", opts) -- Save and quit
map("n", "<leader>X", ":q!<CR>", opts) -- Quit without saving
map("n", "U", "<C-r>")

-- File Explorer
map("n", "<leader>e", ":Neotree toggle reveal filesystem left<CR>", opts) -- Toggle NeoTree

--Quick fix and location lists
map("n", "]q", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
map("n", "[q", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })
map("n", "[z", "<cmd>colder<CR>", { desc = "Older qfixlist" })
map("n", "]z", "<cmd>cnewer<CR>", { desc = "Newer qfixlist" })

-- Custom copen for no_neck_pain
vim.api.nvim_create_user_command("COpenCustom", function()
  vim.cmd("copen")
  vim.cmd("wincmd J")
  vim.cmd("resize 10")
end, {})
map("n", "<leader>co", ":COpenCustom<CR>", opts)
map("n", "<leader>cc", ":cclose<CR>", opts)

-- Clipboard Operations
map("n", "<leader>CA", 'ggVG"+y', opts) -- Yank all to system clipboard
map("v", "<C-y>", '"+y', opts) -- Yank all to system clipboard
map(
  "n",
  "<leader>CP",
  clipboard_utils.copy_file_to_system_register,
  opts,
  { desc = "Append file content to system clipboard" }
)
map(
  "n",
  "<leader>+",
  clipboard_utils.append_unnamed_to_system_register,
  opts,
  { desc = "Swap register with system clipboard" }
)

-- LSP Functions
map("n", "K", vim.lsp.buf.hover, {}) -- Hover documentation
map("n", "gd", vim.lsp.buf.definition, {}) -- Go to definition
-- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Code actions
-- map("n", "<leader>F", vim.lsp.buf.format, {}) -- Format code
map("n", "<leader>R", vim.lsp.buf.rename, {}) -- Format code
map("n", "gr", lsp_funcs.lsp_references, opts)

--Disabling stuff
map("n", "<leader>nd", ":NoiceDismiss<CR>", opts) -- Disable notifs
map("n", "<leader>;", ":noh<CR>", opts) -- Disable highlighting

-- Spelling
map("n", "<Leader>sP", require("functions.spelling").HandleSpellingErrors, opts)

-- Set the keybinding to toggle NoNeckPain and resize
map("n", "<leader>|", require("functions.no_neck_pain_funcs").toggle_no_neck_pain, opts)
map(
  "n",
  "<leader>\\",
  require("functions.no_neck_pain_funcs").refresh_no_neck_pain,
  opts
)

-- Navigation
map("n", "G", "Gzz", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "{", "{zz", opts)
map("n", "}", "}zz", opts)
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "%", "%zz", opts)
map("n", "``", "``zz", opts)

map("n", "H", "_", opts)
map("n", "L", "$", opts)

map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)

local hpoon_mark = require("harpoon.mark")
local hpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", hpoon_mark.add_file)
vim.keymap.set("n", "<leader>hl", hpoon_ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function()
  hpoon_ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
  hpoon_ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
  hpoon_ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>4", function()
  hpoon_ui.nav_file(4)
end)
