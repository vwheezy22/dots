local remap = vim.api.nvim_set_keymap

-- w!! to save with sudo
remap('n', '<leader>W', "<Cmd>lua require'utils'.sudo_write()<CR>", { silent = true })
