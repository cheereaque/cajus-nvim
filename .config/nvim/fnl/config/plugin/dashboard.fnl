(module config.plugin.dashboard
  {autoload {db dashboard}})

(db.setup {:theme "hyper"
           :config {:week_header {:enable false}
                    :packages {:enable false}}})
