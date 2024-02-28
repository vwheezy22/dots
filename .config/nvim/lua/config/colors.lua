vim.opt.syntax = 'on'
vim.opt.termguicolors = true
vim.opt.encoding = 'utf-8'
vim.opt.gfn = 'Source Code Pro 12'

--[[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
--]]

vim.opt.background = 'dark'
vim.cmd.highlight({ 'Pmenu', 'guibg=Black', 'guifg=White' })
vim.cmd.highlight({ 'ColorColumn', 'guibg=Gray' })
