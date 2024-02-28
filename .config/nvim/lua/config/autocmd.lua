local userCmds = vim.api.nvim_create_augroup('userCmds', { clear = true })
vim.api.nvim_create_autocmd({ 'FileType' }, {
    desc = 'Spellcheck fix',
    pattern = { 'tex', 'latex', 'markdown' },
    command = 'setlocal spell spelllang=en_us',
    group = userCmds,
})
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    desc = 'Remove trailing whitespace on save',
    pattern = { '*' },
    command = [[%s/\s\+$//e]],
    group = userCmds,
})
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    desc = 'Annoying comment continuations',
    pattern = { '*' },
    command = 'setlocal formatoptions-=o formatoptions-=r',
    group = userCmds,
})
--[[
vim.api.nvim_create_autocmd({ 'CursorHold' }, {
    desc = 'Show diagnostic popup on cursor hold',
    pattern = {'*'},
    callback = function() vim.lsp.diagnostic.show_line_diagnostics() end,
    group = userCmds,
})
--]]
