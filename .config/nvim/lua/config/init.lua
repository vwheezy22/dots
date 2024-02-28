leader = " "
vim.g.mapleader = leader
vim.g.localeader = leader

require("config.set")
require("config.remap")
require("config.autocmd")
require("config.colors")
require("plugins")

