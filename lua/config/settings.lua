-- Disable expandtab to keep tabs as tabs
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0

-- Enable wrap for diffs, with no mid-word wrap
vim.api.nvim_create_autocmd("FileType", {
  pattern = "diff",
  command = "setlocal wrap linebreak",
})

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
vim.opt.shada = "'1000,f1,<3000"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true

vim.cmd([[autocmd FileType * set formatoptions-=ro]])
