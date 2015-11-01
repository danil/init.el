(my-init--hook
  (my-init--after-load 'compile
    (define-key compilation-mode-map "\C-c\C-f" nil)))
