(my-init--hook
  (my-init--after-load "replace"
    (define-key occur-edit-mode-map (kbd "\C-c\C-f") nil)))
