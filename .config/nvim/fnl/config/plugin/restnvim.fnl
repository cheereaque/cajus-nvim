(module config.plugin.restnvim
  {autoload {nvim aniseed.nvim
             rn rest-nvim}})

(nvim.set_keymap :n :<leader>rr "<Plug>RestNvim" {:noremap true})
(nvim.set_keymap :n :<leader>rR "<Plug>RestNvimLast" {:noremap true})

(rn.setup {:result_split_horizontal false
           :result_split_in_place false
           :skip_ssl_verification false
           :highlight {:enabled true
                       :timeout 150}
           :jump_to_request false
           :env_file ".env"
           :yank_dry_run true})

