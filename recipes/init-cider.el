(custom-set-variables '(cider-mode-line " cider"))

(my-init--hook
  (my-init--after-load 'cider-mode
    (define-key cider-mode-map (kbd "C-c C-f") nil)))
