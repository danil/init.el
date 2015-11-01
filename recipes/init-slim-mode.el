(my-init--hook
  (my-init--after-load 'slim-mode
    (define-key slim-mode-map (kbd "\C-c\C-f") nil)))
