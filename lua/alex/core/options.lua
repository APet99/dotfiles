vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- line numbers
-- opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
-- opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- this lets me dw on words with a dash ex. hello-hello
opt.iskeyword:append("-")

-- Show vertical split to encourage keeping length below column count
opt.colorcolumn = "80"

vim.opt.undofile = true
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- smart indent
vim.opt.mousemoveevent = true
