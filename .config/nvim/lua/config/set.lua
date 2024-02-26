-- Basic settings
vim.opt.showmatch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard:append { "unnamedplus" }
vim.opt.wrap = false
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.path:append { "**" }
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Saving settings
vim.opt.swapfile = false
-- vim.opt.undodir = ~/.cache/nvim/undo
vim.opt.undofile = true

-- Tab settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- Autocompletion Menu
vim.opt.wildmode = { "list:longest", "full" }
vim.opt.wildmenu = true

-- Fix splitting
vim.opt.splitbelow  = true
vim.opt.splitright = true
