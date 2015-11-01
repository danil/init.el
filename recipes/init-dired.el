(my-init--hook
  (my-init--after-load 'dired
    (setq dired-listing-switches "-alh")))
