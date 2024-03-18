local Plugin = { 'norcalli/nvim-colorizer.lua' }

Plugin.event = 'VeryLazy'
Plugin.config = function ()
    require('colorizer').setup()
end
Plugin.ft = { "css", "html", "js" }


return Plugin
