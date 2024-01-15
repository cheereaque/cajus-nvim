(module config.plugin.dadbod-ui
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<space>dd ":DBUIToggle<CR>" {:noremap true})

(let [icloud_path (os.getenv "ICLOUD_PATH")]
  (set nvim.g.db_ui_save_location (.. icloud_path "/share/nvim/db_ui")))


