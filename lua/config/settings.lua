-- Disable expandtab to keep tabs as tabs
vim.opt.expandtab = false
-- Set tabstop to 4 to display tabs as 4 spaces wide
vim.opt.tabstop = 4
-- Set softtabstop to 0 to use the value of tabstop
vim.opt.softtabstop = 0
-- Set shiftwidth to 0 to use the value of tabstop
vim.opt.shiftwidth = 0

vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.smartindent = true -- Smart indentation
vim.opt.wrap = true
vim.opt.fillchars = { eob = " " }

vim.o.laststatus = 3
vim.opt.mouse = "a"
vim.opt.spell = true
vim.opt.undofile = true
vim.opt.undodir = os.getenv("USERPROFILE") .. "/AppData/Local/nvim/undo/"

vim.opt.fileformat = "unix"
vim.opt.fileformats = "unix,dos"

vim.cmd([[autocmd FileType * set formatoptions-=ro]])
