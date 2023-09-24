(module config.plugin.conjure
  {autoload {nvim aniseed.nvim}})

(set nvim.g.conjure#mapping#doc_word "K")
(set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
(set nvim.g.conjure#relative_file_root (nvim.fn.getcwd))
(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
(set nvim.g.conjure#client#clojure#nrepl#refresh#before "user.my/stop")
(set nvim.g.conjure#client#clojure#nrepl#refresh#after "user.my/go")
(set vim.g.clojure_enable_formatting true)

(nvim.create_user_command
  :ClojureEnableFormatting
  #(vim.cmd "silent! AniseedEval(set vim.g.clojure_enable_formatting true)")
  {:bang true})

(nvim.create_user_command
  :ClojureDisableFormatting
  #(vim.cmd "silent! AniseedEval(set vim.g.clojure_enable_formatting false)")
  {:bang true})

(vim.api.nvim_create_autocmd
   [:BufWritePre]
   {:pattern "*.clj"
    :group group
    :callback #(do 
                 (vim.cmd ":ConjureCljDebugInput continue"))})

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
                  (vim.cmd ":ConjureCljRefreshChanged")
                  (vim.cmd ":ConjureCljDebugInit")
                  (vim.cmd ":ConjureEvalFile"))}))
