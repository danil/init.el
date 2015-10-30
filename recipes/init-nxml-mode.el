(my-after-init
  (my-eval-after-load 'nxml-mode
    (define-key nxml-mode-map (kbd "\C-c\C-f") nil)))
