local Plugin = { 'nvim-telescope/telescope.nvim', branch = '0.1.x', }
Plugin.dependencies = { 'nvim-lua/plenary.nvim' }
Plugin.event = "VeryLazy"

Plugin.config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    telescope.setup {
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
                i = {
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    ["<C-h>"] = "which_key",
                }
            }
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
            buffers = {
                previewer = false,
                mappings = {
                    i = {
                        ["<C-d>"] = "delete_buffer",
                    },
                    n = {
                        ["<C-d>"] = "delete_buffer",
                    }
                }
            },
            find_files = {
                mappings = {
                    i = {
                        --[[ -- TODO: setup mapping to use find_files in parent dir
                        ["<C-.>"] = ]]
                    },
                },
            },
            current_buffer_fuzzy_find = {
                previewer = false,
            },
        },
        extensions = {
            -- Your extension configuration goes here:
            -- extension_name = {
            --   extension_config_key = value,
            -- }
            -- please take a look at the readme of the extension you want to configure
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            }
        }
    }

    -- telescope.load_extension('fzy_native')

    vim.keymap.set('n', '<Leader>pf', builtin.git_files, {})
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<Leader>pws', function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<Leader>pWs', function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<Leader>ps', builtin.live_grep)
    -- vim.keymap.set('n', '<Leader>/', builtin.current_buffer_fuzzy_find)
    vim.keymap.set('n', '<Leader>vh', builtin.help_tags, {})
    vim.keymap.set('n', '<Leader>bl', builtin.buffers, {})
end

return Plugin
