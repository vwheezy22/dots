--[[ TODO: add desc to mappings
vim.keymap.set('n', '<Leader>pl1', require('plugin').action,
  { desc = 'Execute action from plugin' })
--]]

-- Fix indenting of visual block
vim.keymap.set('v', 'lt', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Write
vim.keymap.set('n', '<Leader>w', ':w<CR>')

-- Replace
vim.keymap.set('n', 'S', ':%s//g<Left><Left>')
vim.keymap.set('v', 'S', ':s//g<Left><Left>')

-- Yank $
vim.keymap.set('n', 'Y', 'y$')

-- Commentary
vim.keymap.set('n', '<C-_>', ':Commentary<CR>')
vim.keymap.set('v', '<C-_>', ':Commentary<CR>')

-- Navigation
-- Window shortcuts
vim.keymap.set('n', '<Leader>h', ':wincmd h<CR>')
vim.keymap.set('n', '<Leader>j', ':wincmd j<CR>')
vim.keymap.set('n', '<Leader>k', ':wincmd k<CR>')
vim.keymap.set('n', '<Leader>l', ':wincmd l<CR>')
-- vim.keymap.set('n', '<Leader>z', ':wincmd o<CR>')

-- Windows, tabs, quickfixes, and buffers
vim.keymap.set('n', '<Leader>-', ':split<CR>')
vim.keymap.set('n', '<Leader>|', ':vsplit<CR>')
vim.keymap.set('n', '<Leader><Tab>', '<C-^>')
vim.keymap.set('n', '<Leader>c', ':cl<CR>:cc')
vim.keymap.set('n', '<C-n>', ':cn<CR>')
vim.keymap.set('n', '<C-b>', ':cp<CR>')

vim.keymap.set('n', [[<Leader>\]], ':w!<CR>:e %:h<CR>')

-- Move selected text up or down
vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]])
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]])
vim.keymap.set('i', '<C-j>', '<ESC>:m .+1<CR>==')
vim.keymap.set('i', '<C-k>', '<ESC>:m .-2<CR>==')
-- vim.keymap.set('n', '<Leader>k', ':m .-2<CR>==')
-- vim.keymap.set('n', '<Leader>j', ':m .+1<CR>==')

vim.keymap.set('n', '<F5>', ':UndotreeToggle<CR>')

-- vim-powered terminal in new tab
vim.keymap.set('n', '<Leader>t', ':tabnew<CR>:term<CR>')
vim.keymap.set('n', '<C-v>t', ':vsplit<CR>:term<CR>')
vim.keymap.set('n', '<C-x>t', ':split<CR>:term<CR>')

-- Reload all buffers
vim.keymap.set('n', '<F3>', ':checktime<CR>')

-- Keeping it centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mzJ`z')

-- Undo break points
vim.keymap.set('i', ',', ',<C-g>u')
vim.keymap.set('i', '.', '.<C-g>u')
vim.keymap.set('i', '!', '!<C-g>u')
vim.keymap.set('i', '?', '?<C-g>u')
vim.keymap.set('i', ';', ';<C-g>u')

--[[
-- Jump list mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
--]]


-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_winsize =  30
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3
-- vim.g.netrw_list_hide = 'netrw_gitignore#Hide()'
-- vim.g.netrw_list_hide. = ',\(^|\s\s\s\)\zs\.S\+'
vim.g.netrw_list_hide = { 'netrw_gitignore#Hide()', [[(^|\s\s\s)\zs.S+]] }

-- Screen maximizer
vim.g.maximizer_set_default_mapping = 0
vim.g.maximizer_set_default_mapping_with_bang = 0
vim.g.maximizer_default_mapping_key = '<Leader>z'
