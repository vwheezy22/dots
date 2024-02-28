--[[
Idk what tf is going on here:
    https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
]]

-- TODO: refactor to LSP folder because I'm bored ¯\_(ツ)_/¯
return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()
            local cmp_format = lsp_zero.cmp_format()

            cmp.setup({
                formatting = cmp_format,
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<Tab>'] = cmp_action.tab_complete(),
                    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                })
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            --- if you want to know more about lsp-zero and mason.nvim
            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({
                    buffer = bufnr,
                    exclude = { "<F2>", "<F3>", "<F4>", "gr" },
                })

                vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
                vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, { buffer = bufnr })
                vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })

                local telescope_builtin = require('telescope.builtin')
                vim.keymap.set("n", "gr", "<Cmd>Telescope lsp_references<CR>", { buffer = bufnr })
                vim.keymap.set("n", "<Leader>ic", "<Cmd>Telescope lsp_incoming_calls<CR>", { buffer = bufnr })
                vim.keymap.set("n", "<Leader>oc", "<Cmd>Telescope lsp_outgoing_calls<CR>", { buffer = bufnr })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pyright", "tsserver" },
                handlers = {
                    lsp_zero.default_setup,

                    -- TODO: Fix this ugly shite
                    lua_ls = function()
                        local config = {}
                        config.settings = {}
                        config.settings.Lua = {
                            diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { 'vim', 'mp' }
                            },
                            workspace = {
                                library = {
                                    -- Make the server aware of Neovim runtime files
                                    vim.api.nvim_get_runtime_file("", true),
                                    vim.fn.expand('/usr/lib/libmpv.so'),
                                }
                            }
                        }

                        local lua_opts = lsp_zero.nvim_lua_ls(config)
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })
        end
    }
}
