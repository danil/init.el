(my-after-init
  (my-eval-after-load 'dired
    (setq dired-listing-switches "-alh")))
