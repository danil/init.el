(my-init--hook
  (my-init--after-load 'help-mode
    (define-key help-mode-map (kbd "C-c C-f") nil)))
