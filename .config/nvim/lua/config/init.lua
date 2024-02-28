--[[
    - Build first nvim config in lua:
        https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
]]

leader = " "
vim.g.mapleader = leader
vim.g.localeader = leader

require("config.set")
require("config.remap")
require("config.autocmd")
require("config.colors")
require("config.lazy")
