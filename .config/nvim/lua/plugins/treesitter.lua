local Plugin = { 'nvim-treesitter/nvim-treesitter' }

Plugin.event = 'VeryLazy'
Plugin.build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
end
Plugin.config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "rust", "javascript", "bash" },
        sync_install = false,
        auto_install = true, -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" },
        },
        indent = { enable = true },
    })
end

return Plugin
