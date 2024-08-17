-- Basic settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.smartindent = true    -- Smart indentation
vim.opt.wrap = true
vim.opt.fillchars = { eob = " "}

vim.o.laststatus = 3
vim.opt.mouse = "a"
vim.opt.spell = true
vim.opt.undofile = true
vim.opt.undodir = os.getenv("USERPROFILE") .. "/AppData/Local/nvim/undo/"

vim.cmd([[autocmd FileType * set formatoptions-=ro]])
