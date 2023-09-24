(module config.plugin.telescope-file-browser
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<space>fb ":Telescope file_browser<CR>" {:noremap true})

