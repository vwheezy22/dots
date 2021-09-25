local actions = require'telescope.actions'
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,

    mappings = {
        i = {
            ["<C-q>"] = actions.send_to_qflist,
        }
    }
  },
  pickers = {
      buffers = {
          previewer = false,
          mappings = {
              i = {
                  ["<C-d>"] = require'telescope.actions'.delete_buffer,
              },
              n = {
                  ["<C-d>"] = require'telescope.actions'.delete_buffer,
              }
          }
      },
  },
  extensions = {
      fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
      }
  }
}

require'telescope'.load_extension('fzy_native')

vim.api.nvim_set_keymap('n', '<C-p>', [[<Cmd>lua require"telescope.builtin".fd()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bl', [[<Cmd>lua require"telescope.builtin".buffers()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ps', [[<Cmd>lua require"telescope.builtin".live_grep()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', [[<Cmd>lua require"telescope.builtin".git_branches()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', [[<Cmd>lua require"telescope.builtin".git_status()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gB', [[<Cmd>lua require"telescope.builtin".git_bcommits()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cr', [[<Cmd>lua require"telescope.builtin".command_history()<CR>]], { noremap = true, silent = true})


