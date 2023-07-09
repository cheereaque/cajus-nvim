(module config.plugin.lazygit
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>lg ":LazyGit<CR>" {:noremap true})
