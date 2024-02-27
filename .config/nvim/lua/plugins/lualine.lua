local Plugin = {'nvim-lualine/lualine.nvim'}

Plugin.event = 'VeryLazy'
Plugin.config = true

-- See :help lualine.txt
Plugin.opts = {
  options = {
    theme = 'modus-vivendi',
    icons_enabled = false,
    component_separators = '|',
    section_separators = '',
    disabled_filetypes = {
      statusline = {'NvimTree'}
    }
  },
}

function Plugin.init()
  vim.opt.showmode = false
end

return Plugin
