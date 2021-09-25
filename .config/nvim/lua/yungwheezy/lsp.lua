-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<C-v>gd', '<Cmd>vsplit<CR><Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<C-x>gd', '<Cmd>split<CR><Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workleader_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workleader_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workleader_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap("n", '<leader>T', '<cmd>lua require"rust-tools.inlay_hints".toggle_inlay_hints()<CR>', opts)
end

local function setup_servers()
    require'lspinstall'.setup()
    local util = require'lspconfig/util'
    local servers = require'lspinstall'.installed_servers()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        }
    }
    -- Enable diagnostics
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            signs = true,
            update_in_insert = true,
    })
    for _, server in pairs(servers) do
        local default = {
            on_attach=on_attach,
            capabilities=capabilities,
            flags = {
                debounce_text_changes = 150,
            },
            -- handler = {
            --     ["textDocument/publishDiagnostics"] = vim.lsp.with(
            --         vim.lsp.diagnostic.on_publish_diagnostics, {
            --             virtual_text = true,
            --             signs = true,
            --             update_in_insert = true,
            --     })
            -- }
        }

        if server == "rust" then
            vim.cmd[[hi rustInlayHints guifg=Teal]]
            default.settings = {
                ["rust-analyzer"] = {
                    assist = {
                        importGranularity = "module",
                    },
                    cargo = {
                        loadOutDirsFromCheck = true
                    },
                    procMacro = {
                        enable = true
                    },
                }
            }
            local opts = {
                tools = {
                    autoSetHints = true,
                    inlay_hints = {
                        highlight = "rustInlayHints"
                    }
                },
                server = default,
            }
            require'rust-tools'.setup(opts)
        elseif server == "python" then
            -- print("PYTHON", server.name)
        elseif server == "vue" then
            default.on_attach = function(client)
                client.resolved_capabilities.document_formatting = true
                on_attach(client)
            end
            default.settings = {
                ["vetur"] = {
                    completion = {
                        autoImport = true,
                        useScaffoldSnippets = true,
                    },
                    format = {
                        defaultFormatter = {
                            html = "none",
                            js = "prettier",
                            ts = "prettier",
                        }
                    }
                }
            }
            default.root_dir = util.root_pattern("package.json", "vue.config.js")
        elseif server == "lua" then
            default.settings = {
                ["Lua"] = {
                    diagnostics = {
                        globals = {'vim', 'mp'},
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                            [vim.fn.expand('/usr/lib/libmpv.so')] = true,
                        }
                    }
                }
            }
        end

        require'lspconfig'[server].setup(default)
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
