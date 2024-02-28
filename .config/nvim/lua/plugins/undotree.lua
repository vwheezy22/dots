local Plugin = { 'mbbill/undotree' }

Plugin.event = 'VeryLazy'
Plugin.config = function()
    vim.keymap.set('n', '<F5>', vim.cmd.UndotreeToggle)
end

return Plugin
