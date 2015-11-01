(my-init--hook
  (my-init--add-mode-to-patterns 'json-mode "\\.bowerrc\\'")

  (my-init--after-load 'json-mode
    (define-key json-mode-map (kbd "C-c C-f") nil)
    (define-key json-mode-map (kbd "C-c C-p") nil)))
