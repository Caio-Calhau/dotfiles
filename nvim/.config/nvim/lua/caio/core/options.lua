local opt = vim.opt
local g = vim.g

-- General
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.mouse = "a" -- Enable mouse
opt.clipboard = "unnamedplus" -- Use system clipboard

-- Indentation
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Disable swap & backups
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Wrap line configuration
opt.wrap = true
opt.breakindent = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.scrolloff = 10

opt.backspace = "indent,eol,start"

opt.splitright = true
opt.splitbelow = true

opt.virtualedit = "onemore"
