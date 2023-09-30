(module config.plugin.dadbod-ui
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<space>dd ":DBUIToggle<CR>" {:noremap true})
