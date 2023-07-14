(module config.plugin.conjure
  {autoload {nvim aniseed.nvim}})

(set nvim.g.conjure#mapping#doc_word "K")
(set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
(set vim.g.clojure_enable_formatting true)

(let [group (vim.api.nvim_create_augroup
              :clojure
              {:clear true})]
  (vim.api.nvim_create_autocmd
    [:BufWritePost]
    {:pattern "*.clj,*.edn"
     :group group
     :callback #(do 
                  (when (= vim.g.clojure_enable_formatting true)
                    (vim.cmd "silent! !cljstyle fix <afile>")))})

  (vim.api.nvim_create_autocmd
    [:BufWritePost]
    {:pattern "*.clj"
     :group group
     :callback #(do 
                  (vim.cmd ":ConjureEvalFile"))}))
