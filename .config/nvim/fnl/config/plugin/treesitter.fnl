(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(treesitter.setup {:highlight {:enable true}
                   :indent {:enable true}
                   :ensure_installed [:bash
                                      :clojure
                                      :commonlisp
                                      :dockerfile
                                      :fennel
                                      :html
                                      :http
                                      :java
                                      :javascript
                                      :json
                                      :lua
                                      :markdown
                                      :yaml
                                      :sql
                                      :kotlin]})
