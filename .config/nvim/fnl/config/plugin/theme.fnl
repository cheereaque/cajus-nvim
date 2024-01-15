(module config.plugin.theme
  {autoload {nvim aniseed.nvim
             onedark onedark}})

;; everforest
; (vim.cmd "colorscheme everforest")
; (set nvim.g.everforest_background "hard")

;; nightfox
; (vim.cmd "colorscheme nightfox")

;; rose-pine
(vim.cmd "colorscheme rose-pine")

;; onedark
; (let [style :light]
;   (onedark.setup {:style style
;                   :toggle_style_key "<leader>ts"
;                   :toggle_style_list [:light]})
;   (vim.cmd "colorscheme onedark"))
