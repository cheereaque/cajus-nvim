(module config.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util config.util
             packer packer}})

(defn- safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name)))))))
  nil)

;;; plugins managed by packer
;;; :mod specifies namespace under plugin directory

(use
  ;; plugin Manager
  :wbthomason/packer.nvim {}
  ;; nvim config and plugins in Fennel
  :Olical/aniseed {:branch :develop}

  ;; themes
  :sainnhe/everforest {:mod :theme}
  :EdenEast/nightfox.nvim {:mod :theme}
  :rose-pine/neovim {:mod :theme}
  :navarasu/onedark.nvim {:mod theme}
  :kyazdani42/nvim-web-devicons {}

  ;; status line
  :nvim-lualine/lualine.nvim {:mod :lualine}

  ;; file searching
  :nvim-telescope/telescope.nvim {:requires [:nvim-telescope/telescope-ui-select.nvim
                                             :nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim]
                                  :mod :telescope}

  ;; repl tools
  :Olical/conjure {:branch :master :mod :conjure}

  ;; sexp
  :guns/vim-sexp {:mod :sexp}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-repeat {}
  :tpope/vim-surround {}

  ;; parsing system
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}

  ;; lsp
  :neovim/nvim-lspconfig {:mod :lspconfig}

  ; snippets
  :L3MON4D3/LuaSnip {:requires [:saadparwaiz1/cmp_luasnip]}

  ;; autocomplete
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-vsnip
                                :PaterJason/cmp-conjure]
                     :mod :cmp}
  
  ;; dashboard
  :glepnir/dashboard-nvim {:requires [:nvim-tree/nvim-web-devicons]
                           :mod :dashboard}
  
  ;; parinfer
  :gpanders/nvim-parinfer {:mod :parinfer}
  
  ;; lightspeed
  :ggandor/lightspeed.nvim {}

  ;; which-key
  ; shows popup with possible key bindings of the command you started typing
  :folke/which-key.nvim {:mod :whichkey}
  
  ;; clojure
  :clojure-vim/clojure.vim {}
  
  ;; commentary
  :tpope/vim-commentary {}

  ;; undotree
  :mbbill/undotree {:mod :undotree}
  
  ;; lazygit
  :kdheepak/lazygit.nvim {:mod :lazygit}
  
  ;; vim-jack-in
  :clojure-vim/vim-jack-in {:requires [:tpope/vim-dispatch
                                       :radenling/vim-dispatch-neovim]}
  
  ;; wakatime | tracks work time
  :wakatime/vim-wakatime {}

  ;; tabnine
  :codota/tabnine-nvim {:run "./dl_binaries.sh"
                        :mod :tabnine})
